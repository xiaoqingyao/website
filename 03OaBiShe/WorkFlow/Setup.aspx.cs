using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkFlow_Setup : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ddlWfType.DataSource = bc.GetDataSet("select * from dbo.wf_type ", "a");
            this.ddlWfType.DataTextField = "name";
            this.ddlWfType.DataValueField = "code";
            this.ddlWfType.DataBind();

            DataTable dt = new DataTable();
            dt = bc.GetDataSet("select * from sysUser", "a").Tables[0];

            DataRow dr = dt.NewRow();
            dr["UserName"] = "";
            dt.Rows.InsertAt(dr, 0);

            this.ddlAuditor1.DataSource = dt;
            this.ddlAuditor1.DataTextField = "UserName";
            this.ddlAuditor1.DataValueField = "UserName";
            this.ddlAuditor1.DataBind();

            this.ddlAuditor2.DataSource = dt;
            this.ddlAuditor2.DataTextField = "UserName";
            this.ddlAuditor2.DataValueField = "UserName";
            this.ddlAuditor2.DataBind();

            this.ddlAuditor3.DataSource = dt;
            this.ddlAuditor3.DataTextField = "UserName";
            this.ddlAuditor3.DataValueField = "UserName";
            this.ddlAuditor3.DataBind();

            this.ddlAuditor4.DataSource = dt;
            this.ddlAuditor4.DataTextField = "UserName";
            this.ddlAuditor4.DataValueField = "UserName";
            this.ddlAuditor4.DataBind();

            init();
        }
    }

    private void init()
    {
        string sql = "select * from wf_setup where wf_type='" + this.ddlWfType.SelectedValue + "'";
        DataTable dtsetup = bc.GetDataSet(sql, "b").Tables[0];
        if (dtsetup.Rows.Count > 0)
        {
            this.ddlAuditor1.SelectedValue = dtsetup.Rows[0]["reviewer1"].ToString();
            this.ddlAuditor2.SelectedValue = dtsetup.Rows[0]["reviewer2"].ToString();
            this.ddlAuditor3.SelectedValue = dtsetup.Rows[0]["reviewer3"].ToString();
            this.ddlAuditor4.SelectedValue = dtsetup.Rows[0]["reviewer4"].ToString();
            this.note.Text = dtsetup.Rows[0]["note"].ToString();
        }
        else
        {
            this.ddlAuditor1.SelectedIndex = 0;
            this.ddlAuditor2.SelectedIndex = 0;
            this.ddlAuditor3.SelectedIndex = 0;
            this.ddlAuditor4.SelectedIndex = 0;
            this.note.Text = "";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "delete from wf_setup where wf_type='{0}';insert into wf_setup(wf_type,reviewer1,reviewer2,reviewer3,reviewer4,note) values('{0}','{1}','{2}','{3}','{4}','{5}')";
            sql = string.Format(sql, this.ddlWfType.SelectedValue, this.ddlAuditor1.SelectedValue, this.ddlAuditor2.SelectedValue, this.ddlAuditor3.SelectedValue, this.ddlAuditor4.SelectedValue, this.note.Text.Trim());
            bc.ExecSQL(sql);
            Response.Write(bc.MessageBox("保存成功!"));
        }
        catch (Exception ex)
        {
            Response.Write(bc.MessageBox("操作失败，原因：" + ex.Message));
        }

    }

    protected void ddlWfType_SelectedIndexChanged(object sender, EventArgs e)
    {
        init();
    }
}