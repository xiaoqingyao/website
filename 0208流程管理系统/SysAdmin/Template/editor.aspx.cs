using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.Template;
using AllPower.Web.Admin;
using System.Data;
using System.IO;
using System.Text;
using System.Collections;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.Hosting;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月8日    功能描述： 可视化编辑模板 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class editor : AdminPage
    {
        #region  Path参数
        private string _path = null;
        /// <summary>
        /// 当前的路径
        /// </summary>
        public string Path
        {
            get
            {
                if (this._path == null)
                {
                    this._path = Utils.ReqUrlParameter("Path");
                }

                return this._path;
            }
        }
        #endregion

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        private void PageInit()
        {
            string path = this.Path;//取得模板文件路径
            this.HiddenField_Path.Value = path;
            FileContent.Value = Utils.showFileContet(path);
            FileInfo file = new FileInfo(path);
            this.txtTemplateName.Text = file.Name;
            this.lblPath.Text = " (所在目录：" + file.DirectoryName + " )";
            this.lblPath.ForeColor = System.Drawing.Color.Gray;
        }
        #endregion

        #region 提交事件
        //保存文件
        protected void Button_Save_Click1(object sender, EventArgs e)
        {
            string filepath = this.HiddenField_Path.Value.ToString().Trim();
            if (IsHaveRightByOperCode("Edit"))
            {
                bool result = Utils.saveHtml(filepath, this.FileContent.Value.ToString().Trim());       //保存文件
                if (result)
                {
                    WriteLog(GetLogValue("模板管理-->编辑成功", "Update", "模板模型", true), "", 2);      //写日志
                    Utils.RunJavaScript(this, "alert({msg:'编辑模板成功！',title:'提示信息'})");
                    Response.Redirect("TemplateList.aspx?Path=" + Path + "&Action=ALL&NodeCode=" + NodeCode);
                }
                else
                {
                    WriteLog(GetLogValue("模板管理-->编辑失败", "Update", "模板模型", false), "", 3);      //写日志
                    Utils.RunJavaScript(this, "alert({msg:'编辑模板失败，请通知管理员！',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'没有操作权限，请通知管理员！',title:'提示信息'})");
            }
        }
        #endregion

    }
}
