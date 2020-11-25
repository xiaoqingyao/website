using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cropEdit : BasePage
{
    sqlHelper server = new sqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //界面初始化
            string userCode = Session["userCode"].ToString();
            string userName = Session["userName"].ToString();
            string sql = "select * from worker where farmerCode='" + userCode + "'";
            DataTable dt = server.GetDataTable(sql, null);
            this.worker.DataSource = dt;
            this.worker.DataTextField = "name";
            this.worker.DataValueField = "code";
            this.worker.DataBind();

            sql = "select * from farmland where tenantryCode='" + userCode + "'";
            dt = server.GetDataTable(sql, null);
            this.farmland.DataSource = dt;
            this.farmland.DataTextField = "name";
            this.farmland.DataValueField = "code";
            this.farmland.DataBind();

            object objCode = Request["code"];
            if (objCode != null)
            {
                string code = objCode.ToString();
                sql = "select * from crop where code='" + code + "'";
                dt = new sqlHelper().GetDataTable(sql, null);
                this.name.Text = dt.Rows[0]["name"].ToString();
                this.code.Value = dt.Rows[0]["code"].ToString();
                this.tenantryName.Text = dt.Rows[0]["tenantryName"].ToString();
                this.tenantryCode.Value = dt.Rows[0]["tenantryCode"].ToString();
                this.dtFrm.Text = dt.Rows[0]["dtFrm"].ToString();
                this.dtTo.Text = dt.Rows[0]["dtTo"].ToString();
                this.totalDay.Text = dt.Rows[0]["totalDay"].ToString();
                this.worker.SelectedValue = dt.Rows[0]["WorkerCode"].ToString();
                this.farmland.SelectedValue = dt.Rows[0]["farmlandCode"].ToString();
                this.status.SelectedValue = dt.Rows[0]["status"].ToString();
            }
            else
            {
                this.tenantryCode.Value = userCode;
                this.tenantryName.Text = userName;
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string code = this.code.Value;
        string name = this.name.Text.Trim();
        string tenantryCode = this.tenantryCode.Value;
        string tenantryName = this.tenantryName.Text.Trim();
        string dtFrom = this.dtFrm.Text.Trim();
        string dtTo = this.dtTo.Text.Trim();
        string farmlandCode = this.farmland.SelectedValue;
        string farmlandName = this.farmland.SelectedItem.Text;
        string workerCode = this.worker.SelectedValue;
        string workerName = this.worker.SelectedItem.Text;
        string totalDays = this.totalDay.Text;
        string strstatus = this.status.SelectedValue;

        string sql = "delete from crop where code='{0}';insert into dbo.crop(name,tenantryCode,tenantryName,dtFrm,dtTo,totalDay,farmlandCode,farmlandName,WorkerCode,WorkerName,status) values('{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}')";
        sql = string.Format(sql, code, name, tenantryCode, tenantryName, dtFrom, dtTo, totalDays, farmlandCode, farmlandName, workerCode, workerName, strstatus);
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