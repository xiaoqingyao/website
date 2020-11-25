using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Text;
using AllPower.Web.Admin;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月18日
    功能描述： 友情链接配置
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.LinkManage
{
    public partial class FriendLinkConfigEdit : AdminPage
    {
        #region 业务操作类

        AllPower.Model.LinkManage.FriendLinkConfig modelFriendLinkConfig = null;
        AllPower.BLL.LinkManage.FriendLinkClass bllLinkClass = new AllPower.BLL.LinkManage.FriendLinkClass();
        BLL.LinkManage.FriendLinkConfig bllFriendLinkConfig = new AllPower.BLL.LinkManage.FriendLinkConfig();
        #endregion

        #region  URL参数

        private string _action = null;
        private string _id = null;

        /// <summary>
        /// 获取用户操作
        /// </summary>
        public string Action
        {
            get
            {
                if (this._action == null)
                {
                    this._action = Utils.ReqUrlParameter("Action").ToUpper();
                    if (_action == "")
                    {
                        _action = "NEW";
                    }
                }

                return this._action;
            }
        }

        /// <summary>
        /// 配置的ID
        /// </summary>
        public string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("ID");
                }

                return this._id;
            }
        }
        #endregion

        #region 数据初始化
        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlLinkClass.Attributes.Add("onchange", "$('#txtLinkClass').val(this.value);");            //注册一个客户端选择事件
                PageInit();
            }
        }

        //加载数据
        private void PageInit()
        {
            //绑定链接的分类
            DataTable dtAlllClass = bllLinkClass.GetList("NODECODE", Utils.getOneParams(SiteID.ToString()));
            ControlUtils.DropDownDataBind(ddlLinkClass, dtAlllClass, "ClassName", "ID", true);
            ddlLinkClass.Items.Insert(0, new ListItem("--请选择--", "0"));

            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllFriendLinkConfig.GetList("ONE", Utils.getOneParams("1"));
                if (dt != null && dt.Rows.Count > 0)
                {
                    //rblLinkType.SelectedValue = dt.Rows[0]["LinkType"].ToString();
                    string linkClass = dt.Rows[0]["ClassID"].ToString();
                    if (!Utils.ValidateNumber(linkClass) || "0".Equals(linkClass))
                    {
                        txtLinkClass.Text = linkClass;
                    }
                    else
                    {
                        DataTable dtClass = bllLinkClass.GetList("ONE", Utils.getOneParams(linkClass));
                        if (dtClass.Rows.Count > 0)
                        {
                            txtLinkClass.Text = dtClass.Rows[0]["ClassName"].ToString();
                        }
                    }
                    rblRecomment.SelectedValue = Utils.ParseBoolToInt(dt.Rows[0]["IsCommend"]).ToString();
                    txtLinkCounts.Text = dt.Rows[0]["ShowCount"].ToString();
                    IsEnable.Checked = Utils.ParseBool(dt.Rows[0]["IsEnable"].ToString());
                }
                dt.Dispose();
            }
        }
        #endregion

        #region 操作的事件

        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            modelFriendLinkConfig = new AllPower.Model.LinkManage.FriendLinkConfig();
            ModelSaveOrUpdate();
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_FriendLinkConfig");
                modelFriendLinkConfig.ID = "1";
                modelFriendLinkConfig.Orders = Utils.ParseInt(strTableOrId[1], 1);
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }

                modelFriendLinkConfig.ID = "1";
            }
            //用户添加/修改操作
            string strMessage = bllFriendLinkConfig.Save(Action, modelFriendLinkConfig);
            if (strMessage == "1") //操作成功
            {
                Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddSucess") + "',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddError") + "',title:'提示信息'})");
            }
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            //modelFriendLinkConfig.LinkType = Convert.ToInt32(rblLinkType.SelectedValue);
            modelFriendLinkConfig.ClassID = txtLinkClass.Text.Trim();
            modelFriendLinkConfig.IsCommend = Utils.ParseBool(rblRecomment.SelectedValue);
            modelFriendLinkConfig.ShowCount = Utils.ParseInt(txtLinkCounts.Text.Trim(), 18);
            modelFriendLinkConfig.LinkWidth = "88px";
            modelFriendLinkConfig.LinkHeight = "31px";
            modelFriendLinkConfig.IsEnable = IsEnable.Checked;
            modelFriendLinkConfig.SiteID = SiteID;
            modelFriendLinkConfig.IsDel = false;
            modelFriendLinkConfig.AddDate = DateTime.Now;
            modelFriendLinkConfig.AddMan = UserNo;
        }
        #endregion
    }
}
