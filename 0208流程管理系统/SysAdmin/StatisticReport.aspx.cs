using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Microsoft.Reporting;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Test
{
    public partial class reptest : AllPower.Web.Admin.AdminPage
    {
        protected string repTitle;

        protected void Page_Load(object sender, EventArgs e)
        {
            labMessage.Text = "";
        }

        public DataTable Get(DateTime startTime,DateTime endTime)
        {
            List<SqlParameter> lstParam;
            SqlDataReader sqlReader;
            DataTable dt;
            dt = new DataTable();
            lstParam = new List<SqlParameter>();
            lstParam.Add(new SqlParameter("@SiteID", SiteID));
            lstParam.Add(new SqlParameter("@NodeCode", ddlProduct.SelectedValue));
            lstParam.Add(new SqlParameter("@StartTime", startTime));
            lstParam.Add(new SqlParameter("@EndTime", endTime));

            try
            {
                sqlReader = AllPower.Common.SQLHelper.ExecuteReader(AllPower.Common.SQLHelper.ConnectionStringLocalTransaction, CommandType.StoredProcedure, "proc_Statistics", lstParam.ToArray());
                dt.Load(sqlReader);
            }
            catch { dt = null; }

            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt;
            DateTime startTime;
            DateTime endTime;

            dt = null;

            if (ddJD.SelectedValue != "" || ddMonth.SelectedValue != "")
            {
                if (ddJD.SelectedValue != "")
                {
                    repTitle = ddlProduct.SelectedItem.Text + ddlYear.SelectedItem.Text + ddJD.SelectedItem.Text + "访问量统计";
                    startTime = DateTime.Parse(ddlYear.SelectedValue + "-" + ((AllPower.Common.Utils.ParseInt(ddJD.SelectedValue, 1)-1) * 3 + 1).ToString() + "-01");
                    endTime = DateTime.Parse(ddlYear.SelectedValue + "-" + (AllPower.Common.Utils.ParseInt(ddJD.SelectedValue, 1) * 3).ToString() + "-30");
                }
                else
                {
                    repTitle = ddlProduct.SelectedItem.Text + ddlYear.SelectedItem.Text + ddMonth.SelectedItem.Text + "份访问量统计";
                    startTime = DateTime.Parse(ddlYear.SelectedValue + "-" + ddMonth.SelectedValue + "-01");
                    endTime = DateTime.Parse(ddlYear.SelectedValue + "-" + ddMonth.SelectedValue + "-30");
                }

                dt = Get(startTime,endTime);
            }
            else
            {
                labMessage.Text = "请选择月份或季度";
            }


            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    ReportDataSource rptDS = new ReportDataSource("sdStatics_Statistics", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("Report1.rdlc");
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rptDS);
                    ReportViewer1.LocalReport.Refresh();
                    ReportViewer1.DataBind();
                    rptStatic.DataSource = dt;
                    rptStatic.DataBind();
                    rptGraphic.Visible = true;
                }
                else
                {
                    rptGraphic.Visible = false;
                }
            }

        }
    }
}
