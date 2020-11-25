//**************************************************************
//機能ID　：Test_BLL
//機能　　：実例のデータに対する増加、改正、削除して、検索の操作
//          する。BLL階
//作成者　：偉東林      
//作成期日：2008/05/14
//バージョン：1.0.0
//**************************************************************
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Collections;
using DAO;

namespace BLL
{
    public class Test_BLL
    {
        protected DAO.Test_DAO testDao = new DAO.Test_DAO();
        /// <summary>
        /// すべての社員の情報に戻ります。
        /// </summary>  
        /// <returns>データ集</returns>
        public DataSet ReadInfo_BLL(Test_DAO dao)
        {
            return dao.ReadInfo();
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="strSql">SQL文</param>
        /// <returns>データ集</returns>
        public DataSet EmpDetailInfo_BLL(Test_DAO dao,string strSql)
        {
            return dao.EmpDetailInfo(strSql);
        }
        /// <summary>
        /// 评论邦定数据
        /// </summary>
        /// <param name="dao"></param>
        /// <param name="strSql"></param>
        /// <returns></returns>
        public DataSet PinglunInfo_BLL(Test_DAO dao, string strSql)
        {
            return dao.PinglunInfo(strSql);
        }
        /// <summary>
        /// 社員情報の更新
        /// </summary>
        /// <param name="userInfo">社員情報リスト</param>
        /// <returns>影響の行数</returns>
        public int UpdateInfo_BLL(Test_DAO dao,ArrayList userInfo)
        {
            int reflunce = dao.UpdateInfo(userInfo);
            return reflunce;
        }
        
      
        /// <summary>
        /// 社員情報の削除
        /// </summary>
        /// <param name="userNo">社員番号</param>
        /// <returns>影響の行数</returns>
        public int DeleteInfo_BLL(Test_DAO dao,String sqlStr)
        {
            return dao.DeleteInfo(sqlStr);
        }
        /// <summary>
        /// 社員情報の修改密码
        /// </summary>
        /// <param name="userNo">社員番号</param>
        /// <returns>影響の行数</returns>
        public int UpdatePass_BLL(Test_DAO dao, String sqlStr)
        {
            return dao.UpdatePass(sqlStr); 
        }
        /// <summary>
        /// 社員情報の插入
        /// </summary>
        /// <param name="userNo">社員番号</param>
        /// <returns>影響の行数</returns>
        public int InsertInfo(Test_DAO dao, String sqlStr)
        {
            return dao.InsertInfo2(sqlStr);
        }
        /// <summary>
        /// 方法の通用入ります
        /// </summary>
        /// <param name="methodname">方法名</param>
        /// <param name="obj">対象に入って</param>
        /// <returns>対象</returns>
        public object executeDAO(string methodname, object[] obj)
        {
            return new MethodInvoker().MInvoke(testDao, methodname, obj, this);
        }
      
    }
}
