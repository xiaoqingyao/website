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

public partial class UpdateDetails : System.Web.UI.Page
{
    EntPersonal obj = new EntPersonal();
    CtlPersonal ctl = new CtlPersonal();
    Common com = new Common();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
            string userName = Session["PerName"].ToString();
            DataTable dt = new DataTable();
            dt = ctl.selectPersonal(userName);
            this.lblUserName.Text = dt.Rows[0][7].ToString();
            this.txtEmail.Text = dt.Rows[0][2].ToString();
            this.txtPhone.Text = dt.Rows[0][3].ToString();
            this.txtAddress.Text = dt.Rows[0][8].ToString();
            this.txtMSN.Text = dt.Rows[0][4].ToString();
            this.txtQQ.Text = dt.Rows[0][5].ToString();
            this.imgPhoto.ImageUrl = "~/Image/Personal/" + dt.Rows[0][6] + "";
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        obj.perName = Session["PerName"].ToString();
        obj.email = this.txtEmail.Text;
        obj.phone = this.txtPhone.Text;
        obj.address = this.txtAddress.Text;
        obj.msn = this.txtMSN.Text;
        obj.qq = this.txtQQ.Text;
        obj.photo = "~/Image/Perosnal/" + this.imgPhoto.ImageUrl + "";

        try
        {
            ctl.updateDetails(obj);
            Response.Write("修改成功！");
        }
        catch (Exception ex)
        {
            com.Alert("Error!" + ex.Message.ToString());
        }
    }
}
