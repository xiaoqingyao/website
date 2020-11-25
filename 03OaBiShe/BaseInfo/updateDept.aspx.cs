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

public partial class BaseInfo_updateDept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.btnReturn.Attributes.Add("oncheck","<script language=javascript>location='javascript:history.go(-1)'</script>");
        if (!IsPostBack)
        { 
                SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
                con.Open();
                SqlCommand cmd =new SqlCommand("select * from dept where deptID='" + Request.QueryString["id"] + "'", con);
                try
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        TextBox1.Text = dr["deptName"].ToString();
                        TextBox2.Text=dr["memo"].ToString();
                    }
                }
                catch(Exception ee)
                {
                    Response.Write(ee.ToString());
                }
                finally
                {
                    con.Close();
                }
        }
        
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>this.parent.rightFrame.location.href='EditDept.aspx'</script>");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BaseClass bc = new BaseClass();
        Boolean bl;
        bl = bc.ExecSQL("update dept set deptName='"+TextBox1.Text+"',memo='"+TextBox2.Text+"' where deptID='" + Request.QueryString["id"] + "'");
        if (bl)
        {
            Response.Write(bc.MessageBox("班级基本信息修改成功!"));
        }
        else
        {
            Response.Write(bc.MessageBox("班级基本信息修改失败!"));
            
        }
        Response.Write("<script language='javascript'>this.parent.rightFrame.location.href='EditDept.aspx'</script>");
    }
}
