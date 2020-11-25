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

public partial class admin_courseMode : System.Web.UI.Page
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
            OleDbCommand cmd1 = new OleDbCommand("select * from tb_course", conn);
            OleDbDataReader sdr1 = cmd1.ExecuteReader();
            while (sdr1.Read())
            {
                courseName.Items.Add(sdr1["courseName"].ToString());

            }
           conn.Close();
       }
       
    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
       
            string sqlstr = "update tb_course set courseMode='" + DropDownList1.SelectedValue.Trim() + "' where courseName='" + courseName.SelectedValue.Trim() + "'";
            baseClass.OperateData(sqlstr);
            MessageBox.Show("考试状态修改成功！");

        

    }
    protected void courseName_SelectedIndexChanged(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
            string sqlstr = "select * from tb_course where courseName='" + courseName.SelectedValue.Trim() + "'";
            OleDbCommand cmd = new OleDbCommand(sqlstr, conn);
            OleDbDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                courseMode.Text = sdr["courseMode"].ToString();
            }
            conn.Close();
      
       
           
       
    }
   
}
