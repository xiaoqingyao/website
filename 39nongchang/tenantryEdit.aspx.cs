using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tenantryEdit : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            object objCode = Request["code"];
            if (objCode != null)
            {
                string code = objCode.ToString();
                string sql = "select * from tenantry where code='" + code + "'";
                DataTable dt = new sqlHelper().GetDataTable(sql, null);
                this.code.Text = dt.Rows[0]["code"].ToString();
                this.name.Text = dt.Rows[0]["name"].ToString();
                this.pwd.Text = dt.Rows[0]["pwd"].ToString();
                this.phone.Text = dt.Rows[0]["phone"].ToString();
                this.address.Text = dt.Rows[0]["address"].ToString();
                this.age.Text = dt.Rows[0]["age"].ToString();
                this.deposit.Text = dt.Rows[0]["deposit"].ToString();
                this.sex.SelectedValue = dt.Rows[0]["sex"].ToString();
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string code = this.code.Text.Trim();
        string name = this.name.Text.Trim();
        string pwd = this.pwd.Text.Trim();
        string phone = this.phone.Text.Trim();
        string address = this.address.Text.Trim();
        string deposit = this.deposit.Text.Trim();
        string age = this.deposit.Text.Trim();
        string sex = this.sex.SelectedValue;
        if (string.IsNullOrEmpty(code))
        {
            showMessage("编号不能为空！", false, "");
            return;
        }
        string sql = "delete from tenantry where code='{0}';insert into dbo.tenantry(code,name,pwd,phone,address,deposit,age,sex) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')";
        sql = string.Format(sql, code, name, pwd, phone, address, deposit, age, sex);
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