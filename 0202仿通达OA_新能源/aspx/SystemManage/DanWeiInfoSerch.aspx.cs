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

namespace OA.aspx.SystemManage{ 
 public partial class DanWeiInfoSerch: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.BLL.ERPDanWeiInfo MyDanWei = new FTD.BLL.ERPDanWeiInfo();
            MyDanWei.GetModel();
            Label1.Text = MyDanWei.DanWeiName;
            Label2.Text = MyDanWei.Tel;
            Label3.Text = MyDanWei.Fax;
            Label4.Text = MyDanWei.YouBian;
            Label5.Text = MyDanWei.Address;
            Label6.Text = MyDanWei.WebUrl;
            Label7.Text = MyDanWei.Email;
            Label8.Text = MyDanWei.KaiHuHang;
            Label9.Text = MyDanWei.ZhangHao;
        }
    }
}
}