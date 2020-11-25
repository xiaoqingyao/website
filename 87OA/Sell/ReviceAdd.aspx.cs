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

public partial class Sell_ReviceAdd : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.txtHeTongName.Attributes.Add("readonly", "true");
            this.txtQianYueKeHu.Attributes.Add("readonly", "true");

        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataEntityDataContext context = new DataEntityDataContext();
        ERPRecive Model = new ERPRecive();
        
        Model.HeTongName = this.txtHeTongName.Text.ToString();
        Model.QianYueKeHu = this.txtQianYueKeHu.Text.ToString();
        Model.HTJE = this.txtHeTongMiaoShu.Text.ToString();
        Model.TiXingDate = DateTime.Parse(this.txtShengXiaoDate.Text);
        Model.DaoKuanDate = DateTime.Parse(this.txtTiXingDate.Text);
        Model.CreateTime = DateTime.Now;
        Model.CreateUser = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        Model.BackInfo = this.txtBackInfo.Text.ToString();
        Model.SFDK = this.DZ.Value;
        Model.NowState = "S";
        Model.SFDK = "否";
        context.ERPRecive.InsertOnSubmit(Model);
        context.SubmitChanges();
        int id = Model.ID;

        ERPYS ys = new ERPYS();
        ys.FKID = id;
        ys.HeTongName = this.txtHeTongName.Text.ToString();
        ys.QianYueKeHu = this.txtQianYueKeHu.Text.ToString();
        ys.HTJE = this.txtHeTongMiaoShu.Text.ToString();
        ys.TiXingDate = DateTime.Parse(this.txtShengXiaoDate.Text);
        ys.DaoKuanDate = DateTime.Parse(this.txtTiXingDate.Text);
        ys.CreateTime = DateTime.Now;
        ys.CreateUser = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        ys.BackInfo = this.txtBackInfo.Text.ToString();
        ys.SFDK = this.DZ.Value;
        ys.NowState = "S";
        context.ERPYS.InsertOnSubmit(ys);
        context.SubmitChanges();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加收款计划信息(" + this.txtHeTongName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "收款计划信息添加成功！", "Revice.aspx");
    }





}
