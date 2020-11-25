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
    创建时间： 2010年8月2日
    功能描述： 回收站问题表添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class RecyclingManageEdit : AdminPage
    {
        KingTop.Model.Content.RecyclingManage modelRecyclingManage;
        BLL.Content.RecyclingManage bllRecyclingManage = new KingTop.BLL.Content.RecyclingManage();
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

        #region 数据初始化
        private void PageInit()
        {
          
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllRecyclingManage.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["tableName"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    cbIsManage.Checked = Utils.ParseBool(dt.Rows[0]["IsManage"].ToString());
                    txtpKey.Text = dt.Rows[0]["pKey"].ToString();
                    txtdelKey.Text = dt.Rows[0]["DelKey"].ToString();
                    txtTitleKey.Text = dt.Rows[0]["TitleKey"].ToString();                   
                    btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                    txtDesc.Text = dt.Rows[0]["Desc"].ToString();
                    txtdelTimeKey.Text = dt.Rows[0]["DelTimeKey"].ToString();
                    cbIsReductive.Checked = Utils.ParseBool(dt.Rows[0]["IsReductive"].ToString());
                    cbIsProcDel.Checked = Utils.ParseBool(dt.Rows[0]["IsProcDel"].ToString());
                    cbIsOnDesc.Checked = Utils.ParseBool(dt.Rows[0]["IsOnDesc"].ToString());
                    cbIsProcReductive.Checked = Utils.ParseBool(dt.Rows[0]["IsProcReductive"].ToString());
                    txtListUrl.Text = dt.Rows[0]["ListUrl"].ToString();
                    txtProcDelText.Text = dt.Rows[0]["ProcDelText"].ToString();
                    txtProcReductiveText.Text = dt.Rows[0]["ProcReductiveText"].ToString();
                }              
            }            
        }
        #endregion

        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strOperateName = "Add";
            modelRecyclingManage = new KingTop.Model.Content.RecyclingManage();
            ModelSaveOrUpdate();
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }                       
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
                modelRecyclingManage.ID = Utils.ParseInt(ID,0);
            }
           
            //用户添加/修改操作
            string strMessage = bllRecyclingManage.Save(Action, modelRecyclingManage);
            if (strMessage == "1") //操作成功
            {
                //执行生成视图
                bllRecyclingManage.CreateView();
                Utils.UrlRedirect(this, "RecyclingManageList.aspx" + StrPageParams, Utils.GetResourcesValue("model", "AddSucess"));
            }
            else
            {              
                Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
            }
            WriteLogExpand(modelRecyclingManage.TableName, hidLogTitle.Value, strOperateName, "RecyclingManage", strMessage); //写日志
        }

      
        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelRecyclingManage.TableName = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelRecyclingManage.NodeCode = "nodecode";  
            modelRecyclingManage.Desc = HttpUtility.HtmlEncode(txtDesc.Text.Trim());
            modelRecyclingManage.pKey = txtpKey.Text.Trim();
            modelRecyclingManage.DelKey = txtdelKey.Text.Trim();
            modelRecyclingManage.TitleKey = txtTitleKey.Text.Trim();
            modelRecyclingManage.DelTimeKey = txtdelTimeKey.Text.Trim();
            modelRecyclingManage.IsManage = cbIsManage.Checked;
            modelRecyclingManage.IsReductive = cbIsReductive.Checked;
            modelRecyclingManage.ListUrl = txtListUrl.Text.Trim();
            modelRecyclingManage.IsProcDel = cbIsProcDel.Checked;
            modelRecyclingManage.ProcDelText = txtProcDelText.Text.Trim();
            modelRecyclingManage.IsProcReductive = cbIsProcReductive.Checked;
            modelRecyclingManage.ProcReductiveText = txtProcReductiveText.Text.Trim();
            modelRecyclingManage.AddMan = UserNo;
            modelRecyclingManage.IsOnDesc = cbIsOnDesc.Checked;
        }
    }
}
