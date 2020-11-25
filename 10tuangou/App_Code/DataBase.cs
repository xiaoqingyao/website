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
/// DataBase 的摘要说明
/// </summary>
public class DataBase
{


    private  DataBase _instance;
    public DataBase()
    {
    }
    public  DataBase getInstance()
    {
        if (_instance == null)
        {
            _instance = new DataBase();
        }
        return _instance;
    }
    public  SqlConnection ReturnConn()
    {
        string strConn =  ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection Conn = new SqlConnection(strConn);
        if (Conn.State.Equals(ConnectionState.Closed))
        {
            Conn.Open();
        }
        return Conn;
    }
    public  SqlCommand CreatCmd(string procName, SqlParameter[] prams)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = Conn;
        cmd.CommandText = procName;
        if (prams != null)
        {
            foreach (SqlParameter paramenter in prams)
            {
                if (paramenter != null)
                {
                    cmd.Parameters.Add(paramenter);
                }
            }
        }
        return cmd;
    }
    public  SqlCommand CreatCmd(string procName, SqlParameter[] prams, SqlConnection Conn)
    {
        SqlConnection SqlConn = Conn;
        if (SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = SqlConn;
        cmd.CommandText = procName;
        if (prams != null)
        {
            foreach (SqlParameter paramenter in prams)
            {
                if (paramenter != null)
                {
                    cmd.Parameters.Add(paramenter);
                }
            }
        }
        return cmd;

    }


    public  SqlCommand CreatCmd(string procName, SqlConnection Conn)
    {
        SqlConnection SqlConn = Conn;
        if (SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = SqlConn;
        cmd.CommandText = procName;
        return cmd;

    }

    public  SqlCommand CreatCmd(string procName)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = Conn;
        cmd.CommandText = procName;
        return cmd;

    }

    public  SqlDataReader RunProcGetReader(string procName,SqlParameter[] prams)
    {
        SqlCommand Cmd = CreatCmd(procName, prams);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;

    }
    public  SqlDataReader RunProcGetReader(string procName, SqlParameter[] prams,SqlConnection Conn)
    {
        SqlCommand Cmd = CreatCmd(procName, prams,Conn);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;

    }
    public  SqlDataReader RunProcGetReader(string procName, SqlConnection Conn)
    {
        SqlCommand Cmd = CreatCmd(procName,Conn);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;

    }
    public  SqlDataReader RunProcGetReader(string procName)
    {
        SqlCommand Cmd = CreatCmd(procName);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;

    }
    public  DataTable RunProcGetTable(string procName,SqlParameter[] prams,SqlConnection conn)
    {
        SqlCommand Cmd = CreatCmd(procName,prams,conn);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        DataSet Ds = new DataSet();
        Dtr.SelectCommand = Cmd;
        Dtr.Fill(Ds);
        DataTable Dt = Ds.Tables[0];
        conn.Close();
        return Dt;
    }
    public DataTable RunProcGetTable(string procName, SqlParameter[] prams)
    {
        SqlConnection conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName, prams, conn);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        DataSet Ds = new DataSet();
        Dtr.SelectCommand = Cmd;
        Dtr.Fill(Ds);
        DataTable Dt = Ds.Tables[0];
        conn.Close();
        return Dt;
    }
    public DataTable RunProcGetTable(string procName)
    {
        SqlConnection conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName,conn);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        DataSet Ds = new DataSet();
        Dtr.SelectCommand = Cmd;
        Dtr.Fill(Ds);
        DataTable Dt = Ds.Tables[0];
        conn.Close();
        return Dt;
    }


    public  int RunExecute(string procName)
    {
        SqlConnection Conn=ReturnConn();
        SqlCommand Cmd = CreatCmd(procName,Conn);
        int intResult = Cmd.ExecuteNonQuery();
        Conn.Close();
        return intResult;
    }
    public int RunExecute(string procName,SqlParameter[] prams)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName,prams,Conn);
       
        int intResult = Cmd.ExecuteNonQuery();
        Conn.Close();
        return intResult;
    }
    public  int RunExecuteScalar(string procName)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName, Conn);
        int intResult = Convert.ToInt32(Cmd.ExecuteScalar());
        Conn.Close();
        return intResult;
    }
    public  int RunExecuteScalar(string procName, SqlParameter[] prams)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName,prams,Conn);
        int intResult =  Convert.ToInt32(Cmd.ExecuteScalar());
        Conn.Close();
        return intResult;
    }
    public SqlDataAdapter RunSqlDataAdapter(string procName, SqlParameter[] prams)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName, prams, Conn);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        Dtr.SelectCommand = Cmd;
        Conn.Close();
        return Dtr;
    }
    public SqlDataAdapter RunSqlDataAdapter(string procName)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName, Conn);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        Dtr.SelectCommand = Cmd;
        Conn.Close();
        return Dtr;
    }
    public DataSet RunDataSet(String sql)
    {
        DataSet ds = new DataSet();
        SqlConnection Con = ReturnConn();
        SqlDataAdapter sqldater = new SqlDataAdapter(sql, Con);
        sqldater.Fill(ds);
        Con.Close();
        return ds;
    }
    public int ExecuteNonQuery(string sql)
    {
        int i;
        SqlConnection Con = ReturnConn();
        SqlCommand sqlcom = new SqlCommand(sql, Con);
        i = sqlcom.ExecuteNonQuery();
        return i;

    }
    public SqlDataAdapter RunDataAter(String sql)
    {
        SqlConnection Con = ReturnConn();
        SqlDataAdapter sqldater = new SqlDataAdapter(sql, Con);
        Con.Close();
        return sqldater;
    }
    public String HtmlEncode(String str)//转化成html标签
    {
        str = str.Replace(">", "&gt");
        str = str.Replace("<", "&lt");
        char ch;
        ch = (char)32;
        str = str.Replace(ch.ToString(), "&nbsp;");
        ch = (char)34;
        str = str.Replace(ch.ToString(), "&quot;");
        ch = (char)39;
        str = str.Replace(ch.ToString(), "&#39;");
        ch = (char)13;
        str = str.Replace(ch.ToString(), "");
        ch = (char)10;
        str = str.Replace(ch.ToString(), "<br>");
        return str;
    }
}
