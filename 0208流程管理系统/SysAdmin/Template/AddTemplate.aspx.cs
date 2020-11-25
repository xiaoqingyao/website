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
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 模板添加
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class AddTemplate : AdminPage
    {
        private AllPower.BLL.Template.Lable lable = new AllPower.BLL.Template.Lable();
        public int lableCount = 0;     //标签的数量
        #region  Path参数
  
        private string _path = null;
  
        /// <summary>
        ///路径
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
              

                if (Request["op"] == "getOneLable")  //ajax 用于弹出框
                {
                    DataTable dt = lable.GetLable("OneLable", Utils.getOneParams(Request["lableID"])).Tables[0];                    
                    dt.TableName = "lable";
                    dt.Columns.Add("Newidex");
                    foreach (DataRow dr in dt.Rows)
                    {
                        dr["Newidex"] = lable.FormartIdentification(dr["Identification"]);
                    }
                    Response.ContentType = "text/xml";
                    Response.Charset = "UTF-8";

                    //StringWriter xmlstr = new StringWriter();
                    //dt.WriteXml(xmlstr);
                    //Response.Write(xmlstr.ToString());
                    dt.WriteXml(Response.OutputStream);
                    this.Response.End();
                }               
                txtLableContent.Attributes.Add("onclick", "$(\"#hidStart\").val(getStartEnd($('#txtLableContent')).start)");
            }
        }
      
        /// <summary>
        /// 加载标签数据
        /// </summary>
        private void PageInit()
        {
            ddlTagModelBind();                          //绑定Tag列表
            string path = this.Path;                    //获取模板所在根目录      
            if (Action == "EDIT")
            {
                txtLableContent.Text = Utils.showFileContet(path);
                FileInfo file = new FileInfo(path);
                this.txtTemplateName.Text = file.Name.Substring(0, file.Name.LastIndexOf('.'));
                string ext = System.IO.Path.GetExtension(path).ToLower ();
                switch (ext)
                {
                    case ".htm":
                        selExt.SelectedIndex = 1;
                        break;
                    case ".aspx":
                        selExt.SelectedIndex = 2;
                        break;
                }
                selExt.Disabled = true;
                txtTemplateName.Enabled = false;               
                lblPath.Text = path.Substring(0, path.LastIndexOf('\\'));
            }
            else
            {
                lblPath.Text = path; 
            }
        }

        //绑定标签列表
        private void ddlTagModelBind()
        {        

            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = 1;
            prams.I2 = 0;
            prams.I3 = -1;   
            prams.S3 = SiteID.ToString();
            prams.S4 = " AND IsEnable=1";

            DataTable dt = lable.GetLable("LableList", prams).Tables[1];  //标签的所有数据     
            rptLableList.DataSource = dt;
            rptLableList.DataBind();

        }
        #endregion

        #region 事件
        /// <summary>
        ///模板保存
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {           
            string templateName = this.txtTemplateName.Text.Trim().ToString() + Request.Form["selExt"];                    //模板名称
          
            bool result = false;
           
            if (IsHaveRightByOperCode("New"))
            {

                if (Action == "EDIT")
                {                  
                    string filepath = Path;                      //获取路径
                    result = Utils.saveHtml(filepath, this.txtLableContent.Text.ToString().Trim());        //保存文件
                }
                else
                {
                    result = Utils.AddHtml(templateName, Path, this.txtLableContent.Text.Trim());
                }

                if (result)
                {
                    WriteLog(GetLogValue(templateName, Action, "TemplateFile", true), "", 2);      //写日志
                    Utils.RunJavaScript(this, "alert({msg:'编辑模板成功！',title:'提示信息'});window.location.href='TemplateList.aspx?NodeCode=" + NodeCode + "'");
                 
                    
                }
                else
                {
                    WriteLog(GetLogValue(templateName, Action, "TemplateFile", false), "", 3);      //写日志
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
