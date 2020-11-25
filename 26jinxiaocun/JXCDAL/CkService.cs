using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class CkService
    {
        public static IList<Ck> getAllCk()
        {
            IList<Ck> cks = new List<Ck>();
            try
            {
                string sql = "select ckbh,ckmc,ckbz from ck";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Ck ck = new Ck();
                        ck.Ckbh = Convert.ToString(reader["ckbh"]);
                        ck.Ckmc = Convert.ToString(reader["ckmc"]);
                        ck.Ckbz = Convert.ToString(reader["ckbz"]);
                        cks.Add(ck);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return cks;
        }
        public static Ck getCkByCkbh(string ckbh)
        {
            string sql = "select ckbh,ckmc,ckbz from ck where ckbh='" + ckbh + "'";
            Ck ck = new Ck();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        ck.Ckbh = Convert.ToString(reader["ckbh"]);
                        ck.Ckmc = Convert.ToString(reader["ckmc"]);
                        ck.Ckbz = Convert.ToString(reader["ckbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return ck;
        }

        public static void deleteCkByCkbh(string ckbh)
        {
            try
            {
                string sql = "delete from ck where ckbh='" + ckbh + "'";
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string modifyCk(Ck ck)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update ck set ckbh='" + ck.Ckbh + "',ckmc='" + ck.Ckmc + "',ckbz='" + ck.Ckbz + "' where ckbh='" + ck.Ckbh + "'";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addCk(Ck ck)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into ck (ckbh,ckmc,ckbz) values('"+ck.Ckbh+"','" + ck.Ckmc + "','" + ck.Ckbz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static int existsCkByCkBh(string ckbh)
        {
            int flag = 0;
            try
            {
                string sql = "select ckbh,ckmc,ckbz from ck where ckbh='" + ckbh + "'";
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
