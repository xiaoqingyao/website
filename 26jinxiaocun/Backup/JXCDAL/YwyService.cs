using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class YwyService
    {
        public static IList<Ywy> getAllYwy() { 
            IList<Ywy> ywys = new List<Ywy>();
            try {
                string sql = "select ywybh,ywymc,dlmc,dlmm,lxdh,jtzz,sfzhm,jsbh,ywybz from ywy";
                using(SqlDataReader reader = DBHelper.GetReader(sql)){
                    while(reader.Read()){
                        Ywy ywy = new Ywy();
                        ywy.Ywybh = Convert.ToInt32(reader["ywybh"]);
                        ywy.Ywymc = Convert.ToString(reader["ywymc"]);
                        ywy.Dlmc = Convert.ToString(reader["dlmc"]);
                        ywy.Dlmm = Convert.ToString(reader["dlmm"]);
                        ywy.Lxdh = Convert.ToString(reader["lxdh"]);
                        ywy.Jtzz = Convert.ToString(reader["jtzz"]);
                        ywy.Sfzhm = Convert.ToString(reader["sfzhm"]);
                        ywy.Jsbh = Convert.ToInt32(reader["jsbh"]);
                        ywy.Ywybz = Convert.ToString(reader["ywybz"]);
                        ywys.Add(ywy);
                    }
                }
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return ywys;
        }

        public static void deleteYwyByYwybh(int ywybh) {
            try {
                string sql = "delete from ywy where ywybh="+ywybh;
                DBHelper.ExecuteCommand(sql);
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
        }
        public static Ywy getYwyByYwybh(int ywybh)
        {
            string sql = "select ywybh,ywymc,dlmc,dlmm,lxdh,jtzz,sfzhm,jsbh,ywybz from ywy where ywybh=" + ywybh;
            Ywy ywy = new Ywy();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        ywy.Ywybh = Convert.ToInt32(reader["ywybh"]);
                        ywy.Ywymc = Convert.ToString(reader["ywymc"]);
                        ywy.Dlmc = Convert.ToString(reader["dlmc"]);
                        ywy.Dlmm = Convert.ToString(reader["dlmm"]);
                        ywy.Lxdh = Convert.ToString(reader["lxdh"]);
                        ywy.Jtzz = Convert.ToString(reader["jtzz"]);
                        ywy.Sfzhm = Convert.ToString(reader["sfzhm"]);
                        ywy.Jsbh = Convert.ToInt32(reader["jsbh"]);
                        ywy.Ywybz = Convert.ToString(reader["ywybz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return ywy;
        }
        public static Ywy getYwyByCoditions(string condition1,string condition2,int condition3)
        {
            string sql = "select ywybh,ywymc,dlmc,dlmm,lxdh,jtzz,sfzhm,jsbh,ywybz from ywy where dlmc='" + condition1 + "' and dlmm='" + condition2 + "' and jsbh=" + condition3;
            Ywy ywy = new Ywy();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        ywy.Ywybh = Convert.ToInt32(reader["ywybh"]);
                        ywy.Ywymc = Convert.ToString(reader["ywymc"]);
                        ywy.Dlmc = Convert.ToString(reader["dlmc"]);
                        ywy.Dlmm = Convert.ToString(reader["dlmm"]);
                        ywy.Lxdh = Convert.ToString(reader["lxdh"]);
                        ywy.Jtzz = Convert.ToString(reader["jtzz"]);
                        ywy.Sfzhm = Convert.ToString(reader["sfzhm"]);
                        ywy.Jsbh = Convert.ToInt32(reader["jsbh"]);
                        ywy.Ywybz = Convert.ToString(reader["ywybz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return ywy;
        }
        public static string getYwymcByYwybh(string ywybh)
        {
            string sql = "select ywymc from ywy where ywybh=" + ywybh;
            string str = "";
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                        str = Convert.ToString(reader["ywymc"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string modifyYwy(Ywy ywy) {
            string str = "更新失败！";
            try
            {
                string sql = "update ywy set ywymc='" + ywy.Ywymc + "',dlmc='" + ywy.Dlmc + "',dlmm='" + ywy.Dlmm + "',lxdh='" + ywy.Lxdh + "',jtzz='" + ywy.Jtzz + "',sfzhm='" + ywy.Sfzhm + "',jsbh='" + ywy.Jsbh + "',ywybz='" + ywy.Ywybz + "' where ywybh=" + ywy.Ywybh;
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addYwy(Ywy ywy) {
            string str = "添加失败！";
            try
            {
                string sql = "insert into ywy (ywymc,dlmc,dlmm,lxdh,jtzz,sfzhm,jsbh,ywybz) values('" + ywy.Ywymc + "','" + ywy.Dlmc + "','" + ywy.Dlmm + "','" + ywy.Lxdh + "','" + ywy.Jtzz + "','" + ywy.Sfzhm + "'," + ywy.Jsbh + ",'" + ywy.Ywybz + "')";
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "添加成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
    }
}
