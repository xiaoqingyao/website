using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AllPower.Common;
using AllPower.Web.Admin;

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class DataManage : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string pwd = ConfigurationManager.AppSettings["DataManagePassword"].ToString();
            if (SecurityHelper.MD5(txtManagePwd.Text.Trim()).Equals(pwd))
            {
                int type=int.Parse(Request["type"]);
                string url="";
                switch(type)
                {
                    case 1:                         //数据还原
                        url="DataBaseRestore.aspx";
                        break;
                    case 2:                         //数据替换
                        url="DataBaseReplace.aspx";
                        break;
                    case 3:                         //执行sql语句
                        url="DataBaseExecSql.aspx"; 
                        break;
                }

                Utils.WriteCookie("ISDBMANAGE", "true");//写入Cookie
                Response.Redirect(url + "?NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'安全码有误，请重新输入！',title:'提示信息'})");
            }
        }
    }
}
