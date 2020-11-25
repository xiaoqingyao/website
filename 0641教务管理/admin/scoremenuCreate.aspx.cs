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
using System.Text;

public partial class admin_scoremenuCreate : System.Web.UI.Page
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
            OleDbCommand cmd1 = new OleDbCommand("select * from tb_course where courseMode='开启' order by courseName", conn);
            OleDbDataReader sdr1 = cmd1.ExecuteReader();
            while (sdr1.Read())
            {
                DropDownList1.Items.Add(sdr1["courseName"].ToString());
            }
            sdr1.Close();
            OleDbCommand cmd2 = new OleDbCommand("select * from tb_deptclass order by deptclaName", conn);
            OleDbDataReader sdr2 = cmd2.ExecuteReader();
            while (sdr2.Read())
            {
                DropDownList2.Items.Add(sdr2["deptclaName"].ToString());
            }
            sdr2.Close();
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        OleDbDataAdapter myda = new OleDbDataAdapter("select * from 查询2 where stuClass='" + DropDownList2.SelectedValue.Trim() + "' and courseName='" + DropDownList1.SelectedValue.Trim() + "'", conn);
        DataSet myds = new DataSet();
        myda.Fill(myds, "admin_info");
        GridView1.DataSource = myds;
        GridView1.DataKeyNames = new string[] { "stuID" };
        GridView1.DataBind();
        conn.Close();
    }
    protected void update_Click(object sender, EventArgs e)
    {
        int flag=0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            OleDbConnection conn = baseClass.GetCon();
            conn.Open();
            StringBuilder query = new StringBuilder();
            GridViewRow row = GridView1.Rows[i];
            string stuID = ((TextBox)row.Cells[0].FindControl("txtstuID")).Text.Replace("'", "");
            string stuName = ((TextBox)row.Cells[0].FindControl("txtstuName")).Text.Replace("'", "");
            string courseName = ((TextBox)row.Cells[0].FindControl("txtcourseName")).Text.Replace("'", "");
            OleDbCommand cmd = new OleDbCommand("select count(*) from score where stuID='" + stuID + "' and courseName='" + courseName + "'", conn);
            int j = Convert.ToInt32(cmd.ExecuteScalar());
          
            if (j>0)
            {
                flag=1;
            }
            else
            { 
                query.Append("insert into score(stuID,stuName,courseName) values('" + stuID + "','" + stuName + "','" + courseName + "')");
                baseClass.ExecuteSql(query.ToString());
                flag=2;
            }    
        }
        if (flag ==1)
        {
            MessageBox.Show("该班级本科目名单已存在！");
        }
        else if(flag==2)
        {
            MessageBox.Show("名单添加成功！");
        }
    
 
    }
}
