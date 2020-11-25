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
    创建时间： 2010年4月27日
    功能描述： 广告版位列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class Advertising : AdminPage
    {
        #region 页面初始化
        BLL.Content.Advertising bllAdvertising = new AllPower.BLL.Content.Advertising();
        DataTable dtType = null;

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
            dtType = Utils.GetXmlDataSet("../Configuraion/Model/AdvertisingType.xml").Tables[0];
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
            //判断页面权限
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

        /// <summary>
        /// 获取显示顺序
        /// </summary>
        /// <param Name="Id"></param>
        /// <returns></returns>
        public string GetAdvertisingDisplayType(string Id)
        {
            string value = null;
            switch (Id)
            {
                case "1":
                    value = Utils.GetResourcesValue("Model", "AdvertisingDisplayType1");
                    break;
                case "2":
                    value = Utils.GetResourcesValue("Model", "AdvertisingDisplayType2");
                    break;
                case "3":
                    value = Utils.GetResourcesValue("Model", "AdvertisingDisplayType3");
                    break;
                default:
                    value = "";
                    break;
            }
            return value;
        }

        /// <summary>
        /// 获取js调用代码
        /// </summary>
        /// <param name="jsName"></param>
        /// <returns></returns>
        public string GetJsCode(string jsName)
        {
            string jsCode = "";                                                    //js调用的代码
            string dirPath = GetSiteDomain();                                      //获取当前站点路径(跨站用)
            string advPath = string.Format("{0}Plus/Advert/", dirPath);            //广告js调用目录
            if (!"/".Equals(advPath.Substring(advPath.Length - 1, 1)))
            {
                advPath += "/";
            }
            jsCode = string.Format("{0}{1}{2}", "&lt;script type='text/javascript' src='", advPath + jsName, "'&gt;&lt;/script&gt;");
            return jsCode;
        }
        #endregion

        #region 操作的事件
        //添加
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("AdvertisingEdit.aspx?NodeCode=" + NodeCode);
            }
        }

        //删除
        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllAdvertising.AdvertisingSet("LOGICDEL", "", e.CommandArgument.ToString());  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "Advertising", strMessage);  //写日志    
                PageInit();
            }
        }

        //启用与禁用
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
                string strValue = bllAdvertising.AdvertisingSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态

                PageInit();
            }
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
                Utils.UrlRedirect("AdvertisingList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtGroupName.Text.Trim())); //页面跳转          
            }
        }

        //逻辑删除
        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllAdvertising.AdvertisingSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "Advertising", strMessage);  //写日志    
                PageInit();
            }
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
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllAdvertising.PageData(p);
        }
        #endregion
    }
}
