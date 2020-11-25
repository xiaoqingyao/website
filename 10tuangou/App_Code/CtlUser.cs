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
/// CtlUser 的摘要说明
/// </summary>
public class CtlUser
{
	public CtlUser()
	{
	}

    string strConn =  ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    public DataTable selectUser(string userName)
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from sys_users where userName='" + userName.Trim() + "'";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public DataTable Login(EntUser obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from sys_users where userName='" + obj.userName.Trim() + "'";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public Boolean addUser(EntUser obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("insert sys_users values('" + obj.userName.Trim() + "','" + obj.password.Trim() + "','" + obj.roleId.Trim() + "')", conn);
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
    public DataTable getAllUser()
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from sys_users";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public Boolean deleteUser(string userName)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("delete sys_users where userName='" + userName.Trim() + "'", conn);
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
    public Boolean updatePassword(EntUser obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("update sys_users set password='" + obj.password.Trim() + "'where userName='"+obj.userName.Trim()+"'", conn);
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
