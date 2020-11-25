using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Data.Sql;


using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.Web.Admin;
using AllPower.BLL.SysManage;
namespace AllPower.WEB.SysAdmin.Category
{
    public partial class CategoryListOrder : AdminPage
    {
        AllPower.BLL.Categorys.Category bll = new AllPower.BLL.Categorys.Category();      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.ContentType = "text/plain";
                string id = Request.Form["id"].ToString();
                if (Request["action"] != null)
                {
                    string CName = Request["NodeName"].ToString();
                    if (base.IsHaveRightByOperCode("Delete"))
                    {
                        string tranType;    // 事务类型
                        string returnMsg;   // 事务返回信息

                        tranType = "DELDB";
                        returnMsg = bll.CategorySet(tranType, null, id);
                        int result = Utils.ParseInt(returnMsg, 0);
                        if (result == 0)  //操作失败
                        {
                            WriteLog(GetLogValue(LogTitle, "Del", "CategoryModel", false), returnMsg, 3); //写日志

                            Response.Write("[{msg:'删除失败，请重试！'}]");
                            //Utils.AlertMessage(this, "删除失败，请重试！");
                        }
                        else //操作成功
                        {
                            WriteLog(GetLogValue(LogTitle, "Del", "CategoryModel", true), "", 2); //写日志
                            Response.Write("[{msg:'操作成功'}]");
                        }

                    }
                    else
                    {
                        Response.Write("[{msg:'删除" + CName + "失败，没有权限！'}]");
                    }
                }
                else
                {
                    string orde = "";
                    if (Request.Form["order"] != null)
                    {
                        orde = Request.Form["order"].ToString();
                    }

                    string i=bll.CategorySet(orde,"999999",id);
                    Response.Write("[{msg:'OK'}]");
                }
            }
        }
    }
}
