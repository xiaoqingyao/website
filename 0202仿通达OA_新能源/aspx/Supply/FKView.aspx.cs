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
using System.Linq;

namespace OA.aspx.Supply{ 
 public partial class FKView: System.Web.UI.Page
{
    public string HeTongName = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();

            DataEntityDataContext context = new DataEntityDataContext();
            ERPRecive Model = new ERPRecive();
            Model = context.ERPRecive.SingleOrDefault(p => p.ID == int.Parse(Request.QueryString["ID"].ToString()));
            this.lblHeTongName.Text = Model.HeTongName.ToString();
            HeTongName = Model.HeTongName.ToString();

            this.lblQianYueKeHu.Text = Model.QianYueKeHu.ToString();
            this.lblHeTongMiaoShu.Text = Model.HTJE.ToString();

            this.lblShengXiaoDate.Text = Model.TiXingDate.ToString().Replace(" 0:00:00", "");
            this.Label1.Text = Model.SFDK;
            this.lblTiXingDate.Text = Model.DaoKuanDate.ToString().Replace(" 0:00:00", "");

            this.lblCreateTime.Text = Model.CreateTime.ToString();
            this.lblCreateUser.Text = Model.CreateUser.ToString();

            this.lblBackInfo.Text = Model.BackInfo.ToString();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看付款计划信息(" + this.lblHeTongName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

        }
    }
}
}