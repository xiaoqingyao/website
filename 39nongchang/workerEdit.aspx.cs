using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class workerEdit : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            object objCode = Request["code"];
            if (objCode != null)
            {
                string code = objCode.ToString();
                string sql = "select * from worker where code='" + code + "'";
                DataTable dt = new sqlHelper().GetDataTable(sql, null);
                this.code.Text = dt.Rows[0]["code"].ToString();
                this.name.Text = dt.Rows[0]["name"].ToString();
                this.age.Text = dt.Rows[0]["age"].ToString();
                this.sex.Text = dt.Rows[0]["sex"].ToString();
                this.phone.Text = dt.Rows[0]["phone"].ToString();
                this.address.Text = dt.Rows[0]["address"].ToString();
                this.farmerCode.Value = dt.Rows[0]["farmerCode"].ToString();
            }
            else {
                this.farmerCode.Value = Session["userCode"].ToString();
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string code = this.code.Text.Trim();
        string name = this.name.Text.Trim();
        string age = this.age.Text.Trim();
        string sex = this.sex.Text.Trim();
        string phone = this.phone.Text.Trim();
        string address = this.address.Text.Trim();
        string farmerCode = this.farmerCode.Value;
        if (string.IsNullOrEmpty(code))
        {
            showMessage("编号不能为空！", false, "");
            return;
        }
        string sql = "delete from worker where code='{0}';insert into dbo.worker(code,name,age,sex,phone,address,farmerCode) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')";
        sql = string.Format(sql, code, name, age, sex, phone, address, farmerCode);
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