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
/// VCUtilities 的摘要说明
/// </summary>
public class VCUtilities
{
	public VCUtilities()
	{
	}
    public static bool IsNumeric(string s)
    {
        try { Convert.ToInt32(s); return true; }
        catch { return false; }
    }
    public static bool IsDate(string s)
    {
        try { Convert.ToDateTime(s); return true; }
        catch { return false; }
    } 
    public static bool IsSingle(string s)
    {
        try { Convert.ToSingle(s); return true; }
        catch { return false; }
    }
    public static bool IsValidUser(string UserID)
    {
        bool flag=false;
        string sql = "select * from userinfosheet where code='" + UserID + "'";        
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connection"]);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        int returnRow = Convert.ToInt32(cmd.ExecuteScalar());
        if (returnRow > 0)
            flag = true;
        return flag;
       
    }

}
