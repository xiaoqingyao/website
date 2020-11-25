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
/// Database 的摘要说明
/// </summary>
public class Database
{
    private static Database _instance;
	protected Database()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static Database getInstance()
    {
        if (_instance == null)
        {
            _instance = new Database();
        }
        return _instance;
    }
    //返回一个连接SqlConnection
    #region    
    public  static SqlConnection ReturnConn()
    {
        string strConn = System.Configuration.ConfigurationManager.AppSettings["connection"];
        //string strConn = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection Conn = new SqlConnection(strConn);
        if(Conn.State.Equals(ConnectionState.Closed))
        {
            Conn.Open();
        }
        return Conn;
    }
    #endregion
    //返回SqlCommand
    #region
    public  static SqlCommand CreatCmd(string procName, SqlParameter[] prams)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = new SqlCommand();
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.CommandText = procName;
        Cmd.Connection = Conn;
        if (prams != null)
        {
            foreach (SqlParameter paramenter in prams)
            {
                if (paramenter != null)
                {
                    Cmd.Parameters.Add(paramenter);
                }
            }
        }
        return Cmd;
    }
    public static SqlCommand CreatCmd(string procName, SqlParameter[] prams, SqlConnection Conn)
    {
        SqlConnection SqlConn = Conn;
        if(SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand Cmd = new SqlCommand();
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.CommandText = procName;
        Cmd.Connection = SqlConn;
        if (prams != null)
        {
            foreach (SqlParameter paramenter in prams)
            {
                if (paramenter != null)
                {
                    Cmd.Parameters.Add(paramenter);
                }
            }
        }
        return Cmd;
    }
    public static SqlCommand CreatCmd(string procName, SqlConnection Conn)
    {
        SqlConnection SqlConn = Conn;
        if (SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand Cmd = new SqlCommand();
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.CommandText = procName;
        Cmd.Connection = SqlConn;        
        return Cmd;
    }
    public static SqlCommand CreatCmd(string proName)
    {
        SqlConnection SqlConn = ReturnConn();
        if (SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand Cmd = new SqlCommand();
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.CommandText = proName;
        Cmd.Connection = SqlConn;
        return Cmd;
    }
    #endregion
    //返回SqlDataReader
    #region
    public  static SqlDataReader RunProcGetReader(string proName, SqlParameter[] prams)
    {
        SqlCommand Cmd = CreatCmd(proName, prams);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;
    }
    public static SqlDataReader RunProcGetReader(string proName, SqlConnection Conn)
    {
        SqlCommand Cmd = CreatCmd(proName,Conn);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;
    }
    public static SqlDataReader RunProcGetReader(string proName, SqlParameter[] prams, SqlConnection Conn)
    {
        SqlCommand Cmd = CreatCmd(proName,prams,Conn);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;
    }
    public SqlDataReader RunProcGetReader(string proName)
    {
        SqlCommand Cmd = CreatCmd(proName);
        SqlDataReader Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return Dr;
    }
    #endregion
    //返回DataTable
    #region
    public  static DataTable RunProcGetTable(string procName, SqlParameter[] prams, SqlConnection Conn)
    {
        SqlCommand Cmd = CreatCmd(procName, prams, Conn);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        DataSet Ds=new DataSet();
        Dtr.SelectCommand = Cmd;
        Dtr.Fill(Ds);
        DataTable Dt = Ds.Tables[0];
        Conn.Close();
        return Dt;
    }
    #endregion
    //返回int
    #region
    public static int RunExecute(string procName)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName,Conn);
        int intResult = Cmd.ExecuteNonQuery();
        Conn.Close();
        return intResult;
    }
    #endregion
    public  static int RunExecute(string procName, SqlParameter[] prams)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName,prams,Conn);
        int intResult = Cmd.ExecuteNonQuery();
        Conn.Close();
        return intResult;

    }
    //返回首行首列int
    #region
    public static int RunExecuteScalar(string procName)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName, Conn);
        int intResult =Convert.ToInt32( Cmd.ExecuteScalar());
        Conn.Close();
        return intResult;
    }
    public static int RunExecuteScalar(string procName, SqlParameter[] prams)
    {
        SqlConnection Conn = ReturnConn();
        SqlCommand Cmd = CreatCmd(procName, prams,Conn);
        int intResult = Convert.ToInt32(Cmd.ExecuteScalar());
        Conn.Close();
        return intResult;
    }
    #endregion
    public  static DataView ExecuteView(string proName,int _oldPage,int _pageSize)
     {
        int oldPage=_oldPage;
        int pageSize=_oldPage+_pageSize;
       
        SqlConnection SqlConn = ReturnConn();
        if (SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand Cmd = CreatCmd(proName);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        Cmd.Connection = SqlConn;
        DataTable Dt = new  DataTable();
        Dtr.SelectCommand = Cmd;
        Dtr.Fill(Dt);
        SqlConn.Close();
        DataView dv = Dt.DefaultView;
        dv.Sort = "s_id";
        dv.RowFilter = "s_id>'"+oldPage+"' and s_id<='"+pageSize+"'";
        return dv;
     }
    public static  DataView CreateDataView(string proName)
    {
       
        SqlConnection SqlConn = ReturnConn();
        if (SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand Cmd = CreatCmd(proName);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        Cmd.Connection = SqlConn;
        DataSet Ds = new DataSet();
        Dtr.SelectCommand = Cmd;
        Dtr.Fill(Ds);
        SqlConn.Close();
        DataView Dv = new DataView(Ds.Tables[0]);
        return Dv;
        
    }
    public static DataView _ExecuteView(string proName, int _oldPage, int _pageSize)
    {
        int oldPage = _oldPage;
        int pageSize = _oldPage + _pageSize;

        SqlConnection SqlConn = ReturnConn();
        if (SqlConn.State.Equals(ConnectionState.Closed))
        {
            SqlConn.Open();
        }
        SqlCommand Cmd =new SqlCommand(proName);
        SqlDataAdapter Dtr = new SqlDataAdapter();
        Cmd.Connection = SqlConn;
        DataTable Dt = new DataTable();
        Dtr.SelectCommand = Cmd;
        Dtr.Fill(Dt);
        SqlConn.Close();
        DataView dv = Dt.DefaultView;
        //dv.Sort = "s_id";
        //dv.RowFilter = "s_id>'" + oldPage + "' and s_id<='" + pageSize + "'";
        return dv;
    }
    
}
