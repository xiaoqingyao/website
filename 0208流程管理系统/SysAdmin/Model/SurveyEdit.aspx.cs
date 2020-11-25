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
using System.IO;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年5月18日
    功能描述： 问卷调查添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class SurveyEdit : AdminPage
    {
        #region 数据初始化
        AllPower.Model.Content.Survey modelSurvey;
        BLL.Content.Survey bllSurvey = new AllPower.BLL.Content.Survey();
        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        private void PageInit()
        {

            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllSurvey.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    cbIsUserSurvey.Checked = Utils.ParseBool(dt.Rows[0]["IsUserSurvey"].ToString());
                    txtIPLimit.Text = dt.Rows[0]["LimitIP"].ToString();
                    txtExpiredTime.Text = Convert.ToDateTime(dt.Rows[0]["LimitTime"]).ToShortDateString();

                    txtSurveyIPCount.Text = dt.Rows[0]["SurveyIPCount"].ToString();
                    btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                    txtDesc.Text = dt.Rows[0]["Desc"].ToString();
                    txtPwd.Text = dt.Rows[0]["SurveyPwd"].ToString();
                }
            }
        }
        #endregion

        #region 操作的事件
        /// <summary>
        /// 添加/修改数据 By 何伟 2010-9-21 修改
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strOperateName = "Add";
            modelSurvey = new AllPower.Model.Content.Survey();
            ModelSaveOrUpdate();
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                modelSurvey.Orders = 50;
                modelSurvey.AddMan = UserNo;
                modelSurvey.FileName = DateTime.Now.ToString("yyyyMMddhhmmss") + ".aspx";
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                strOperateName = "Update";
                modelSurvey.ID = ID;
            }

            //用户添加/修改操作
            string strMessage = bllSurvey.Save(Action, modelSurvey);
            if (strMessage != "0" && strMessage.IndexOf('|') == -1) //操作成功
            {
                if (Action == "NEW")                                                        //新增成功还要新加一个空白文件
                {
                    string filePath = Utils.GetPath(string.Format("~/{0}/Plus/Survey/", SiteDir));//文件的目录
                    if (!Directory.Exists("Survey"))                                        //如果不存在目录先创建
                    {
                        Directory.CreateDirectory(filePath);
                    }
                    FileReadOrWrite file = new FileReadOrWrite();
                    file.FileWrite("", filePath + modelSurvey.FileName);                  //生成文件 
                }
                if (ID == "")
                {
                    ID = strMessage;
                }
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelSurvey.Name.Replace("'", "\"") + "';");
                strMessage = "1";
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';");
            }
            WriteLogExpand(modelSurvey.Name, hidLogTitle.Value, strOperateName, "Survey", strMessage); //写日志

        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelSurvey.NodeCode = NodeCode;
            modelSurvey.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelSurvey.SiteId = SiteID.ToString();
            modelSurvey.NodeId = NodeID;
            modelSurvey.LimitIP = txtIPLimit.Text.Trim();
            modelSurvey.LimitTime = Convert.ToDateTime(txtExpiredTime.Text.Trim());
            modelSurvey.SurveyIPCount = Utils.ParseInt(txtSurveyIPCount.Text.Trim(), 0);
            modelSurvey.Desc = HttpUtility.HtmlEncode(txtDesc.Text.Trim());
            modelSurvey.IsUserSurvey = cbIsUserSurvey.Checked;
            modelSurvey.SurveyPwd = txtPwd.Text.Trim();
        }
        #endregion
    }
}
