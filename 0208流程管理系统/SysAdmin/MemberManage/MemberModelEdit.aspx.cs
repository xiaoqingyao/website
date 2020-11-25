using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data.SqlClient;
using System.Data;
using System.Text;


#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月4日
    功能描述： 添加会员模型
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class MemberModelEdit : AdminPage
    {
        AllPower.Model.Business.BusinessModel modelBusiness = new AllPower.Model.Business.BusinessModel();
        BLL.Business.BusinessModel bllBusiness = new AllPower.BLL.Business.BusinessModel();

       
        //更新成功后，返回的页面 Url
        //private readonly string returnUrl = "MemberModelList.aspx";        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InitShow();
            }           
        }

        /// <summary>
        /// 获取并显示模型字段
        /// </summary>
        private void InitShow()
        {
            if (Action == "EDIT")
            {
                DataTable dt = bllBusiness.GetList("ONE", Utils.getOneParams(ID));

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtDescription.Text = dr["Description"].ToString();
                    chkIsValid.Checked = dr["IsValid"].ToString() == "True" ? true : false;
                    txtName.Text = dr["Name"].ToString();
                }
                dt.Dispose();

                txtName.ReadOnly = true;
                btnAdd.Text = Utils.GetResourcesValue("Common", "Update");
            }
        }


        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelBusiness.Name = txtName.Text.Trim();
            modelBusiness.IsValid = chkIsValid.Checked;
            modelBusiness.Description = txtDescription.Text.Trim();
            modelBusiness.SiteID = SiteID.ToString();
            modelBusiness.NodeID = NodeCode;
        }


        #region 添加/修改数据
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ModelSaveOrUpdate();

            if (Action == "EDIT") //修改
            {
                modelBusiness.ID = ID;
            }
            else
            {
                //获取表主键
                string[] strTableOrId = GetTableID("0", "K_BusinessModel");
                modelBusiness.ID = strTableOrId[0];
                modelBusiness.Orders = Utils.ParseInt(strTableOrId[1], 0);

                //添加的为会员模型组
                modelBusiness.Class = 1;
                modelBusiness.AddMan = AddMan;
               
            }

            string strMessage = bllBusiness.Save(Action, modelBusiness);
            int result = Utils.ParseInt(strMessage, 0);

              //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");
            string nameIsExis = Utils.GetResourcesValue("member", "MemberModelNameIsExis");

            switch (result)
            {
                case 1:
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModel", true), "", 2);
                    Utils.AlertMessage(this, success);                   
                    break;

                case 0:
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModel", false), strMessage, 3);
                    Utils.AlertMessage(this, error);                    
                    break;
                
                case 2:
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModel", false), nameIsExis, 3);
                    Utils.AlertMessage(this, nameIsExis);   
                    break;
            }
        }
        #endregion

    }
}
