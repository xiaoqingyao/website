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

public partial class admin_teacherAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../default.aspx");
        }
        else if (!IsPostBack)
        {
            OleDbConnection conn = baseClass.GetCon();
            conn.Open();
            OleDbCommand cmd2 = new OleDbCommand("select * from tb_deptcollege order by deptCollegeName", conn);
            OleDbDataReader sdr2 = cmd2.ExecuteReader();
            while (sdr2.Read())
            {
                DropDownList1.Items.Add(sdr2["deptCollegeName"].ToString());
            }
            sdr2.Close();
            conn.Close();
        }
    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
         OleDbCommand cmd = new  OleDbCommand("select count(*) from tb_teacher where techID='" + teacherNum.Text.Trim() + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            MessageBox.Show("该用户已存在");
            conn.Close();
        }
        else if (teacherNum.Text.Trim() == "" || teacherName.Text.Trim() == "")
        {
            MessageBox.Show("信息不完整！");
        }
        else
        {
            string strsql = "insert into tb_teacher(techID,techName,techPwd) values('" + teacherNum.Text.Trim() + "','" + teacherName.Text.Trim() + "','" + teacherPwd.Text.Trim() + "')";
            string strsql1 = "insert into tb_teacher_info(techID,techName,techSex,techTitles,techTel,techPro) values('" + teacherNum.Text.Trim() + "','" + teacherName.Text.Trim() + "','"+techSex.SelectedValue.Trim()+"','"+techTitles.SelectedValue.Trim()+"','"+techTel.Text.Trim()+"','"+DropDownList1.SelectedValue.Trim()+"')";

            baseClass.OperateData(strsql);
            baseClass.OperateData(strsql1);
            Response.Redirect("../admin/teacherManage.aspx");
        }
    }
}
