using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop;
using KingTop.Common;
using KingTop.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月7日    功能描述： 自定义表单列表
    更新日期:2010-9-26  更新人:何伟   更新原因/内容:表单的标签调用
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class CustomFormList : AdminPage
    {
        #region 初始化
        BLL.Content.CustomForm bllCustomForm = new KingTop.BLL.Content.CustomForm();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();    //初始化绑定             
            }
        }

        // 初始化数据绑定
        void PageInit()
        {
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中   
            //判断页面权限
            SetRight(this.Page, rptModelFileGroup);
        }

        //添加
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("CustomFormEdit.aspx?NodeCode=" + NodeCode);
            }
        }
        #endregion

        #region 操作的事件
        //启用与禁用
        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("State"))
            {
                string[] strMessage = KingTop.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态

                #region 是否启用状态标识更改

                int iEnable = KingTop.Common.Utils.BoolToInt(strMessage[1]);
                if (iEnable == 1)
                {
                    iEnable = 0;
                }
                else
                {
                    iEnable = 1;
                }
                #endregion
                string strValue = bllCustomForm.CustomFormSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态

                PageInit();
            }
        }

        //生成模板
        protected void lbtnRelease_Click(object sender, CommandEventArgs e)
        {
            BLL.Content.ParseModel parser;
            string parsedContent;
            string prevContent;
            bool isAuthcode;

            isAuthcode = Utils.ParseBool(((LinkButton)sender).ToolTip);
            parser = new KingTop.BLL.Content.ParseModel(e.CommandArgument.ToString(),KingTop.BLL.Content.ParserType.Form);
            prevContent = "<script src=\"Plus/Form/jquery-1.4.2.min.js\" type=\"text/javascript\"></script>";
            prevContent += "<script src=\"Plus/Form/jquery-validationEngine.js\" type=\"text/javascript\"></script>";
            prevContent += "<script src=\"Plus/Form/jquery-validationEngine-cn.js\" type=\"text/javascript\"></script>";
            prevContent += "<script src=\"Plus/Form/Calendar/WdatePicker.js\" type=\"text/javascript\"></script>";
            prevContent += " <script type=\"text/javascript\">$(document).ready(function() { $(\"#theForm\").validationEngine({ promptPosition: \"centerRight\" }) });</script>";
            parsedContent = parser.ParseEdit("IsListVisible=1");

            if (isAuthcode)
            {
                parsedContent += "<dl><dt>验证码：</dt><dd><input name=\"validate\" id='validate' type=\"text\" size=\"6\" class=\"validate[required]\" maxlength=\"6\" onfocus=\"this.select()\"/><img src='Plus/Common/ValidateCode.aspx' alt='看不清楚？点击刷新验证码！' style='cursor:pointer' onclick=\"src='Plus/Common/ValidateCode.aspx?s='+Math.random()\" /></dd></dl>";
            }

            parsedContent = parsedContent + "<input type=\"hidden\" id=\"SelfDefinedFormID\" name=\"SelfDefinedFormID\" value=\""+ e.CommandName  +"\" />";
            parsedContent = "<form  name=\"theForm\" id=\"theForm\" action=\"Plus/Form/FormDeal.aspx" + "\" method=\"post\">" + parsedContent + "<input type=\"submit\" value=\"提交\" /></form>";
            parsedContent = prevContent + parsedContent;

            System.IO.File.WriteAllText(Server.MapPath("FormModel/" + e.CommandName + ".html"), parsedContent, Encoding.UTF8);
        }

        //生成页面
        protected void lbtnPageRelease_Click(object sender, CommandEventArgs e)
        {
            bllCustomForm.PageReleaseHtml(e.CommandArgument.ToString());
            PageInit();
        }

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        #endregion

        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            dcWhere.Add("isdel", "0");
            if (StrKeySearch != "")
            {
                dcWhere.Add("Name", Utils.UrlDecode(StrKeySearch));
                txtGroupName.Text = StrKeySearch;
            }
            KingTop.Model.Pager p = new KingTop.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllCustomForm.PageData(p);
        }

        #endregion

        // 按条件搜索
        protected void btnKeySerach_Click(object sender, EventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("CustomFormList.aspx?NodeCode=" + NodeID + "&keySearch=" + Utils.UrlEncode(txtGroupName.Text.Trim())); //页面跳转          
            }
        }

        //逻辑删除
        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllCustomForm.CustomFormSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "CustomForm", strMessage);  //写日志  
                PageInit();
            }
        }
        #endregion
    }
}
