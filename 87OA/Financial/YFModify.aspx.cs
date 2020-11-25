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

public partial class Financial_YFModify : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataEntityDataContext context = new DataEntityDataContext();
            ERPYS Model = new ERPYS();
            Model = context.ERPYS.SingleOrDefault(p => p.ID == int.Parse(Request.QueryString["ID"].ToString()));
            this.txtHeTongName.Attributes.Add("readonly", "true");
            this.txtQianYueKeHu.Attributes.Add("readonly", "true");
            this.txtHeTongMiaoShu.Attributes.Add("readonly", "true");
            this.txtShengXiaoDate.Attributes.Add("readonly", "true");
            this.txtHeTongName.Text = Model.HeTongName.ToString();
            this.txtQianYueKeHu.Text = Model.QianYueKeHu.ToString();
            this.txtHeTongMiaoShu.Text = Model.HTJE.ToString();

            this.txtShengXiaoDate.Text = Model.TiXingDate.ToString().Replace(" 0:00:00", "");

            this.txtTiXingDate.Text = Model.DaoKuanDate.ToString().Replace(" 0:00:00", "");

            this.DZ.Value = Model.SFDK;
            this.txtBackInfo.Text = Model.BackInfo.ToString();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataEntityDataContext context = new DataEntityDataContext();
        ERPYS Model = new ERPYS();
        Model = context.ERPYS.SingleOrDefault(p => p.ID == int.Parse(Request.QueryString["ID"].ToString()));
        Model.SFDK = this.DZ.Value;
        ERPRecive model2 = context.ERPRecive.SingleOrDefault(p => p.ID == Model.FKID);
        model2.SFDK = this.DZ.Value;
        context.SubmitChanges();

        //дϵͳ��־
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û��޸�Ӧ����Ϣ(" + this.txtHeTongName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "Ӧ����Ϣ�޸ĳɹ���", "YF.aspx");
    }
}
