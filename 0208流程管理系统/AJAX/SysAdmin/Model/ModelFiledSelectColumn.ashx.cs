using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AllPower.Common;
using AllPower.BLL.Content;

namespace AllPower.WEB.AJAX.SysAdmin.Model
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    public class ModelFiledSelectColumn : IHttpHandler
    {
        private string strTableid;
        public void ProcessRequest(HttpContext context)
        {
            strTableid = Utils.ReqUrlParameter("tableid");
            if (strTableid != "")
            {
                BLL.Content.ModelField bllModelField = new ModelField();
                Dictionary<string, string> dctWhere = new Dictionary<string, string>();
                dctWhere.Add("TranType", "column");
                dctWhere.Add("s1", strTableid);               
               context.Response.Write(Utils.DataTableToJson(bllModelField.GetTableOrColumnSel(dctWhere)).ToString());  //输出结果
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
