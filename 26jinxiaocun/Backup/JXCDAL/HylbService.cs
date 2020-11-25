using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class HylbService
    {
        public static string getHylbmcByHylbbh(string hylbbh)
        {
            string str = "";
            try
            {
                string sql = "select hylbmc from hylb where hylbbh=" + hylbbh;
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        str = Convert.ToString(reader["hylbmc"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static IList<Hylb> getAllHylb()
        {
            IList<Hylb> hylbs = new List<Hylb>();
            try
            {
                string sql = "select hylbbh,hylbmc,hylbbz from hylb";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Hylb hylb = new Hylb();
                        hylb.Hylbbh = Convert.ToInt32(reader["hylbbh"]);
                        hylb.Hylbmc = Convert.ToString(reader["hylbmc"]);
                        hylb.Hylbbz = Convert.ToString(reader["hylbbz"]);
                        hylbs.Add(hylb);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return hylbs;
        }
        public static Hylb getHylbByHylbbh(string hylbbh)
        {
            string sql = "select hylbbh,hylbmc,hylbbz from hylb where hylbbh=" + hylbbh;
            Hylb hylb = new Hylb();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        hylb.Hylbbh = Convert.ToInt32(reader["hylbbh"]);
                        hylb.Hylbmc = Convert.ToString(reader["hylbmc"]);
                        hylb.Hylbbz = Convert.ToString(reader["hylbbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return hylb;
        }

        public static void deleteHylbByHylbbh(string hylbbh)
        {
            try
            {
                string sql = "delete from hylb where hylbbh=" + hylbbh;
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string modifyHylb(Hylb hylb)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update hylb set hylbmc='" + hylb.Hylbmc + "',hylbbz='" + hylb.Hylbbz + "' where hylbbh=" + hylb.Hylbbh;
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addHylb(Hylb hylb)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into hylb (hylbmc,hylbbz) values('" + hylb.Hylbmc + "','" + hylb.Hylbbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static int existsHylbByHylbmc(string hylbmc)
        {
            int flag = 0;
            try
            {
                string sql = "select hylbbh,hylbmc,hylbbz from hylb where hylbmc='" + hylbmc + "'";
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
