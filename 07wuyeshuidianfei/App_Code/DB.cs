using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Text;
/// <summary>
/// DB 的摘要说明
/// </summary>
public class DB
{
    #region 公共成员
    public static SqlConnection sqlconnection;//定义公共成员
    public static string cnstr = "server=.;database=sj_wuye_db;User Id=sa;pwd=lvcc;";//数据库连接字符串
    #endregion

    public DB()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
    }

    #region 打开数据库连接
    /// <summary>
    /// 打开数据库连接 返回SqlConnection
    /// </summary>
    /// <returns></returns>
    public static SqlConnection OpenConnection()
    {
        try
        {
            sqlconnection = new SqlConnection(cnstr);
            sqlconnection.Open();
            return sqlconnection;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion

    #region 关闭数据库连接并释放资源
    /// <summary>
    /// 关闭数据库连接释放资源
    /// </summary>
    /// <param name="Conn">数据库连接对象</param>
    public static void DisposeConnection(SqlConnection Conn)
    {
        if (Conn != null)
        {
            Conn.Close();
            Conn.Dispose();
        }
    }
    #endregion

    #region 执行Sql查询语句
    ///<summary>
    /// 执行Sql查询语句 执行成功返回受影响的行数，执行失败返回-1；
    /// </summary>
    /// <param name="strSQL">传入的Sql语句</param>
    /// <returns>返回受影响的行数</returns>
    public static int ExecuteSql(string strSQL)
    {
        SqlConnection conn = OpenConnection();
        try
        {
            SqlCommand comm = new SqlCommand(strSQL, conn);
            int val = comm.ExecuteNonQuery();

            DisposeConnection(conn);
            return val;

        }
        catch (Exception e)
        {
            DisposeConnection(conn);
            throw new Exception(e.Message);
        }
    }
    #endregion

    #region 返回指定Sql语句的SqlDataReader，请注意，在使用后请关闭本对象，同时将自动调用closeConnection()来关闭数据库连接
    /// <summary>
    /// 返回指定Sql语句的SqlDataReader，请注意，在使用后请关闭本对象，同时将自动调用closeConnection()来关闭数据库连接 
    /// </summary>
    /// <param name="strSQL">传入的Sql语句</param>
    /// <returns>SqlDataReader对象</returns>
    public static SqlDataReader getDataReader(string strSQL)
    {
        SqlConnection conn = OpenConnection();
        SqlDataReader dr = null;
        try
        {
            SqlCommand comm = new SqlCommand(strSQL, conn);
            dr = comm.ExecuteReader();
            return dr;
        }
        catch (Exception ex)
        {
            if (dr != null && !dr.IsClosed)
                dr.Close();
            DisposeConnection(conn);
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region 返回指定Sql语句的DataTable
    /// <summary>
    /// 返回指定Sql语句的DataTable
    /// </summary>
    /// <param name="strSQL">传入的Sql语句</param>
    /// <returns>DataTable</returns>
    public static DataTable getDataTable(string strSQL)
    {
        SqlConnection conn = OpenConnection();
        try
        {
            SqlCommand comm = new SqlCommand(strSQL, conn);
            SqlDataAdapter da = new SqlDataAdapter(comm);
            DataTable table = new DataTable();
            da.Fill(table);

            DisposeConnection(conn);
            return table;
        }
        catch (Exception ex)
        {
            DisposeConnection(conn);
            throw new Exception(ex.Message);
        }
    }
    #endregion

    #region 返回指定Sql语句的DataSet
    /// <summary> 
    /// 返回指定Sql语句的DataSet 
    /// </summary> 
    /// <param name="strSQL">传入的Sql语句</param> 
    /// <returns>DataSet</returns> 
    public static DataSet getDataSet(string strSQL)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection conn = OpenConnection();
        try
        {
            SqlCommand comm = new SqlCommand(strSQL, conn);
            comm.CommandType = CommandType.Text;
            da.SelectCommand = comm;
            da.Fill(ds);

            DisposeConnection(conn);
            return ds;
        }
        catch (Exception e)
        {
            DisposeConnection(conn);
            throw new Exception(e.Message);
        }
    }
    #endregion

    #region 查询数据库中是否存在该条数据 存在返回True,不存在返回False
    /// <summary>
    /// 是否存在值
    /// </summary>
    /// <param name="strSQL"></param>
    /// <returns></returns>
    public static bool isExists(string strSQL)
    {
        SqlConnection conn = OpenConnection();
        try
        {
            SqlCommand comm = new SqlCommand(strSQL,conn);
            SqlDataReader dr = comm.ExecuteReader();

            if (dr.HasRows) return true;

            DisposeConnection(conn);
            return false;
        }
        catch (Exception ex)
        {
            DisposeConnection(conn);
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region 获取记录总数
    /// <summary>
    /// 获取查询记录总数
    /// </summary>
    /// <param name="strSql"></param>
    /// <returns></returns>
    public static int getRowCount(string tableNm)
    {
        SqlConnection cn=OpenConnection();
        int intRowCount = 0;

        string str = "select count(*) from (" + tableNm + ")";
        SqlCommand cmd=new SqlCommand (str,cn);
        intRowCount = (int)cmd.ExecuteScalar();
        DisposeConnection(cn);
        return intRowCount;
    }
    #endregion

    #region 为DropDownList绑定数据
    public static void Bind_Dropdownlist(string sql,DropDownList ddl,string value,string textvalue)
    {
        ddl.DataSource = getDataTable(sql);
        ddl.DataTextField = textvalue;
        ddl.DataValueField = value;
        ddl.DataBind();
    }
    #endregion

    #region 为Repeater绑定数据
    public static void Bind_Repeater(string sql, Repeater rpt,SqlConnection cn)
    {
        SqlDataReader dr = getDataReader(sql);
        rpt.DataSource = dr;
        rpt.DataBind();
        dr.Close();
        dr.Dispose();
    }
    #endregion

    #region 验证字符串是否数字
    /// <summary>
    /// 验证字符串是否数字
    /// </summary>
    /// <param name="value">需验证的字符串</param>
    /// <returns></returns>
    public static bool IsInt(string value)
    {
        if (!string.IsNullOrEmpty(value))
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(value, @"^(\d+)$"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
            return false;
    }
    #endregion

    #region 标识字符串中的子字符串（以指定的分隔符分隔），返回一个字符串数组
    /// <summary>
    /// 标识字符串中的子字符串（以指定的分隔符分隔），返回一个字符串数组
    /// </summary>
    /// <param name="flag">分隔符</param>
    /// <param name="data">字符串</param>
    /// <returns></returns>
    public static string[] Split(string flag, string data)
    {
        if (flag == string.Empty || data == string.Empty)
        {
            return new string[0];
        }
        Regex reg = new Regex(flag);

        return reg.Split(data);
    }
    #endregion


    #region HTML转为string并保存到数据库
    /// <summary>
    /// HTML转为string并保存到数据库
    /// </summary>
    /// <param name="strString"></param>
    /// <returns></returns>
    public static string ConvertHtmlToString(string strString)
    {
        strString = strString.Replace("'", "&acute;");
        strString = strString.Replace("“", "&ldquo;");
        strString = strString.Replace("”", "&rdquo;");
        strString = strString.Replace("\"", "&quot;");
        strString = strString.Replace("<", "&lt;");
        strString = strString.Replace(">", "&gt;");
        strString = strString.Replace("/", "&#8224;");
        return strString;
    }
    #endregion

    #region 从数据库读出信息并转为HTML
    /// <summary>
    /// 从数据库读出信息并转为HTML
    /// </summary>
    /// <param name="strString"></param>
    /// <returns></returns>
    public static string ConvertStringToHtml(string strString)
    {
        strString = strString.Replace("&acute;", "'");
        strString = strString.Replace("&ldquo;", "“");
        strString = strString.Replace("&rdquo;", "”");
        strString = strString.Replace("&quot;", "\"");
        strString = strString.Replace("&lt;", "<");
        strString = strString.Replace("&gt;", ">");
        strString = strString.Replace("&#8224;", "/");
        //strString = strString.Replace(" ", "&nbsp;");
        //strString = strString.Replace("　", "&nbsp;&nbsp;");
        return strString;
    }
    #endregion

    #region 截取字符串函数

    #region 截取字符串函数
    /// <summary>
    /// 截取字符串函数
    /// </summary>
    /// <param name="str">所要截取的字符串</param>
    /// <param name="num">截取字符串的长度(0则不判断)</param>
    /// <returns></returns>
    public static string GetSubString(object str, int num)
    {
        return GetSubString(str.ToString(), num);
    }
    #endregion

    /// <summary>
    /// 截取字符串函数
    /// </summary>
    /// <param name="str">所要截取的字符串</param>
    /// <param name="num">截取字符串的长度(0则不判断)</param>
    /// <param name="laststr">后缀字符（如：..）</param>
    /// <returns></returns>
    public static string GetSubString(string str, int num, string laststr)
    {
        //if (num > 0)
        //{
        //    return (RemoveHTML(str).Length > num) ? (RemoveHTML(str).Substring(0, num)) : str;
        //}
        //else
        //{
        //    return str;
        //}

        if (Encoding.UTF8.GetByteCount(str) <= num * 2)
        {
            return str;
        }
        ASCIIEncoding ascii = new ASCIIEncoding();
        int tempLen = 0;
        string tempString = "";
        byte[] s = ascii.GetBytes(str);
        for (int i = 0; i < s.Length; i++)
        {
            if ((int)s[i] == 63)//汉字
            {
                tempLen += 2;
            }
            else//非汉字
            {
                tempLen += 1;
            }

            if (tempLen > num * 2)
                break;

            tempString += str.Substring(i, 1);
        }

        return tempString + laststr;
    }
    #endregion

    #region 过滤HTML代码
    /// <summary>
    /// 过滤HTML代码
    /// </summary>
    /// <param name="strText">被操作字符串</param>
    /// <returns></returns>
    public static string RemoveHTML(string strText)
    {
        return Regex.Replace(strText.Replace("&nbsp;", "").Replace("　", "").Replace(" ", "").Replace("\r", "").Replace("\n", "").Replace("\t", ""), @"<\/*[^<>]*>", "");
    }
    #endregion
}
