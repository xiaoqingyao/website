using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AllPower.Common;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年04月29日
    功能描述： 会员组管理列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class MemberGroupList : AdminPage
    {
        BLL.MemberManage.MemberGroup bllMemberGroup = new AllPower.BLL.MemberManage.MemberGroup();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();    //初始化绑定             
            }
        }


        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        private void PageInit()
        {
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
        }

        #region 添加按钮事件
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Utils.UrlRedirect("MemberGroupEdit.aspx?action=NEW&NodeCode=" + NodeCode);
        }
        #endregion

        #region 查询按钮事件
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            PageData();
        }
        #endregion

        #region 启用/禁用 操作
        //启用/禁用按钮
        protected void lbtnState_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("State"))
            {
                bllMemberGroup.MemberGroupSet("ENABLE", "", e.CommandArgument.ToString());
                PageInit();
            }
            else
            {
                Utils.AlertMessage(this, "你没有相关启用禁用权限 ！");
            }
        }

        //启用
        protected void btnDisable_Click(object sender, EventArgs e)
        {
            Enable(GetAllChkId(), "0");
        }

        //禁用
        protected void btnUnDisable_Click(object sender, EventArgs e)
        {
            Enable(GetAllChkId(), "1");
        }

        private void Enable(string idList, string setValue)
        {
            if (IsHaveRightByOperCode("State"))
            {

                if (!string.IsNullOrEmpty(idList))
                {
                    bllMemberGroup.MemberGroupSet("MUTIENABLE", setValue, idList);
                    PageInit();
                }
            }
            else
            {
                Utils.AlertMessage(this, "你没有相关启用禁用权限 ！");
            }
        }
        #endregion

        #region 删除

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete(GetAllChkId());
        }

        //单条记录删除按钮事件
        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            Delete(e.CommandArgument.ToString());
        }

        //删除方法
        private void Delete(string idList)
        {
            //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("FriendLink", "DelSuccess");
            string error = Utils.GetResourcesValue("FriendLink", "DelFail");
            string nameIsUse = Utils.GetResourcesValue("member", "GroupNameIsUse");

            if (!string.IsNullOrEmpty(idList))
            {
                string strMessage = bllMemberGroup.MemberGroupSet("LOGICDEL", "", idList);
                int result = Utils.ParseInt(strMessage, 0);

                if (result >= 1)  //删除成功
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "MemberGroup", true), "", 2);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + success + "',title:'" + alterTitle + "'})");
                    PageInit();
                }
                else if (result == -1) //分类名称已被使用，不能删除
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "MemberGroup", false), nameIsUse, 3);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + nameIsUse + "',title:'" + alterTitle + "'})");
                }
                else  //删除失败
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "MemberGroup", false), strMessage, 3);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + error + "',title:'" + alterTitle + "'})");
                }

            }
        }

        #endregion

        #region 排序
        protected void btnOrders_Click(object sender, EventArgs e)
        {
            TextBox txtOrder = null;
            HiddenField hidId = null;
            for (int i = 0; i < rptGroup.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
            {
                txtOrder = rptGroup.Items[i].FindControl("txtOrders") as TextBox;
                hidId = rptGroup.Items[i].FindControl("hidIds") as HiddenField;
                bllMemberGroup.MemberGroupSet("ORDER", AllPower.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
            }
            PageInit();
        }
        #endregion

        #region 获取复选框列表值
        //获取复选框列表值
        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        }
        #endregion

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            if (IsPageChanged())
            {
                PageData();
            }
        }
        #endregion

        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            dcWhere.Add("isdel", "0");
            dcWhere.Add("NodeCode", NodeCode);
            dcWhere.Add("GroupName", txtGroupName.Text.Trim());
            dcWhere.Add("IsDisable", ddlState.SelectedValue);

            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptGroup;
            bllMemberGroup.PageData(p);  //执行绑定
        }

        #endregion

        #region 按钮操作文本
        //根据 stateID，取得按钮操作文本
        protected string GetOperatorText(object stateID)
        {
            string text = string.Empty;
            int state = Utils.ParseInt(stateID, 0);
            switch (state)
            {
                case 0:
                    text = Utils.GetResourcesValue("Common", "OffTitle");
                    break;

                case 1:
                    text = Utils.GetResourcesValue("Common", "OnTitle");
                    break;
            }

            return text;
        }
        #endregion
    }
}
