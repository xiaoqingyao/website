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

public partial class DocFile_TiKuShiJuanAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			//设置上传的附件为空
			 ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
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



		ZWL.BLL.ERPTiKuShiJuan Model = new ZWL.BLL.ERPTiKuShiJuan();
		
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
        Model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加试卷管理信息(" + this.txtShiJuanTitle.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "试卷管理信息添加成功！", "TiKuShiJuan.aspx");
	}
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
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
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
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
