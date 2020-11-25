using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using KingTop.Model;
using System.Text;
using System.IO;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年5月6日
    功能描述： 投票添加/修改
 
// 更新日期:2010-09-21 更新人:何伟      更新原因/内容:完善前台的调用
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class VoteEdit : AdminPage
    {
        KingTop.Model.Content.Vote modelVote;
        BLL.Content.Vote bllVote = new KingTop.BLL.Content.Vote();

        #region 数据初始化
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

        /// <summary>
        /// 绑定
        /// </summary>
        private void PageInit()
        {
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllVote.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    cbIsUserVote.Checked = Utils.ParseBool(dt.Rows[0]["IsUserVote"].ToString());
                    txtIPLimit.Text = dt.Rows[0]["LimitIP"].ToString();
                    txtExpiredTime.Text = Convert.ToDateTime(dt.Rows[0]["LimitTime"]).ToShortDateString();
                    cbType.Checked = Utils.ParseBool(dt.Rows[0]["Type"]);
                    txtVoteIPCount.Text = dt.Rows[0]["VoteIPCount"].ToString();
                    txtVoteUserCount.Text = dt.Rows[0]["VoteUserCount"].ToString();
                    btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                    BLL.Content.VoteItems bllVoteItems = new KingTop.BLL.Content.VoteItems();
                    rptItems.DataSource = bllVoteItems.GetList("ALL", Utils.getOneParams(ID));
                    rptItems.DataBind();
                    dt.Dispose();
                }
            }
            else
            {
                #region 初始化投票项
                DataTable dt = new DataTable();
                dt.Columns.Add("ID", typeof(int));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("VoteCount", typeof(int));
                dt.Columns.Add("NewsId", typeof(string));
                DataRow dr = dt.NewRow();
                dr["ID"] = "0";
                dr["Name"] = "投票项1";
                dr["VoteCount"] = "0";
                dr["newsid"] = "0";
                dt.Rows.Add(dr);
                dr = dt.NewRow();
                dr["ID"] = "0";
                dr["Name"] = "投票项2";
                dr["VoteCount"] = "0";
                dr["newsid"] = "0";
                dt.Rows.Add(dr);
                rptItems.DataSource = dt;
                rptItems.DataBind();
                rptItems.Dispose();
                #endregion
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
            string strOperateName = "Add";
            modelVote = new KingTop.Model.Content.Vote();
            ModelSaveOrUpdate();
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_Vote");
                modelVote.ID = strTableOrId[0];
                modelVote.Orders = Utils.ParseInt(strTableOrId[1], 1);
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
                modelVote.ID = ID;
            }

            //用户添加/修改操作
            string strMessage = bllVote.Save(Action, modelVote, Utils.ReqFromParameter("_title"), Utils.ReqFromParameter("_totalNumber"), Utils.ReqFromParameter("_Newsid"), Utils.ReqFromParameter("_id"));
            if (strMessage == "1") //操作成功
            {
                if (Action == "NEW")                                                        //新增成功还要新加一个空白文件
                {
                    string filePath = Utils.GetPath(string.Format("~/{0}/Plus/Vote/", SiteDir));//文件的目录
                    if (!Directory.Exists("Vote"))                                        //如果不存在目录先创建
                    {
                        Directory.CreateDirectory(filePath);
                    }
                    FileReadOrWrite file = new FileReadOrWrite();
                    file.FileWrite("", filePath + modelVote.FileName);                      //生成文件 
                }
                ID = modelVote.ID;
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelVote.Name.Replace("'", "\\'") + "';");
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';");
            }
            WriteLogExpand(modelVote.Name, hidLogTitle.Value, strOperateName, "Vote", strMessage); //写日志
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelVote.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelVote.SiteId = SiteID.ToString();
            modelVote.NodeId = NodeID;
            modelVote.IsUserVote = cbIsUserVote.Checked;
            modelVote.LimitIP = txtIPLimit.Text.Trim();
            modelVote.LimitTime = Convert.ToDateTime(txtExpiredTime.Text.Trim());
            modelVote.Type = Utils.BoolToInt(cbType.Checked);
            modelVote.VoteIPCount = Utils.ParseInt(txtVoteIPCount.Text.Trim(), 0);
            modelVote.VoteUserCount = Utils.ParseInt(txtVoteUserCount.Text.Trim(), 0);
            modelVote.NodeCode = NodeCode;
            modelVote.FileName = DateTime.Now.ToString("yyyyMMddhhmmss") + ".aspx";         //生成文件名
            modelVote.FileType = 1;                                                         //文件类型
            modelVote.VotePath = "";
            modelVote.AddMan = UserNo;
        }
        #endregion
    }
}
