using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataBase
{
    public abstract class DataConSql
    {
        protected static string strCon = ConfigurationSettings.AppSettings["ConStr"];
       
        public static DataSet RunProcedure(SqlConnection oleCon, SqlTransaction tx, string storedProcName, IDataParameter[] parameters, string tablename)
        {
            DataSet dataSet = new DataSet();
            SqlDataAdapter SqlDA = new SqlDataAdapter();
            SqlCommand cmd = BuildQueryCommand(oleCon, tx, storedProcName, parameters);
            parameters[0].Direction = ParameterDirection.Output;
            SqlDA.SelectCommand = cmd;
            SqlDA.Fill(dataSet, tablename);
            cmd.Dispose();
            SqlDA.Dispose();
            return dataSet;
        }
       
        public static DataSet RunProcedure_notParam(SqlConnection oleCon, SqlTransaction tx, string storedProcName, string tablename)
        {
            DataSet dataSet = new DataSet();
            SqlDataAdapter SqlDA = new SqlDataAdapter();
            SqlCommand cmd = BuildQueryCommand(oleCon, tx, storedProcName);
            SqlDA.SelectCommand = cmd;
            SqlDA.Fill(dataSet, tablename);
            cmd.Dispose();
            SqlDA.Dispose();
            return dataSet;
        }
       
        public static int RunProcedure_Row(SqlConnection oleCon, SqlTransaction tx, string storedProcName, IDataParameter[] parameters)
        {
            int influenceRow = 0;
            try
            {
                SqlCommand cmd = BuildQueryCommand(oleCon, tx, storedProcName, parameters);
                influenceRow = cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            catch (SqlException ex)
            {
                influenceRow = -1;
                throw new Exception(ex.Message);
            }
            return influenceRow; 
        }
        private static SqlCommand BuildQueryCommand(SqlConnection oleCon, SqlTransaction tx, string storedProcName, IDataParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(storedProcName, oleCon);
            if (tx != null)
            {
                command.Transaction = tx;
            }
            command.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
            {
                command.Parameters.Add(parameter);
            }
            return command;
        }
        private static SqlCommand BuildQueryCommand(SqlConnection oleCon, SqlTransaction tx, string storedProcName)
        {
            SqlCommand command = new SqlCommand(storedProcName, oleCon);
            if (tx != null)
            {
                command.Transaction = tx;
            }
            command.CommandType = CommandType.StoredProcedure;
            return command;
        }
      
        public static DataSet RunProcedure_StrSql(SqlConnection oleCon, SqlTransaction tx, string strSql, string tablename)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter SqlDA = new SqlDataAdapter();
            SqlCommand oleComm = new SqlCommand(strSql, oleCon);
            if (tx != null)
            {
                oleComm.Transaction = tx;
            }
            SqlDA.SelectCommand = oleComm;
            SqlDA.Fill(ds, tablename);
            oleComm.Dispose();
            SqlDA.Dispose();
            return ds;
        }
       
        public static int RunProcedure_StrSql_Row(SqlConnection oleCon, SqlTransaction tx, string strSql)
        {
            int influenceRow = 0;
            try
            {
                SqlCommand cmd = new SqlCommand(strSql, oleCon);
                if (tx != null)
                {
                    cmd.Transaction = tx;
                }
                influenceRow = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return influenceRow;
            }
            catch (SqlException ex)
            {
                influenceRow = -1;
                throw new Exception(ex.Message);
            }
            return influenceRow;
        }
    }
}
