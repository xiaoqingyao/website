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
/// DB 的摘要说明
/// </summary>
public class DB
{
	public DB()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static SqlConnection createdb()
    {

        string dbstring = ConfigurationSettings.AppSettings["cn"];
        SqlConnection conn = new SqlConnection(dbstring);
        return conn;
    }

    public static bool delly(int id)
    {
        try
        {
            SqlConnection conn = createdb();
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from book where id=" + id, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            return true;
        }

        catch
        {
            return false;
        }
     }
}
