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
    创建时间： 2010年8月3日
    功能描述： 回收站关联表添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class RecyclingAssociatedEdit : AdminPage
    {
        KingTop.Model.Content.RecyclingAssociated modelRecyclingAssociated;
        BLL.Content.RecyclingAssociated bllRecyclingAssociated = new KingTop.BLL.Content.RecyclingAssociated();
        BLL.Content.RecyclingManage bllRecyclingManage = new KingTop.BLL.Content.RecyclingManage();

        string strpid;

        public string strPid
        {
            get
            {
                if (strpid == null)
                {
                    strpid = Utils.ReqUrlParameter("pid");
                }
                return strpid;
            }
        }

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

            ControlUtils.DropDownDataBind(ddlRecyclingManageID, bllRecyclingManage.GetList("one", Utils.getOneParams(strPid)), "tableName", "id");
            if (Action == "EDIT")
            {
                ControlUtils.DropDownDataBind(ddlAssociatedID, bllRecyclingManage.GetList("NOTONEUPDATE", Utils.getTwoParams(strPid, ID)), "tableName", "id");
            }
            else
            {
                ControlUtils.DropDownDataBind(ddlAssociatedID, bllRecyclingManage.GetList("NOTONE", Utils.getOneParams(strPid)), "tableName", "id");
            }
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllRecyclingAssociated.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    hidLogTitle.Value = ddlRecyclingManageID.SelectedValue;
                    ddlAssociatedID.SelectedValue = dt.Rows[0]["AssociatedID"].ToString();
                    txtAssociatedKey.Text = dt.Rows[0]["AssociatedKey"].ToString();
                    txtAssociatedWhere.Text = dt.Rows[0]["AssociatedWhere"].ToString();
                    btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                    cbKeyIsWhere.Checked = Utils.ParseBool(dt.Rows[0]["KeyIsWhere"].ToString());
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
            modelRecyclingAssociated = new KingTop.Model.Content.RecyclingAssociated();
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
                modelRecyclingAssociated.ID = Utils.ParseInt(ID, 0);
            }
           
            //用户添加/修改操作
            string strMessage = bllRecyclingAssociated.Save(Action, modelRecyclingAssociated);
            if (strMessage == "1") //操作成功
            {
                Utils.UrlRedirect(this, "RecyclingAssociatedList.aspx" + StrPageParams, Utils.GetResourcesValue("model", "AddSucess"));
            }
            else
            {
                Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
            }
            WriteLogExpand(ddlRecyclingManageID.SelectedItem.Text, hidLogTitle.Value, strOperateName, "RecyclingAssociated", strMessage); //写日志
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelRecyclingAssociated.RecyclingManageID =Utils.ParseInt(strPid,0);
            modelRecyclingAssociated.AssociatedID =Utils.ParseInt(ddlAssociatedID.SelectedValue,0);
            modelRecyclingAssociated.AssociatedKey = txtAssociatedKey.Text;
            modelRecyclingAssociated.AssociatedWhere = txtAssociatedWhere.Text;           
            modelRecyclingAssociated.AddMan = UserNo;
            modelRecyclingAssociated.KeyIsWhere = cbKeyIsWhere.Checked;
        }
    }
}
