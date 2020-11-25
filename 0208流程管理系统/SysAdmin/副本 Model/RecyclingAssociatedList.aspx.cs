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
    创建时间： 2010年8月3日
    功能描述： 回收站关联表列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class RecyclingAssociatedList : AdminPage
    {
        BLL.Content.RecyclingAssociated bllRecyclingAssociated = new KingTop.BLL.Content.RecyclingAssociated();
        DataTable dt = null;
        string strpid;

        public string strPid
        {
            get
            {
                if (strpid == null)
                {
                    strpid = Utils.ReqUrlParameter("pid");
                }
                return strpid;
            }
        }
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
            btnDelete2.Visible = btnDelete.Visible;          
            btnDelete2.Visible = btnDelete.Visible;
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
        }
    

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("RecyclingAssociatedEdit.aspx?nodecode=" + NodeCode+"&pid="+Utils.ReqUrlParameter("pid"));
            }
        }

        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllRecyclingAssociated.RecyclingAssociatedSet("LOGICDEL", "", e.CommandArgument.ToString());  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "Survey", strMessage);  //写日志    
                PageInit();
            }
        }

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
                string strValue = bllRecyclingAssociated.RecyclingAssociatedSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态
                PageInit();
            }
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
            dcWhere.Add("RecyclingManageID", strPid);
            KingTop.Model.Pager p = new KingTop.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.SearField = "*,(select tablename from K_RecyclingManage where ID=AssociatedID) as tableName";
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllRecyclingAssociated.PageData(p);
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
                Utils.UrlRedirect("RecyclingAssociatedList.aspx?nodecode=" + NodeCode + "&pid=" + Utils.ReqUrlParameter("pid")); //页面跳转          
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                string chkId = Utils.ReqFromParameter("chkID");
                string[] fileName = Utils.strSplit(Utils.ReqFromParameter("hdnFile"), ",");
                string strMessage = bllRecyclingAssociated.RecyclingAssociatedSet("DEL", "", chkId);  //删除数据
                if (strMessage == "1")  //成功
                {       
                  
                }
                WriteLogExpand(LogTitle, "Del", "Survey", strMessage);  //写日志    
                PageInit();
            }
        }

        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllRecyclingAssociated.RecyclingAssociatedSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "RecyclingManage", strMessage);  //写日志    
                PageInit();
            }
        }
    }
}