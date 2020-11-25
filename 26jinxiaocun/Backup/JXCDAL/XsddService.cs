using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;
//该源码下载自www.51aspx.com(５１ａsｐｘ．ｃｏｍ)

namespace JXCDAL
{
    public class XsddService
    {
        public static string modifyXsdd(Xsdd xsdd)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update xsdd set xsrq='" + xsdd.Xsrq + "',ywy=" + xsdd.Ywy + ",xsddbh='" + xsdd.Xsddbh + "',khbh=" + xsdd.Khbh + ",spbh=" + xsdd.Spbh + ",sl=" + xsdd.Sl + ",dj=" + xsdd.Dj + ",zk=" + xsdd.Zk + ",zje=" + xsdd.Zje + ",zt=" + xsdd.Zt + ",xsddbz='" + xsdd.Xsddbz + "' from xsdd where xsddbh='" + xsdd.Xsddbh + "'";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static IList<Xsdd> getAllXsdd(string zt,string tj)
        {
            IList<Xsdd> xsdds = new List<Xsdd>();
            try
            {
                string sql = "select xsrq,ywy,xsddbh,khbh,spbh,sl,dj,zk,zje,zt,xsddbz from xsdd where 1=1";
                if (zt == "0")
                    sql += " and zt=0";
                if (zt == "1")
                    sql += " and zt=1";
                if (zt == "2")
                    sql += " and zt=2";
                if (zt == "3")
                    sql += " and zt=3";
                if(tj!="")
                    sql += " and zt!="+tj;
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Xsdd xsdd = new Xsdd();
                        xsdd.Xsrq = Convert.ToString(reader["xsrq"]);
                        xsdd.Ywy = Convert.ToInt32(reader["ywy"]);
                        xsdd.Xsddbh = Convert.ToString(reader["xsddbh"]);
                        xsdd.Khbh = Convert.ToInt32(reader["khbh"]);
                        xsdd.Spbh = Convert.ToInt32(reader["spbh"]);
                        xsdd.Sl = Convert.ToDecimal(reader["sl"]);
                        xsdd.Dj = Convert.ToDecimal(reader["dj"]);
                        xsdd.Zk = Convert.ToDecimal(reader["zk"]);
                        xsdd.Zje = Convert.ToDecimal(reader["zje"]);
                        xsdd.Zt = Convert.ToInt32(reader["zt"]);
                        xsdd.Xsddbz = Convert.ToString(reader["xsddbz"]);
                        xsdds.Add(xsdd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsdds;
        }
        public static void deleteXsddByXsddbh(string xsddbh)
        {
            try
            {
                string sql = "delete from xsdd where xsddbh='" + xsddbh + "'";
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string addXsdd(Xsdd xsdd)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into xsdd (xsrq,ywy,xsddbh,khbh,spbh,sl,dj,zk,zje,zt,xsddbz) values('"
                    + xsdd.Xsrq + "'," + xsdd.Ywy + ",'" + xsdd.Xsddbh + "'," + xsdd.Khbh + "," + xsdd.Spbh + ","
                    + xsdd.Sl + "," + xsdd.Dj + "," + xsdd.Zk + "," + xsdd.Zje + "," + xsdd.Zt + ",'" + xsdd.Xsddbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static Xsdd getXsddByXsddbh(string xsddbh)
        {
            string sql = "select xsrq,ywy,xsddbh,khbh,spbh,sl,dj,zk,zje,zt,xsddbz from xsdd where xsddbh='" + xsddbh + "'";
            Xsdd xsdd = new Xsdd();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        xsdd.Xsrq = Convert.ToString(reader["xsrq"]);
                        xsdd.Ywy = Convert.ToInt32(reader["ywy"]);
                        xsdd.Xsddbh = Convert.ToString(reader["xsddbh"]);
                        xsdd.Khbh = Convert.ToInt32(reader["khbh"]);
                        xsdd.Spbh = Convert.ToInt32(reader["spbh"]);
                        xsdd.Sl = Convert.ToDecimal(reader["sl"]);
                        xsdd.Dj = Convert.ToDecimal(reader["dj"]);
                        xsdd.Zk = Convert.ToDecimal(reader["zk"]);
                        xsdd.Zje = Convert.ToDecimal(reader["zje"]);
                        xsdd.Zt = Convert.ToInt32(reader["zt"]);
                        xsdd.Xsddbz = Convert.ToString(reader["xsddbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsdd;
        }
        public static int getZtByXsddbh(string xsddbh)
        {
            string sql = "select zt from xsdd where xsddbh='" + xsddbh + "'";
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
            DBHelper.ExecuteCommand("update xsdd set zt=" + zt + " where xsddbh in(" + ddbh + ")");
        }
    }
}
