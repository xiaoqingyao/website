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
        if (Session["teacher"] == null)
        {
            Response.Redirect("../default.aspx");
        }
        else if (!IsPostBack)
        {
            OleDbConnection conn = baseClass.GetCon();
            conn.Open();
            OleDbCommand cmd1 = new OleDbCommand("select * from tb_teacher_info where techID='" + Session["teacher"].ToString() + "'", conn);
            OleDbDataReader sdr1 = cmd1.ExecuteReader();
            while (sdr1.Read())
            {
                techID.Text = sdr1["techID"].ToString();
                techName.Text = sdr1["techName"].ToString();
                techSex.Text = sdr1["techSex"].ToString();
                techTel.Text = sdr1["techTel"].ToString();
                techPro.Text = sdr1["techPro"].ToString();
                techTitles.Text = sdr1["techTitles"].ToString();
            }
            sdr1.Close();
            OleDbCommand cmd2 = new OleDbCommand("select * from tb_deptCollege order by deptCollegeName", conn);
            OleDbDataReader sdr2 = cmd2.ExecuteReader();
            while (sdr2.Read())
            {
                techPro.Items.Add(sdr2["deptCollegeName"].ToString());
            }
            sdr2.Close();
        }
    }
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
       
                string sqlstr = "update tb_teacher_info set techName='" + techName.Text.Trim() + "',techSex='" + techSex.Text.Trim() + "',techTel='" + techTel.Text.Trim() + "',techPro='"+techPro.SelectedValue.Trim()+"',techTitles='"+techTitles.SelectedValue.Trim()+"'  where techID='" + Session["teacher"].ToString()+ "'";
                string sqlstr1 = "update tb_teacher set techName='" + techName.Text.Trim() + "' where techID='" + Session["teacher"].ToString() + "'";
                baseClass.OperateData(sqlstr);
                baseClass.OperateData(sqlstr1);
                MessageBox.Show("信息修改成功！");
       
    }
}
