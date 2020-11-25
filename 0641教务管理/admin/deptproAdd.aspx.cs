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

public partial class admin_deptproAdd : System.Web.UI.Page
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
            OleDbCommand cmd1 = new OleDbCommand("select * from tb_deptCollege order by deptCollegeId", conn);
            OleDbDataReader sdr1 = cmd1.ExecuteReader();
            while (sdr1.Read())
            {
                proCollege.Items.Add(sdr1["deptCollegeName"].ToString());

            }
            conn.Close();
        }
    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        OleDbCommand cmd = new OleDbCommand("select count(*) from tb_deptprofessional where deptproId='" + proId.Text.Trim() + "' and deptproCollege='"+proCollege.Text.Trim()+"'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            MessageBox.Show("该专业在本学院已存在");
            conn.Close();
        }
        else if (proId.Text.Trim() == "" || proName.Text.Trim() == "")
        {
            MessageBox.Show("信息不完整！");
        }
        else
        {
            string strsql = "insert into tb_deptprofessional(deptproId,deptproName,deptproCollege) values('" + proId.Text.Trim() + "','" + proName.Text.Trim() + "','" + proCollege.Text.Trim() + "')";
            baseClass.OperateData(strsql);
            Response.Redirect("../admin/deptproManage.aspx");
        }
    }
}
