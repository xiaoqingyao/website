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
        作者： 严辉
    创建时间： 2010年5月13日
    功能描述： 友情链接列表
 
    更新日期    更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class FriendLinkList : AdminPage
    {
        #region 业务实体对象、参数
        AllPower.BLL.LinkManage.FriendLink bllFriendLink = new AllPower.BLL.LinkManage.FriendLink();
        protected OptionsDictionary odLink = new OptionsDictionary("link");
        Dictionary<string, string> dicWhere = null;
        private string chkIdList = null;
        protected string uploadPath = string.Empty;           //文件上传的目录
        #endregion

        #region 页面初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitControlData();
            }
            PageInit();                 //初始化绑定             
        }

        //绑定初始化控件数据
        private void InitControlData()
        {
            ControlUtils.RadioButtonListDataBind(radlLinkType, "link");

            //缺省查询条件为文字链接
            radlLinkType.SelectedValue = "1";
        }

        /// <summary>
        /// 获取上传图片路径
        /// </summary>
        /// <returns></returns>
        public string GetUploadImg()
        {
            uploadPath = GetUploadImgUrl();                          //获取当前上传文件的路径
            return uploadPath;
        }

        // 初始化数据绑定
        private void PageInit()
        {
            dicWhere = GetSqlWhere();
            SplitDataBind();
            //把当前url全部参数存入cookie中       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
        }
        #endregion

        #region 操作的事件
        //添加
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Utils.UrlRedirect("FriendLinkEdit.aspx?action=NEW&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "你没有添加操作权限！");
            }
        }

        #region 批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete(GetAllChkId());
        }

        private void Delete(string idList)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                if (!string.IsNullOrEmpty(idList))
                {
                    bllFriendLink.FriendLinkSet("DEL", "", idList);
                    WriteLog(GetLogValue(LogTitle, "Del", "FriendLink", true), "", 2);    //写日志

                    PageInit();
                }
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限！");
            }
        }
        #endregion

        #region 排序
        protected void btnOrders_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("Order"))
            {
                Utils.AlertMessage(this, "你没有排序权限的操作！");
                return;
            }
            TextBox txtOrder = null;
            HiddenField hidId = null;
            for (int i = 0; i < rptFriendLink.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
            {
                txtOrder = rptFriendLink.Items[i].FindControl("txtOrders") as TextBox;
                hidId = rptFriendLink.Items[i].FindControl("hidIds") as HiddenField;
                bllFriendLink.FriendLinkSet("ORDERS", AllPower.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
            }
            PageInit();

        }
        #endregion

        #region 推荐
        protected void btnCommend_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("Commend"))
            {
                Utils.AlertMessage(this, "你没有取消推荐权限的操作！");
                return;
            }
            chkIdList = GetAllChkId();
            if (!string.IsNullOrEmpty(chkIdList))
            {
                bllFriendLink.FriendLinkSet("COMMEND", "1", chkIdList);

                PageInit();
            }
        }
        #endregion

        #region 取消推荐
        protected void btnCancelCommend_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("CancelCommend"))
            {
                Utils.AlertMessage(this, "你没有取消推荐权限的操作！");
                return;
            }
            chkIdList = GetAllChkId();
            if (!string.IsNullOrEmpty(chkIdList))
            {
                bllFriendLink.FriendLinkSet("COMMEND", "0", chkIdList);

                PageInit();
            }
        }
        #endregion

        #region 审核
        protected void btnCheckLink_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("Check"))
            {
                Utils.AlertMessage(this, "你没有审核权限的操作！");
                return;
            }
            chkIdList = GetAllChkId();
            if (!string.IsNullOrEmpty(chkIdList))
            {
                bllFriendLink.FriendLinkSet("CHECK", "1", chkIdList);

                PageInit();
            }
        }
        #endregion

        #region 取消审核
        protected void btnCancelLink_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("CancelCheck"))
            {
                Utils.AlertMessage(this, "你没有取消审核限的操作！");
                return;
            }
            chkIdList = GetAllChkId();
            if (!string.IsNullOrEmpty(chkIdList))
            {
                bllFriendLink.FriendLinkSet("CHECK", "0", chkIdList);

                PageInit();
            }
        }
        #endregion

        #region 分页
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

        //审核分类查询事件
        protected void radlCheck_SelectedIndexChanged(object sender, EventArgs e)
        {
            PageInit();
        }

        //条件查询事件
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            PageInit();
        }
        #endregion

        #region 实现列表信息绑定
        private void SplitDataBind()
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = GetSqlWhere();
            p.Aspnetpage = Split;
            p.RptControls = rptFriendLink;
            bllFriendLink.PageData(p);
        }

        // 获取搜索条件
        private Dictionary<string, string> GetSqlWhere()
        {
            if (dicWhere != null)
            {
                dicWhere.Clear();
            }
            else
            {
                dicWhere = new Dictionary<string, string>();
            }
            dicWhere.Add("NodeCode=", NodeCode);
            dicWhere.Add(" IsCheck=", Utils.cutBadStr(this.radlCheck.SelectedValue));
            dicWhere.Add(" LinkType=", Utils.cutBadStr(this.radlLinkType.SelectedValue));
            if (this.chkCommend.Checked)
            {
                dicWhere.Add(" IsCommend=", "1");
            }
            string keyword = Utils.cutBadStr(this.txtKeyword.Text);
            if (!string.IsNullOrEmpty(keyword))
            {
                dicWhere.Add(" WebName LIKE ", " '%" + keyword + "%'");
            }
            return dicWhere;
        }

        #endregion

        #region 加粗/文本/推荐 颜色显示
        /// <summary>
        /// 加粗/文本/推荐 颜色显示
        /// </summary>
        /// <param name="text">文本</param>
        /// <param name="objIsBold">是否加粗</param>
        /// <param name="objTextColor">文本颜色</param>
        /// <param name="objIsCommend">是否推荐</param>
        /// <returns></returns>
        protected string IsBoldCommandTextColor(string text, object objIsBold, object objTextColor, object objIsCommend)
        {
            if (Utils.ParseInt(objIsBold, 0) == 1)
            {
                text = "<b>" + text + "</b>";
            }

            if (!String.IsNullOrEmpty(objTextColor.ToString()))
            {
                text = "<font color='" + objTextColor.ToString() + "'>" + text + "</font>";
            }

            if (Utils.ParseInt(objIsCommend, 0) == 1)
            {
                text += "&nbsp;&nbsp;<font color='red'>荐</font>";
            }

            return text;
        }
        #endregion
    }
}
