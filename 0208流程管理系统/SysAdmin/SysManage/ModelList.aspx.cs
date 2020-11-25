using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
using System.Data;
using System.IO;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 模块管理
    
// 更新日期        更新人      更新原因/内容
// 2010-4-2        肖丹        修改字段显示和添加操作：删除，状态更改
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class ModelList : AdminPage
    {
        #region 初始参数
        //设置变量
        AllPower.Model.Pager p = new AllPower.Model.Pager();
        AllPower.BLL.SysManage.Module objModule = new AllPower.BLL.SysManage.Module();
        StringBuilder sbLog = new StringBuilder(16);
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        private void PageInit()
        {
            SplitDataBind();
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中      
            //页面权限管理
            SetRight(this.Page, rptModelList);
        }

        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            if (StrKeySearch != "")
            {
                dicWhere.Add("ModuleName", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }
            p.Aspnetpage = Split;
            p.RptControls = rptModelList;
            p.DicWhere = dicWhere;
            objModule.PageData(p);
        }
        public void ModelList_State(object sender, CommandEventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("State"))
            {
                string returnMsg;
                string[] strMessage = AllPower.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态
                #region 是否启用状态标识更改
                int iEnable = AllPower.Common.Utils.BoolToInt(strMessage[1]);
                if (iEnable == 1)
                {
                    iEnable = 0;
                }
                else
                {
                    iEnable = 1;
                }
                #endregion
                //tranType = STATE，调用存储过程名[proc_K_SysModuleSet]
                returnMsg = objModule.ModuleSet("STATE", iEnable.ToString(), strMessage[0]);
                PageInit();
            }
            else
            {
                sbLog.Append("失败，没有权限！");
                Utils.RunJavaScript(this, "alert({msg:'更新操作失败，没有权限！',title:'提示信息'})");
                WriteLog("操作状态修改" + sbLog.ToString(), "", 2); //写日志
            }
        }

        public void ModelList_Del(object sender, CommandEventArgs e)
        {
            OnDel(e.CommandArgument.ToString());
        }
        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg = "1";   // 事务返回信息

                tranType = "DEL";
                returnMsg = objModule.ModuleSet(tranType, null, id);
                int result = Utils.ParseInt(returnMsg, 0);
                try
                {
                    if (result > 0)  //操作成功
                    {
                        WriteLog(GetLogValue(LogTitle, "Del", "ModelList", true), "", 2); //写日志
                        Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
                    }
                    else //操作失败
                    {
                        WriteLog(GetLogValue(LogTitle, "Del", "ModelList", false), returnMsg, 3); //写日志
                        Utils.RunJavaScript(this, "alert({msg:'该模块下包含栏目，无法删除！',title:'提示信息'})");
                    }
                }
                catch
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "ModelList", false), returnMsg, 3); //写日志
                    Utils.RunJavaScript(this, "alert({msg:'操作失败！',title:'提示信息'})");
                }
                PageInit();
            }
            else
            {
                sbLog.Append("删除模块失败，没有权限！");
                Utils.RunJavaScript(this, "alert({msg:'删除模块失败，没有权限！',title:'提示信息'})");
            }
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            if (base.IsPageChanged())
            {
                SplitDataBind();
            }
        }

        //新增按钮
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("ModelEdit.aspx?Action=New&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有新增模块的权限，请联系站点管理员！',title:'提示信息'})");
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
                Utils.UrlRedirect("ModelList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转 
            }
        }   
    }
}
