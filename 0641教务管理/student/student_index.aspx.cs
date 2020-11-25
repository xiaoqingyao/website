﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

public partial class teacher_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student"] == null)
        {
            Response.Redirect("../default.aspx");
        }
        else
        {
            lblwz.Text = Session["student"].ToString();
            OleDbConnection conn = baseClass.GetCon();
            conn.Open();
            OleDbCommand cmd = new OleDbCommand("select stuName from tb_student_info where stuID='" + lblwz.Text + "'", conn);
            lblname.Text = cmd.ExecuteScalar().ToString();
            conn.Close();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Loginout.aspx");
    }
}
