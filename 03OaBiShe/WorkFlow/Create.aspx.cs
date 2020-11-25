using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkFlow_Create : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) { ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true); return; }
        if (!IsPostBack)
        {
            BaseClass bc = new BaseClass();
            this.ddlwfType.DataSource = bc.GetDataSet("select * from dbo.wf_type ", "a");
            this.ddlwfType.DataTextField = "name";
            this.ddlwfType.DataValueField = "code";
            this.ddlwfType.DataBind();

            this.txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            this.txtbillUser.Text = Session["loginName"].ToString();
            DataSet ds = bc.GetDataSet("select dept from employee where name='" + Session["loginName"].ToString() + "'", "a");
            this.txtDept.Text = ds.Tables[0].Rows[0]["dept"].ToString();

            DataTable dt = bc.GetDataSet("select * from sysUser", "a").Tables[0];
            this.shenpiren.DataSource = dt;
            this.shenpiren.DataTextField = "UserName";
            this.shenpiren.DataValueField = "UserName";
            this.shenpiren.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sql = "insert into wf_ApplicationForm(billcode,billuser,billdept,wfType,Title,billDate,billContent,wfStatus,statusExplain,reviewer1,reviewer2,reviewer3,reviewer4) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}')";
        string wfType = this.ddlwfType.SelectedValue;


        Guid id = Guid.NewGuid();

        string content = this.billContent.Text.Trim();
        if (string.IsNullOrEmpty(content))
        {
            Response.Write(bc.MessageBox("申请说明不能为空!")); return;
        }
        string title = this.title.Text.Trim();
        if (string.IsNullOrEmpty(title))
        {
            Response.Write(bc.MessageBox("标题不能为空!")); return;
        }
        string reviewer1 = "", reviewer2 = "", reviewer3 = "", reviewer4 = "";
        int wfStatus = 4;
        string statusExplain = "";
        if (this.rb_Ddd.Checked)
        {
            wfStatus = 3;
            reviewer4 = this.shenpiren.SelectedValue.ToString();
            statusExplain = reviewer4 + "审批中";
        }
        else
        {
            DataTable dtWfSetUp = bc.GetDataSet("select * from wf_setup where wf_type='" + wfType + "'", "3242").Tables[0];
            if (dtWfSetUp.Rows.Count <= 0)
            {
                Response.Write(bc.MessageBox("请先设置审批流!")); return;
            }
            string rev1 = dtWfSetUp.Rows[0]["reviewer1"].ToString();
            string rev2 = dtWfSetUp.Rows[0]["reviewer2"].ToString();
            string rev3 = dtWfSetUp.Rows[0]["reviewer3"].ToString();
            string rev4 = dtWfSetUp.Rows[0]["reviewer4"].ToString();
            //判断审批节点为空的情况
            if (rev4.Length > 0)
            {
                wfStatus--;
                statusExplain = rev4 + "审批中";
            }
            if (rev3.Length > 0)
            {
                wfStatus--;
                statusExplain = rev3 + "审批中";
            }
            if (rev2.Length > 0)
            {
                wfStatus--;
                statusExplain = rev2 + "审批中";
            }
            if (rev1.Length > 0)
            {
                wfStatus--;
                statusExplain = rev1 + "审批中";
            }
            List<string> lstreviewer = new List<string>();
            lstreviewer.Add(rev4);
            lstreviewer.Add(rev3);
            lstreviewer.Add(rev2);
            lstreviewer.Add(rev1);       

            for (int i = 0; i < lstreviewer.Count; i++)
            {
                if (lstreviewer[i].Length > 0)
                {
                    reviewer4 = lstreviewer[i];
                    lstreviewer.Remove(lstreviewer[i]);
                    break;
                }
            }
            for (int i = 0; i < lstreviewer.Count; i++)
            {
                if (lstreviewer[i].Length > 0)
                {
                    reviewer3 = lstreviewer[i];
                    lstreviewer.Remove(lstreviewer[i]);
                    break;
                }
            }
            for (int i = 0; i < lstreviewer.Count; i++)
            {
                if (lstreviewer[i].Length > 0)
                {
                    reviewer2 = lstreviewer[i];
                    lstreviewer.Remove(lstreviewer[i]);
                    break;
                }
            }
            for (int i = 0; i < lstreviewer.Count; i++)
            {
                if (lstreviewer[i].Length > 0)
                {
                    reviewer1 = lstreviewer[i];
                    lstreviewer.Remove(lstreviewer[i]);
                    break;
                }
            }
        }
        sql = string.Format(sql, id, this.txtbillUser.Text.Trim(), this.txtDept.Text.Trim(), this.ddlwfType.SelectedItem.Text, title, this.txtDate.Text.Trim(), content, wfStatus, statusExplain, reviewer1, reviewer2, reviewer3, reviewer4);
        try
        {
            bc.ExecSQL(sql);
            Response.Write(bc.MessageBox("提交成功!"));
        }
        catch (Exception ex)
        {
            Response.Write(bc.MessageBox("提交失败，原因：" + ex.Message));
        }
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if (this.rb_Zc.Checked)
        {
            this.ddd.Visible = false;
        }
        else
        {
            this.ddd.Visible = true;
        }
    }
}