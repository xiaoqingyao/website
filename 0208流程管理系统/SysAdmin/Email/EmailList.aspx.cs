#region 引用程序集
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;

using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.Web.Admin;
using AllPower.BLL.SysManage;
#endregion

//#region 版权注释
///*================================================================
//    Copyright (C) 2010 华强北在线
//    作者:      朱存群
//    创建时间： 2010年5月27日
//    功能描述： 内容模型列表

//// 更新日期        更新人      更新原因/内容
////
//--===============================================================*/

namespace AllPower.Web.Admin.Emails
{
    public partial class EmailList : AdminPage
    {
        AllPower.BLL.Emails.InnerEmail bll = new AllPower.BLL.Emails.InnerEmail();
        AllPower.Model.Emails.InnerEmail model = new AllPower.Model.Emails.InnerEmail();
        
        #region URL参数
        private string _flag = null;
        private string _cid = null;
        private string _emailaddress=null;

        // 搜索类型
        public string Flag //类别标识符
        {
            get
            {
                if (this._flag == null)
                {
                    this._flag = Utils.ReqUrlParameter("fg").ToLower();
                }

                return this._flag;
            }
        }

        public string Menu //菜单字段
        {
            get
            {
                string _menu = "";
                switch (Flag)
                {
                    case "snd":
                        _menu = Utils.GetResourcesValue("Orgin", "SendBox"); break; //发件箱
                    case "drf":
                        _menu = Utils.GetResourcesValue("Orgin", "DraftBox"); break; //草稿箱
                    case "rec":
                        _menu = Utils.GetResourcesValue("Orgin", "ReceiveBox"); break;  //收件箱
                    case "del":
                        _menu = Utils.GetResourcesValue("Orgin", "DeleteBox"); break;  //已删除箱，回收站
                    default:
                        _menu = Utils.GetResourcesValue("Orgin", "SendBox"); break; //发件箱
                }
                return _menu;
            }
        }

        public string CID //菜单字段
        {
            get
            {
                switch (Flag)
                {
                    case "snd":
                        _cid = "sendbox"; break; //发件箱
                    case "draf":
                        _cid = "draftbox"; break; //草稿箱
                    case "rec":
                        _cid = "receivebox"; break;  //收件箱
                    case "del":
                        _cid = "deletebox"; break;  //已删除箱，回收站
                    default:
                        _cid = "sendbox"; break; //发件箱
                }

                return _cid;
            }
        }

        public string EmailAddress //登录用户ID
        {
            get
            {
                if (_emailaddress==null && !string.IsNullOrEmpty(base.GetLoginAccountId()))
                {
                    _emailaddress = bll.GetList("SYSEMAIL", Utils.getOneParams(base.GetLoginAccountId())).Rows[0]["Email"].ToString();
                }
                return _emailaddress;
            }            
        }
        #endregion

        #region 页面加载初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtSearch.Attributes.Add("onblur", "if(this.value==''){this.value='搜索邮件';}");
            this.txtSearch.Attributes.Add("onfocus", "if (this.value=='搜索邮件'){this.value='';}");

            this.btnDelete.Attributes.Add("onclick", "javascript:return(confirm('确定删除所选记录？'))");
            this.btnDelete1.Attributes.Add("onclick", "javascript:return(confirm('确定删除所选记录？'))");
            if (!Page.IsPostBack)
            {
                PageInit();
                Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中          
            }
        }

        private void PageInit()
        {     
            Dictionary<string, string> dicWhere=new Dictionary<string,string>();            
            SplitDataBind(dicWhere);
            base.SetRight(this, rptEmailList);//权限检测
        }
        #endregion

        #region 删除树级     
        public void Category_Del(object sender, CommandEventArgs e)
        {
            OnDel(e.CommandArgument.ToString());
        }

        /// <summary>
        /// 批量删邮件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));
        }

        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg;   // 事务返回信息

                tranType = "DEL";
                returnMsg = bll.InnerEmailSet(tranType, null, id);
                int result = Utils.ParseInt(returnMsg, 0);
                if (result == 0)  //操作失败
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "InnerEmailModel", false), returnMsg, 3); //写日志
                    Utils.RunJavaScript(this, "alert({msg:'操作失败，请重试！',title:'提示信息'})");
                }
                else //操作成功
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "InnerEmailModel", true), "", 2); //写日志
                    Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
                }
                PageInit();
            }
            else
            {              
                Utils.RunJavaScript(this, "alert({msg:'删除失败，没有权限！',title:'提示信息'})");
            }
        }
        #endregion
    
        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind(Dictionary<string, string> dicWhere)
        {
             AllPower.Model.Pager p = new AllPower.Model.Pager();
             p.Aspnetpage = Split;
             p.RptControls = rptEmailList;
            string field=FilterString(txtSearch.Text);
            if (CID.IndexOf("box") == -1)
            {
                dicWhere.Add("Title",field);
                dicWhere.Add("Content", field);               
                p.DicWhere = dicWhere;
                bll.PageData(p,"zcq_26@126.com",true);
            }
            else
            {
                dicWhere.Add("NOKEY", "zcq_26@126.com");
                p.DicWhere=dicWhere;
                bll.PageData(p,CID);
            }
        }
        #endregion

        #region 过滤输入查询字段
        protected string FilterString(string temp)
        {
            return temp.Trim().Replace("%", "").Replace("*", "").Replace("\"", "").Replace("\'", "");
        }
        #endregion

        #region 分页显示
        protected void Split_PageChanged(object src, EventArgs e)
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();            
            SplitDataBind(dicWhere);
        }
        #endregion

        #region 写邮件       
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("EmailEdit.aspx?NodeId=" +NodeID+"&Action=add");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'无新增权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
        #endregion         

        protected void rptEmailList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            SplitDataBind(dicWhere);
        }
    }
}