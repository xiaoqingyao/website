using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace AllPower.WEB.SysAdmin.Questionnaire
{
    public partial class statistic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    PageInit();
                }
                catch { }
            }
        }

        void PageInit()
        {
            SqlParameter[] selParam;
            DataTable dt;
            DataSet ds;
            SqlDataReader sqlReader;

            dt = new DataTable();
            selParam = new SqlParameter[] { new SqlParameter("@QID",Request.QueryString["QID"]) };
            sqlReader = AllPower.Common.SQLHelper.ExecuteReader(AllPower.Common.SQLHelper.ConnectionStringLocalTransaction, CommandType.StoredProcedure, "proc_statistic_itemjoincount", selParam);
            dt.Load(sqlReader);
            rptItem.DataSource = dt;
            rptItem.DataBind();
            ds = AllPower.Common.SQLHelper.ExecuteDataSet(AllPower.Common.SQLHelper.ConnectionStringLocalTransaction, CommandType.StoredProcedure, "proc_statistic_answer", selParam);
            DataRelation dRelation_item_list = new DataRelation("Relation_item_list", ds.Tables[0].Columns["ID"], ds.Tables[1].Columns["ItemID"]);
            ds.Relations.Add(dRelation_item_list);
            rptMain.DataSource = ds;
            rptMain.DataBind();
        }
    }
}
