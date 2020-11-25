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
using System.Data.SqlClient;

public partial class BaseInfo_updateEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BaseClass bc = new BaseClass();
            dlDept.DataSource = bc.GetDataSet("select * from dept", "dept");
            dlDept.DataBind();

            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from employee where ID='" + Request.QueryString["id"] + "'", con);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtEName.Text = dr["name"].ToString();
                    dlSex.Text = dr["sex"].ToString();
                    txtEBrith.Text = dr["birthday"].ToString();
                    txtAddress.Text = dr["address"].ToString();
                    txtELearn.Text = dr["learn"].ToString();
                    txtPost.Text = dr["post"].ToString();
                    txtTel.Text = dr["tel"].ToString();
                    txtEmail.Text = dr["email"].ToString();
                    dlDept.Text = dr["dept"].ToString();
                    dlJop.Text = dr["job"].ToString();
                    
                    dlState.Text = dr["state"].ToString();
                }
            }
            catch (Exception ee)
            {
                Response.Write(ee.ToString());
            }
            finally
            {
                con.Close();
            }
        }
    
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BaseClass bc = new BaseClass();
        Boolean bl;
        bl=bc.ExecSQL("update employee set name='" + txtEName.Text + "',sex='" + dlSex.Text + "',birthday='" + txtEBrith.Text + "',learn='" + txtELearn.Text + "',post='" + txtPost.Text + "',dept='" + dlDept.Text + "',job='" + dlJop.Text + "',tel='" + txtTel.Text + "',address='" + txtAddress.Text + "',email='" + txtEmail.Text + "',state='" + dlState.Text + "' where ID='" + Request.QueryString["id"] + "'");
        if (bl)
        {
            Response.Write(bc.MessageBox("员工基本信息修改成功!"));
        }
        else
        {
            Response.Write(bc.MessageBox("学生基本信息修改失败!"));
        }
        Response.Write("<script language='javascript'>this.parent.rightFrame.location.href='editEmployee.aspx'</script>");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>this.parent.rightFrame.location.href='editEmployee.aspx'</script>");
    }
}
