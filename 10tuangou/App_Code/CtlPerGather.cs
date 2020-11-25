using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// CtlPerGather 的摘要说明
/// </summary>
public class CtlPerGather
{
	public CtlPerGather()
	{

	}
    string strConn =  ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public DataTable getAllPerGather()
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from p_gather";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public DataTable SelectPerGatherById(EntPerGather obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from p_gather where pGatherId='"+obj.pGatherId.Trim()+"'";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public DataTable getAllGatherType()
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from g_type";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public Boolean deletePerGather(string pGatherId)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("delete p_gather where pGatherId='"+pGatherId+"'", conn);
        conn.Open();
        if (command.ExecuteNonQuery() == 1)
        {
            return true;
        }

        else
        {
            return false;
        }
        conn.Close();
    }
    public Boolean AddPerGather(EntPerGather obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("insert p_gather values('"+obj.gTypeId.Trim()+"','"+obj.perName.Trim()+"','"+obj.title.Trim()+"','"+obj.gatherDesc.Trim()+"','"+obj.gatherTime.Trim()+"')", conn);
        conn.Open();
        if (command.ExecuteNonQuery() == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
        conn.Close();
    }
   
   
}
