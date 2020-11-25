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

public partial class admin_studentInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../default.aspx");
        }
    }
    protected void selectStudent_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() == "")
        {
            MessageBox.Show("请输入学号");
        }
        else
        {
             OleDbConnection conn = baseClass.GetCon();
            conn.Open();
             OleDbCommand cmd = new  OleDbCommand("select count(*) from tb_student_info where stuID='" + TextBox1.Text.Trim() + "'", conn);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i <= 0)
            {
                MessageBox.Show("无该生信息");
            }
            else
            {
                string sqlstr = "select * from tb_student_info where stuID='" + TextBox1.Text.Trim() + "'";
                 OleDbCommand cmd1 = new  OleDbCommand(sqlstr, conn);
                 OleDbDataReader sdr = cmd1.ExecuteReader();
                while (sdr.Read())
                {
                    stuID.Text = sdr["stuID"].ToString();
                    stuName.Text = sdr["stuName"].ToString();
                    stuSex.Text = sdr["stuSex"].ToString();
                    stuBirth.Text = sdr["stuBirth"].ToString();
                    stuBirthplace.Text = sdr["stuBirthplace"].ToString();
                    stuCollege.Text = sdr["stuCollege"].ToString();
                    stuProfessional.Text = sdr["stuProfessional"].ToString();
                    stuClass.Text = sdr["stuClass"].ToString();
                    stuTel.Text = sdr["stuTel"].ToString();
                    stuHomeAddr.Text = sdr["stuHomeAddr"].ToString();
                    stuParent.Text = sdr["stuParent"].ToString();
                    stuHomephone.Text = sdr["stuHomePhone"].ToString();
                }
                conn.Close();
            }
        }
      
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        DateTime stuBir;
        stuBir = Convert.ToDateTime(stuBirth.Text.Trim());
                string sqlstr = "update tb_student_info set stuID='" + stuID.Text.Trim() + "',stuName='" + stuName.Text.Trim() + "',stuSex='" + stuSex.Text.Trim() + "',stuBirth='" +stuBir + "',stuBirthplace='" + stuBirthplace.Text.Trim() + "',stuCollege='" + stuCollege.Text.Trim() + "',stuProfessional='" + stuProfessional.Text.Trim() + "',stuClass='" + stuClass.Text.Trim() + "',stuTel='" + stuTel.Text.Trim() + "',stuHomeAddr='" + stuHomeAddr.Text.Trim() + "',stuParent='" + stuParent.Text.Trim() + "',stuHomephone='" + stuHomephone.Text.Trim() + "' where stuID='" + TextBox1.Text.Trim() + "'";
                string sqlstr1 = "update tb_student set stuID='" + stuID.Text.Trim() + "',stuName='" + stuName.Text.Trim() + "' where stuID='" + TextBox1.Text.Trim() + "'";
                baseClass.OperateData(sqlstr);
                baseClass.OperateData(sqlstr1);
                MessageBox.Show("学生信息修改成功！");
       
    }
}
