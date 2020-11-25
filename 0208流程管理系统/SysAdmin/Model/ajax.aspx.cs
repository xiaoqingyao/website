using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class ajax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["tableName"] != null)
            {
                string eidtSQL;
                SqlParameter[] editParam;

                eidtSQL = "update " + AllPower.Common.Tools.CheckSql(Request.QueryString["tableName"]) + " set Orders=@orderValue where ID=@ID";
                editParam = new SqlParameter[] { 
                new SqlParameter("@orderValue",AllPower.Common.Tools.CheckSql(Request.QueryString["orderValue"])),
                new SqlParameter("@ID",AllPower.Common.Tools.CheckSql(Request.QueryString["id"])),

            };

                Response.Write(SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, eidtSQL, editParam));
                Response.End();
            }
        }
    }
}
