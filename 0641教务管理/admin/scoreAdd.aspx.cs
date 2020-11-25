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

public partial class admin_scoreAdd : System.Web.UI.Page
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

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {
            tc.Attributes["style"] = "border-color:Black";
        }
        //行绑定DropDownList
        if (((DropDownList)e.Row.FindControl("txtscoreMode1")) != null)
        {
            DropDownList txtscoreMode1 = (DropDownList)e.Row.FindControl("txtscoreMode1");
            txtscoreMode1.Items.Clear();
            txtscoreMode1.Items.Add(new ListItem("参考", "参考"));
            txtscoreMode1.Items.Add(new ListItem("缺考", "缺考"));
            txtscoreMode1.Items.Add(new ListItem("缓考", "缓考"));
            //ddlSex.Items.Add(new ListItem("男"));
            //ddlSex.Items.Add(new ListItem("女"));
            //DropDownList初始被选择的项
            txtscoreMode1.SelectedValue = ((HiddenField)e.Row.FindControl("txtscoreMode")).Value;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        OleDbDataAdapter myda = new OleDbDataAdapter("select * from 查询1 where stuClass='"+DropDownList2.SelectedValue.Trim()+"' and courseName='"+DropDownList1.SelectedValue.Trim()+"' order by coursename,stuID", conn);
        DataSet myds = new DataSet();
        myda.Fill(myds, "admin_info");
        GridView1.DataSource = myds;
        GridView1.DataKeyNames = new string[] { "stuID" };
        GridView1.DataBind();
        conn.Close();
    }
    protected void update_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            OleDbConnection conn=baseClass.GetCon();
            conn.Open();
            StringBuilder query = new StringBuilder();
            GridViewRow row = GridView1.Rows[i];
            string stuID = ((TextBox)row.Cells[0].FindControl("txtstuID")).Text.Replace("'", "");
            string stuName = ((TextBox)row.Cells[0].FindControl("txtstuName")).Text.Replace("'", "");
            string courseName = ((TextBox)row.Cells[0].FindControl("txtcourseName")).Text.Replace("'", "");
            string score = ((TextBox)row.Cells[0].FindControl("txtscore")).Text.Replace("'", "");
            string scoreMode = ((DropDownList)row.Cells[0].FindControl("txtscoreMode1")).SelectedValue;

            query.Append("update score set score='" + score + "',scoreMode='" + scoreMode + "' where stuID='" +stuID+ "' and courseName='"+courseName+"'");
            //ID=" + GridView1.DataKeys[i].Value + "");
            baseClass.ExecuteSql(query.ToString());
            
        }
        MessageBox.Show("成绩添加成功！");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
