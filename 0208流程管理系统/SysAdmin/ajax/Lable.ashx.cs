using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web;
using System.Data;
using System.Text;

using AllPower.BLL;
using AllPower.Model;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.ajax
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class Lable : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string action = context.Request.QueryString["action"];
            string siteId = context.Request.QueryString["siteid"];
            string classId = context.Request.QueryString["classid"];
            string isSystem = context.Request.QueryString["issystem"];

            switch (action)
            {
                case "systemlable":
                    GetLableBySiteID(siteId, classId, isSystem);
                    break;
                case "freelable":
                    GetFreeLableBySiteID(siteId);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 系统标签
        /// </summary>
        /// <param name="siteId"></param>
        /// <param name="classId"></param>
        /// <param name="isSystem"></param>
        private void GetLableBySiteID(string siteId, string classId, string isSystem)
        {
            System.Web.HttpContext.Current.Response.ContentType = "text/xml";
            System.Web.HttpContext.Current.Response.Charset = "utf-8";
            SelectParams prams = new SelectParams();
            prams.I1 = 1;
            prams.I2 = 500;
            prams.I3 = Convert.ToInt32(isSystem);
            prams.S1 = siteId;
            //prams.S2 = classId;

            DataTable dt = new AllPower.BLL.Template.Lable().GetLable("LABLELIST", prams).Tables[1];
            StringBuilder sb = new StringBuilder();
            sb.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
            sb.Append("<lable>");
            if (dt.Rows.Count > 0)
            {                
                foreach (DataRow dr in dt.Rows)
                {
                    sb.Append("<Item>");
                    //sb.Append("<Name>" + TemplateTools.GetLableName(dr["LabelName"].ToString()) + "</Name>");  //原代码，因调试不通过，所以换成以下代码
                    //sb.Append("<Name>" + TemplateTools.GetLableName(dr["LableName"].ToString(),0) + "</Name>");
                    sb.Append("<Id>" + dr["Lableid"].ToString() + "</Id>");
                    sb.Append("</Item>");
                }   
            }
            sb.Append("</lable>");
            System.Web.HttpContext.Current.Response.Write(sb.ToString());
        }
        /// <summary>
        /// 自由标签
        /// </summary>
        /// <param name="siteId"></param>
        private void GetFreeLableBySiteID(string siteId)
        {
            System.Web.HttpContext.Current.Response.ContentType = "text/xml";
            System.Web.HttpContext.Current.Response.Charset = "utf-8";
            SelectParams prams = new SelectParams();
            prams.I1 = 1;
            prams.I2 = 500;
            prams.I3 = Convert.ToInt32(siteId);
            //prams.S2 = classId;

            DataTable dt = new AllPower.BLL.Template.Lable().GetLableFreeList("AllList", prams).Tables[1];
            StringBuilder sb = new StringBuilder();
            sb.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
            sb.Append("<lable>");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    sb.Append("<Item>");
                    //sb.Append("<Name>" + TemplateTools.GetLableName(dr["LabelName"].ToString()) + "</Name>");  //原代码，因调试不通过，所以换成以下代码
                    //sb.Append("<Name>" + TemplateTools.GetLableName(dr["LabelName"].ToString(), 0) + "</Name>");
                    sb.Append("<Id>" + dr["Lableid"].ToString() + "</Id>");
                    sb.Append("</Item>");
                }
            }
            sb.Append("</lable>");
            System.Web.HttpContext.Current.Response.Write(sb.ToString());
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
