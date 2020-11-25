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
    创建时间： 2010年5月21日
    功能描述： 关键字 添加/编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class KeywordFilterEdit : AdminPage
    {
        Model.Filter.KeywordFilter modelKeyword = new AllPower.Model.Filter.KeywordFilter();
        BLL.Filter.KeywordFilter bllKeyword = new AllPower.BLL.Filter.KeywordFilter();

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
                DataTable dtKeyword = bllKeyword.GetList("ONE", Utils.getOneParams(ID));
                if (dtKeyword != null && dtKeyword.Rows.Count > 0)
                {
                    DataRow drow = dtKeyword.Rows[0];
                    txtKeyword.Text = drow["Keyword"].ToString();
                    txtReplace.Text = drow["ReplaceStr"].ToString();
                    chkDisable.Checked = Utils.ParseBool(drow["IsDisable"]);
                    hidLogTitle.Value = drow["Keyword"].ToString();                    
                }

                dtKeyword.Dispose();
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
            string strOperateName = "Add";
            InitModel();
            string logTitle = hidLogTitle.Value;

            if (Action == "NEW")
            {
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.AlertMessage(this, "你没有添加操作权限！");
                    return;
                }
                modelKeyword.ID = Guid.NewGuid().ToString();
                logTitle = txtKeyword.Text.Trim();
            }
            else
            {
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.AlertMessage(this, "你没有修改操作权限！");
                    return;
                }
                strOperateName = "Update";               
            }

            //添加/修改操作
            string strMessage = bllKeyword.Save(Action, modelKeyword);
            int result = Utils.ParseInt(strMessage, 0);

            string modelName = "关键字过滤";
            string alertTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");
            string isExis = Utils.GetResourcesValue("KeywordFilter", "KeywordIsExis");


            switch (result)
            {
                case 1:     //成功
                    ID = modelKeyword.ID;
                    Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelKeyword.Keyword.Replace("'", "\"") + "';");          
                    break;

                case 0:     //失败
                    Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';"); ;
                    break;

                case -1:    //已存在
                    Utils.RunJavaScript(this, "type=2;errmsg='关键字已经存在!';");
                    strMessage = "关键字已经存在";
                    break;
            }
            WriteLogExpand(modelKeyword.Keyword, hidLogTitle.Value, strOperateName, "KeywordFilter", strMessage); //写日志

        }
        #endregion

        #region  获取实体类
        /// <summary>
        /// 获取实体类
        /// </summary>
        private void InitModel()
        {
            modelKeyword.ID = ID;
            modelKeyword.Keyword = txtKeyword.Text.Trim();
            modelKeyword.ReplaceStr = txtReplace.Text.Trim();
            modelKeyword.IsDisable = Utils.BoolToInt(chkDisable.Checked);
            modelKeyword.SiteID = SiteID;
            modelKeyword.NodeCode = NodeCode;
            modelKeyword.AddMan = AddMan;
        }
        #endregion

    }
}
