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

public partial class WorkFlow_updateWorkFlowType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.btnReturn.Attributes.Add("oncheck","<script language=javascript>location='javascript:history.go(-1)'</script>");
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from wf_type where code='" + Request.QueryString["id"] + "'", con);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    code.Text = dr["code"].ToString();
                    name.Text = dr["name"].ToString();
                    note.Text = dr["note"].ToString();
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

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>this.parent.rightFrame.location.href='EditWorkFlowType.aspx'</script>");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BaseClass bc = new BaseClass();
        Boolean bl;
        bl = bc.ExecSQL("update wf_type set name='" + name.Text + "',note='" + note.Text + "' where code='" + Request.QueryString["id"] + "'");
        if (bl)
        {
            Response.Write(bc.MessageBox("修改成功!"));
        }
        else
        {
            Response.Write(bc.MessageBox("修改失败!"));

        }
        Response.Write("<script language='javascript'>this.parent.rightFrame.location.href='EditWorkFlowType.aspx'</script>");
    }
}
