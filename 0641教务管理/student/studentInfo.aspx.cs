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
        if (Session["student"] == null)
        {
            Response.Redirect("../default.aspx");
        }
        else if (!IsPostBack)
        {
            OleDbConnection conn = baseClass.GetCon();
            conn.Open();
            OleDbCommand cmd1 = new OleDbCommand("select * from tb_student_info where stuID='" + Session["student"].ToString() + "'", conn);
            OleDbDataReader sdr1 = cmd1.ExecuteReader();
            while (sdr1.Read())
            {
                stuID.Text = sdr1["stuID"].ToString();
                stuName.Text = sdr1["stuName"].ToString();
                stuSex.Text = sdr1["stuSex"].ToString();
                stuBirth.Text = sdr1["stuBirth"].ToString();
                stuBirthplace.Text = sdr1["stuBirthplace"].ToString();
                stuCollege.Text = sdr1["stuCollege"].ToString();
                stuProfessional.Text = sdr1["stuProfessional"].ToString();
                stuClass.Text = sdr1["stuClass"].ToString();
                stuTel.Text = sdr1["stuTel"].ToString();
                stuHomeAddr.Text = sdr1["stuHomeAddr"].ToString();
                stuParent.Text = sdr1["stuParent"].ToString();
                stuHomephone.Text = sdr1["stuHomephone"].ToString();
            }
            sdr1.Close();
        }
    }
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        DateTime stuBir;
        stuBir = Convert.ToDateTime(stuBirth.Text.Trim());
                string sqlstr = "update tb_student_info set stuName='" + stuName.Text.Trim() + "',stuSex='" + stuSex.Text.Trim() + "',stuBirth='" +stuBir + "',stuBirthplace='" + stuBirthplace.Text.Trim() + "',stuCollege='" + stuCollege.Text.Trim() + "',stuProfessional='" + stuProfessional.Text.Trim() + "',stuClass='" + stuClass.Text.Trim() + "',stuTel='" + stuTel.Text.Trim() + "',stuHomeAddr='" + stuHomeAddr.Text.Trim() + "',stuParent='" + stuParent.Text.Trim() + "',stuHomephone='" + stuHomephone.Text.Trim() + "' where stuID='" + Session["student"].ToString()+ "'";
                string sqlstr1 = "update tb_student set stuName='" + stuName.Text.Trim() + "' where stuID='" + Session["student"].ToString() + "'";
                baseClass.OperateData(sqlstr);
                baseClass.OperateData(sqlstr1);
                MessageBox.Show("学生信息修改成功！");
       
    }
}
