using System;
using System.Data;
using System.Data.Linq;
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
 public partial class FKModify: System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            this.txtHeTongName.Attributes.Add("readonly", "true");
            this.txtQianYueKeHu.Attributes.Add("readonly", "true");
            DataEntityDataContext context = new DataEntityDataContext();
            ERPRecive Model = new ERPRecive();
            Model = context.ERPRecive.SingleOrDefault(p => p.ID == int.Parse(Request.QueryString["ID"].ToString()));
            this.txtHeTongName.Text = Model.HeTongName.ToString();
            this.txtQianYueKeHu.Text = Model.QianYueKeHu.ToString();
            this.txtHeTongMiaoShu.Text = Model.HTJE.ToString();
            this.txtShengXiaoDate.Text = Model.TiXingDate.ToString().Replace(" 0:00:00", "");
            this.txtTiXingDate.Text = Model.DaoKuanDate.ToString().Replace(" 0:00:00", "");
            this.DZ.Value= Model.SFDK ;
            this.txtBackInfo.Text = Model.BackInfo.ToString();
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        DataEntityDataContext context = new DataEntityDataContext();
        ERPRecive Model = new ERPRecive();
        Model = context.ERPRecive.SingleOrDefault(p => p.ID == int.Parse(Request.QueryString["ID"].ToString()));
        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.HeTongName = this.txtHeTongName.Text.ToString();
        Model.QianYueKeHu = this.txtQianYueKeHu.Text.ToString();
        Model.HTJE = this.txtHeTongMiaoShu.Text.ToString();
        Model.TiXingDate = DateTime.Parse(this.txtShengXiaoDate.Text);
        Model.DaoKuanDate = DateTime.Parse(this.txtTiXingDate.Text);
        Model.SFDK = this.DZ.Value;
        Model.BackInfo = this.txtBackInfo.Text.ToString();
        ERPYS ys = new ERPYS();
        ys = context.ERPYS.SingleOrDefault(p => p.FKID==Model.ID);
        ys.HeTongName = this.txtHeTongName.Text.ToString();
        ys.QianYueKeHu = this.txtQianYueKeHu.Text.ToString();
        ys.HTJE = this.txtHeTongMiaoShu.Text.ToString();
        ys.TiXingDate = DateTime.Parse(this.txtShengXiaoDate.Text);
        ys.DaoKuanDate = DateTime.Parse(this.txtTiXingDate.Text);
        ys.BackInfo = this.txtBackInfo.Text.ToString();
        ys.SFDK = this.DZ.Value;
        ys.NowState = "F";
        context.SubmitChanges();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改付款计划信息(" + this.txtHeTongName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "付款计划信息修改成功！", "FK.aspx");
    }
}
}