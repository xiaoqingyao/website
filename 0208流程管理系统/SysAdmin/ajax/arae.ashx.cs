using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AllPower.Common;

namespace AllPower.Web.Admin
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    public class arae : IHttpHandler
    {

        private string strID;
        public void ProcessRequest(HttpContext context)
        {
            strID = Utils.ReqUrlParameter("id");
            if (strID != "")
            {
                BLL.Categorys.Category bllCategory = new AllPower.BLL.Categorys.Category();              
                context.Response.Write(Utils.DataTableToJson(bllCategory.GetList("child",Utils.getOneParams(strID))));  //输出结果
            }
            else
            {
                context.Response.Write("error");
            }
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
