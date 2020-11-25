using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.Template;
using AllPower.Web.Admin;
using System.Text;
using AllPower.BLL.SysManage;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      胡志瑶
    创建时间： 2010年9月10日   
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class LabelFreeEdit : AdminPage
    {
        private AllPower.BLL.Template.Lable lableBll = new Lable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();
                //通过ajax调用获得方案
                if (Request.QueryString["op"] == "getProject")
                {
                    Response.Write(BindProject(int.Parse(Request.QueryString["webSite"])));
                    Response.End();
                }
            }
        }

        private void PageInit()
        {
            //绑定站点
            string userID = GetLoginAccountId();
            string tranType = "";
            if (userID == "0")
            {
                tranType = "ALL";
            }
            else
            {
                tranType = "ALLBYUSERID";
            }
            SysWebSite webSite = new SysWebSite();
            DataTable dt = webSite.GetList(tranType, Utils.getOneParams(SiteID.ToString()));

            ddlWeb.DataSource = dt;
            ddlWeb.DataTextField = "SiteName";
            ddlWeb.DataValueField = "SiteID";
            ddlWeb.DataBind();
            ddlWeb.SelectedValue = SiteID.ToString();
            ClientScript.RegisterStartupScript(GetType(), "aa", "$('#ddlProject').html('" + BindProject(SiteID) + "')", true);
            //ddlWeb.Items.Insert(0, new ListItem("-请选择站点-", "0"));
            ddlWeb.Attributes.Add("onchange", "changeSelect(this.value)");

            //绑定分类
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = 1;
            prams.I3 = -1;
            prams.I2 = 500;
            prams.S1 = SiteID.ToString();
            DataTable dtClass = lableBll.GetLable("LableClass", prams).Tables[1];
            if (dtClass != null)
            {
                foreach (DataRow dr in dtClass.Rows)
                {
                    ddlLableClass.Items.Add(new ListItem(dr["SiteName"].ToString() + "-" + dr["ClassName"].ToString(), dr["ClassID"].ToString()));

                }
            }

            string lableId = Request.Form["hidid"];
            string strSQL = Request.Form["txtSql"];
            string lableName = Request.Form["TxtName"];
            string action = Request.Form["hidaction"];
            hidPageSize.Value = Request.Form["TxtNum"];
            if (string.IsNullOrEmpty(strSQL) || string.IsNullOrEmpty(lableName))
            {
                Response.Write("缺少参数");
                Response.End();
            }
            if (!string.IsNullOrEmpty(lableId))
            {
                if (action.ToLower() != "copy")
                {
                    hidId.Value = lableId.Trim();
                }
                else
                {
                    hidId.Value = "0";
                }
                AllPower.Model.Template.LableFreeInfo model = lableBll.GetLableFreeInfo(Convert.ToInt32(lableId));
                txtLableContent.Text = Server.HtmlDecode(model.LableContent.Trim());
                ddlLableClass.SelectedValue = model.ClassId.ToString();
                txtDescription.Text = model.Description.Trim();
                txtSequence.Text = model.Sequence.ToString();
                hidIdentification.Value = lableBll.FormartIdentification(model.Identification);

                StringBuilder str = new StringBuilder();
                str.Append("<script>");
                str.Append("check(" + model.IsShare + ");");
                //不为通用时
                if (model.IsShare == 0)
                {
                    str.Append("$('#ddlProject').html('" + BindProject(model.SiteID) + "');$('#ddlProject').val('" + model.TempPrjID + "');");

                }
                str.Append("</script>");
                ddlWeb.SelectedValue = model.SiteID.ToString();
                ltlJS.Text = str.ToString();
            }
          


            hidSQL.Value = strSQL.Trim();
           
            txtTitle.Text = lableName;

            string dbtb1 = Request.Form["SelPrin"].Trim();
            string dbtb2 = Request.Form["SelSub"].Trim();

            string pattern = @"select(\s+top\s\d+)?\s+(?<fields>.+?)\s+from";

            Regex reg = new Regex(pattern, RegexOptions.IgnoreCase | RegexOptions.Compiled);
            Match m = reg.Match(strSQL);
            if (m.Success)
            {
                string Fields = m.Groups["fields"].Value.Trim();
                if (Fields.Equals(""))
                {
                    Response.Write("SQL语句无效,没有要显示的字段名!");
                    Response.End();
                }
                StringBuilder field1 = new StringBuilder();         
                if (Fields.IndexOf(",") > 0)
                {
                    string[] Fld = Fields.Split(',');
                    foreach (string _fld in Fld)
                    {
                        string fd = _fld.Trim();
                        field1.Append("<span style='background-color:#E6EFF8;border:solid 3px white;height:20px' onclick=\"showDailog('" + fd + "')\">&nbsp;" + fd + "&nbsp;</span>");                           
                      
                    }                     
                }
                else
                {
                 
                    field1.Append("<span style='background-color:#E6EFF8;border:solid 3px white;height:20px' onclick=\"showDailog('" + Fields + "')\">&nbsp;" + Fields + "&nbsp;</span>");
                }
                ltlField1.Text = field1.ToString();                
            }
            else
            {
                Response.Write("语句非法或无效!");
                Response.End();
            }
        }

        //绑定方案
        protected string BindProject(int webSiteID)
        {
            ddlProject.Items.Clear();
            AllPower.BLL.TemplateProject bll = new AllPower.BLL.TemplateProject();
            StringBuilder str = new StringBuilder();


            AllPower.Model.SelectParams sp = new AllPower.Model.SelectParams();
            sp.I1 = webSiteID;
            DataTable dt = bll.GetList("ALL", sp);


            foreach (DataRow dr in dt.Rows)
            {
                str.Append("<option value=\"" + dr["ID"] + "\">" + dr["Title"] + "</option>");
            }
          
            return str.ToString();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
         
            try
            {              
                string lableId = hidId.Value.Trim();
                string description = txtDescription.Text.Trim();
                string lableContent =txtLableContent.Text.Trim();
                string strSQL = hidSQL.Value.Trim();
                string identification = string.Empty;

                AllPower.Model.Template.LableFreeInfo model = new AllPower.Model.Template.LableFreeInfo();
                model.Description = description;

                
                model.Title = txtTitle.Text;      
                model.LableID = Utils.IsNumber(lableId) ? int.Parse(lableId) : 0;
                model.LabelSQL = strSQL;
                model.LableContent = Server.HtmlEncode(lableContent);
                model.SiteID = int.Parse(ddlWeb.SelectedValue);
                model.TempPrjID = Request["ddlProject"];
                model.IsShare = int.Parse(Request["public"]);             
                model.ClassId = Convert.ToInt32(ddlLableClass.SelectedValue);
                model.PageSize = int.Parse(hidPageSize.Value);
                model.Sequence = Utils.ConvertInt(txtSequence.Text);
                string tranType = "Add";
                int type = 0;
                if (model.LableID > 0)
                {
                    tranType = "Update";
                    type = 1;
                    identification = hidIdentification.Value;
                }
                else
                {
                    identification = lableBll.GetIdentification(SiteID);
                }
                model.Identification = int.Parse(identification);
                model.LableName = "{HQB_L" + identification + "_" + txtTitle.Text.Trim() + " LableType=\"FREE\"}";
                int row = lableBll.SaveLableFree(tranType, model);
                switch (row)
                {
                    case 1:
                        WriteLog(GetLogValue(txtTitle.Text, Action, "FreeLable", true), "", 2);
                        Utils.RunJavaScript(this, "type=" + type + "" + ";title='" + Utils.AlertMessage(txtTitle.Text) + "'");
                        break;
                    case 2:
                        Utils.RunJavaScript(this, "type=2;errmsg='标签名已经存在，请重新填写！" + "';id='" + model.LableID + "'");
                        break;
                    default:
                        WriteLog(GetLogValue(txtTitle.Text, Action, "FreeLable", false), "", 2);//写入操作日志
                        Utils.RunJavaScript(this, "type=2;errmsg='操作失败，请重试！" + "';id='" + model.LableID + "'");
                       
                        break;
                }                
              
            }
            catch (Exception ex)
            {
                WriteLog(GetLogValue(txtTitle.Text, Action, "FreeLable", false), "", 2);//写入操作日志
                Utils.RunJavaScript(this, "type=2;errmsg='" + ex.ToString() + "';");
                return;
            }
        }
    }
}
