//**************************************************************
//機能ID　：Test_BLL
//機能　　：実例のデータに対する増加、改正、削除して、検索の操作
//          する。DAO階
//作成者　：偉東林      
//作成期日：2008/05/14
//バージョン：1.0.0
//**************************************************************
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using DataBase;

namespace DAO
{
    public class Test_DAO : BaseDAO

    {
        /// <summary>
        /// すべての社員の情報に戻ります。
        /// </summary>
        /// <returns>データ集</returns>
        public DataSet ReadInfo()
        {
            SqlParameter[] parameters = {
                                            new SqlParameter("ret", SqlDbType.VarChar, 20)
                                           };
            return DataConSql.RunProcedure(oleConn, tx, "wmsbind_test.bindtest", parameters, "WMST0001");
        }
        /// <summary>
        /// 社員詳細情報に戻ります。
        /// </summary>
        /// <param name="strSql">SQL文</param>
        /// <returns></returns>
        public DataSet EmpDetailInfo(string strSql)
        {
            return DataConSql.RunProcedure_StrSql(oleConn,tx, strSql, "username");
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="strSql"></param>
        /// <returns></returns>
        public DataSet PinglunInfo(string strSql)
        {
            return DataConSql.RunProcedure_StrSql(oleConn, tx, strSql, "pinglun");
        }
        /// <summary>
        /// 社員の情報を更新する。
        /// </summary>
        /// <param name="userInfo">社員情報リスト</param>
        /// <returns>影響の行数</returns>
        public int UpdateInfo(ArrayList userInfo)
        {

            SqlParameter[] parameters = {
                                            new SqlParameter("sname", SqlDbType.VarChar,50),
                                            new SqlParameter("sex", SqlDbType.VarChar,50),
                                            new SqlParameter("email", SqlDbType.VarChar,50),
                                            new SqlParameter("birth", SqlDbType.VarChar,50),
                                            new SqlParameter("tel", SqlDbType.VarChar,50),
                                            new SqlParameter("telphone", SqlDbType.VarChar,50),
                                            new SqlParameter("question", SqlDbType.VarChar,50),
                                            new SqlParameter("answer", SqlDbType.VarChar,50)
                                        };
            parameters[0].Value = userInfo[0].ToString();
            parameters[1].Value = userInfo[1].ToString();
            parameters[2].Value = userInfo[2].ToString();
            parameters[3].Value = userInfo[3].ToString();
            parameters[4].Value = userInfo[4].ToString();
            parameters[5].Value = userInfo[5].ToString();
            parameters[6].Value = userInfo[6].ToString();
            parameters[7].Value = userInfo[7].ToString();
            return DataConSql.RunProcedure_Row(oleConn, tx, "salaryinfo", parameters);
        }
        /// <summary>
        /// 社員の情報を削除する。
        /// </summary>
        /// <param name="userNo">社員番号</param>
        /// <returns>影響の行数</returns>
        public int DeleteInfo(String sqlStr)
        {
            return DataConSql.RunProcedure_StrSql_Row(oleConn, tx, sqlStr);   
        }
        /// <summary>
        /// 密码更新。
        /// </summary>
        /// <param name="userNo">社員番号</param>
        /// <returns>影響の行数</returns>
        public int UpdatePass(String sqlStr)
        {
            return DataConSql.RunProcedure_StrSql_Row(oleConn, tx, sqlStr);
        }
        /// <summary>
        /// 以sql形式插入的方法。
        /// </summary>
        /// <param name="sqLStr"></param>
        /// <returns></returns>
        public int InsertInfo2(String sqlStr)
        {
            return DataConSql.RunProcedure_StrSql_Row(oleConn, tx, sqlStr);
        } 
    }
}
