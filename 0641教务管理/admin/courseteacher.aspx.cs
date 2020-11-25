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

public partial class admin_courseteacher : System.Web.UI.Page
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
            OleDbCommand cmd2 = new OleDbCommand("select * from tb_deptcollege order by deptCollegeName", conn);
            OleDbDataReader sdr2 = cmd2.ExecuteReader();
            while (sdr2.Read())
            {
                DropDownList2.Items.Add(sdr2["deptCollegeName"].ToString());
            }
            sdr2.Close();
            OleDbCommand cmd3 = new OleDbCommand("select * from tb_deptclass order by deptclaName", conn);
            OleDbDataReader sdr3 = cmd3.ExecuteReader();
            while (sdr3.Read())
            {
                DropDownList3.Items.Add(sdr3["deptclaName"].ToString());
            }
            sdr3.Close();
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        ListBox1.Items.Clear();
        OleDbCommand cmd1 = new OleDbCommand("select * from tb_teacher_info where techPro='"+DropDownList2.SelectedValue.Trim()+"' order by techID", conn);
        OleDbDataReader sdr1 = cmd1.ExecuteReader();
        while (sdr1.Read())
        {
            ListBox1.Items.Add(sdr1["techName"].ToString());
        }
        sdr1.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int count = ListBox1.Items.Count;
        int index = 0;
        for (int i = 0; i < count; i++)
        {
            ListItem item = ListBox1.Items[index];
            if (ListBox1.Items[index].Selected == true)
            {

                ListBox1.Items.Remove(item);
                ListBox2.Items.Add(item);
                index--;
            }
            index++;
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int count = ListBox2.Items.Count;
        int index = 0;
        for (int i = 0; i < count; i++)
        {
            ListItem item = ListBox2.Items[index];
            if (ListBox2.Items[index].Selected == true)
            {

                ListBox2.Items.Remove(item);
                ListBox1.Items.Add(item);
                index--;
            }
            index++;
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        int flag = 0;
            int count = ListBox2.Items.Count;
            int i = count;
            string[] ch1 = new string[count];
            for (int k = 0; k < i; k++)
            {
        OleDbCommand cmd = new OleDbCommand("SELECT count(*) FROM tb_courseteacher where courseName='" +DropDownList1.SelectedValue.Trim()+ "'and  techClass='"+DropDownList3.SelectedValue.Trim()+"'", conn);
        int j = Convert.ToInt32(cmd.ExecuteScalar());
        if (j > 0)
                {
                    flag = 1;
                  
                }
              
                else
               {
                ch1[k] = ListBox2.Items[k].Value;  
                string strsql2 = string.Format(@"insert into tb_courseTeacher(courseName,techName,techClass) values ('" + DropDownList1.SelectedValue.Trim() + "','" +ch1[k]+ "','"+DropDownList3.SelectedValue.Trim()+"')");             
                OleDbCommand cmd2 = new OleDbCommand(strsql2, conn);
                cmd2.ExecuteNonQuery();
                flag = 2;
                
               }
               
              
         }
         if (flag == 1)
         {
             MessageBox.Show("该班级科目已指定教师！");
             ListBox2.Items.Clear();
         }
         else if (flag == 2)
         {
             MessageBox.Show("指定成功！");
             ListBox2.Items.Clear();
         }
        
         conn.Close();     
       
    }
}
