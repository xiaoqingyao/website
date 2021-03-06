using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using DataBase;

namespace DAO
{
    public class User_DAO : BaseDAO
    {
       
        public DataSet ReadInfo()
        {
            SqlParameter[] parameters = {
                                            new SqlParameter("ret", SqlDbType.VarChar, 20)
                                           };
            return DataConSql.RunProcedure(oleConn, tx, "wmsbind_test.bindtest", parameters, "WMST0002");
        }
       
        public DataSet EmpDetailInfo(string strSql)
        {
            return DataConSql.RunProcedure_StrSql(oleConn, tx, strSql, "login");
        }
        public DataSet EmpDetailInfo111(string strSql)
        {
            return DataConSql.RunProcedure_StrSql(oleConn, tx, strSql, "reg");
        }
      
        public DataSet EmpDetailInfo2(string strSql)
        {
            return DataConSql.RunProcedure_StrSql(oleConn, tx, strSql, "gouwuhw");
        }
       
        public DataSet EmpDetailInfo3(string strSql)
        {
            return DataConSql.RunProcedure_StrSql(oleConn, tx, strSql, "admin");
        }
      
        public int DeleteInfo(String sqlStr)
        {
            return DataConSql.RunProcedure_StrSql_Row(oleConn, tx, sqlStr);
        }
      
        public int UpdatePass(String sqlStr) 
        {
            return DataConSql.RunProcedure_StrSql_Row(oleConn, tx, sqlStr);
        }

       
        public int  InsertInfo(ArrayList users)
        {
            SqlParameter[] parameters ={ 
                                            //new SqlParameter("id",SqlDbType.Int,4),
                                            new SqlParameter("sname",SqlDbType.VarChar,50),
                                            new SqlParameter("pass",SqlDbType.VarChar,50),
                                            new SqlParameter("pass2",SqlDbType.VarChar,50),
                                            new SqlParameter("sex",SqlDbType.VarChar,50),
                                            new SqlParameter("qq",SqlDbType.VarChar,50),
                                            new SqlParameter("email",SqlDbType.VarChar,50),
                                            new SqlParameter("question",SqlDbType.VarChar,50),
                                            new SqlParameter("tel",SqlDbType.VarChar,50),
                                            new SqlParameter("province",SqlDbType.VarChar,50),
                                            new SqlParameter("city",SqlDbType.VarChar,50),
                                            new SqlParameter("image",SqlDbType.VarChar,50),
                                            new SqlParameter("birth",SqlDbType.DateTime),
                                            new SqlParameter("answer",SqlDbType.VarChar,50),
                                            new SqlParameter("telphone",SqlDbType.VarChar,50),
                                            new SqlParameter("biaoqing",SqlDbType.VarChar,50),
                                            new SqlParameter("regtime",SqlDbType.VarChar,50),
                                            new SqlParameter("IP",SqlDbType.VarChar,50),
                                            new SqlParameter("type",SqlDbType.VarChar,50),
                                            new SqlParameter("jifen",SqlDbType.VarChar,50),
                                            new SqlParameter("logins",SqlDbType.VarChar,50)
        
        };
            //parameters[0].Direction = ParameterDirection.Output;
            parameters[0].Value = users[0].ToString();
            parameters[1].Value = users[1].ToString();
            parameters[2].Value = users[2].ToString();
            parameters[3].Value = users[3].ToString();
            parameters[4].Value = users[4].ToString();
            parameters[5].Value = users[5].ToString();
            parameters[6].Value = users[6].ToString();
            parameters[7].Value = users[7].ToString();
            parameters[8].Value = users[8].ToString();
            parameters[9].Value = users[9].ToString();
            parameters[10].Value = users[10].ToString();
            parameters[11].Value = users[11].ToString();
            parameters[12].Value = users[12].ToString();
            parameters[13].Value = users[13].ToString();
            parameters[14].Value = users[14].ToString();
            parameters[15].Value = users[15].ToString();
            parameters[16].Value = users[16].ToString();
            parameters[17].Value = users[17].ToString();
            parameters[18].Value = users[18].ToString();
            parameters[19].Value = users[19].ToString();
            return DataConSql.RunProcedure_Row (oleConn ,tx,"reg",parameters);
        }
       
        public int InsertInfo2(String sqlStr)
        {
            return DataConSql.RunProcedure_StrSql_Row(oleConn, tx, sqlStr);
        } 
    }
}
