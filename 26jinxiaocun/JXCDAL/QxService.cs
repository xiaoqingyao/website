using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;


namespace JXCDAL
{
    public class QxService
    {
        public static IList<Qx> getAllQx(){
            IList<Qx> qxs = new List<Qx>();
            try {
                string sql = "select qxbh,qxmc,qxurl,qxbz from qx";
                using(SqlDataReader reader = DBHelper.GetReader(sql)){
                    while(reader.Read()){
                        Qx qx = new Qx();
                        qx.Qxbh = Convert.ToInt32(reader["qxbh"]);
                        qx.Qxmc = Convert.ToString(reader["qxmc"]);
                        qx.Qxurl = Convert.ToString(reader["qxurl"]);
                        qx.Qxbz = Convert.ToString(reader["qxbz"]);
                        qxs.Add(qx);
                    }
                }
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return qxs;
        }
        
        public static Qx getQxByQxbh(int qxbh) {
            Qx qx = new Qx();
            try {
                string sql = "select qxbh,qxmc,qxurl,qxbz from qx where qxbh=" + qxbh;
                using(SqlDataReader reader = DBHelper.GetReader(sql)){
                    if(reader.Read()){
                        qx.Qxbh = Convert.ToInt32(reader["qxbh"]);
                        qx.Qxmc = Convert.ToString(reader["qxmc"]);
                        qx.Qxurl = Convert.ToString(reader["qxurl"]);
                        qx.Qxbz = Convert.ToString(reader["qxbz"]);
                    }
                }
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return qx;
        }
        public static void deleteQxByQxbh(int qxbh) {
            try
            {
                string sql = "delete from qx where qxbh=" + qxbh;
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static String modifyQx(Qx qx) {
            string str = "更新失败！";
            try
            {
                string sql = "update qx set qxmc='"+qx.Qxmc+"',qxurl='"+qx.Qxurl+"',qxbz='"+qx.Qxbz+"' where qxbh=" + qx.Qxbh;
                if(DBHelper.ExecuteCommand(sql)==1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        
        public static String addQx(Qx qx)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into qx (qxmc,qxurl,qxbz) values('" + qx.Qxmc + "','" + qx.Qxurl + "','" + qx.Qxbz + "')";
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
