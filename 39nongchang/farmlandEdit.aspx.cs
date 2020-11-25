using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class farmlandEdit : BasePage
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
                this.chengzurencode.Value = dt.Rows[0]["tenantryCode"].ToString();
                this.chengzurenname.Value = dt.Rows[0]["tenantryName"].ToString();
                this.code.ReadOnly = true;
                this.code.BackColor = System.Drawing.Color.Gray;// "#999999";
            }
            else
            {
                this.farmercode.Text = Session["userCode"].ToString();
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string code = this.code.Text.Trim();
        string name = this.name.Text.Trim();
        string area = this.area.Text.Trim();
        string farmercode = this.farmercode.Text.Trim();
        string address = this.address.Text.Trim();
        string status = this.status.SelectedValue;
        string chengzurencode = this.chengzurencode.Value;
        string chengzurenname = this.chengzurenname.Value;
        if (string.IsNullOrEmpty(code))
        {
            showMessage("编号不能为空！", false, "");
            return;
        }
        string sql = "delete from farmland where code='{0}';insert into dbo.farmland(code,name,area,farmercode,address,status,tenantryCode,tenantryName) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')";
        sql = string.Format(sql, code, name, area, farmercode, address, status, chengzurencode, chengzurenname);
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