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

public partial class admin_deptclaAdd : System.Web.UI.Page
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
               claProfessional.Items.Add(sdr1["deptproName"].ToString());
            }
            conn.Close();
        }
       
    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        OleDbCommand cmd = new OleDbCommand("select count(*) from tb_deptclass where deptclaId='" + claId.Text.Trim() + "' and deptclaPro='" + claProfessional.Text.Trim() + "' and deptclaGrade='"+claGrade.SelectedValue.Trim()+"'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            MessageBox.Show("该年级的班级在本专业中已存在");
            conn.Close();
        }
        else if (claId.Text.Trim() == "" || claName.Text.Trim() == "")
        {
            MessageBox.Show("信息不完整！");
        }
        else
        {
            string strsql = "insert into tb_deptclass(deptclaID,deptclaName,deptclapro,deptclaGrade) values('" + claId.Text.Trim() + "','" + claName.Text.Trim() + "','" + claProfessional.Text.Trim() + "','"+claGrade.SelectedValue.Trim()+"')";
            baseClass.OperateData(strsql);
            Response.Redirect("../admin/deptclaManage.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (claId.Text.Trim() == "")
        {
            MessageBox.Show("班级编号不能为空");
        }
        else
        {
            claName.Text = claGrade.Text.Trim() + claProfessional.Text.Trim() + claId.Text.Trim() + "班";
        }
    }
   
}
