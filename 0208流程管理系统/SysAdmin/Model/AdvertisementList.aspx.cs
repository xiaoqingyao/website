using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Text;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月28日
    功能描述： 广告列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class AdvertisementList : AdminPage
    {
        #region 初始参数/属性
        BLL.Content.Advertisement bllAdvertisement = new AllPower.BLL.Content.Advertisement();
        DataTable dtType = null;

        private string strNid;

        /// <summary>
        /// 广告版位
        /// </summary>
        public string StrNid
        {
            get
            {
                if (strNid == null)
                {
                    strNid = Utils.UrlDecode(Utils.ReqUrlParameter("nid"));
                }
                return strNid;
            }
        }
        #endregion

        #region 页面初始化
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
            dtType = Utils.GetXmlDataSet("../Configuraion/Model/AdvertisementType.xml").Tables[0];
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中          
            //判断权限
            SetRight(this.Page, rptModelFileGroup);
        }

        /// <summary>
        /// 获取类型
        /// </summary>
        /// <param Name="Id"></param>
        /// <returns></returns>
        public string GetAdvertisingType(string Id)
        {
            string value = "";
            foreach (DataRow dr in dtType.Rows)
            {
                if (dr["value"].ToString() == Id)
                {
                    value = dr["Name"].ToString();
                }
            }
            return value;
        }
        #endregion

        #region 相应的操作事件

        /// <summary>
        /// 返回广告位管理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdvertisingList.aspx?NodeCode=" + NodeCode);
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("AdvertisementEdit.aspx?NodeCode=" + NodeCode + "&nid=" + Utils.ReqUrlParameter("nid"));
            }
        }

        /// <summary>
        /// 启用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("State"))
            {
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
                string strValue = bllAdvertisement.AdvertisementSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态
                PageInit();
            }
        }

        /// <summary>
        /// 按条件搜索
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnKeySerach_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("AdvertisementList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtGroupName.Text.Trim()) + "&nid=" + Utils.ReqUrlParameter("nid")); //页面跳转         
            }
        }


        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllAdvertisement.AdvertisementSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "Advertisement", strMessage);  //写日志  
                PageInit();
            }
        }

        #endregion

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
            if (StrNid != "")
            {
                dcWhere.Add("AdvertisingId", StrNid);
            }
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllAdvertisement.PageData(p);
        }

        #endregion
    }
}
