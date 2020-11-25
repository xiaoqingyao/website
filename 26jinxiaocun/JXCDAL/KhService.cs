using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class KhService
    {
        public static IList<Kh> getAllKh(){
            IList<Kh> khs = new List<Kh>();
            try{
                string sql = "select khbh,khmc,dz,yzbm,lxdh,gszy,lxr,lxrdzyj,hylb,ljxfje,khbz from kh";
                using(SqlDataReader reader = DBHelper.GetReader(sql)){
                    while(reader.Read()){
                        Kh kh = new Kh();
                        kh.Khbh = Convert.ToInt32(reader["khbh"]);
                        kh.Khmc = Convert.ToString(reader["khmc"]);
                        kh.Dz = Convert.ToString(reader["dz"]);
                        kh.Yzbm = Convert.ToString(reader["yzbm"]);
                        kh.Lxdh = Convert.ToString(reader["lxdh"]);
                        kh.Gszy = Convert.ToString(reader["gszy"]);
                        kh.Lxr = Convert.ToString(reader["lxr"]);
                        kh.Lxrdzyj = Convert.ToString(reader["lxrdzyj"]);
                        kh.Hylb = Convert.ToInt32(reader["hylb"]);
                        kh.Ljxfje = Convert.ToDecimal(reader["ljxfje"]);
                        kh.Khbz = Convert.ToString(reader["khbz"]);
                        khs.Add(kh);
                    }
                }
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return khs;
        }
        public static void deleteKhByKhbh(int khbh) {
            try
            {
                string sql = "delete from kh where khbh="+khbh;
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static Kh getKhByKhbh(int khbh) {
            Kh kh = new Kh();
            try
            {
                string sql = "select khbh,khmc,dz,yzbm,lxdh,gszy,lxr,lxrdzyj,hylb,ljxfje,khbz from kh where khbh="+khbh;
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if(reader.Read())
                    {
                        kh.Khbh = Convert.ToInt32(reader["khbh"]);
                        kh.Khmc = Convert.ToString(reader["khmc"]);
                        kh.Dz = Convert.ToString(reader["dz"]);
                        kh.Yzbm = Convert.ToString(reader["yzbm"]);
                        kh.Lxdh = Convert.ToString(reader["lxdh"]);
                        kh.Gszy = Convert.ToString(reader["gszy"]);
                        kh.Lxr = Convert.ToString(reader["lxr"]);
                        kh.Lxrdzyj = Convert.ToString(reader["lxrdzyj"]);
                        kh.Hylb = Convert.ToInt32(reader["hylb"]);
                        kh.Ljxfje = Convert.ToDecimal(reader["ljxfje"]);
                        kh.Khbz = Convert.ToString(reader["khbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kh;
        }
        public static string modifyKh(Kh kh)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update kh set khmc='"+kh.Khmc+"',dz='"+kh.Dz+"',yzbm='"+kh.Yzbm+"',lxdh='"+kh.Lxdh+"',gszy='"+kh.Gszy+"',lxr='"
                    +kh.Lxr+"',lxrdzyj='"+kh.Lxrdzyj+"',hylb="+kh.Hylb+",ljxfje="+kh.Ljxfje+",khbz='"+kh.Khbz+"' where khbh="+kh.Khbh;
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addKh(Kh kh)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into kh (khmc,dz,yzbm,lxdh,gszy,lxr,lxrdzyj,hylb,ljxfje,khbz) values ('"
                    +kh.Khmc+"','"+kh.Dz+"','"+kh.Yzbm+"','"+kh.Lxdh+"','"+kh.Gszy+"','"+kh.Lxr+"','"+kh.Lxrdzyj+"',"+kh.Hylb+","+kh.Ljxfje+",'"+kh.Khbz+"')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static int existsKhByKhmc(string khmc)
        {
            int flag = 0;
            try
            {
                string sql = "select khbh,khmc,dz,yzbm,lxdh,gszy,lxr,lxrdzyj,hylb,ljxfje,khbz from kh where khmc='" + khmc+"'";
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
