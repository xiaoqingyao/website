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
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月10日
    功能描述： 模板字段分组添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class ModelFieldGroupEdit : AdminPage
    {
        KingTop.Model.Content.ModelFieldGroup modelFileGroup; 
        BLL.Content.ModelFieldGroup bllFiledGroup = new KingTop.BLL.Content.ModelFieldGroup();

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
            BLL.Content.ModelManage bllModelManage = new KingTop.BLL.Content.ModelManage();
            KingTop.Model.SelectParams parms = new KingTop.Model.SelectParams();  //传递参数类
            parms.S1 = "10";
            
            //绑定模型下拉列表
            ddlModelList.DataSource = bllModelManage.GetList("ALL", parms);   
            ddlModelList.DataTextField = "title";
            ddlModelList.DataValueField = "ID";
            ddlModelList.DataBind();           

            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                SelectParams selParams = new SelectParams();
                selParams.S1 = ID;
                DataTable dt = bllFiledGroup.GetList("ONE", selParams);               
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    ddlModelList.SelectedValue = dt.Rows[0]["ModelId"].ToString();
                    IsEnable.Checked = Convert.ToBoolean(dt.Rows[0]["IsEnable"]);
                }               
                btnSave.Text = Utils.GetResourcesValue("Common","Update");
                dt.Dispose();
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
            modelFileGroup= new KingTop.Model.Content.ModelFieldGroup();
            ModelSaveOrUpdate();
            string strOperateName = "Add";
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_ModelFieldGroup");
                modelFileGroup.ID = strTableOrId[0];
                modelFileGroup.Orders = Utils.ParseInt(strTableOrId[1], 1);               
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }               
                modelFileGroup.ID = ID;
                strOperateName = "Update";
            }
            //用户添加/修改操作
            string strMessage = bllFiledGroup.Save(Action, modelFileGroup);
            if (strMessage == "1") //操作成功
            {               
                Utils.UrlRedirect(this,"ModelFieldGroupList.aspx"+StrPageParams,Utils.GetResourcesValue("model", "AddSucess"));
            }
            else
            {               
                Utils.AlertJavaScript(this,Utils.GetResourcesValue("model", "AddError"));
            }
            WriteLogExpand(modelFileGroup.Name, hidLogTitle.Value, strOperateName, "ModelGroup", strMessage); //写日志
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelFileGroup.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());          
            modelFileGroup.ModelId = ddlModelList.SelectedValue;
            modelFileGroup.IsEnable = IsEnable.Checked;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Utils.WriteCookie(SystemConst.COOKIES_KEY,SystemConst.COOKIES_LANG_KEY,"zh-cn");           
            Response.Redirect(Request.Url.OriginalString);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Utils.WriteCookie(SystemConst.COOKIES_KEY,SystemConst.COOKIES_LANG_KEY, "en-us");
            Response.Redirect(Request.Url.OriginalString);
        }
    }
}
