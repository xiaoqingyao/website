using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月13日
    功能描述： 友情链接 添加/编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class FriendLinkEdit : AdminPage
    {
        #region 业务实体类

        AllPower.BLL.LinkManage.FriendLinkClass bllLinkClass = new AllPower.BLL.LinkManage.FriendLinkClass();
        AllPower.BLL.LinkManage.FriendLink bllLink = new AllPower.BLL.LinkManage.FriendLink();
        AllPower.Model.LinkManage.FriendLink modelLink = new AllPower.Model.LinkManage.FriendLink();
        #endregion

        #region 页面加载事件
        private string logTitle = null;             //日志的标题

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 数据初始化

        private void PageInit()
        {

            //链接分类下拉框

            DataTable dtblClass = bllLinkClass.GetList("NODECODE", Utils.getOneParams(SiteID.ToString()));
            ControlUtils.DropDownDataBind(dropClass, dtblClass, "ClassName", "ID", true);

            //颜色下拉框

            OptionsDictionary odColor = new OptionsDictionary("color");
            ListItem item = null;
            foreach (KeyValuePair<string, string> kvp in odColor.getDictionary2)
            {
                item = new ListItem(kvp.Value, kvp.Key.ToString());
                item.Attributes.Add("style", "background-color:" + kvp.Key.ToString());
                dropLinkColor.Items.Add(item);
            }

            //链接类型单选按钮列表

            ControlUtils.RadioButtonListDataBind(radlLinkType, "link");

            //设置默值为 文字链接
            radlLinkType.SelectedValue = "1";

            ////如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                LoadData();

                btnSave.Text = Utils.GetResourcesValue("Common", "Update");
            }

        }
        #endregion

        #region 编辑时加载页面数据

        private void LoadData()
        {
            if (!String.IsNullOrEmpty(ID))
            {
                DataTable dtblLink = bllLink.GetList("ONE", Utils.getOneParams(ID));
                if (dtblLink != null && dtblLink.Rows.Count > 0)
                {
                    DataRow drowTemp = dtblLink.Rows[0];
                    dropClass.SelectedValue = drowTemp["ClassID"].ToString();
                    radlLinkType.SelectedValue = drowTemp["LinkType"].ToString();
                    txtWebName.Text = drowTemp["WebName"].ToString();
                    hidLogTitle.Value = drowTemp["WebName"].ToString();
                    dropLinkColor.SelectedValue = drowTemp["LinkColor"].ToString();
                    chkIsBold.Checked = Utils.ParseBool(drowTemp["IsBold"]);
                    txtWebUrl.Text = drowTemp["WebUrl"].ToString();
                    ImgLogo.Value = drowTemp["logo"].ToString();
                    txtWebSiteName.Text = drowTemp["WebSiteName"].ToString();
                    txtIntro.Text = drowTemp["Intro"].ToString();
                    radlCommend.SelectedValue = drowTemp["IsCommend"].ToString();
                    radlCheck.SelectedValue = drowTemp["IsCheck"].ToString();
                }

                dtblLink.Dispose();
            }
        }
        #endregion

        #region 提交按钮事件
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            InitModel();
            int flagType = 0;
            if (Action == "NEW")
            {
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.AlertMessage(this, "你没有添加权限的操作！");
                    return;
                }

                string[] strTableOrId = GetTableID("0", "K_FriendLink");
                modelLink.ID = Guid.NewGuid().ToString();
                modelLink.Orders = Utils.ParseInt(strTableOrId[1], 100);
                modelLink.AddMan = AddMan;
                logTitle = txtWebName.Text.Trim();
            }
            else
            {
                flagType = 1;
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.AlertMessage(this, "你没有修改权限的操作！");
                    return;
                }

                modelLink.ID = ID;
                logTitle = hidLogTitle.Value;
                if (logTitle != txtWebName.Text.Trim())
                {
                    logTitle += "=>" + txtWebName.Text.Trim();
                }
            }

            //添加/修改操作
            string strMessage = bllLink.Save(Action, modelLink);
            int flag = Utils.ParseInt(strMessage, 0);

            //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");
            string webNameMsg = Utils.GetResourcesValue("FriendLink", "WebNameIsExis");
            string webUrlMsg = Utils.GetResourcesValue("FriendLink", "WebUrlIsExis");

            switch (flag)
            {
                case 1:
                    WriteLog(GetLogValue(logTitle, Action, "FriendLink", true), "", 2);               
                    Utils.RunJavaScript(this, "type=" + flagType + ";title='" + Utils.AlertMessage(txtWebName.Text) + "';id='" + modelLink.ID + "'");
                    break;
                case -1:
                    WriteLog(GetLogValue(logTitle, Action, "FriendLink", false), webNameMsg, 3);
                    Utils.RunJavaScript(this, "type=2;errmsg='" + webNameMsg + "';id='" + modelLink.ID + "'");
                    break;
                case -2:
                    WriteLog(GetLogValue(logTitle, Action, "FriendLink", false), webUrlMsg, 3);
                    Utils.RunJavaScript(this, "type=2;errmsg='" + webUrlMsg + "';id='" + modelLink.ID + "'");
                    break;

                default:
                    WriteLog(GetLogValue(logTitle, Action, "FriendLink", false), strMessage, 3);                 
                    Utils.RunJavaScript(this, "type=2;errmsg='" + Utils.AlertMessage(strMessage) + "';id='" + modelLink.ID + "'");
                    break;
            }
        }
        #endregion

        #region  获取实体类

        /// <summary>
        /// 获取实体类

        /// </summary>
        private void InitModel()
        {
            modelLink.ClassID = dropClass.SelectedValue;
            modelLink.LinkType = Utils.ParseInt(radlLinkType.SelectedValue, 1);
            modelLink.WebName = txtWebName.Text.Trim();
            modelLink.LinkColor = dropLinkColor.SelectedValue;
            modelLink.IsBold = Utils.BoolToInt(chkIsBold.Checked);
            modelLink.WebUrl = txtWebUrl.Text.Trim();
            modelLink.logo = ImgLogo.Value.Trim();
            modelLink.WebSiteName = txtWebSiteName.Text.Trim();
            modelLink.Intro = txtIntro.Text.Trim();
            modelLink.IsCommend = Utils.ParseInt(radlCommend.SelectedValue, 0);
            modelLink.IsCheck = Utils.ParseInt(radlCheck.SelectedValue, 1);

            modelLink.NodeCode = NodeCode;
            modelLink.SiteID = SiteID;

        }
        #endregion

        #region 类型改变事件
        protected void radlLinkType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ("2".Equals(radlLinkType.SelectedValue))
            {
                this.plLogo.Visible = true;
            }
            else
            {
                this.plLogo.Visible = false;
            }
        }
        #endregion
    }
}
