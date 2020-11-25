#region 引用程序集
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;

using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.BLL.Business;
#endregion

//#region 版权注释
///*================================================================
//    Copyright (C) 2010 华强北在线
//    作者:      严辉
//    创建时间： 2010年5月4日
//    功能描述： 会员模型列表

//// 更新日期        更新人      更新原因/内容
////
//--===============================================================*/

namespace AllPower.Web.Admin
{
    public partial class MemberModelList : AdminPage
    {
        AllPower.BLL.Business.BusinessModel bllBusinessModel = new AllPower.BLL.Business.BusinessModel();
        private Dictionary<string, string> dicWhere = null;

        #region 页面加载初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

 
        #endregion

        #region  页面初始化

        private void PageInit()
        {   
            SplitDataBind();

            //把当前url全部参数存入cookie中            
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); 
        }
        // 获取搜索条件
        private Dictionary<string, string> GetSqlWhere()
        {
            if (dicWhere != null)
            {
                dicWhere.Clear();
            }
            else
            {
                dicWhere = new Dictionary<string, string>();
            }
            //class=1 表示 会员模型
            dicWhere.Add(" class ", "1");
            dicWhere.Add("NodeID", NodeCode);
            dicWhere.Add("Name", txtName.Text.Trim());
            dicWhere.Add("IsValid", ddlState.SelectedValue);

            return dicWhere;
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                PageInit();
            }
            else
            {
                Utils.AlertMessage(this, "你没有查询操作权限！");
            }
        }
        #endregion

        #region 添加按钮事件
        protected void btnNew_Click(object sender, EventArgs e)
        {
          
            if (IsHaveRightByOperCode("New"))
            {
                Utils.UrlRedirect("MemberModelEdit.aspx?action=NEW&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "你没有添加操作权限！");
            }
        }
        #endregion
       
        #region 删除模型
        public void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            if (!IsHaveRightByOperCode("Delete"))
            {
                Utils.AlertMessage(this, "你没有删除操作权限 ！");
                return;
            }

            //int flag=1;
            string id;
            string returnMsg;   // 操作返回信息            

            id = e.CommandArgument.ToString();
            
            string modelFile = ((LinkButton)sender).ToolTip;
            string incFilePath = Server.MapPath("/Inc/" + modelFile + ".inc");
            string aspxFilePath = Server.MapPath("/Inc/" + modelFile + ".aspx");
            
            //删除生成的模型文件
            if (File.Exists(incFilePath))
            {
                File.Delete(incFilePath);       
            }
            if (File.Exists(aspxFilePath))
            {
                File.Delete(aspxFilePath);
            }

            returnMsg = bllBusinessModel.BusinessModelSet("DEL", "", id);
              
            PageInit();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("Delete"))
            {
                Utils.AlertMessage(this, "你没有删除操作权限 ！");
                return;
            }
           string chkIdList = GetAllChkId();
            if (!string.IsNullOrEmpty(chkIdList))
            {
                bllBusinessModel.BusinessModelSet("DELP", "", chkIdList);  //删除数据
                WriteLog(GetLogValue(LogTitle, "Del", "MemberModel", true), "", 2);    //写日志
                PageInit();
            }
        }

        //获取复选框列表值
        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        }
        #endregion

        #region 设置禁用
        /// <summary>
        /// 设置禁用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            bllBusinessModel.BusinessModelSet("ENABLE", "", e.CommandArgument.ToString());
            PageInit();
        }

        //启用
        protected void btnDisable_Click(object sender, EventArgs e)
        {
            Enable(GetAllChkId(), "1");
        }

        //禁用
        protected void btnUnDisable_Click(object sender, EventArgs e)
        {
            Enable(GetAllChkId(), "0");
        }

        private void Enable(string idList, string setValue)
        {
            if (!string.IsNullOrEmpty(idList))
            {
                bllBusinessModel.BusinessModelSet("MUTIENABLE", setValue, idList);
                PageInit();
            }
        }

        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            dicWhere = GetSqlWhere();
            p.Aspnetpage = Split;
            p.RptControls = rptModelManage;
            p.DicWhere = dicWhere;
            bllBusinessModel.PageData(p);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            if (IsPageChanged())
            {
                SplitDataBind();
            }
        }
        #endregion

        #region 创建模型
        protected void CreateModel(object sender, CommandEventArgs e)
        {
            //模型编号
            string strModelId = e.CommandArgument.ToString();

            ParseBusiness pars = new ParseBusiness();
            StringBuilder sb = new StringBuilder();
            StringBuilder sbr = new StringBuilder();
            #region 引入脚本样式
            sb.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
            sb.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
            sb.Append("<head id=\"Head1\" runat=\"server\">\n");
            sb.Append("    <title></title>\n");
            sb.Append("    <script language=\"javascript\" type=\"text/javascript\" src=\"/SysAdmin/JS/ChangeCity.js\" charset=\"gb2312\"></script>\n");
            sb.Append("    <link href=\"/My97DatePicker/skin/WdatePicker.css\" type=\"text/css\" rel=\"Stylesheet\" />\n");
            sb.Append("    <script language=\"javascript\" type=\"text/javascript\" src=\"/My97DatePicker/WdatePicker.js\"></script>\n");
            sb.Append("    <link href=\"/SysAdmin/CSS/validationEngine.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
            sb.Append("    <link href=\"/SysAdmin/ColorPicker/colorpicker.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
            sb.Append("    <script src=\"/SysAdmin/JS/jquery-3.2.min.js\" type=\"text/javascript\"></script>\n");
            sb.Append("    <script src=\"/SysAdmin/JS/Common.js\" type=\"text/javascript\"></script>\n");
            sb.Append("    <script src=\"/SysAdmin/JS/jquery-validationEngine.js\" type=\"text/javascript\"></script>\n");
            sb.Append("    <script type=\"text/javascript\" src=\"/SysAdmin/js/jquery-validationEngine-cn.js\"></script>\n");
            sb.Append("    <script src=\"/SysAdmin/Calendar/WdatePicker.js\" type=\"text/javascript\"></script>\n");
            sb.Append("    <script type=\"text/javascript\" src=\"/SysAdmin/Editor/ckeditor/ckeditor.js\"></script>\n");
            sb.Append("    <script src=\"/SysAdmin/ColorPicker/colorpicker.js\" type=\"text/javascript\"></script>\n");
            sb.Append("    <link href=\"/SysAdmin/Editor/ckeditor/content.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
            sb.Append("    <script type=\"text/javascript\">\n");
            sb.Append("        $(document).ready(function() { $(\"#theForm\").validationEngine({ promptPosition: \"centerRight\" }) });\n");
            sb.Append("    </script>\n");
            sb.Append("   <link href=\"/SysAdmin/css/ustyle.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
            sb.Append("    <script type=\"text/javascript\" src=\"/SysAdmin/js/publicform.js\"></script>\n");
            sb.Append("    <script type=\"text/javascript\" src=\"/SysAdmin/js/public.js\"></script>\n");            
            sb.Append("    <link href=\"/SysAdmin/css/dialog.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
            sb.Append("    <script type=\"text/javascript\" src=\"/SysAdmin/js/jquery.dialog.js\"></script>\n");
            sb.Append("    </head>\n");
            sb.Append("    <body>\n");
            sb.Append("    <div class=\"container\">\n");
            #endregion

            //生成含table的字段模型解析
            DataTable dtTemp = bllBusinessModel.GetList("BORN", Utils.getOneParams(strModelId));
            sbr.Append(FieldHtml.controlParentTemplate.Replace("{$TableBody$}", pars.BasicHtml(dtTemp, null, null).ToString()));

            GenerateFile gf = new GenerateFile();
            string fileName = e.CommandName;
            string result = gf.WriteFile(sbr.ToString(), "/SysAdmin/MemberManage/Inc/" + fileName + ".inc");
            string sult = gf.WriteFile(sb.ToString() + gf.ReadFile("/SysAdmin/MemberManage/Inc/" + fileName + ".inc"), "/SysAdmin/MemberManage/Inc/" + fileName + ".html");

            if ((result.IndexOf("错误") == -1) && (sult.IndexOf("错误") == -1))
            {
                Utils.AlertMessage(this, "模型" + fileName + "生成成功!");
            }
            else
            {
                Utils.AlertMessage(this, result);
            }
        }

        #endregion

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            TextBox txtOrder = null;
            HiddenField hidId = null;
            for (int i = 0; i < rptModelManage.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
            {
                txtOrder = rptModelManage.Items[i].FindControl("txtOrders") as TextBox;
                hidId = rptModelManage.Items[i].FindControl("hidIds") as HiddenField;
                bllBusinessModel.BusinessModelSet("ORDER", AllPower.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
            }
            PageInit();
        }


        #region 按钮操作文本
        //根据 stateID，取得按钮操作文本
        protected string GetOperatorText(string stateID)
        {
            string text = string.Empty;
            int state = Utils.BoolToInt(stateID);
            switch (state)
            {
                case 0:
                    text = Utils.GetResourcesValue("Common", "ON");
                    break;

                case 1:
                    text = Utils.GetResourcesValue("Common", "OFF");
                    break;
            }

            return text;
        }
        #endregion
    }
}









