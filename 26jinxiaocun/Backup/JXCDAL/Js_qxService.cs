using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using JXCMODEL;

namespace JXCDAL
{
    public class Js_qxService
    {
        public static IList<Js_qx> getJs_qxsByJsbh(int jsbh)
        {
            IList<Js_qx> js_qxs = new List<Js_qx>();
            string sql = "select js_qxbh,jsbh,qxbh from js_qx where jsbh=" + jsbh;
            
            try
            {
                using (SqlDataReader reader = DBHelper.GetReader(sql))
                {
                    while(reader.Read())
                    {
                        Js_qx js_qx = new Js_qx();
                        js_qx.Js_qxbh = Convert.ToInt32(reader["js_qxbh"]);
                        js_qx.Jsbh = Convert.ToInt32(reader["jsbh"]);
                        js_qx.Qxbh = Convert.ToInt32(reader["qxbh"]);
                        js_qxs.Add(js_qx);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return js_qxs;
        }
    }
}
