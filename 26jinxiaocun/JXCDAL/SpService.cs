using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class SpService
    {
        public static IList<Sp> getAllSp()
        {
            IList<Sp> sps = new List<Sp>();
            try
            {
                string sql = "select spbh,spmc,sptxm,splbbh,sprkjg,spfxjg,splsjg,spsccj,spgxrq,spbz from sp";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Sp sp = new Sp();
                        sp.Spbh = Convert.ToInt32(reader["spbh"]);
                        sp.Spmc = Convert.ToString(reader["spmc"]);
                        sp.Sptxm = Convert.ToString(reader["sptxm"]);
                        sp.Splbbh = Convert.ToInt32(reader["splbbh"]);
                        sp.Sprkjg = Convert.ToDecimal(reader["sprkjg"]);
                        sp.Spfxjg = Convert.ToDecimal(reader["spfxjg"]);
                        sp.Splsjg = Convert.ToDecimal(reader["splsjg"]);
                        sp.Spsccj = Convert.ToString(reader["spsccj"]);
                        sp.Spgxrq = Convert.ToString(reader["spgxrq"]);
                        sp.Spbz = Convert.ToString(reader["spbz"]);
                        sps.Add(sp);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return sps;
        }
        public static Sp getSpBySpbh(int spbh)
        {
            Sp sp = new Sp();
            try
            {
                string sql = "select spbh,spmc,sptxm,splbbh,sprkjg,spfxjg,splsjg,spsccj,spgxrq,spbz from sp where spbh=" + spbh;
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        sp.Spbh = Convert.ToInt32(reader["spbh"]);
                        sp.Spmc = Convert.ToString(reader["spmc"]);
                        sp.Sptxm = Convert.ToString(reader["sptxm"]);
                        sp.Splbbh = Convert.ToInt32(reader["splbbh"]);
                        sp.Sprkjg = Convert.ToDecimal(reader["sprkjg"]);
                        sp.Spfxjg = Convert.ToDecimal(reader["spfxjg"]);
                        sp.Splsjg = Convert.ToDecimal(reader["splsjg"]);
                        sp.Spsccj = Convert.ToString(reader["spsccj"]);
                        sp.Spgxrq = Convert.ToString(reader["spgxrq"]);
                        sp.Spbz = Convert.ToString(reader["spbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return sp;
        }

        public static void deleteSpBySpbh(int spbh)
        {
            try
            {
                string sql = "delete from sp where spbh=" + spbh;
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifySp(Sp sp)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update sp set spmc='" + sp.Spmc + "',sptxm='"+sp.Sptxm+"',splbbh="+sp.Splbbh+",sprkjg='"+sp.Sprkjg+"',spfxjg='"
                    +sp.Spfxjg+"',splsjg='"+sp.Splsjg+"',spsccj='"+sp.Spsccj+"',spgxrq='"+sp.Spgxrq+"',spbz='"+sp.Spbz+"' where spbh=" + sp.Spbh;
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addSp(Sp sp)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into sp (spmc,sptxm,splbbh,sprkjg,spfxjg,splsjg,spsccj,spgxrq,spbz) values ('"
                    + sp.Spmc + "','"+sp.Sptxm+"',"+sp.Splbbh+",'" + sp.Sprkjg + "','" + sp.Spfxjg + "','" + sp.Splsjg + "','" + sp.Spsccj + "','" + sp.Spgxrq + "','" + sp.Spbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static int existsSpBySpmc(string spmc)
        {
            int flag = 0;
            try
            {
                string sql = "select spbh,spmc,sptxm,splbbh,sprkjg,spfxjg,splsjg,spsccj,spgxrq,spbz from sp where spmc='" + spmc + "'";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                        flag = 1;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return flag;
        }
        public static string getSplbmcBySplbbh(string splbbh)
        {
            string sql = "select cplbmc from cplb where cplbbh=" + Convert.ToInt32(splbbh);
            string str = "";
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                        str = Convert.ToString(reader["cplbmc"]);
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
