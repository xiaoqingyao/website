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


using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.Web.Admin;
using AllPower.BLL.SysManage;

namespace AllPower.WEB.SysAdmin.Category
{
    public partial class EnableAjax : AdminPage
    {
        AllPower.BLL.Categorys.Category bll = new AllPower.BLL.Categorys.Category(); //业务类
        protected void Page_Load(object sender, EventArgs e)
        { if (Request["IsValid"] != null && Request["ID"] != null)
           {
            if (base.IsHaveRightByOperCode("Edit"))
            {

                string ID = Request["ID"].ToString();
                string ISsValid = Request["IsValid"].ToString();

                    string tranType = "ENABLE";
                    string returnMsg;
                    int isEnable;
                    // 是否启用           
                    isEnable = 0;
                    if (ISsValid == "False" || ISsValid == "0")
                        {
                            isEnable = 1;
                        }
                    returnMsg = bll.CategorySet(tranType, isEnable.ToString(), ID);
                    Response.Write("[{msg:'更新成功！'}]");
                }
                else
                {
                    Response.Write("[{msg:'更新失败，没有权限！'}]");
                }
            }
        }
    }
}
