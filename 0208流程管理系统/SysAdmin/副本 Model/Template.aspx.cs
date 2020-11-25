using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月9日
    功能描述： 模板编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class Template :AdminPage
    {
        #region 变量成员
        private string _tableName = null;
        protected string jsMessage = string.Empty;
        #endregion
   
        #region  URL参数
        /// <summary>
        /// 操作表名
        /// </summary>
        public string TableName
        {
            get
            {
                if (this._tableName == null)
                {
                    this._tableName = Utils.ReqUrlParameter("TableName");
                }

                return this._tableName;
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
            string filePath;

            if (TableName != "")
            {
                filePath = Server.MapPath("FormModel/" + ID + ".html");

                if (System.IO.File.Exists(filePath))                 {
                    txtCode.Value = System.IO.File.ReadAllText(filePath);
                }
                else
                {
                    txtCode.Value = "文件不存在";
                }
            }
            else
            { 
                txtCode.Value = "文件不存在";
            }
        }

        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string filePath;
            
            filePath = Server.MapPath("FormModel/" + ID + ".html");

            try
            {
                System.IO.File.Delete(filePath);
                System.IO.File.WriteAllText(filePath, txtCode.Value, Encoding.UTF8);
                jsMessage = "alertClose({title:\"操作成功\",msg:\"更新成功！\"},funcation(){location.href=\"CustomFormList.aspx?NodeCode="+ NodeCode +"\";});";
            }
            catch
            {
                jsMessage = "alert({title:\"操作失败\",msg:\"对不起操作失败！\"});";
            }
        }
   }
}
