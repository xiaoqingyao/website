using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class GetExcelFile :  KingTop.Web.Admin.AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt;
            SqlDataReader sqlReader;
            
            dt = new DataTable();
            string selSQL = "select Title,sqed,qs,case when xb = '0' then '男' when xb='1' then '女'end as xb,sfz,dhhm,email,gzdw,dwdh,myyx,qtsr,adddate,ip,case when flowstate=99 then '通过审核' else '未审核' end as flowstate from k_f_zxsqin where isdel=0";
            sqlReader = SQLHelper.ExecuteReader(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, selSQL, null);
            dt.Load(sqlReader);

            grd.DataSource = dt;
            grd.DataBind();
            ToExcel(grd);
        }

        //由gridviw导出为Excel 
        public static void ToExcel(System.Web.UI.Control ctl) 
        {
            string fileName;


            fileName = "客户申请记录";
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename="+ fileName   +".xls"); 
            HttpContext.Current.Response.Charset = "UTF-8"; 
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Default; 
            HttpContext.Current.Response.ContentType = "application/ms-excel";//image/JPEG;text/HTML;image/GIF;vnd.ms-excel/msword 
            ctl.Page.EnableViewState = false; 
            System.IO.StringWriter tw = new System.IO.StringWriter(); 
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw); 
            ctl.RenderControl(hw); 
            HttpContext.Current.Response.Write(tw.ToString()); 
            HttpContext.Current.Response.End(); 
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {

        }

    }
}
