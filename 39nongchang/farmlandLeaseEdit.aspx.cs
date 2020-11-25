using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class farmlandLeaseEdit : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            object objCode = Request["code"];
            if (objCode != null)
            {
                string code = objCode.ToString();
                string sql = "select * from farmland where code='" + code + "'";
                DataTable dt = new sqlHelper().GetDataTable(sql, null);
                this.code.Text = dt.Rows[0]["code"].ToString();
                this.name.Text = dt.Rows[0]["name"].ToString();
                this.area.Text = dt.Rows[0]["area"].ToString();
                this.farmercode.Text = dt.Rows[0]["farmercode"].ToString();
                this.address.Text = dt.Rows[0]["address"].ToString();
                this.status.SelectedValue = dt.Rows[0]["status"].ToString();

                //承租人
                string sqlchengzu = "select * from tenantry ";
                DataTable dtchengzu = new sqlHelper().GetDataTable(sqlchengzu, null);
                this.tenantry.DataSource = dtchengzu;
                this.tenantry.DataTextField = "name";
                this.tenantry.DataValueField = "code";
                this.tenantry.DataBind();
            }

        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string code = this.code.Text.Trim();
        string name = this.name.Text.Trim();
        string chengzuren = this.tenantry.SelectedValue;
        string chengzurenName = this.tenantry.SelectedItem.Text;
        if (string.IsNullOrEmpty(code))
        {
            showMessage("编号不能为空！", false, "");
            return;
        }
        string sql = "update farmland set tenantryCode='{0}',tenantryName='{1}',status='已出租' where code='{2}';insert into farmlandLease(farmlandCode,farmlandName,fromUserName,toUserName) values('{2}','{3}','{4}','{1}');";
        sql = string.Format(sql, chengzuren, chengzurenName, code, name, Session["userName"].ToString());
        try
        {
            new sqlHelper().ExecuteNonQuery(sql, null);
            showMessage("保存成功！", false, "window.parent.$.fancybox.close();");
        }
        catch (Exception ex)
        {

            showMessage(ex.Message, false, "");
        }

    }
}