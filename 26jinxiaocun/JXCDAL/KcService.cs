using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class KcService
    {
        public static IList<Kc> getAllKc(string qhjg)
        {
            IList<Kc> kcs = new List<Kc>();
            try
            {
                string sql = "select kcbh,gxrq,ckbh,spbh,sl,zje,qhjg,kcbz from kc where 1=1";
                if (qhjg == "0")
                    sql += " and qhjg=0";
                if (qhjg == "1")
                    sql += " and qhjg=1";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Kc kc = new Kc();
                        kc.Gxrq = Convert.ToString(reader["gxrq"]);
                        kc.Kcbh = Convert.ToString(reader["kcbh"]);
                        kc.Ckbh = Convert.ToString(reader["ckbh"]);
                        kc.Spbh = Convert.ToInt32(reader["spbh"]);
                        kc.Sl = Convert.ToDecimal(reader["sl"]);
                        kc.Zje = Convert.ToDecimal(reader["zje"]);
                        kc.Qhjg = Convert.ToInt32(reader["qhjg"]);
                        kc.Kcbz = Convert.ToString(reader["kcbz"]);
                        kcs.Add(kc);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kcs;
        }
        public static IList<Kc> getKcsOrderByCondition(string condition)
        {
            IList<Kc> kcs = new List<Kc>();
            try
            {
                string sql = "select kcbh,gxrq,ckbh,spbh,sl,zje,qhjg,kcbz from kc";
                switch (condition)
                {
                    case "gxrq":
                        sql += " order by 'gxrq'";
                        break;
                    case "kcbh":
                        sql += " order by 'kcbh'";
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
                    case "zje":
                        sql += " order by 'zje'";
                        break;
                    default:
                        break;
                }
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Kc kc = new Kc();
                        kc.Gxrq = Convert.ToString(reader["gxrq"]);
                        kc.Kcbh = Convert.ToString(reader["kcbh"]);
                        kc.Ckbh = Convert.ToString(reader["ckbh"]);
                        kc.Spbh = Convert.ToInt32(reader["spbh"]);
                        kc.Sl = Convert.ToDecimal(reader["sl"]);
                        kc.Zje = Convert.ToDecimal(reader["zje"]);
                        kc.Qhjg = Convert.ToInt32(reader["qhjg"]);
                        kc.Kcbz = Convert.ToString(reader["kcbz"]);
                        kcs.Add(kc);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kcs;
        }
        public static IList<Kc> getKcsByCondition(string condition1,string condition2)
        {
            IList<Kc> kcs = new List<Kc>();
            try
            {
                string sql = "select kcbh,gxrq,ckbh,spbh,sl,zje,qhjg,kcbz from kc where 1=1";
                if (condition1 != "-1" && condition2 !=null)
                    sql += " and "+condition1+" like '%"+condition2+"%'";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Kc kc = new Kc();
                        kc.Gxrq = Convert.ToString(reader["gxrq"]);
                        kc.Kcbh = Convert.ToString(reader["kcbh"]);
                        kc.Ckbh = Convert.ToString(reader["ckbh"]);
                        kc.Spbh = Convert.ToInt32(reader["spbh"]);
                        kc.Sl = Convert.ToDecimal(reader["sl"]);
                        kc.Zje = Convert.ToDecimal(reader["zje"]);
                        kc.Qhjg = Convert.ToInt32(reader["qhjg"]);
                        kc.Kcbz = Convert.ToString(reader["kcbz"]);
                        kcs.Add(kc);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kcs;
        }
        public static Kc getKcByKcbh(string kcbh)
        {
            string sql = "select kcbh,gxrq,ckbh,spbh,sl,zje,qhjg,kcbz from kc where kcbh='" + kcbh+"'";
            Kc kc = new Kc();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        kc.Gxrq = Convert.ToString(reader["gxrq"]);
                        kc.Kcbh = Convert.ToString(reader["kcbh"]);
                        kc.Ckbh = Convert.ToString(reader["ckbh"]);
                        kc.Spbh = Convert.ToInt32(reader["spbh"]);
                        kc.Sl = Convert.ToDecimal(reader["sl"]);
                        kc.Zje = Convert.ToDecimal(reader["zje"]);
                        kc.Qhjg = Convert.ToInt32(reader["qhjg"]);
                        kc.Kcbz = Convert.ToString(reader["kcbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kc;
        }

        public static void deleteKcByKcbh(string kcbh)
        {
            try
            {
                string sql = "delete from kc where kcbh='" + kcbh+"'";
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string modifyKc(Kc kc)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update kc set gxrq='"+kc.Gxrq+"',ckbh='"+kc.Ckbh+"',spbh="+kc.Spbh+",sl="
                    +kc.Sl+",zje="+kc.Zje+",qhjg="+kc.Qhjg+",kcbz='"+kc.Kcbz+"' where kcbh='" + kc.Kcbh+"'";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addKc(Kc kc)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into kc (kcbh,gxrq,ckbh,spbh,sl,zje,qhjg,kcbz) values('"
                    + kc.Kcbh + "','" + kc.Gxrq + "','" + kc.Ckbh + "'," + kc.Spbh + ","  + kc.Sl + "," + kc.Zje + "," + kc.Qhjg + ",'" + kc.Kcbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static Kc existsKcBySpbh(int spbh)
        {
            Kc kc = new Kc();
            try
            {
                string sql = "select kcbh,gxrq,ckbh,spbh,sl,zje,qhjg,kcbz from kc where spbh=" + spbh;
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read()) {
                        kc.Gxrq = Convert.ToString(reader["gxrq"]);
                        kc.Kcbh = Convert.ToString(reader["kcbh"]);
                        kc.Ckbh = Convert.ToString(reader["ckbh"]);
                        kc.Spbh = Convert.ToInt32(reader["spbh"]);
                        kc.Sl = Convert.ToDecimal(reader["sl"]);
                        kc.Zje = Convert.ToDecimal(reader["zje"]);
                        kc.Qhjg = Convert.ToInt32(reader["qhjg"]);
                        kc.Kcbz = Convert.ToString(reader["kcbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kc;
        }
        
        public static string getSlBySpbh(string spbh) {
            string sql = "select sl from kc where spbh=" + spbh;
            string str = "无";
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                        str = Convert.ToString(reader["sl"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        
       
    }
}
