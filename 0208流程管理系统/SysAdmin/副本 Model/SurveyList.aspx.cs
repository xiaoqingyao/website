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
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年5月18日
    功能描述： 问卷调查列表
 
// 更新日期:2010-09-21 更新人:何伟  更新原因/内容:完善页面生成
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class SurveyList : AdminPage
    {
        #region 初始化
        BLL.Content.Survey bllSurvey = new KingTop.BLL.Content.Survey();
        DataTable dt = null;

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
        void PageInit()
        {
            //判断页面权限
            // SetRight(this.Page, rptModelFileGroup);            
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
        }

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
            bllSurvey.PageData(p);
        }

        /// <summary>
        /// 获取调用代码
        /// </summary>
        /// <param name="fileName">生成的文件名</param>
        /// <param name="id">问卷的ID</param>
        /// <returns>调用文件代码</returns>
        public string GetJsCode(string fileName, int id)
        {
            string jsCode = "";                                                    //调用的代码
            string dirPath = GetSiteDomain();                                      //获取当前站点路径(跨站用)
            string advPath = string.Format("{0}Plus/Survey/", dirPath);            //生成文件调用目录
            string iframeId = "sif" + id;                                          //iframe的ID

            if (!"/".Equals(advPath.Substring(advPath.Length - 1, 1)))
            {
                advPath += "/";
            }
            jsCode = string.Format("{0}{1}{2}", "&lt;iframe id='" + iframeId + "' src='", advPath + fileName, "' width='100%' height='100%' scrolling='no' frameborder='0' onload='IFrameReSize(\"" + iframeId + "\");IFrameReSizeWidth(\"" + iframeId + "\");'&gt;&lt;/iframe&gt;");
            return jsCode;
        }
        #endregion
        #endregion

        #region 操作的事件
        //添加
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("SurveyEdit.aspx?NodeCode=" + NodeCode);
            }
        }

        //启用与禁用
        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
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
                string strValue = bllSurvey.SurveySet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态

                PageInit();
            }
        }

        /// <summary>
        /// 生成页面  By 何伟 2010-09-21 update
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtnPub_Click(object sender, CommandEventArgs e)
        {
            string[] strMessage = KingTop.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数
            string fPath = string.Format("~/{0}/Plus/Survey/", SiteDir);                                //生成文件的目录
            if (!"/".Equals(fPath.Substring(fPath.Length - 1)))                                         //判断是否结尾是否有 "/"
            {
                fPath += "/";
            }
            bllSurvey.PubPage(strMessage, fPath);                                                       //生成页面文件
        }

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        #endregion

        /// <summary>
        /// 按条件搜索
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnKeySerach_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("SurveyList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtGroupName.Text.Trim())); //页面跳转          
            }
        }

        //逻辑删除
        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllSurvey.SurveySet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "Survey", strMessage);  //写日志    
                PageInit();
            }
        }
        #endregion
    }
}