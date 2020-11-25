using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;//引入命名空间


/// <summary>
/// DBHelper 的摘要说明：公共类用来操作数据库，静态类通过类名直接调用其中的方法
/// </summary>
public class DBHelper
{
    public DBHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    } 

    /// <summary>
    /// 获得数据库连接字符串
    /// </summary>
    /// <returns></returns>
    public static string GetConnStr()
    {
        return ConfigurationManager.AppSettings["connstr"];
    } 



    /// <summary>
    /// 由sql变量（select语句）得到DataSet类型查询记录集合
    /// </summary>
    /// <param name="sql">select语句，字符串类型</param>
    /// <returns></returns>
    public static DataSet GetDataSet(string sql)
    {
        SqlConnection conn = new SqlConnection(GetConnStr());
        conn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        conn.Close();
        return ds;
    } 




    /// <summary>
    /// 执行sql语句，主要是insert、update、delete语句
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public static Boolean ExecSql(string sql)
    {
        SqlConnection conn = new SqlConnection(GetConnStr());
        conn.Open();
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            cmd.ExecuteNonQuery();
            conn.Close();
        } 
        catch (Exception ex)
        {
            conn.Close();
            return false;
        } 
        return true;
    } 



    /// <summary>
    /// 由select语句（sql）查询得到SQLDataReader类型记录集（为了方便对每一行进行处理）
    /// </summary>
    /// <param name="sql">select语句</param>
    /// <returns>SQLDataReader类型记录集</returns>
    public static SqlDataReader GetReader(string sql)
    {
        SqlConnection conn = new SqlConnection(GetConnStr());
        conn.Open();
        SqlCommand cmd = new SqlCommand(sql, conn);
        //try
        //{
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection); //关闭datareader对象时候自动关闭关联的conn对象
        //} 
        //catch (Exception ex)
        //{

        //} 
        //finally
        //{
        //conn.Close();  //此处不能关闭，关闭后datareader对象无法执行read方法

        //} 
        return dr;
    } 



    /// <summary>
    /// 说明：GetDataSet数据集，返回数据源的数据集
    ///	返回值：数据集DataSet
    ///	参数：sQueryString SQL字符串，TableName 数据表名称
    /// 创建日期：2010-8
    /// 创建人：
    /// </summary>
    public static DataSet GetDataSet(string sQueryString, string TableName)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        con.Open();
        SqlDataAdapter dbAdapter = new SqlDataAdapter(sQueryString, con);
        DataSet dataset = new DataSet();
        dbAdapter.Fill(dataset, TableName);
        con.Close();
        return dataset;
    } 



    /// <summary>
    /// 给dropdownlist控件绑定数据库源
    /// 
    /// </summary>
    /// <param name="ddlName">控件名称</param>
    /// <param name="sql">sql语句</param>
    public static void BindDDL(DropDownList ddlName, string sql)
    {
        ddlName.Items.Clear();
        DataSet ds = GetDataSet(sql);

        ListItem li = new ListItem("", "");
        ddlName.Items.Add(li);
        if (ds != null && ds.Tables[0].Rows.Count >= 1)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                li = new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString());//text,value
                ddlName.Items.Add(li);
            } 
        } 

        /*
        //如下的代码也可以；确点无法添加空项目
        ddlName.Items.Clear();
        DataSet ds = GetDataSet(sql);

        if (ds != null && ds.Tables[0].Rows.Count >= 1)
        {
            ddlName.DataSource = ds.Tables[0].DefaultView ;
            ddlName.DataTextField = DisplayText;
            ddlName.DataValueField = ValueField;
            ddlName.DataBind();
        } 
        */
    } 


    #region 查找某值在某表中某字段中是否出现过--重载
    /// <summary>
    /// 
    /// </summary>
    /// <param name="TabName">要查找的表名称</param>
    /// <param name="FieldName">表中字段</param>
    /// <param name="Val">字符串类型值</param>
    /// <returns></returns>
    public static bool FindValue(string TabName, string FieldName, string strVal)
    {
        string sql = "";
        sql = "select * from " + TabName + " where " + FieldName + "='" + strVal + "'";
        DataSet ds = GetDataSet(sql);
        if (ds.Tables[0].Rows.Count > 0)
            return true;
        return false;
    } 

    /// <summary>
    /// 
    /// </summary>
    /// <param name="TabName">要查找的表名称</param>
    /// <param name="FieldName">表中字段</param>
    /// <param name="Val">字符串类型值</param>
    /// <returns></returns>
    public static bool FindValue(string TabName, string FieldName, int iVal)
    {
        string sql;
        sql = "select * from " + TabName + " where " + FieldName + "=" + iVal;
        DataSet ds = GetDataSet(sql);
        if (ds.Tables[0].Rows.Count > 0)
            return true;
        return false;
    } 

    /// <summary>
    /// 
    /// </summary>
    /// <param name="TabName">要查找的表名称</param>
    /// <param name="FieldName">表中字段</param>
    /// <param name="Val">字符串类型值</param>
    /// <returns></returns>
    public static bool FindValue(string TabName, string FieldName, DateTime dVal)
    {
        string sql;
        sql = "select * from " + TabName + " where " + FieldName + "='" + dVal + "'";
        DataSet ds = GetDataSet(sql);
        if (ds.Tables[0].Rows.Count > 0)
            return true;
        return false;
    } 
    #endregion


    #region 由某个（编号）字段得到相应的名称字段
    /// <summary>
    /// 
    /// </summary>
    /// <param name="TabName">表名称</param>
    /// <param name="No">编号值（字符串类型）</param>
    /// <param name="FieldNameofName">名称字段</param>
    /// <param name="FieldNameofNo">编号字段</param>
    /// <returns></returns>
    public static string GetNameById(string TabName, string No, string FieldNameofName, string FieldNameofNo)
    {
        string sql = "select " + FieldNameofName + " from " + TabName + " where " + FieldNameofNo + " = '" + No + "'";
        DataSet ds = GetDataSet(sql);
        if (ds != null)
            return (ds.Tables[0].Rows[0][0].ToString());
        else
            return string.Empty;
    } 

    /// <summary>
    /// 
    /// </summary>
    /// <param name="TabName">表名称</param>
    /// <param name="No">编号值(整形)</param>
    /// <param name="FieldNameofName">名称字段</param>
    /// <param name="FieldNameofNo">编号字段</param>
    /// <returns></returns>
    public static string GetNameById(string TabName, int No, string FieldNameofName, string FieldNameofNo)
    {
        string sql = "select " + FieldNameofName + " from " + TabName + " where " + FieldNameofNo + " = " + No;
        DataSet ds = GetDataSet(sql);
        if (ds != null)
            return (ds.Tables[0].Rows[0][0].ToString());
        else
            return string.Empty;
    } 
    #endregion


    #region 由名称得到编号
    /// <summary>
    /// 
    /// </summary>
    /// <param name="Name">名称字段值（假设不重复，惟一）</param>
    /// <param name="Table">表名称</param>
    /// <param name="FieldNameofNo">编号字段名称(编号是字符串类型)</param>
    /// <param name="FieldNameofName">值字段名称</param>
    /// <returns></returns>
    public static string GetNo(string Name, string Table, string FieldNameofNo, string FieldNameofName)
    {
        string sql, no;
        sql = "select " + FieldNameofNo + " from " + Table + " where " + FieldNameofName + "='" + Name + "'";

        DataSet ds = GetDataSet(sql);
        no = ds.Tables[0].Rows[0][0].ToString();
        return no;
    } 

    //public static int GetNo(string Name, string Table, string FieldNameofNo, string FieldNameofName)
    //{
    //    string sql;
    //    int no;
    //    sql = "select " + FieldNameofNo + "from " + Table + " where " + FieldNameofName + "='" + Name + "'";

    //    DataSet ds = GetDS(sql);
    //    no = ds.Tables[0].Rows[0][0];
    //    return no;
    //} 
    #endregion


    #region 执行存储过程相关方法
    /// <summary>
    /// 生成执行存储过程的sqlcommand对象
    /// </summary>
    /// <param name="ProcName"></param>
    /// <param name="Prams"></param>
    /// <returns></returns>
    public static SqlCommand CreatCommand(string ProcName, SqlParameter[] Prams)
    {
        //打开数据库连接
        SqlConnection conn = new SqlConnection(GetConnStr());
        conn.Open();
        //创建一个命令对象
        SqlCommand Cmd = new SqlCommand(ProcName, conn);
        //指定命令对象的类型为存储过程
        Cmd.CommandType = CommandType.StoredProcedure;
        // 依次把参数传入命令文本
        if (Prams != null)
        {
            foreach (SqlParameter Parameter in Prams)
                Cmd.Parameters.Add(Parameter);
        } 
        return Cmd;
    } 

    //公有方法，调用存储过程(带参数)
    //输入：
    //      ProcName - 存储过程名
    //      Params   - 用来调用存储过程的参数表
    //输出：
    //      对Update、Insert、Delete操作返回影响到的行数，其他情况为-1
    public static void RunProc(string ProcName, SqlParameter[] Params)
    {
        //int Count = -1;
        SqlCommand Cmd = CreatCommand(ProcName, Params);
        Cmd.ExecuteNonQuery();
        Cmd.Dispose();
        //return Count;
    } 

    //公有方法，调用存储过程(不带参数)
    //输入：
    //			ProcName存储过程名
    //输出：
    //			将执行结果以DataSet返回,经常用于执行查询的存储过程  
    public static DataSet RunProcGetDataSet(string ProcName)
    {
        SqlConnection conn = new SqlConnection(GetConnStr());
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(ProcName, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        return ds;
    } 

    //公有方法，调用存储过程(带参数)
    //输入：
    //			ProcName - 存储过程名
    //      Params	 - 存储过程需要的参数
    //输出：
    //			将执行结果以SqlDataReader返回,经常用于执行查询的存储过程  
    //注意：使用后注意调用SqlDataReader.Close()方法********
    public static SqlDataReader RunProcGetReader(string ProcName, SqlParameter[] Params)
    {
        SqlCommand Cmd = CreatCommand(ProcName, Params);
        return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    } 

    /// <summary>
    /// 初始化参数值
    /// </summary>
    /// <param name="ParamName">存储过程名称或命令文本</param>
    /// <param name="DbType">参数类型</param>
    /// <param name="Size">参数大小</param>
    /// <param name="Direction">参数方向</param>
    /// <param name="Value">参数值</param>
    /// <returns>新的 parameter 对象</returns>
    public static SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value)
    {
        SqlParameter Param;
        if (Size > 0)
            Param = new SqlParameter(ParamName, DbType, Size);
        else
            Param = new SqlParameter(ParamName, DbType);
        Param.Direction = Direction;
        if (!(Direction == ParameterDirection.Output && Value == null))
            Param.Value = Value;
        return Param;
    } 
    //公有方法，实例化一个用于调用存储过程的输入参数
    //输入：
    //     ParamName - 数据库存储过程的参数名称
    //     DbType   -  参数类型
    //     Size     - 参数大小 
    //     Value     - 传给参数的值
    public static SqlParameter MakeInParam(string ParamName, SqlDbType DbTpye, int Size, object Value)
    {
        return MakeParam(ParamName, DbTpye, Size, ParameterDirection.Input, Value);
    } 
    #endregion




} 
