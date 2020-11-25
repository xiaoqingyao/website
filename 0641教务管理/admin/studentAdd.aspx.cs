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

public partial class admin_studentAdd : System.Web.UI.Page
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
        OleDbCommand cmd = new OleDbCommand("select count(*) from tb_student where stuID='" + studentNum.Text.Trim() + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            MessageBox.Show("该用户已存在");
            conn.Close();
        }
        else if (studentName.Text.Trim() == "" || studentNum.Text.Trim() == "")
        {
            MessageBox.Show("信息不完整");
        }
        else
        {
            string strsql = "insert into tb_student(stuID,stuPwd) values('" + studentNum.Text.Trim() + "','" + studentPwd.Text.Trim() + "')";
            string strsql1 = "insert into tb_student_info(stuID,stuName) values('" + studentNum.Text.Trim() + "','" + studentName.Text.Trim() + "')";

            baseClass.OperateData(strsql);
            baseClass.OperateData(strsql1);
            Response.Redirect("../admin/studentManage.aspx");
        }
    }
}
