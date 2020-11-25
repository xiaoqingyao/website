using System;
using System.Collections.Generic;
using System.Linq;
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
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 编辑模板 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class EditTemplate : AdminPage
    {
        #region 参数
        private AllPower.BLL.Template.Lable lable = new AllPower.BLL.Template.Lable();
        public string tPath = string.Empty;
        public int lableCount = 0;     //标签的数量
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
                txtLableContent.Attributes.Add("onclick", "$(\"#hidStart\").val(getStartEnd($('#txtLableContent')).start)");
            }
        }

        //加载模板文件
        private void PageInit()
        {
            ddlTagModelBind();                              //加载标签列表
            string path = this.Path;                        //取得模板文件路径
            tPath = Path;
            this.HiddenField_Path.Value = path;
            txtLableContent.Text = Utils.showFileContet(path);
            FileInfo file = new FileInfo(path);
            this.txtTemplateName.Text = file.Name;
            this.lblPath.Text = " (所在目录：" + file.DirectoryName + " )";
            this.lblPath.ForeColor = System.Drawing.Color.Gray;
        }

        //绑定标签列表
        private void ddlTagModelBind()
        {
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = 1;
            prams.I2 = 0;
            prams.I3 = -1;
            prams.S3 = SiteID.ToString();

            DataTable dt = lable.GetLable("LableList", prams).Tables[1];  //标签的所有数据
            DataTable dt1 = dt.Clone();
            DataTable dt2 = dt.Clone();
            for (int i = 0; i < 13; i++)
            {
                dt.Rows[i]["Title"] = dt.Rows[i]["Title"].ToString().Length > 7 ? dt.Rows[i]["Title"].ToString().Substring(0, 7) : dt.Rows[i]["Title"];
                dt1.Rows.Add(dt.Rows[i].ItemArray);
            }
            for (int j = 13; j < dt.Rows.Count; j++)
            {
                dt.Rows[j]["Title"] = dt.Rows[j]["Title"].ToString().Length > 7 ? dt.Rows[j]["Title"].ToString().Substring(0, 7) : dt.Rows[j]["Title"];
                dt2.Rows.Add(dt.Rows[j].ItemArray);
            }
            rptLableList.DataSource = dt1;
            rptLableList.DataBind();

            rptLableList2.DataSource = dt2;
            rptLableList2.DataBind();
        }

      

        //项绑定事件
   
        #endregion

        #region 保存事件
        //保存文件
        protected void Button_Save_Click1(object sender, EventArgs e)
        {
            string filepath = this.HiddenField_Path.Value.ToString().Trim();                        //获取路径
            if (IsHaveRightByOperCode("Edit"))
            {
                bool result = Utils.saveHtml(filepath, this.txtLableContent.Text.ToString().Trim());        //保存文件
                if (result)
                {
                    WriteLog(GetLogValue(txtTemplateName.Text, Action, "TemplateFile", true), "", 2);      //写日志
                    Utils.RunJavaScript(this, "alert({msg:'修改模板成功！',title:'提示信息'})");
                    Response.Redirect("TemplateList.aspx?Path=" + Path + "&Action=ALL&NodeCode=" + NodeCode);
                }
                else
                {
                    WriteLog(GetLogValue(txtTemplateName.Text, Action, "TemplateFile", false), "", 3);      //写日志
                    Utils.RunJavaScript(this, "alert({msg:'修改模板失败，请通知管理员！',title:'提示信息'})");
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