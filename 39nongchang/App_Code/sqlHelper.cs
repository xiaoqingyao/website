using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// sqlHelper 的摘要说明
/// </summary>
public class sqlHelper
{
    public static readonly string SQL_CONNECTION_STRING_CONFIG_NAME = "ConnectionStringvUnionDataBase";
    public static readonly int SQL_COMMAND_TIMEOUT = 0;
    private string SQL_CONNECTION_STRING = "";
    private DataSet returnDataSet = null;



    public sqlHelper()
    {
        //if (string.IsNullOrEmpty(sqlCon.Name))
        //{
        SQL_CONNECTION_STRING = System.Configuration.ConfigurationManager.AppSettings[SQL_CONNECTION_STRING_CONFIG_NAME].ToString().Trim();

        //}
        //else
        //{
        // SQL_CONNECTION_STRING = sqlCon.Name;

        // }



    }
    public sqlHelper(string sqlConnectionString)
    {
        SQL_CONNECTION_STRING = sqlConnectionString;
    }

    public object ExecuteScalar(string sql)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            OpenConnection(conn);
            using (SqlCommand cmd = conn.CreateCommand())
            {
                cmd.CommandText = sql;
                return cmd.ExecuteScalar();
            }
        }
    }

    /// <summary>
    /// open connection to database
    /// </summary>
    /// <param name="conn"></param>
    private void OpenConnection(SqlConnection conn)
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
    }
    /// <summary>
    /// close connection to database
    /// </summary>
    /// <param name="conn"></param>
    private void CloseConnection(SqlConnection conn)
    {
        if (conn.State == ConnectionState.Open)
        {
            conn.Close();
        }
    }
    /// <summary>
    /// Get SQL Connection String
    /// </summary>
    /// <returns>SQL Connection String</returns>
    private string GetConnectionString()
    {
        if (SQL_CONNECTION_STRING == "")
            return System.Configuration.ConfigurationManager.AppSettings[SQL_CONNECTION_STRING_CONFIG_NAME].ToString().Trim();
        else
            return SQL_CONNECTION_STRING;
    }
    /// <summary>
    /// According to sqlQueryString,Get the number of rows affected
    /// </summary>
    /// <param name="sqlQueryString">sqlQueryString without parameter</param>
    /// <returns>the number of rows affected</returns>
    public int ExecuteNonQuery(string sqlQueryString)
    {
        return ExecuteNonQuery(sqlQueryString, null);
    }
    /// <summary>
    /// execute muti sqlQueryString,and return a number of rows affected
    /// </summary>
    /// <param name="sqlQueryString">array of sqlQueryString</param>
    /// <returns></returns>
    public int ExecuteNonQuerys(string[] sqlQueryString)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                SqlTransaction stran = conn.BeginTransaction();
                com.Connection = conn;
                com.CommandType = CommandType.Text;
                com.Transaction = stran;

                try
                {
                    foreach (string str in sqlQueryString)
                    {
                        if (str != null && str != string.Empty)
                        {
                            com.CommandText = str;
                            com.ExecuteNonQuery();
                        }
                    }
                    stran.Commit();
                    return 1;
                }
                catch
                {
                    return -1;
                }
                finally
                {
                    CloseConnection(conn);
                }
            }
        }
    }

    /// <summary>
    /// 没有事务的执行sql组成的数组
    /// </summary>
    /// <param name="sqlQueryString"></param>
    /// <returns></returns>
    public int ExecuteNonQuerysWhitOutTrans(string[] sqlQueryString)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                com.Connection = conn;
                com.CommandType = CommandType.Text;
                try
                {
                    foreach (string str in sqlQueryString)
                    {
                        if (str != null && str != string.Empty)
                        {
                            com.CommandText = str;
                            com.ExecuteNonQuery();
                        }
                    }

                    return 1;
                }
                catch
                {
                    return -1;
                }
                finally
                {
                    CloseConnection(conn);
                }
            }
        }
    }

    public int ExecuteNonQuerysArray(List<string> sqlQueryString)
    {
        string[] strs = new string[sqlQueryString.Count];
        for (int i = 0; i <= strs.Length - 1; i++)
        {
            strs[i] = sqlQueryString[i].ToString().Trim();
        }
        return this.ExecuteNonQuerys(strs);
    }

    public int ExecuteNonQuerysArrayWhitOutTrans(List<string> sqlQueryString)
    {
        string[] strs = new string[sqlQueryString.Count];
        for (int i = 0; i <= strs.Length - 1; i++)
        {
            strs[i] = sqlQueryString[i].ToString().Trim();
        }
        return this.ExecuteNonQuerysWhitOutTrans(strs);
    }
    /// <summary>
    /// execute muti sqlQueryString,and return a number of rows affected
    /// </summary>
    /// <param name="sqlQueryString">array of sqlQueryString</param>
    /// <param name="sqlParameter">sqlParameters</param>
    /// <returns></returns>
    public int ExecuteNonQuerys(string[] sqlQueryString, SqlParameter[] sqlParameter)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                SqlTransaction stran = conn.BeginTransaction();
                com.Connection = conn;
                com.CommandType = CommandType.Text;
                com.Transaction = stran;

                try
                {
                    foreach (string str in sqlQueryString)
                    {
                        if (str != null && str != string.Empty)
                        {
                            com.CommandText = str;

                            if (sqlParameter != null)
                            {
                                foreach (SqlParameter spara in sqlParameter)
                                {
                                    com.Parameters.Add(spara);
                                }
                            }
                            com.ExecuteNonQuery();
                        }
                    }
                    stran.Commit();
                    return 0;
                }
                catch
                {
                    return -1;
                }
                finally
                {
                    CloseConnection(conn);
                }
            }
        }
    }
    /// <summary>
    /// According to sqlQueryString and parameters,Get the number of rows affected
    /// </summary>
    /// <param name="sqlQueryString">sqlQueryString with parameter's names</param>
    /// <param name="sqlParameters">arrary of sqlParameters</param>
    /// <returns>the number of rows affected</returns>
    public int ExecuteNonQuery(string sqlQueryString, SqlParameter[] sqlParameters)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            try
            {
                using (SqlCommand com = new SqlCommand())
                {
                    OpenConnection(conn);
                    com.Connection = conn;
                    com.CommandType = CommandType.Text;
                    com.CommandText = sqlQueryString;
                    com.CommandTimeout = SQL_COMMAND_TIMEOUT;
                    if (sqlParameters != null)
                    {
                        foreach (SqlParameter spara in sqlParameters)
                        {
                            SqlParameter pp = (SqlParameter)((ICloneable)spara).Clone();
                            com.Parameters.Add(spara);
                        }
                    }
                    // com.Parameters.Clear();
                    return com.ExecuteNonQuery();
                }
            }
            catch
            {
                return -1;
            }
            finally
            {
                try
                {
                    CloseConnection(conn);
                }
                catch { }
            }
        }
    }
    /// <summary>
    /// According to sqlQueryString,Get DataSet.
    /// </summary>
    /// <param name="sqlQueryString">sqlQueryString without parameters</param>
    /// <returns>return a dataset</returns>
    public DataSet GetDataSet(string sqlQueryString)
    {
        return GetDataSet(sqlQueryString, null);
    }
    /// <summary>
    /// According to sqlQueryString and sqlParemeters,Get DataSet.
    /// </summary>
    /// <param name="sqlQueryString">sqlQueryString with parameter's names</param>
    /// <param name="sqlParameters">array of sqlParameters</param>
    /// <returns>return a dataset</returns>
    public DataSet GetDataSet(string sqlQueryString, SqlParameter[] sqlParameters)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                com.Connection = conn;
                com.CommandType = CommandType.Text;
                com.CommandText = sqlQueryString;
                com.CommandTimeout = SQL_COMMAND_TIMEOUT;
                if (sqlParameters != null)
                {
                    foreach (SqlParameter spara in sqlParameters)
                    {
                        if (spara != null)
                        {
                            com.Parameters.Add(spara);
                        }
                    }

                }

                using (SqlDataAdapter adp = new SqlDataAdapter(com))
                {
                    returnDataSet = new DataSet();
                    adp.Fill(returnDataSet);
                    com.Parameters.Clear();
                    return returnDataSet;
                }

            }
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sql"></param>
    /// <param name="parameter"></param>
    /// <param name="ispro"></param>
    /// <returns></returns>
    public DataTable GetDataTable(string sqlQueryString, SqlParameter[] sqlParameters)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                com.Connection = conn;
                com.CommandType = CommandType.Text;
                com.CommandText = sqlQueryString;
                com.CommandTimeout = SQL_COMMAND_TIMEOUT;
                if (sqlParameters != null)
                {
                    foreach (SqlParameter spara in sqlParameters)
                    {
                        if (spara != null)
                        {
                            com.Parameters.Add(spara);
                        }
                    }
                }

                using (SqlDataAdapter adp = new SqlDataAdapter(com))
                {
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    com.Parameters.Clear();
                    return dt;
                }
            }
        }
    }

    /// <summary>
    /// According to sqlQueryString,Get Column Value
    /// </summary>
    /// <param name="sqlQueryString">sqlQueryString without parameters</param>
    /// <returns>a charactor string</returns>
    public string GetCellValue(string sqlQueryString)
    {
        return GetCellValue(sqlQueryString, null);
    }
    /// <summary>
    /// According to sqlQueryString and sqlParameters,Get Column Value
    /// </summary>
    /// <param name="sqlQueryString">sqlQueryString with parameter's names</param>
    /// <param name="sqlParameters">array of sqlParameters</param>
    /// <returns>a charactor string</returns>
    public string GetCellValue(string sqlQueryString, SqlParameter[] sqlParameters)
    {
        returnDataSet = new DataSet();
        returnDataSet = GetDataSet(sqlQueryString, sqlParameters);
        if (returnDataSet.Tables[0].Rows.Count == 0)
            return string.Empty;
        else
            return Convert.ToString(returnDataSet.Tables[0].Rows[0][0]);
    }
    /// <summary>
    /// According to sqlQueryString,Get record's rows count
    /// </summary>
    /// <param name="sqlQueryStrng">sqlQueryStrng</param>
    /// <returns>a number of rows count</returns>
    public int GetRecordCount(string sqlQueryStrng)
    {
        return GetRecordCount(sqlQueryStrng, null);
    }
    /// <summary>
    /// According to sqlQueryString and parameters,Get record's rows count
    /// </summary>
    /// <param name="sqlQueryStrng">sqlQueryStrng</param>
    /// <param name="sqlParameters">sqlParameters</param>
    /// <returns>a number of rows count</returns>
    public int GetRecordCount(string sqlQueryStrng, SqlParameter[] sqlParameters)
    {
        returnDataSet = new DataSet();
        returnDataSet = GetDataSet(sqlQueryStrng, sqlParameters);
        return returnDataSet.Tables[0].Rows.Count;
    }

    /// <summary>
    /// 根据存储过程名和参数字符串，调用存储过程，不返回数据。
    /// </summary>
    /// <param name="proName">存储过程名称</param>
    /// <param name="parValue">参数字符串格式：pName,pType(Dat?Int?Var),pValue,pLength|pName,pType,pValue,pLength|pName,pType,pValue,pLength</param>
    public void ExecuteProc(string proName, string parValue)
    {
        string[] sqlPars = parValue.Split('|');
        sqlParametersType[] sqlParameterType = new sqlParametersType[sqlPars.Length];
        for (int i = 0; i <= sqlPars.Length - 1; i++)
        {
            string[] sqlPar = sqlPars[i].Split(',');
            sqlParameterType[i].pName = sqlPar[0].ToString();
            sqlParameterType[i].pType = sqlPar[1].ToString();
            sqlParameterType[i].pValue = sqlPar[2].ToString();
            sqlParameterType[i].pLength = int.Parse(sqlPar[3].ToString().Trim());
        }
        ExecuteProc(proName, sqlParameterType);
    }
    /// <summary>
    /// 根据存储过程名称和单个参数执行存储过程，不返回数据，过程参数为 sqlParametersType 类
    /// </summary>
    /// <param name="proName"></param>
    /// <param name="sqlPar"></param>
    public void ExecuteProc(string proName, sqlParametersType sqlPar)
    {
        SqlParameter[] sqlParameter = new SqlParameter[1];
        sqlParameter[0].ParameterName = sqlPar.pName;
        switch (sqlPar.pType.ToUpper())
        {
            case "DAT":
                sqlParameter[0].SqlDbType = SqlDbType.DateTime;
                break;
            case "INT":
                sqlParameter[0].SqlDbType = SqlDbType.Int;
                break;
            case "VAR":
                sqlParameter[0].SqlDbType = SqlDbType.VarChar;
                break;
            default:
                break;
        }
        sqlParameter[0].Size = sqlPar.pLength;
        sqlParameter[0].Value = sqlPar.pValue;
        ExecuteProc(proName, sqlParameter);
    }
    /// <summary>
    /// 根据存储过程名称和多个参数执行存储过程，不返回数据，过程参数为 sqlParametersType 类
    /// </summary>
    /// <param name="proName"></param>
    /// <param name="sqlPars"></param>
    public void ExecuteProc(string proName, sqlParametersType[] sqlPars)
    {
        SqlParameter[] sqlParameter = new SqlParameter[sqlPars.Length];
        for (int i = 0; i <= sqlParameter.Length - 1; i++)
        {
            sqlParameter[i].ParameterName = sqlPars[i].pName;
            switch (sqlPars[i].pType.ToUpper())
            {
                case "DAT":
                    sqlParameter[i].SqlDbType = SqlDbType.DateTime;
                    break;
                case "INT":
                    sqlParameter[i].SqlDbType = SqlDbType.Int;
                    break;
                case "VAR":
                    sqlParameter[i].SqlDbType = SqlDbType.VarChar;
                    break;
                default:
                    break;
            }
            sqlParameter[i].Size = sqlPars[i].pLength;
            sqlParameter[i].Value = sqlPars[i].pValue;
        }
        ExecuteProc(proName, sqlParameter);
    }
    /// <summary>
    /// 根据存储过程名称和参数数组执行存储过程，不返回数据。
    /// </summary>
    /// <param name="proName">procedure's name</param>
    /// <param name="sqlParameters">procedute's parameters</param>
    public void ExecuteProc(string proName, SqlParameter sqlParameters)
    {
        SqlParameter[] sqlPars = new SqlParameter[1];
        sqlPars[0] = sqlParameters;
        ExecuteProc(proName, sqlPars);
    }
    /// <summary>
    /// 根据存储过程名称和参数数组执行存储过程，不返回数据。
    /// </summary>
    /// <param name="proName">procedure's name</param>
    /// <param name="sqlParameters">procedute's parameters</param>
    public void ExecuteProc(string proName, SqlParameter[] sqlParameters)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = proName;
                com.CommandTimeout = SQL_COMMAND_TIMEOUT;

                if (sqlParameters != null)
                {
                    foreach (SqlParameter spara in sqlParameters)
                    {
                        if (spara != null)
                        {
                            com.Parameters.Add(spara);
                        }
                    }
                }
                com.ExecuteNonQuery();

                CloseConnection(conn);
            }
        }
    }

    /// <summary>
    /// 根据存储过程名和参数字符串，调用存储过程，返回数据集。
    /// </summary>
    /// <param name="proName">存储过程名称</param>
    /// <param name="parValue">参数字符串格式：pName,pType(Dat?Int?Var),pValue,pLength|pName,pType,pValue,pLength|pName,pType,pValue,pLength</param>
    public DataSet ExecuteProcedure(string proName, string parValue)
    {
        string[] sqlPars = parValue.Split('|');
        sqlParametersType[] sqlParameterType = new sqlParametersType[sqlPars.Length];
        for (int i = 0; i <= sqlPars.Length - 1; i++)
        {
            string[] sqlPar = sqlPars[i].Split(',');
            sqlParameterType[i].pName = sqlPar[0].ToString();
            sqlParameterType[i].pType = sqlPar[1].ToString();
            sqlParameterType[i].pValue = sqlPar[2].ToString();
            sqlParameterType[i].pLength = int.Parse(sqlPar[3].ToString().Trim());
        }
        return ExecuteProcedure(proName, sqlParameterType);
    }
    /// <summary>
    /// 根据存储过程名称和单个参数执行存储过程，返回数据集，过程参数为 sqlParametersType 类
    /// </summary>
    /// <param name="proName"></param>
    /// <param name="sqlPar"></param>
    public DataSet ExecuteProcedure(string proName, sqlParametersType sqlPar)
    {
        SqlParameter[] sqlParameter = new SqlParameter[1];
        sqlParameter[0].ParameterName = sqlPar.pName;
        switch (sqlPar.pType.ToUpper())
        {
            case "DAT":
                sqlParameter[0].SqlDbType = SqlDbType.DateTime;
                break;
            case "INT":
                sqlParameter[0].SqlDbType = SqlDbType.Int;
                break;
            case "VAR":
                sqlParameter[0].SqlDbType = SqlDbType.VarChar;
                break;
            default:
                break;
        }
        sqlParameter[0].Size = sqlPar.pLength;
        sqlParameter[0].Value = sqlPar.pValue;
        return ExecuteProcedure(proName, sqlParameter);
    }
    /// <summary>
    /// 根据存储过程名称和多个参数执行存储过程，返回数据集，过程参数为 sqlParametersType 类
    /// </summary>
    /// <param name="proName"></param>
    /// <param name="sqlPars"></param>
    public DataSet ExecuteProcedure(string proName, sqlParametersType[] sqlPars)
    {
        SqlParameter[] sqlParameter = new SqlParameter[sqlPars.Length];
        for (int i = 0; i <= sqlParameter.Length - 1; i++)
        {
            sqlParameter[i].ParameterName = sqlPars[i].pName;
            switch (sqlPars[i].pType.ToUpper())
            {
                case "DAT":
                    sqlParameter[i].SqlDbType = SqlDbType.DateTime;
                    break;
                case "INT":
                    sqlParameter[i].SqlDbType = SqlDbType.Int;
                    break;
                case "VAR":
                    sqlParameter[i].SqlDbType = SqlDbType.VarChar;
                    break;
                default:
                    break;
            }
            sqlParameter[i].Size = sqlPars[i].pLength;
            sqlParameter[i].Value = sqlPars[i].pValue;
        }
        return ExecuteProcedure(proName, sqlParameter);
    }
    /// <summary>
    /// 根据存储过程名称和参数数组执行存储过程，返回数据集。
    /// </summary>
    /// <param name="proName">procedure's name</param>
    /// <param name="sqlParameters">procedute's parameters</param>
    public DataSet ExecuteProcedure(string proName, SqlParameter sqlParameters)
    {
        SqlParameter[] sqlPars = new SqlParameter[1];
        sqlPars[0] = sqlParameters;
        return ExecuteProcedure(proName, sqlPars);
    }
    /// <summary>
    /// execute a procedure ,return a DataSet
    /// </summary>
    /// <param name="proName"></param>
    /// <param name="sqlParameters"></param>
    /// <returns></returns>
    public DataSet ExecuteProcedure(string proName, SqlParameter[] sqlParameters)
    {
        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = proName;
                com.CommandTimeout = SQL_COMMAND_TIMEOUT;

                if (sqlParameters != null)
                {
                    foreach (SqlParameter spara in sqlParameters)
                    {
                        if (spara != null)
                        {
                            com.Parameters.Add(spara);
                        }
                    }
                }
                using (SqlDataAdapter adp = new SqlDataAdapter(com))
                {
                    returnDataSet = new DataSet();
                    adp.Fill(returnDataSet);
                    com.Parameters.Clear();
                    return returnDataSet;
                }
            }
        }
    }


    public DataTable RunQueryCmdToTable(string sqlQueryString)
    {
        return RunQueryCmdToTable(sqlQueryString, null);
    }
    /// <summary>
    /// 执行查询类sql语言，（Select * from...) 将结果采用DataTable的方式返回
    /// </summary>
    /// <param name="sqlCmd">Select语句</param>
    /// <param name="parameters">需要的参数，如果没有，用null</param>
    /// <returns>结果DataSet</returns>
    protected DataTable RunQueryCmdToTable(string sqlQueryString, SqlParameter[] sqlParameters)
    {
        //DataTable dataTable = new DataTable();
        //if (dbConnection.State == ConnectionState.Closed)
        //{
        //    dbConnection.Open();
        //}
        //OracleDataAdapter oDA = new OracleDataAdapter();
        //oDA.SelectCommand = BuildCommand(sqlCmd, parameters);
        //oDA.Fill(dataTable);
        //dbConnection.Close();

        //return dataTable;

        using (SqlConnection conn = new SqlConnection(this.GetConnectionString()))
        {
            using (SqlCommand com = new SqlCommand())
            {
                OpenConnection(conn);
                com.Connection = conn;
                com.CommandType = CommandType.Text;
                com.CommandText = sqlQueryString;
                com.CommandTimeout = SQL_COMMAND_TIMEOUT;
                if (sqlParameters != null)
                {
                    foreach (SqlParameter spara in sqlParameters)
                    {
                        if (spara != null)
                        {
                            com.Parameters.Add(spara);
                        }
                    }
                }

                using (SqlDataAdapter adp = new SqlDataAdapter(com))
                {
                    DataTable returnDataTable = new DataTable();
                    adp.Fill(returnDataTable);
                    com.Parameters.Clear();
                    return returnDataTable;
                }
            }
        }
    }


    public class sqlParametersType
    {
        private string _pName;
        private string _pType;
        private string _pValue;
        private int _pLength;


        public string pName
        {
            get { return _pName; }
            set { _pName = value; }
        }
        public string pType
        {
            get { return _pType; }
            set { _pType = value; }
        }
        public string pValue
        {
            get { return _pValue; }
            set { _pValue = value; }
        }
        public int pLength
        {
            get { return _pLength; }
            set { _pLength = value; }
        }


    }
}