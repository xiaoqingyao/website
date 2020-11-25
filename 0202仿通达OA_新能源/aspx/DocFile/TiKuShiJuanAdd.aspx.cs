using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace OA.aspx.DocFile{ 
 public partial class TiKuShiJuanAdd: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			//设置上传的附件为空
			 FTD.Unit.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
        //获取题目排列顺序
        string ShunXuStr = "";
        for (int i = 0; i < ListBox2.Items.Count; i++)
        {
            if (ShunXuStr == "")
            {
                ShunXuStr = ListBox2.Items[i].Text;
            }
            else
            {
                ShunXuStr = ShunXuStr + "|" + ListBox2.Items[i].Text;
            }
        }



		FTD.BLL.ERPTiKuShiJuan Model = new FTD.BLL.ERPTiKuShiJuan();
		
		Model.ShiJuanTitle=this.txtShiJuanTitle.Text.ToString();
		Model.IFSuiJiChuTi=this.RadioButtonList1.SelectedItem.Text.ToString();
        Model.FenLeiShunXu = ShunXuStr;
		Model.KaoShiXianShi=int.Parse(this.txtKaoShiXianShi.Text);
		Model.PanDuanTiList="";
		Model.DanXuanTiList="";
		Model.DuoXuanTiList="";
		Model.TianKongTiList="";
		Model.JianDaTiList="";
		Model.PanDuanFenShu=decimal.Parse(this.txtPanDuanFenShu.Text);
		Model.DanXuanFenShu=decimal.Parse(this.txtDanXuanFenShu.Text);
		Model.DuoXuanFenShu=decimal.Parse(this.txtDuoXuanFenShu.Text);
		Model.TianKongFenShu=decimal.Parse(this.txtTianKongFenShu.Text);
		Model.JianDaFenShu=decimal.Parse(this.txtJianDaFenShu.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
        Model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加试卷管理信息(" + this.txtShiJuanTitle.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "试卷管理信息添加成功！", "TiKuShiJuan.aspx");
	}
    protected void iButton4_Click(object sender, EventArgs e)
    {
        //向上移动
        ListItem li = ListBox2.SelectedItem;
        int index = ListBox2.SelectedIndex;
        if (index > 0)
        {
            ListBox2.Items.Remove(li);
            //上移
            ListBox2.Items.Insert(index - 1, li);
        }
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        //向下移动
        ListItem li = ListBox2.SelectedItem;
        int index = ListBox2.SelectedIndex;
        if (index < ListBox2.Items.Count - 1 && index != -1)
        {
            ListBox2.Items.Remove(li);
            //下移
            ListBox2.Items.Insert(index + 1, li);
        }
    }
}
}