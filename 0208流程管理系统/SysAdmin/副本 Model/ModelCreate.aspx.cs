using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using KingTop.BLL.Content;
using System.Text;
using KingTop.Common;

namespace KingTop.Web.Admin
{
    public partial class ModelCreate : AdminPage
    {
        #region  URL参数

        private BLL.Content.ModelField bllModelField = new KingTop.BLL.Content.ModelField();
        string strModelTableName;
        /// <summary>
        /// 所属模型
        /// </summary>
        string strModelId;
        public string StrModelId
        {
            get
            {
                if (strModelId == null)
                {
                    strModelId = Utils.ReqUrlParameter("modelId");
                }
                return strModelId;
            }
            set
            {
                strModelId = value;
            }
        }


        #endregion       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        void PageInit()
        {
            StringBuilder sbStr = new StringBuilder(400);
            FileReadOrWrite file = new FileReadOrWrite();
            sbStr.Append(file.FileRead("ControlManageEditTemplate.aspx"));
            sbStr.Replace("{GetControlHtml}", GetControlHtml());
            Response.Write(file.FileWrite(sbStr.ToString(), strModelTableName.Replace("K_U_", "") + "EDIT.aspx"));
        }

        public string GetControlHtml()
        {
           // StrModelId = "20100316182438";
            StrModelId = "5230a9b-2d6f-49";
            BLL.Content.ModelManage bllManage = new ModelManage();
            DataTable dtModelField = bllModelField.GetList("ALLModelId", Utils.getOneParams(StrModelId));
            DataTable dtModelManage = bllManage.GetList("ONE", Utils.getOneParams(StrModelId));
            if (dtModelField.Rows.Count > 0 && dtModelManage.Rows.Count > 0)
            {
                ModelFieldCreate create = new ModelFieldCreate();
                create.DtModelFiled = dtModelField;
                create.strModelTableName = dtModelManage.Rows[0]["tablename"].ToString();
                strModelTableName = create.strModelTableName;
                dtModelField.Dispose();
                dtModelManage.Dispose();
                return create.Create(StrModelId);
            }
            else
            {
                dtModelField.Dispose();
                dtModelManage.Dispose();
                return "";
            }
            
        }
    }
}
