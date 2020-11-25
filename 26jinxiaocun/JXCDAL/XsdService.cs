using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class XsdService
    {
        public static IList<Xsd> getAllXsd()
        {
            IList<Xsd> xsds = new List<Xsd>();
            try
            {
                string sql = "select xsrq,ywy,xsdbh,xsddbh,khbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,xsdbz from xsd";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Xsd xsd = new Xsd();
                        xsd.Xsrq = Convert.ToString(reader["xsrq"]);
                        xsd.Ywy = Convert.ToString(reader["ywy"]);
                        xsd.Xsdbh = Convert.ToString(reader["xsdbh"]);
                        xsd.Xsddbh = Convert.ToString(reader["xsddbh"]);
                        xsd.Khbh = Convert.ToInt32(reader["khbh"]);
                        xsd.Ckbh = Convert.ToString(reader["ckbh"]);
                        xsd.Spbh = Convert.ToInt32(reader["spbh"]);
                        xsd.Sl = Convert.ToDecimal(reader["sl"]);
                        xsd.Dj = Convert.ToDecimal(reader["dj"]);
                        xsd.Zk = Convert.ToDecimal(reader["zk"]);
                        xsd.Zje = Convert.ToDecimal(reader["zje"]);
                        xsd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        xsd.Sfjz = Convert.ToString(reader["sfjz"]);
                        xsd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        xsd.Xsdbz = Convert.ToString(reader["xsdbz"]);
                        xsds.Add(xsd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsds;
        }
        public static Xsd getXsdByXsdbh(string xsdbh)
        {
            Xsd xsd = new Xsd();
            try
            {
                string sql = "select xsrq,ywy,xsdbh,xsddbh,khbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,xsdbz from xsd where xsdbh='" + xsdbh + "'";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        xsd.Xsrq = Convert.ToString(reader["xsrq"]);
                        xsd.Ywy = Convert.ToString(reader["ywy"]);
                        xsd.Xsdbh = Convert.ToString(reader["xsdbh"]);
                        xsd.Xsddbh = Convert.ToString(reader["xsddbh"]);
                        xsd.Khbh = Convert.ToInt32(reader["khbh"]);
                        xsd.Ckbh = Convert.ToString(reader["ckbh"]);
                        xsd.Spbh = Convert.ToInt32(reader["spbh"]);
                        xsd.Sl = Convert.ToDecimal(reader["sl"]);
                        xsd.Dj = Convert.ToDecimal(reader["dj"]);
                        xsd.Zk = Convert.ToDecimal(reader["zk"]);
                        xsd.Zje = Convert.ToDecimal(reader["zje"]);
                        xsd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        xsd.Sfjz = Convert.ToString(reader["sfjz"]);
                        xsd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        xsd.Xsdbz = Convert.ToString(reader["xsdbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsd;
        }
        public static void deleteXsdByXsdbh(string xsdbh)
        {
            try
            {
                string sql = "delete from xsd where xsdbh='" + xsdbh + "'";
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyXsd(Xsd xsd)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update xsd set xsrq='" + xsd.Xsrq + "',ywy='" + xsd.Ywy + "',xsdbh='" + xsd.Xsdbh + "',xsddbh='" + xsd.Xsddbh + "',khbh="
                    + xsd.Khbh + ",ckbh='" + xsd.Ckbh + "',spbh=" + xsd.Spbh + ",sl=" + xsd.Sl + ",dj=" + xsd.Dj + ",zk=" + xsd.Zk + ",zje="
                    + xsd.Zje + ",sfjsfk='" + xsd.Sfjsfk + "',sfjz='" + xsd.Sfjz + "',yfje=" + xsd.Yfje + ",xsdbz='" + xsd.Xsdbz + "'";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addXsd(Xsd xsd)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into xsd (xsrq,ywy,xsdbh,xsddbh,khbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,xsdbz) values ('"
                    + xsd.Xsrq + "','" + xsd.Ywy + "','" + xsd.Xsdbh + "','" + xsd.Xsddbh + "'," + xsd.Khbh + ",'" + xsd.Ckbh + "'," + xsd.Spbh + "," + xsd.Sl + ","
                    + xsd.Dj + "," + xsd.Zk + "," + xsd.Zje + ",'" + xsd.Sfjsfk + "','" + xsd.Sfjz + "'," + xsd.Yfje + ",'" + xsd.Xsdbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static IList<Xsd> getXsdsOrderByCondition(string condition)
        {
            IList<Xsd> xsds = new List<Xsd>();
            try
            {
                string sql = "select xsrq,ywy,xsdbh,xsddbh,khbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,xsdbz from xsd";
                switch (condition)
                {
                    case "xsrq":
                        sql += " order by 'xsrq'";
                        break;
                    case "ywy":
                        sql += " order by 'ywy'";
                        break;
                    case "xsdbh":
                        sql += " order by 'xsdbh'";
                        break;
                    case "xsddbh":
                        sql += " order by 'xsddbh'";
                        break;
                    case "khbh":
                        sql += " order by 'khbh'";
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
                        Xsd xsd = new Xsd();
                        xsd.Xsrq = Convert.ToString(reader["xsrq"]);
                        xsd.Ywy = Convert.ToString(reader["ywy"]);
                        xsd.Xsdbh = Convert.ToString(reader["xsdbh"]);
                        xsd.Xsddbh = Convert.ToString(reader["xsddbh"]);
                        xsd.Khbh = Convert.ToInt32(reader["khbh"]);
                        xsd.Ckbh = Convert.ToString(reader["ckbh"]);
                        xsd.Spbh = Convert.ToInt32(reader["spbh"]);
                        xsd.Sl = Convert.ToDecimal(reader["sl"]);
                        xsd.Dj = Convert.ToDecimal(reader["dj"]);
                        xsd.Zk = Convert.ToDecimal(reader["zk"]);
                        xsd.Zje = Convert.ToDecimal(reader["zje"]);
                        xsd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        xsd.Sfjz = Convert.ToString(reader["sfjz"]);
                        xsd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        xsd.Xsdbz = Convert.ToString(reader["xsdbz"]);
                        xsds.Add(xsd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsds;
        }
        public static IList<Xsd> getXsdsByCondition(string condition1, string condition2)
        {
            IList<Xsd> xsds = new List<Xsd>();
            try
            {
                string sql = "select xsrq,ywy,xsdbh,xsddbh,khbh,ckbh,spbh,sl,dj,zk,zje,sfjsfk,sfjz,yfje,xsdbz from xsd where 1=1";
                if (condition1 != "-1" && condition2 != null)
                    sql += " and " + condition1 + " like '%" + condition2 + "%'";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Xsd xsd = new Xsd();
                        xsd.Xsrq = Convert.ToString(reader["xsrq"]);
                        xsd.Ywy = Convert.ToString(reader["ywy"]);
                        xsd.Xsdbh = Convert.ToString(reader["xsdbh"]);
                        xsd.Xsddbh = Convert.ToString(reader["xsddbh"]);
                        xsd.Khbh = Convert.ToInt32(reader["khbh"]);
                        xsd.Ckbh = Convert.ToString(reader["ckbh"]);
                        xsd.Spbh = Convert.ToInt32(reader["spbh"]);
                        xsd.Sl = Convert.ToDecimal(reader["sl"]);
                        xsd.Dj = Convert.ToDecimal(reader["dj"]);
                        xsd.Zk = Convert.ToDecimal(reader["zk"]);
                        xsd.Zje = Convert.ToDecimal(reader["zje"]);
                        xsd.Sfjsfk = Convert.ToString(reader["sfjsfk"]);
                        xsd.Sfjz = Convert.ToString(reader["sfjz"]);
                        xsd.Yfje = Convert.ToDecimal(reader["yfje"]);
                        xsd.Xsdbz = Convert.ToString(reader["xsdbz"]);
                        xsds.Add(xsd);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsds;
        }
        //public static int existsXsdByXsdmc(string xsdmc)
        //{
        //    int flag = 0;
        //    try
        //    {
        //        string sql = "select xsdbh,xsdmc,dz,yzbm,lxdh,gszy,lxrdzyj,lxr,xsdbz from xsd where xsdmc='" + xsdmc + "'";
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
