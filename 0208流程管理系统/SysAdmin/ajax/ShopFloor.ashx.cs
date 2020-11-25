using System;
using System.Collections.Generic;
using System.Web;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.ajax
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    public class ShopFloor : IHttpHandler
    {

        private string strID;
        public void ProcessRequest(HttpContext context)
        {
            strID = Utils.ReqUrlParameter("id");
            if (strID != "")
            {
                BLL.Business.shopManage bll = new AllPower.BLL.Business.shopManage();
                context.Response.Write(Utils.DataTableToJson(bll.GetFloorList(strID)));  //输出结果
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
