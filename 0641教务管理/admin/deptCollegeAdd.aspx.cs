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
using System.Data.OleDb;

public partial class admin_deptCollegeAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../default.aspx");
        }
    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        OleDbCommand cmd = new OleDbCommand("select count(*) from tb_deptCollege where deptCollegeId='" + collegeId.Text.Trim() + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            MessageBox.Show("该学院信息已存在");
            conn.Close();
        }
        else if (collegeId.Text.Trim() == "" || collegeName.Text.Trim() == "")
        {
            MessageBox.Show("信息不完整！");
        }
        else
        {
            string strsql = "insert into tb_deptCollege(deptCollegeId,deptCollegeName,deptCollegeTel) values('" +collegeId.Text.Trim()+ "','" + collegeName.Text.Trim() + "','" + collegeTel.Text.Trim() + "')";
            baseClass.OperateData(strsql);
            Response.Redirect("../admin/deptCollegeManage.aspx");
        }
    }
}
