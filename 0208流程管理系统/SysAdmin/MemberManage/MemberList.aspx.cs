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
    创建时间： 2010年04月28日
    功能描述： 会员管理列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class MemberList :AdminPage
    {
        private string chkIdList = string.Empty;
        protected OptionsDictionary odLink = new OptionsDictionary("memberstate");

        BLL.MemberManage.Member bllMember = new AllPower.BLL.MemberManage.Member();
        //会员模型
       //DataTable dtMemberModel = new DataTable();
        Dictionary<string, string> dicWhere = null;

        #region url 参数

        
        private string _groupId;
        private string _modelId;
        private string _stateId;
        private string _email;

        /// <summary>
        /// 查询字段
        /// </summary>
        public string GroupId
        {
            get
            {
                if (_groupId == null)
                {
                    _groupId = Utils.UrlDecode(Utils.ReqUrlParameter("groupId"));
                }
                return _groupId;
            }
        }


        public string ModelId
        {
            get
            {
                if (_modelId == null)
                {
                    _modelId = Utils.UrlDecode(Utils.ReqUrlParameter("modelId"));
                }
                return _modelId;
            }
        }
        public string StateId
        {
            get
            {
                if (_stateId == null)
                {
                    _stateId = Utils.UrlDecode(Utils.ReqUrlParameter("stateId"));
                }
                return _stateId;
            }
        }


        public string Email
        {
            get
            {
                if (_email == null)
                {
                    _email = Utils.UrlDecode(Utils.ReqUrlParameter("email"));
                }
                return _email;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitControlData();
                PageInit();    //初始化绑定             
            }
        }


        private void InitControlData()
        {
            //请选择
            //ListItem item = new ListItem(Utils.GetResourcesValue("member", "PleaseSelect"), "");
            

            //绑定会员组下拉框
            BLL.MemberManage.MemberGroup bllMemberGroup = new BLL.MemberManage.MemberGroup();
            DataTable dtMemberGroup = bllMemberGroup.GetList("NODEL", Utils.getOneParams(SiteID.ToString()));
            ControlUtils.DropDownDataBind(ddlGroup, dtMemberGroup, "GroupName", "ID", true);
            ddlGroup.Items.Insert(0, (new ListItem(Utils.GetResourcesValue("member", "PleaseSelect"), "")));

            //绑定会员模型下拉框
            //BLL.Business.BusinessModel bllBusinessModel = new AllPower.BLL.Business.BusinessModel();
            //DataTable dtMemeberModel = bllBusinessModel.GetList("MEMBER", Utils.getOneParams(SiteID.ToString()));
            //ControlUtils.DropDownDataBind(ddlMemberModel, dtMemeberModel, "Name", "ID", true);
            //ddlMemberModel.Items.Insert(0, (new ListItem(Utils.GetResourcesValue("member", "PleaseSelect"), "")));

            //绑定会员状态
            ControlUtils.DropDownDataBind(ddlState, "memberstate");
        }

        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        private void PageInit()
        {
            //dtMemberModel = (new AllPower.BLL.Business.BusinessModel()).GetList("MEMBER", Utils.getOneParams(SiteID.ToString()));

            dicWhere = GetSqlWhere();
            SplitDataBind();

            

            //把当前url全部参数存入cookie中            
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); 
        }

        private void SplitDataBind()
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = GetSqlWhere();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptMember;
            bllMember.PageData(p);  //执行绑定
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

            dicWhere.Add("isdel", "0");
            dicWhere.Add("SiteID", SiteID.ToString());
            if (!string.IsNullOrEmpty(StrKeySearch))
            {
                dicWhere.Add("UserName", StrKeySearch);
                txtUserName.Text = StrKeySearch;
            }

            if (!string.IsNullOrEmpty(GroupId))
            {                
                dicWhere.Add("GroupID", GroupId);
                ddlGroup.SelectedValue = GroupId;
            }

            //if (!string.IsNullOrEmpty(ModelId))
            //{
            //    dicWhere.Add("ModleID", ModelId);
            //    ddlMemberModel.SelectedValue = ModelId;
            //}

            //if (!string.IsNullOrEmpty(StateId))
            //{
                dicWhere.Add("StateID", StateId);
                ddlState.SelectedValue = StateId;
            //}

            //if (!string.IsNullOrEmpty(Email))
            //{
                dicWhere.Add("Email", Email);
                txtEmail.Text = Email;
            //}

            return dicWhere;
        }
        /// <summary>
        /// 根据会员模型 ID， 获取会员模型名称
        /// </summary>
        /// <param name="modelId"></param>
        /// <returns></returns>
        protected string GetMemberModelByModelID(string modelId)
        {
            string strModelName = string.Empty;
            //foreach (DataRow dr in dtMemberModel.Rows)
            //{
            //    if (dr["ID"].ToString() == modelId)
            //    {
            //        strModelName = dr["Name"].ToString();
            //        break;
            //    }
            //}

            return strModelName;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("MemberEdit.aspx?action=NEW&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "你没有添加操作权限！");
            }
        }

        protected void btnLock_Click(object sender, EventArgs e)
        {
            UnlockOrLock("2");
        }

        protected void btnUnlock_Click(object sender, EventArgs e)
        {
            UnlockOrLock("1");
        }

        private void UnlockOrLock(string setValue)
        {
            if (IsHaveRightByOperCode("State"))
            {
                chkIdList = GetAllChkId();
                if (!string.IsNullOrEmpty(chkIdList))
                {
                    bllMember.MemberSet("MUTILOCK", setValue, chkIdList);  //锁定/解锁
                    PageInit();
                }

                PageInit();
            }
            else
            {
                Utils.AlertMessage(this, "你没有锁定解锁会员权限！");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("MemberList.aspx?NodeCode=" + NodeCode
                                                 + "&keySearch=" + Utils.UrlEncode(txtUserName.Text.Trim())
                                                 + "&email=" + Utils.UrlEncode(txtEmail.Text.Trim())
                                                 + "&groupId=" + Utils.UrlEncode(ddlGroup.SelectedValue)
                                                 //+ "&modelId=" + Utils.UrlEncode(ddlMemberModel.SelectedValue)
                                                 + "&stateId=" + Utils.UrlEncode(ddlState.SelectedValue)); //页面跳转 
            }
            else
            {
                Utils.AlertMessage(this, "你没有查询操作权限！");
            }
        }

        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                bllMember.MemberSet("LOGICDEL", "", e.CommandArgument.ToString());  //删除数据

                PageInit();
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限 ！");
            }
        }

        protected void lbtnState_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("State"))
            {
                bllMember.MemberSet("UNLOCK", "", e.CommandArgument.ToString());  //锁定/解锁

                PageInit();
            }
            else
            {
                Utils.AlertMessage(this, "你没有锁定解锁会员权限！");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("Delete"))
            {
                Utils.AlertMessage(this, "你没有删除操作权限 ！");
                return;
            }

            chkIdList = GetAllChkId();
            if (!string.IsNullOrEmpty(chkIdList))
            {
                bllMember.MemberSet("LOGICDEL", "", chkIdList);  //删除数据
                WriteLog(GetLogValue(LogTitle, "Del", "Member", true), "", 2);    //写日志
                PageInit();
            }
        }


    

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

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        

        #region 实现列表信息绑定
        private void PageData()
        {
            

            //把当前url全部参数存入cookie中
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); 
        }
        #endregion

        //根据 stateID，取得按钮操作文本
        protected string GetOperatorLock(object stateID)
        {
            string lockText = string.Empty;
            int state  = Utils.ParseInt(stateID, 0);
            switch (state)
            { 
                case 1:
                    lockText = Utils.GetResourcesValue("member", "Islock");
                    break;

                case 2:
                    lockText = Utils.GetResourcesValue("member", "Unlock");
                    break;
            }

           return lockText;
        }

        #endregion
    }
}
