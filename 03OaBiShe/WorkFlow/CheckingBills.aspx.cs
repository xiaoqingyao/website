using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkFlow_CheckingBills : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) { ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true); return; }
        if (!IsPostBack) {
            init();
        }
    }

    private void init()
    {
        
        DataTable dt = bc.GetDataSet("select * from wf_ApplicationForm where wfStatus!=-1 and statusExplain like '%" + Session["loginName"].ToString() + "%'", "12").Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string billcode = GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text.ToString();
        string checkUser = Session["loginName"].ToString();
        if (e.CommandName.Equals("rejected"))
        {
            //GridViewRow drv = ((GridViewRow)(((ButtonField)(e.CommandSource)).Parent.Parent));
            //((TextBox)(  .FindControl("sm")))
            int rowindex = int.Parse(e.CommandArgument.ToString());
            string sm = ((TextBox)GridView1.Rows[rowindex].Cells[9].FindControl("sm")).Text.ToString();
            //驳回
            string sql = "update wf_ApplicationForm set wfStatus=-1,statusExplain='" + checkUser + "驳回" + "',bohuiSm='" + sm + "' where billcode='" + billcode + "'";
            bc.ExecSQL(sql);
            init();
        }
        else if (e.CommandName.Equals("approve"))
        {
            string statusExplain = "";

            string sql = "select * from wf_ApplicationForm where billcode='" + billcode + "'";
            DataTable dt = bc.GetDataSet(sql, "1").Tables[0];
            int wfstatus = int.Parse(dt.Rows[0]["wfStatus"].ToString());
            if (wfstatus == 3)
            {
                statusExplain = "审批通过";
            }
            else
            {
                //查找下一位审核人
                sql = "select reviewer" + (wfstatus + 2) + " from wf_ApplicationForm where billcode='" + billcode + "' ";
                statusExplain = bc.GetDataSet(sql, "21").Tables[0].Rows[0][0].ToString() + "审批中";
            }
            //通过
            sql = "update wf_ApplicationForm set wfStatus=wfStatus+1,statusExplain='" + statusExplain + "' where billcode='" + billcode + "'";
            bc.ExecSQL(sql);
            init();
        }
        //else if (e.CommandName.Equals("upUser"))
        //{
        //    string sql = "select * from wf_ApplicationForm where billcode='" + billcode + "'";
        //    DataTable dt = bc.GetDataSet(sql, "1").Tables[0];
        //    string wfstatus = dt.Rows[0]["wfStatus"].ToString();
        //    string ziduan = "reviewer1";
        //    if (wfstatus == "0")
        //    {
        //        ziduan = "reviewer1";
        //    }
        //    else if (wfstatus == "1")
        //    {
        //        ziduan = "reviewer2";
        //    }
        //    else if (wfstatus == "2")
        //    {
        //        ziduan = "reviewer3";
        //    }
        //    string username = ((DropDownList)GridView1.Rows[int.Parse(e.CommandArgument.ToString())].FindControl("user")).SelectedValue;
        //    sql = "update wf_ApplicationForm set " + ziduan + "='" + username + "',statusExplain='" + username + "审批中' where billcode='" + billcode + "'";
        //    Response.Write(sql);
        //    bc.ExecSQL(sql);
        //    init();
        //}
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    DropDownList drp = ((DropDownList)e.Row.FindControl("user"));
        //    DataTable dt = bc.GetDataSet("select * from sysUser", "1").Tables[0];
        //    if (dt != null)
        //    {
        //        drp.DataSource = dt;
        //        drp.DataTextField = "userName";
        //        drp.DataValueField = "userName";
        //        drp.DataBind();
        //    }
        //}
    }


}