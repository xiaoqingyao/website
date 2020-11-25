using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.BLL.SysManage;
using System.Data;
using AllPower.Web.Admin;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月19日
    功能描述： 模板管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class TemplateManage : AdminPage
    {
        AllPower.BLL.SysManage.WebSiteTemplate bllTemplate = new AllPower.BLL.SysManage.WebSiteTemplate();
        StringBuilder sbLog = new StringBuilder(16);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        private void PageInit()
        {
            //绑定列表控件
            SplitDataBind();
            //把当前url全部参数存入cookie中 
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
            //判断权限
            SetRight(this, rptTemplateList);
        }


        #region 分页数据绑定
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();            

            if (StrKeySearch != "")
            {
                dicWhere.Add("TemplateName", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }

            p.Aspnetpage = Split;
            p.RptControls = rptTemplateList;
            p.DicWhere = dicWhere;
            bllTemplate.PageData(p);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            if (base.IsPageChanged())
            {
                SplitDataBind();
            }
        }
        #endregion

        //新增按钮
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("TemplateEdit.aspx?Action=New&NodeCode="+NodeCode);
            }
            else
            {
                JavascriptMsg("提示信息", "你没有新增模板的权限，请联系站点管理员！");
            }
        }

        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg = "1";   // 事务返回信息

                tranType = "DEL";
                returnMsg = bllTemplate.TemplateSet(tranType, "", id);
                int result = Utils.ParseInt(returnMsg, 0);
                if (result <= 0)  //操作失败
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "TemplateManage", false), returnMsg, 3); //写日志
                    JavascriptMsg("提示信息", "操作失败，请重试！");
                }
                else //操作成功
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "TemplateManage", true), "", 2); //写日志
                    JavascriptMsg("提示信息", "操作成功！");
                }
                PageInit();
            }
            else
            {
                sbLog.Append("失败，没有权限！");
                JavascriptMsg("提示信息", "删除操作失败，没有权限！");
            }
        }

        //删除按钮
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));   
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("TemplateManage.aspx?NodeCode="+NodeCode+"&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转 
            }
        }

        private void JavascriptMsg(string msgTitle, string msgContent)
        {
            Utils.RunJavaScript(this, "nmsgtitle='" + msgTitle + "';nmsgcontent='" + msgContent + "';");
        }
    }
}
