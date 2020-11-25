using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class JsService
    {
        public static IList<Js> getAllJs()
        {
            IList<Js> jss = new List<Js>();
            try
            {
                string sql = "select jsbh,jsmc,jsbz from js";
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while (reader.Read())
                    {
                        Js js = new Js();
                        js.Jsbh = Convert.ToInt32(reader["jsbh"]);
                        js.Jsmc = Convert.ToString(reader["jsmc"]);
                        js.Jsbz = Convert.ToString(reader["jsbz"]);
                        jss.Add(js);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jss;
        }
        public static Js getJsByJsbh(string jsbh)
        {
            string sql = "select jsbh,jsmc,jsbz from js where jsbh=" + jsbh;
            Js js = new Js();
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    if (reader.Read())
                    {
                        js.Jsbh = Convert.ToInt32(reader["jsbh"]);
                        js.Jsmc = Convert.ToString(reader["jsmc"]);
                        js.Jsbz = Convert.ToString(reader["jsbz"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return js;
        }

        public static void deleteJsByJsbh(string jsbh)
        {
            try
            {
                string sql = "delete from js where jsbh=" + jsbh;
                DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        
        public static string modifyJs(Js js)
        {
            string str = "更新失败！";
            try
            {
                string sql = "update js set jsmc='" + js.Jsmc + "',jsbz='" + js.Jsbz + "' where jsbh=" + js.Jsbh;
                if (DBHelper.ExecuteCommand(sql) == 1)
                    str = "更新成功！";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static string addJs(Js js)
        {
            string str = "添加失败！";
            try
            {
                string sql = "insert into js (jsmc,jsbz) values('" + js.Jsmc + "','" + js.Jsbz + "')";
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
