using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllPower.WEB.AJAX.SysAdmin.Model
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    public class VoteItemDelel : IHttpHandler
    {      
        public void ProcessRequest(HttpContext context)
        {
            string id = context.Request.QueryString["ID"];
            BLL.Content.VoteItems bllVoteItems = new AllPower.BLL.Content.VoteItems();
            bllVoteItems.VoteItemsSet("del", "", id);
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
