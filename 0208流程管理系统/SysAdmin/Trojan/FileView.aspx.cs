using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;
using System.IO;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月28日
    功能描述： 文件查看
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class FileView : AdminPage
    {
        FileReadOrWrite fro = new FileReadOrWrite();
       
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
            string fileFullName = string.Empty;

            if (Session["fullName"] != null)
            {
                fileFullName = Session["fullName"].ToString();
            }
            if (!string.IsNullOrEmpty(fileFullName))
            {
                lblFileName.Text = fileFullName;
                fro.IsServerPath = false;
                txtContent.Text = fro.FileRead(fileFullName);
            }
        }     
        #endregion

        #region 文件保存 
        protected void btnSave_Click(object sender, EventArgs e)
        {
            fro.IsServerPath = false;
            fro.FileWrite(txtContent.Text.Trim(), lblFileName.Text);            

            Utils.AlertMessage(this, "保存成功！");
        }
        #endregion
    }
}
