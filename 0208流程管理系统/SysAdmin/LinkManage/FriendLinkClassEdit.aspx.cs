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
    创建时间： 2010年5月12日
    功能描述： 友情链接分类 添加/编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class FriendLinkClassEdit : AdminPage
    {
        AllPower.BLL.LinkManage.FriendLinkClass bllLinkClass = new AllPower.BLL.LinkManage.FriendLinkClass();
        AllPower.Model.LinkManage.FriendLinkClass modelLinkClass = new AllPower.Model.LinkManage.FriendLinkClass();

        //日志常量 
        private readonly string logModelName = "FriendLinkClass";


        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        #region 数据初始化
        private void PageInit()
        {
            //绑定颜色下拉框
            OptionsDictionary odColor = new OptionsDictionary("color");
            ListItem item = null;
            foreach (KeyValuePair<string, string> kvp in odColor.getDictionary2)
            {
                item = new ListItem(kvp.Value, kvp.Key.ToString());
                item.Attributes.Add("style", "background-color:" + kvp.Key.ToString());
                dropLinkColor.Items.Add(item);
            }            

            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                LoadData();

                btnSave.Text = Utils.GetResourcesValue("Common", "Update");
            }

        }

        #region 编辑时加载页面数据
        private void LoadData()
        {
            if (!String.IsNullOrEmpty(ID))
            {
                DataTable dtblLink = bllLinkClass.GetList("ONE", Utils.getOneParams(ID));
                if (dtblLink != null && dtblLink.Rows.Count > 0)
                {
                    DataRow drow = dtblLink.Rows[0];
                    txtClassName.Text = drow["ClassName"].ToString();
                    hidLogTitle.Value = drow["ClassName"].ToString();
                    txtDesc.Text = drow["ClassDesc"].ToString();
                    dropLinkColor.SelectedValue = drow["LinkColor"].ToString();
                    chkIsBold.Checked = Utils.ParseBool(drow["IsBold"]);
                }

                dtblLink.Dispose();
            }
        }
        #endregion

        #endregion

        #region 添加/修改数据
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            InitModel();
            string logTitle = hidLogTitle.Value;
            int flagType = 0;
            if (Action == "NEW")
            {
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.AlertMessage(this, "你没有添加操作权限！");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_FriendLinkClass");
                modelLinkClass.ID = strTableOrId[0];
                modelLinkClass.Orders = Utils.ParseInt(strTableOrId[1], 100);
                             
                logTitle = txtClassName.Text.Trim();
            }
            else
            {
                flagType = 1;
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.AlertMessage(this, "你没有修改操作权限！");
                    return;
                }

                if (logTitle != txtClassName.Text.Trim())
                {
                    logTitle += "=>" + txtClassName.Text.Trim();
                }
            }

            //添加/修改操作
            string strMessage = bllLinkClass.Save(Action, modelLinkClass);
            int result = Utils.ParseInt(strMessage, 0);

            switch (result)
            {
                case 1:     //成功
                    WriteLog(GetLogValue(logTitle, Action, logModelName, true), "", 2);
                    Utils.RunJavaScript(this, "type=" + flagType + ";title='" + Utils.AlertMessage(txtClassName.Text) + "';id='" + modelLinkClass.ID + "'");
                    break;

                case 0:     //失败
                    WriteLog(GetLogValue(logTitle, Action, logModelName, false), strMessage, 3);
                    Utils.RunJavaScript(this, "type=2;errmsg='" + Utils.AlertMessage(strMessage) + "';id='" + modelLinkClass.ID + "'");
                    break;

                case -1:    //已存在
                    WriteLog(GetLogValue(logTitle, Action, logModelName, false), Utils.GetResourcesValue("FriendLink", "ClassNameIsExis"), 3);
                    Utils.RunJavaScript(this, "type=2;errmsg='" + Utils.GetResourcesValue("FriendLink", "ClassNameIsExis") + "';id='" + modelLinkClass.ID + "'");
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
            modelLinkClass.ID = ID;
            modelLinkClass.ClassName = txtClassName.Text.Trim();
            modelLinkClass.LinkColor = dropLinkColor.SelectedValue;
            modelLinkClass.IsBold = Utils.BoolToInt(chkIsBold.Checked);
            modelLinkClass.ClassDesc = txtDesc.Text.Trim();
            modelLinkClass.SiteID = SiteID;
            modelLinkClass.NodeCode = NodeCode;
            modelLinkClass.AddMan = AddMan;  
        }
        #endregion

    }
}
