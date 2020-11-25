using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class GysService
    {
        public static IList<Gys> getAllGys(){
            IList<Gys> gyss = new List<Gys>();
            try {
                string sql = "select gysbh,gysmc,dz,yzbm,lxdh,gszy,lxrdzyj,lxr,gysbz from gys";
                using(SqlDataReader reader = DBHelper.GetReader(sql)){
                    while(reader.Read()){
                        Gys gys = new Gys();
                        gys.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        gys.Gysmc = Convert.ToString(reader["gysmc"]);
                        gys.Dz = Convert.ToString(reader["dz"]);
                        gys.Yzbm = Convert.ToString(reader["yzbm"]);
                        gys.Lxdh = Convert.ToString(reader["lxdh"]);
                        gys.Gszy = Convert.ToString(reader["gszy"]);
                        gys.Lxrdzyj = Convert.ToString(reader["lxrdzyj"]);
                        gys.Lxr = Convert.ToString(reader["lxr"]);
                        gys.Gysbz = Convert.ToString(reader["gysbz"]);
                        gyss.Add(gys);
                    }
                }
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return gyss;
        }
        public static Gys getGysByGysbh(int gysbh) {
            Gys gys = new Gys();
            try {
                string sql = "select gysbh,gysmc,dz,yzbm,lxdh,gszy,lxrdzyj,lxr,gysbz from gys where gysbh="+gysbh;
                using(SqlDataReader reader = DBHelper.GetReader(sql)){
                    if(reader.Read()){
                        gys.Gysbh = Convert.ToInt32(reader["gysbh"]);
                        gys.Gysmc = Convert.ToString(reader["gysmc"]);
                        gys.Dz = Convert.ToString(reader["dz"]);
                        gys.Yzbm = Convert.ToString(reader["yzbm"]);
                        gys.Lxdh = Convert.ToString(reader["lxdh"]);
                        gys.Gszy = Convert.ToString(reader["gszy"]);
                        gys.Lxrdzyj = Convert.ToString(reader["lxrdzyj"]);
                        gys.Lxr = Convert.ToString(reader["lxr"]);
                        gys.Gysbz = Convert.ToString(reader["gysbz"]);
                    }
                }
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return gys;
        }
        public static void deleteGysByGysbh(int gysbh) {
            try {
                string sql = "delete from gys where gysbh="+gysbh;
                DBHelper.ExecuteCommand(sql);
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyGys(Gys gys) {
            string str = "更新失败！";
            try {
                string sql = "update gys set gysmc='"+gys.Gysmc+"',dz='"+gys.Dz+"',yzbm='"+gys.Yzbm+"',lxdh='"+gys.Lxdh
                    +"',gszy='"+gys.Gszy+"',lxrdzyj='"+gys.Lxrdzyj+"',lxr='"+gys.Lxr+"',gysbz='"+gys.Gysbz+"' where gysbh="+gys.Gysbh;
                if(DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addGys(Gys gys)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into gys (gysmc,dz,yzbm,lxdh,gszy,lxrdzyj,lxr,gysbz) values ('"
                    +gys.Gysmc+"','"+gys.Dz+"','"+gys.Yzbm+"','"+gys.Lxdh+"','"+gys.Gszy+"','"+gys.Lxrdzyj+"','"+gys.Lxr+"','"+gys.Gysbz+"')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static int existsGysByGysmc(string gysmc) {
            int flag = 0;
            try {
                string sql = "select gysbh,gysmc,dz,yzbm,lxdh,gszy,lxrdzyj,lxr,gysbz from gys where gysmc='"+gysmc+"'";
                using(SqlDataReader reader = DBHelper.GetReader(sql)){
                    if (reader.Read())
                        flag = 1;
                }
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return flag;
        }
    }
}
