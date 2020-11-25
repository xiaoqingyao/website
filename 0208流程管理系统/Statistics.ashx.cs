using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using AllPower.Common;

namespace AllPower.WEB
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class Statistics : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string editSQL;
            SqlParameter[] editParam;

            try
            {
                editParam = new SqlParameter[] { new SqlParameter("@ProductID", context.Request.Form["ProductID"]), new SqlParameter("@IPAddress",
                    context.Request.Form["IPAddress"]), new SqlParameter("@Province", context.Request.Form["Province"]), 
                    new SqlParameter("@City", context.Request.Form["City"]), new SqlParameter("@SiteID", context.Request.Form["SiteID"]),
                    new SqlParameter("@XinHao", context.Request.Form["XinHao"]),new SqlParameter("@NodeCode", context.Request.Form["NodeCode"])};
                editSQL = "INSERT INTO K_Statistics(ProductID,IPAddress,Province,City,SiteID,XinHao,NodeCode)VALUES(@ProductID,@IPAddress,@Province,@City,@SiteID,@XinHao,@NodeCode);";
                SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, editSQL, editParam);
            }
            catch { }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
