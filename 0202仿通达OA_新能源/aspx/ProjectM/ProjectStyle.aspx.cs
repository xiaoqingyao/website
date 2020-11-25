using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FTD.Web.UI.aspx.ProjectM
{
    public partial class ProjectStyle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("0");
            dt.Columns.Add("1");


            DataRow
              dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "核电";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "2";
            dr[1] = "可燃冰";
            dt.Rows.Add(dr); dr = dt.NewRow();
            dr[0] = "3";
            dr[1] = "氢能";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "4";
            dr[1] = "新能源汽车";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "5";
            dr[1] = "智能电网储能";
            dt.Rows.Add(dr);

            GVData.DataSource = dt;
            GVData.DataBind();
        }
    }
}