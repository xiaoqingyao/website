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
/// saveinfo 的摘要说明
/// </summary>
public class saveinfo
{
	public saveinfo()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static bool savely(book ly)
    {
        SqlConnection conn = DB.createdb();
        conn.Open();
        try
        {
            //SqlCommand cmd = new SqlCommand("insert into book(username,sex,qq,email,face,adddate,body,ishidden,homepage) values(@username,@sex,@qq,@email,@face,@adddate,@body,@ishidden,@homepage)", conn);
            SqlCommand cmd = new SqlCommand("insert into book(username,sex,body,qq,email,face,adddate,ishidden,homepage) values(@username,@sex,@body,@qq,@email,@face,@adddate,@ishidden,@homepage)", conn);
            cmd.Parameters.Add(new SqlParameter("@username", SqlDbType.NVarChar, 20));
            cmd.Parameters["@username"].Value = ly.username;
            cmd.Parameters.Add(new SqlParameter("@sex", SqlDbType.NVarChar, 4));
            cmd.Parameters["@sex"].Value = ly.sex;
            cmd.Parameters.Add("@body",SqlDbType.NVarChar,500);
            cmd.Parameters["@body"].Value = ly.body;
            cmd.Parameters.Add("@qq", SqlDbType.NVarChar, 10);
            cmd.Parameters["@qq"].Value = ly.qq;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar, 20);
            cmd.Parameters["@email"].Value = ly.email;
            cmd.Parameters.Add("@face", SqlDbType.NVarChar, 10);
            cmd.Parameters["@face"].Value = ly.face;
            cmd.Parameters.Add("@adddate",SqlDbType.DateTime,8);
            cmd.Parameters["@adddate"].Value = System.DateTime.Now.ToLongTimeString();
         
            cmd.Parameters.Add("@ishidden",SqlDbType.Bit,1);
            cmd.Parameters["@ishidden"].Value =ly.ishide;
            cmd.Parameters.Add("@homepage", SqlDbType.NVarChar, 20);
            cmd.Parameters["@homepage"].Value = ly.homepage;
            cmd.ExecuteNonQuery();
            conn.Close();
            return true;
        }
        catch
        {
            conn.Close();
            return false;
        }
    }
}
