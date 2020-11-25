using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class CplbService
    {
        public static IList<Cplb> getAllCplb()
        {
            IList<Cplb> cplbs = new List<Cplb>();
            try
            {
                string sql = "select cplbbh,cplbmc,cplbbz from cplb";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Cplb cplb = new Cplb();
                        cplb.Cplbbh = Convert.ToInt32(reader["cplbbh"]);
                        cplb.Cplbmc = Convert.ToString(reader["cplbmc"]);
                        cplb.Cplbbz = Convert.ToString(reader["cplbbz"]);
                        cplbs.Add(cplb);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return cplbs;
        }
        public static Cplb getCplbByCplbbh(int cplbbh)
        {
            string sql = "select cplbbh,cplbmc,cplbbz from cplb where cplbbh=" + cplbbh;
            Cplb cplb = new Cplb();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        cplb.Cplbbh = Convert.ToInt32(reader["cplbbh"]);
                        cplb.Cplbmc = Convert.ToString(reader["cplbmc"]);
                        cplb.Cplbbz = Convert.ToString(reader["cplbbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return cplb;
        }

        public static void deleteCplbByCplbbh(int cplbbh)
        {
            try
            {
                string sql = "delete from cplb where cplbbh=" + cplbbh;
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string modifyCplb(Cplb cplb)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update cplb set cplbmc='" + cplb.Cplbmc + "',cplbbz='" + cplb.Cplbbz + "' where cplbbh=" + cplb.Cplbbh;
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addCplb(Cplb cplb)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into cplb (cplbmc,cplbbz) values('"+ cplb.Cplbmc + "','" + cplb.Cplbbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static int existsCplbByCplbmc(string cplbmc)
        {
            int flag = 0;
            try
            {
                string sql = "select cplbbh,cplbmc,cplbbz from cplb where cplbmc='" + cplbmc + "'";
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
    }

}
