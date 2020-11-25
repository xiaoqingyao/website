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
//下载于51aspx.com
/// <summary>
/// DataBase 的摘要说明
/// </summary>
public class SQL
{
    public SQL()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static SqlConnection createConnection()
    {
        //数据库连接字符串
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConn"].ConnectionString);
        return cnn;
    }
    public static DataTable GetTable(string sqlStr)
    {
        //定义数据库连接　将要查询的数据集　填充到DataSet中
        SqlConnection tmpCnn = SQL.createConnection();
        if (tmpCnn.State != 0)
        {
            tmpCnn.Close();
        }
        tmpCnn.Open();
        SqlDataAdapter cmd = new SqlDataAdapter(sqlStr, tmpCnn);
        DataSet tmpDataSet = new DataSet();
        cmd.Fill(tmpDataSet);
        return tmpDataSet.Tables[0];
    }

    public static void ExecData(string sqlStr)
    {
        //定义数据库连接　　执行数据库的增加　修改和删除数据的功能
        SqlConnection tmpCnn = SQL.createConnection();
        if (tmpCnn.State != 0)
        {
            tmpCnn.Close();
        }
        tmpCnn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sqlStr;
        cmd.Connection = tmpCnn;
        cmd.ExecuteNonQuery();
    }

	public static int ExecScalar(string sqlStr) {
		//定义数据库连接　　执行数据库的增加　修改和删除数据的功能
		SqlConnection tmpCnn = SQL.createConnection();
		if (tmpCnn.State != 0) {
			tmpCnn.Close();
		}
		tmpCnn.Open();

		SqlCommand cmd = new SqlCommand();
		cmd.CommandText = sqlStr;
		cmd.Connection = tmpCnn;
		return cmd.ExecuteNonQuery();
	}
}
