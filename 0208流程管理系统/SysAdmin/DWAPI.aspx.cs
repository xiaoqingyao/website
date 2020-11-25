using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllPower.WEB.SysAdmin
{
    public partial class DWAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string opType;
            string backContent;
            AllPower.BLL.DWAPI api;

            api = new AllPower.BLL.DWAPI();
            backContent = string.Empty;
            opType = Request.Form["type"];

            if (!string.IsNullOrEmpty(opType))
            {
                switch (opType.ToLower())
                {
                    case "menulist":    // 获取站点栏目列表
                        if (!string.IsNullOrEmpty(Request.Form["siteid"]))
                        {
                            backContent = api.GetMenuList(Request.Form["siteid"]);
                        }
                        else
                        {
                            backContent = "(null)";
                        }

                        break;
                    case "modellist":   // 模型列表
                        if (!string.IsNullOrEmpty(Request.Form["siteid"]))
                        {
                            backContent = api.GetTableList(Request.Form["siteid"]);
                        }
                        else
                        {
                            backContent = "(null)";
                        }

                        break;
                    case "publish":     // 发布
                        backContent = api.PublishSite();
                        break;
                    case "savelabel":   // 添加标签
                        backContent = api.AddLable();
                        break;
                    case "sitelist":    // 站点列表
                        backContent = api.GetSiteList();
                        break;
                    case "lablelist":   // 获取标签
                        backContent = api.GetLabelList();
                        break;
                    case "labledel":    // 删除标签
                        backContent = api.DelLabel();
                        break;
                    case "lableedit":   // 编辑标签
                        backContent = api.EditLabel();
                        break;
                    case "singlelable": // 获取单个标签信息
                        backContent = api.GetLabelByID();
                        break;
                    case "labelnamelist":// 获取标签名
                        backContent = api.GetLabelNameList();
                        break;
                    case "tablefieldlist"://  获取表字段列表
                        backContent = api.GetTableField();
                        break;
                    case "formlist":     // 获取表单列表
                        if (!string.IsNullOrEmpty(Request.Form["siteid"]))
                        {
                            backContent = api.GetFormList();
                        }
                        else
                        {
                            backContent = "(null)";
                        }
                        
                        break;
                }
            }

            Response.ClearContent();
            Response.Write(backContent);
        }
    }
}
