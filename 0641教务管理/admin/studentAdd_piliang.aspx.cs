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

public partial class admin_studentAdd_piliang : System.Web.UI.Page
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
            OleDbCommand cmd1 = new OleDbCommand("select * from tb_deptprofessional order by deptproId", conn);
            OleDbDataReader sdr1 = cmd1.ExecuteReader();
            while (sdr1.Read())
            {
                DropDownList1.Items.Add(sdr1["deptproName"].ToString());
            }
            sdr1.Close();
            OleDbCommand cmd2 = new OleDbCommand("select * from tb_deptclass order by deptclaName", conn);
            OleDbDataReader sdr2 = cmd2.ExecuteReader();
            while (sdr2.Read())
            {
               DropDownList2.Items.Add(sdr2["deptclaName"].ToString());
            }
            sdr2.Close();
            OleDbCommand cmd3 = new OleDbCommand("select * from tb_deptCollege order by deptCollegeId", conn);
            OleDbDataReader sdr3 = cmd3.ExecuteReader();
            while (sdr3.Read())
            {
                DropDownList3.Items.Add(sdr3["deptCollegeName"].ToString());
            }
            sdr1.Close();
            conn.Close();
        }
    }
    OleDbConnection conn = baseClass.GetCon();

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (NumMin.Text == "" || NumMax.Text == "")
        {
            MessageBox.Show("请输入起始编号和终止编号");
        }
        else
        {
            conn.Open();
            OleDbCommand cmd = new OleDbCommand("SELECT count(*) FROM tb_student_info where stuID>='" + NumMin.Text.Trim() + "'and stuID<'" + NumMax.Text.Trim() + "'", conn);
            int j = Convert.ToInt32(cmd.ExecuteScalar());
            if (j > 0)
            {
                MessageBox.Show("该编号段学生信息已存在");
               
                
            }
            else
            {
                for (int i = Convert.ToInt32(NumMin.Text); i <= Convert.ToInt32(NumMax.Text); i++)
                {
                    
                    string strSql1 = string.Format(@"insert into tb_student(stuID) values ('{0}')", i.ToString());
                    string strsql2 = string.Format(@"insert into tb_student_info(stuID,stuCollege,stuProfessional,stuClass) values ('{0}','"+DropDownList3.SelectedValue.Trim()+"','"+DropDownList1.SelectedValue.Trim()+"','"+DropDownList2.SelectedValue.Trim()+"')", i.ToString());
                    OleDbCommand cmd1 = new OleDbCommand(strSql1, conn);
                    OleDbCommand cmd2 = new OleDbCommand(strsql2, conn);
                    cmd1.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                }
                MessageBox.Show("批量信息添加成功！");
                conn.Close();
            }
         
        }
    }
}
