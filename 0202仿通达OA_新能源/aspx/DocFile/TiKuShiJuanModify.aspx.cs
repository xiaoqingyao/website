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
 public partial class TiKuShiJuanModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPTiKuShiJuan Model = new FTD.BLL.ERPTiKuShiJuan();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtShiJuanTitle.Text=Model.ShiJuanTitle.ToString();
			this.RadioButtonList1.SelectedValue=Model.IFSuiJiChuTi.ToString();
			//this.txtFenLeiShunXu.Text=Model.FenLeiShunXu.ToString();
            string[] MyShunXu=Model.FenLeiShunXu.ToString().Split('|');
            for (int i = 0; i < MyShunXu.Length; i++)
            {
                this.ListBox2.Items.Add(MyShunXu[i].ToString());
            }

			this.txtKaoShiXianShi.Text=Model.KaoShiXianShi.ToString();			
			this.txtPanDuanFenShu.Text=Model.PanDuanFenShu.ToString();
			this.txtDanXuanFenShu.Text=Model.DanXuanFenShu.ToString();
			this.txtDuoXuanFenShu.Text=Model.DuoXuanFenShu.ToString();
			this.txtTianKongFenShu.Text=Model.TianKongFenShu.ToString();
			this.txtJianDaFenShu.Text=Model.JianDaFenShu.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
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
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.ShiJuanTitle=this.txtShiJuanTitle.Text.ToString();
		Model.IFSuiJiChuTi=this.RadioButtonList1.SelectedItem.Text.ToString();
        Model.FenLeiShunXu = ShunXuStr;
		Model.KaoShiXianShi=int.Parse(this.txtKaoShiXianShi.Text);		
		Model.PanDuanFenShu=decimal.Parse(this.txtPanDuanFenShu.Text);
		Model.DanXuanFenShu=decimal.Parse(this.txtDanXuanFenShu.Text);
		Model.DuoXuanFenShu=decimal.Parse(this.txtDuoXuanFenShu.Text);
		Model.TianKongFenShu=decimal.Parse(this.txtTianKongFenShu.Text);
		Model.JianDaFenShu=decimal.Parse(this.txtJianDaFenShu.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改试卷管理信息(" + this.txtShiJuanTitle.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "试卷管理信息修改成功！", "TiKuShiJuan.aspx");
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