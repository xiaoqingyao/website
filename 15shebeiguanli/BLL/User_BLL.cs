using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Collections;
using DAO;

namespace BLL
{
    public class User_BLL
    {
        static string str = "";

        protected DAO.User_DAO testDao = new User_DAO();
        /// <summary>
        /// すべての社員の情報に戻ります。
        /// </summary>  
        /// <returns>データ集</returns>
        public DataSet ReadInfo_BLL(User_DAO dao)
        {
            return dao.ReadInfo();
        }
        /// <summary>
        /// 修改密码中的查找
        /// </summary>
        /// <param name="dao"></param>
        /// <param name="empbng"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        public DataSet EmpDetailInfo_BLL3(User_DAO dao, string empbng)
        {
            return dao.EmpDetailInfo(empbng);
        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="dao"></param>
        /// <param name="empbng"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        public DataSet EmpDetailInfo_BLL(User_DAO dao, string empbng, string pass)
        {
            string strSql = EmpDetail_BLL(empbng, pass);
            return dao.EmpDetailInfo(strSql);
        }
        public DataSet EmpDetailInfo_BLL111(User_DAO dao, string empbng, string pass)
        {
            string strSql = EmpDetail_BLL111(empbng, pass);
            return dao.EmpDetailInfo111(strSql);
        }
        /// <summary>
        /// login
        /// </summary>
        /// <param name="empbng"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        public String EmpDetail_BLL(string empbng, string pass)
        {
            string str = "";
            if (!empbng.Trim().Equals("") && !pass.Trim().Equals(""))
            {
                str = "select * from login where username='" + empbng + "' and password='" + pass + "'";
            }

            return str;

        }
        public String EmpDetail_BLL111(string empbng, string pass)
        {
            string str = "";
            if (!empbng.Trim().Equals("") && !pass.Trim().Equals(""))
            {
                str = "select * from reg where users='" + empbng + "' and pass='" + pass + "'";
            }

            return str;

        }
        /// <summary>
        /// 后台登录
        /// </summary>
        /// <param name="dao"></param>
        /// <param name="empbng"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        public DataSet EmpDetailInfo_BLL4(User_DAO dao, string empbng, string pass)
        {
            string strSql = EmpDetail_BLL2(empbng, pass);
            return dao.EmpDetailInfo3(strSql);
        }
        /// <summary>
        /// login
        /// </summary>
        /// <param name="empbng"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        public String EmpDetail_BLL2(string empbng, string pass)
        {
            string str = "";
            if (!empbng.Trim().Equals("") && !pass.Trim().Equals(""))
            {
                str = "select * from admin where username='" + empbng + "' and password='" + pass + "'";
            }

            return str;

        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="strSql">SQL文</param>
        /// <returns>データ集</returns>
        public DataSet EmpDetailInfo_BLL2(User_DAO dao, string empbng,string vll,string moneys)
        {
            string strSql = EmpDetail_BLL(empbng, vll, moneys);
            return dao.EmpDetailInfo2(strSql);
        }


        public String EmpDetail_BLL(string empbng,string vv,string salary)
        {
            string strSQL = "";
            if (!empbng.Trim().Equals(""))
            {
                
                strSQL = strSQL + "and hw_name like " + "'%" + empbng.Trim() + "%'";

            }
            if (!vv.Equals("0"))
            {
                strSQL = strSQL + "and sort_id ='"+ vv +"'";
            }
            if (!salary.Equals("0"))
            {
                string strU = "", strD = "";
                switch (Convert.ToInt32(salary))
                {
                    case 0:
                        break;
                    case 1:
                      strU="0";
                      strD = "100";
                        break;
                    case 2:
                        strU = "100";
                        strD = "1000";
                        break;
                    case 3:
                        strU = "1000";
                        strD = "5000";
                        break;
                    case 4:
                        strU = "5000";
                        strD = "10000";
                        break;
                    case 5:
                        strU = "10000";
                        strD = "9999999999999";
                        break;
                }
                if (!strU.Equals("") && !strD.Equals(""))
                {
                    strSQL = strSQL + " and (shichangjia >= " + strU + " and shichangjia < " + strD + ") ";
                }

            }
            //if (strSQL == "")
            //{
            //    Response.Write("<script language=javascript>alert('請填寫检索关键字！');</script>");
            //}

            if (!strSQL.Equals(""))
            {
                strSQL = strSQL.Trim().Substring(4);//去掉第一個and。
                str = "select * from gouwuhw where 1=1 and " + strSQL + "";
                
            }
            return str;
        }

        public string Substr(string inStr, int len)//解決字符過長問題
        {
            //string[] srt;
            if (inStr.Length <= len)
            {
                return inStr;
            }
            string newinstr = inStr.Substring(0, len);
            newinstr = newinstr + "...";
            return newinstr;
        }


        /// <summary>
        /// 社員情報の新增
        /// </summary>
        /// <returns></returns>
        public int InsertInfo_BLL(User_DAO dao,ArrayList users)
        { 
            return dao.InsertInfo (users);
        }
        /// <summary>
        /// 评论新增
        /// </summary>
        /// <param name="dao"></param>
        /// <param name="sqlStr"></param>
        /// <returns></returns>
        public int InsertInfo_BLL2(User_DAO dao, String sqlStr)
        {
            return dao.InsertInfo2(sqlStr);
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="dao"></param>
        /// <param name="sqlStr"></param>
        /// <returns></returns>
        public int updateInfo_BLL(User_DAO dao, String sqlStr)
        {
            return dao.UpdatePass(sqlStr);
        }
        /// <summary>
        /// 社員情報の削除
        /// </summary>
        /// <param name="userNo">社員番号</param>
        /// <returns>影響の行数</returns>
        public int DeleteInfo_BLL(User_DAO dao, String sqlStr)
        {
            return dao.DeleteInfo(sqlStr);
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
