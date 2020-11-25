using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class JhdService
    {
        public static IList<Jhd> getAllJhd()
        {
            IList<Jhd> jhds = new List<Jhd>();
            try
            {
                string sql = "select jhrq,ywy,jhdbh,jhddbh,gysbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,jhdbz from jhd";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Jhd jhd = new Jhd();
                        jhd.Jhrq = Convert.ToString(reader["jhrq"]);
                        jhd.Ywy = Convert.ToString(reader["ywy"]);
                        jhd.Jhdbh = Convert.ToString(reader["jhdbh"]);
                        jhd.Jhddbh = Convert.ToString(reader["jhddbh"]);
                        jhd.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        jhd.Ckbh = Convert.ToString(reader["ckbh"]);
                        jhd.Spbh = Convert.ToInt32(reader["spbh"]);
                        jhd.Sl = Convert.ToDecimal(reader["sl"]);
                        jhd.Dj = Convert.ToDecimal(reader["dj"]);
                        jhd.Zk = Convert.ToDecimal(reader["zk"]);
                        jhd.Zje = Convert.ToDecimal(reader["zje"]);
                        jhd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        jhd.Sfjz = Convert.ToString(reader["sfjz"]);
                        jhd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        jhd.Jhdbz = Convert.ToString(reader["jhdbz"]);
                        jhds.Add(jhd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhds;
        }
        public static Jhd getJhdByJhdbh(string jhdbh)
        {
            Jhd jhd = new Jhd();
            try
            {
                string sql = "select jhrq,ywy,jhdbh,jhddbh,gysbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,jhdbz from jhd where jhdbh='" + jhdbh+"'";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        jhd.Jhrq = Convert.ToString(reader["jhrq"]);
                        jhd.Ywy = Convert.ToString(reader["ywy"]);
                        jhd.Jhdbh = Convert.ToString(reader["jhdbh"]);
                        jhd.Jhddbh = Convert.ToString(reader["jhddbh"]);
                        jhd.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        jhd.Ckbh = Convert.ToString(reader["ckbh"]);
                        jhd.Spbh = Convert.ToInt32(reader["spbh"]);
                        jhd.Sl = Convert.ToDecimal(reader["sl"]);
                        jhd.Dj = Convert.ToDecimal(reader["dj"]);
                        jhd.Zk = Convert.ToDecimal(reader["zk"]);
                        jhd.Zje = Convert.ToDecimal(reader["zje"]);
                        jhd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        jhd.Sfjz = Convert.ToString(reader["sfjz"]);
                        jhd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        jhd.Jhdbz = Convert.ToString(reader["jhdbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhd;
        }
        public static void deleteJhdByJhdbh(string jhdbh)
        {
            try
            {
                string sql = "delete from jhd where jhdbh='" + jhdbh+"'";
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyJhd(Jhd jhd)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update jhd set jhrq='"+jhd.Jhrq+"',ywy='"+jhd.Ywy+"',jhdbh='"+jhd.Jhdbh+"',jhddbh='"+jhd.Jhddbh+"',gysbh="
                    +jhd.Gysbh+",ckbh='"+jhd.Ckbh+"',spbh="+jhd.Spbh+",sl="+jhd.Sl+",dj="+jhd.Dj+",zk="+jhd.Zk+",zje="
                    +jhd.Zje+",sfjsfk='"+jhd.Sfjsfk+"',sfjz='"+jhd.Sfjz+"',yfje="+jhd.Yfje+",jhdbz='"+jhd.Jhdbz+"'";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addJhd(Jhd jhd)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into jhd (jhrq,ywy,jhdbh,jhddbh,gysbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,jhdbz) values ('"
                    +jhd.Jhrq+"','"+jhd.Ywy+"','"+jhd.Jhdbh+"','"+jhd.Jhddbh+"',"+jhd.Gysbh+",'"+jhd.Ckbh+"',"+jhd.Spbh+","+jhd.Sl+","
                    +jhd.Dj+","+jhd.Zk+","+jhd.Zje+",'"+jhd.Sfjsfk+"','"+jhd.Sfjz+"',"+jhd.Yfje+",'"+jhd.Jhdbz+"')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static IList<Jhd> getJhdsOrderByCondition(string condition)
        {
            IList<Jhd> jhds = new List<Jhd>();
            try
            {
                string sql = "select jhrq,ywy,jhdbh,jhddbh,gysbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,jhdbz from jhd";
                switch (condition)
                {
                    case "jhrq":
                        sql += " order by 'jhrq'";
                        break;
                    case "ywy":
                        sql += " order by 'ywy'";
                        break;
                    case "jhdbh":
                        sql += " order by 'jhdbh'";
                        break;
                    case "jhddbh":
                        sql += " order by 'jhddbh'";
                        break;
                    case "gysbh":
                        sql += " order by 'gysbh'";
                        break;
                    case "ckbh":
                        sql += " order by 'ckbh'";
                        break;
                    case "spbh":
                        sql += " order by 'spbh'";
                        break;
                    case "sl":
                        sql += " order by 'sl'";
                        break;
                    case "dj":
                        sql += " order by 'dj'";
                        break;
                    case "zk":
                        sql += " order by 'zk'";
                        break;
                    case "zje":
                        sql += " order by 'zje'";
                        break;
                    case "yfje":
                        sql += " order by 'yfje'";
                        break;
                    default:
                        break;
                }
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Jhd jhd = new Jhd();
                        jhd.Jhrq = Convert.ToString(reader["jhrq"]);
                        jhd.Ywy = Convert.ToString(reader["ywy"]);
                        jhd.Jhdbh = Convert.ToString(reader["jhdbh"]);
                        jhd.Jhddbh = Convert.ToString(reader["jhddbh"]);
                        jhd.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        jhd.Ckbh = Convert.ToString(reader["ckbh"]);
                        jhd.Spbh = Convert.ToInt32(reader["spbh"]);
                        jhd.Sl = Convert.ToDecimal(reader["sl"]);
                        jhd.Dj = Convert.ToDecimal(reader["dj"]);
                        jhd.Zk = Convert.ToDecimal(reader["zk"]);
                        jhd.Zje = Convert.ToDecimal(reader["zje"]);
                        jhd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        jhd.Sfjz = Convert.ToString(reader["sfjz"]);
                        jhd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        jhd.Jhdbz = Convert.ToString(reader["jhdbz"]);
                        jhds.Add(jhd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhds;
        }
        public static IList<Jhd> getJhdsByCondition(string condition1,string condition2)
        {
            IList<Jhd> jhds = new List<Jhd>();
            try
            {
                string sql = "select jhrq,ywy,jhdbh,jhddbh,gysbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,jhdbz from jhd where 1=1";
                if (condition1 != "-1" && condition2 != null)
                    sql += " and " + condition1 + " like '%" + condition2 + "%'";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Jhd jhd = new Jhd();
                        jhd.Jhrq = Convert.ToString(reader["jhrq"]);
                        jhd.Ywy = Convert.ToString(reader["ywy"]);
                        jhd.Jhdbh = Convert.ToString(reader["jhdbh"]);
                        jhd.Jhddbh = Convert.ToString(reader["jhddbh"]);
                        jhd.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        jhd.Ckbh = Convert.ToString(reader["ckbh"]);
                        jhd.Spbh = Convert.ToInt32(reader["spbh"]);
                        jhd.Sl = Convert.ToDecimal(reader["sl"]);
                        jhd.Dj = Convert.ToDecimal(reader["dj"]);
                        jhd.Zk = Convert.ToDecimal(reader["zk"]);
                        jhd.Zje = Convert.ToDecimal(reader["zje"]);
                        jhd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        jhd.Sfjz = Convert.ToString(reader["sfjz"]);
                        jhd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        jhd.Jhdbz = Convert.ToString(reader["jhdbz"]);
                        jhds.Add(jhd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhds;
        }
        //public static int existsJhdByJhdmc(string jhdmc)
        //{
        //    int flag = 0;
        //    try
        //    {
        //        string sql = "select jhdbh,jhdmc,dz,yzbm,lxdh,gszy,lxrdzyj,lxr,jhdbz from jhd where jhdmc='" + jhdmc + "'";
        //        using (SqlDataReader reader = DBHelper.GetReader(sql))
        //        {
        //            if (reader.Read())
        //                flag = 1;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.ToString());
        //    }
        //    return flag;
        //}
    }
}
