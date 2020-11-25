using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class JhddService
    {
        public static string modifyJhdd(Jhdd jhdd)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update jhdd set dhrq='"+jhdd.Dhrq+"',ywy="+jhdd.Ywy+",jhddbh='"+jhdd.Jhddbh+"',gysbh="+jhdd.Gysbh+",spbh="+jhdd.Spbh+",sl="+jhdd.Sl+",dj="+jhdd.Dj+",zk="+jhdd.Zk+",zje="+jhdd.Zje+",zt="+jhdd.Zt+",jhddbz='"+jhdd.Jhddbz+"' from jhdd where jhddbh='"+jhdd.Jhddbh+"'";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static IList<Jhdd> getAllJhdd(string zt,string tj)
        {
            IList<Jhdd> jhdds = new List<Jhdd>();
            try
            {
                string sql = "select dhrq,ywy,jhddbh,gysbh,spbh,sl,dj,zk,zje,zt,jhddbz from jhdd where 1=1";
                if (zt == "0")
                    sql += " and zt=0";
                if (zt == "1")
                    sql += " and zt=1";
                if (zt == "2")
                    sql += " and zt=2";
                if (zt == "3")
                    sql += " and zt=3";
                if (tj != "")
                    sql += " and zt!=" + tj;
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Jhdd jhdd = new Jhdd();
                        jhdd.Dhrq = Convert.ToString(reader["dhrq"]);
                        jhdd.Ywy = Convert.ToInt32(reader["ywy"]);
                        jhdd.Jhddbh = Convert.ToString(reader["jhddbh"]);
                        jhdd.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        jhdd.Spbh = Convert.ToInt32(reader["spbh"]);
                        jhdd.Sl = Convert.ToDecimal(reader["sl"]);
                        jhdd.Dj = Convert.ToDecimal(reader["dj"]);
                        jhdd.Zk = Convert.ToDecimal(reader["zk"]);
                        jhdd.Zje = Convert.ToDecimal(reader["zje"]);
                        jhdd.Zt = Convert.ToInt32(reader["zt"]);
                        jhdd.Jhddbz = Convert.ToString(reader["jhddbz"]);
                        jhdds.Add(jhdd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhdds;
        }
        public static void deleteJhddByJhddbh(string jhddbh)
        {
            try
            {
                string sql = "delete from jhdd where jhddbh='" + jhddbh + "'";
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        
        public static string addJhdd(Jhdd jhdd)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into jhdd (dhrq,ywy,jhddbh,gysbh,spbh,sl,dj,zk,zje,zt,jhddbz) values('"
                    + jhdd.Dhrq + "'," + jhdd.Ywy + ",'" + jhdd.Jhddbh + "'," + jhdd.Gysbh + "," + jhdd.Spbh + ","
                    + jhdd.Sl + "," + jhdd.Dj + "," + jhdd.Zk + "," + jhdd.Zje + "," + jhdd.Zt + ",'" + jhdd.Jhddbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static Jhdd getJhddByJhddbh(string jhddbh)
        {
            string sql = "select dhrq,ywy,jhddbh,gysbh,spbh,sl,dj,zk,zje,zt,jhddbz from jhdd where jhddbh='" + jhddbh + "'";
            Jhdd jhdd = new Jhdd();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        jhdd.Dhrq = Convert.ToString(reader["dhrq"]);
                        jhdd.Ywy = Convert.ToInt32(reader["ywy"]);
                        jhdd.Jhddbh = Convert.ToString(reader["jhddbh"]);
                        jhdd.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        jhdd.Spbh = Convert.ToInt32(reader["spbh"]);
                        jhdd.Sl = Convert.ToDecimal(reader["sl"]);
                        jhdd.Dj = Convert.ToDecimal(reader["dj"]);
                        jhdd.Zk = Convert.ToDecimal(reader["zk"]);
                        jhdd.Zje = Convert.ToDecimal(reader["zje"]);
                        jhdd.Zt = Convert.ToInt32(reader["zt"]);
                        jhdd.Jhddbz = Convert.ToString(reader["jhddbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhdd;
        }
        public static int getZtByJhddbh(string jhddbh)
        {
            string sql = "select zt from jhdd where jhddbh='"+jhddbh+"'";
            int flag = -1;
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                        flag = Convert.ToInt32(reader["zt"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return flag;
        }
        public static void modifyZtByDdbh(string zt, string ddbh)
        {
            DBHelper.ExecuteCommand("update jhdd set zt=" + zt + " where jhddbh in(" + ddbh + ")");
        }
    }
}
