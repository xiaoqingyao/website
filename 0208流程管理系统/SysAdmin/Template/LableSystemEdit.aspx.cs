using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using System.Data;
using AllPower.Common;
using AllPower.BLL.SysManage;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      胡志瑶
    创建时间： 2010年9月7日   
 
// 更新日期        更新人      更新原因/内容
// 
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class LableSystemEdit : AdminPage
    {
        private int IsSystem
        {
            get
            {
                return int.Parse(Request["IsSystem"]);
            }
        }
        private AllPower.BLL.Template.Lable lableBll = new AllPower.BLL.Template.Lable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
                if (Request.QueryString["op"] == "getproject")
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

            //绑定分类
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = 1;
            prams.I3 = -1;
            prams.I2 = 500;
            prams.S1 = SiteID.ToString();
            DataTable dtClass = new AllPower.BLL.Template.Lable().GetLable("LableClass", prams).Tables[1];
            if (dtClass != null)
            {
                foreach (DataRow dr in dtClass.Rows)
                {
                    ddlLableClass.Items.Add(new ListItem(dr["SiteName"].ToString() + "-" + dr["ClassName"].ToString(), dr["ClassID"].ToString()));

                }
            }
            ddlWeb.Attributes.Add("onchange", "changeSelect(this.value)");

            string action = Request.QueryString["action"];


            if (action == "edit" || action == "copy")
            {
                BindData(Request.QueryString["id"]);
            }
            else
            {
                hidIdentification.Value = lableBll.GetIdentification(SiteID);
            }
            txtTitle.Attributes.Add("onkeyup", "formartContent()");

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

        /// <summary>
        /// 修改时绑定相关的标签
        /// </summary>
        /// <param name="id"></param>
        private void BindData(string id)
        {
            DataTable dt = lableBll.GetLable("OneLable", Utils.getOneParams(id)).Tables[0];
            if (dt != null)
            {
                DataRow dr = dt.Rows[0];               
              
                txtLableContent.Text = dr["LableContent"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ddlLableClass.SelectedValue = dr["ClassId"].ToString();
                txtSequence.Text = dr["Sequence"].ToString();
            
                hidIdentification.Value = lableBll.FormartIdentification(dr["Identification"]);

                txtTitle.Text = dr["Title"].ToString();
                if (Request.QueryString["action"] != "edit")
                {
                    txtTitle.Text = "Copy" + txtTitle.Text;                  
                    btnSubmit.Text = "复制";
                }
                else
                {
                    btnSubmit.Text = "修改";
                }

                StringBuilder str = new StringBuilder();
                str.Append("<script>");
                str.Append("check(" + dr["IsShare"] + ");");
                //不为通用时
                if (dr["IsShare"].ToString() == "0")
                {
                    str.Append("$('#ddlProject').html('" + BindProject(Convert.ToInt32(dr["SiteID"])) + "');$('#ddlProject').val('" + dr["TempPrjID"] + "');");

                }
                str.Append("</script>");
                ddlWeb.SelectedValue = dr["SiteID"].ToString();
                ltlJS.Text = str.ToString();
            }
        }

        protected void ddlWeb_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProject(int.Parse(ddlWeb.SelectedValue));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AllPower.BLL.Template.Lable bll = new AllPower.BLL.Template.Lable();

            int flagType = 0;
            string tranType = "AddLable";           

            int lableID = 0;
            AllPower.Model.Template.LableInfo model = new AllPower.Model.Template.LableInfo();
            string identification = string.Empty;
            if (Request["id"] != null && Action != "COPY")
            {
                lableID = int.Parse(Request["id"]);
                identification = hidIdentification.Value;
            }
            else
            {
                identification = lableBll.GetIdentification(SiteID);
            }
            string lableType = "";
            switch (IsSystem)
            {
                case 0: //静态标签
                    lableType = "STATIC";
                    break;
                case 2:  //分页标签
                    lableType = "SPLIT";
                    break;
                case 1:
                    lableType = "SYSTEM";
                    break;
            }
            model.LableID = lableID;
            model.IsShare = int.Parse(Request["public"]);
            model.IsSystem = int.Parse(Request.QueryString["IsSystem"]);
            model.Identification = int.Parse(identification);
            model.Title =txtTitle.Text;
            model.LableName = "{HQB_L" + identification + "_" + txtTitle.Text.Trim() + " LableType=\"" + lableType + "\"}";
            model.LableContent = txtLableContent.Text.Trim();
            model.ClassID = int.Parse(ddlLableClass.SelectedValue);
            model.SiteID = int.Parse(ddlWeb.SelectedValue);
            model.TempPrjID = Request["ddlProject"];
            model.Description = txtDescription.Text.Trim();
            model.Sequence = Utils.ConvertInt(txtSequence.Text);
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = int.Parse(ddlLableClass.SelectedValue);

            if (Action == "EDIT")
            {
                flagType = 1;
                tranType = "UpdateLable";
            }

            int row = bll.SaveLable(tranType, model);
            switch (row)
            {
                case 1:
                    WriteLog(GetLogValue(model.LableName, Action, "Lable", true), "", 2);
                    Utils.RunJavaScript(this, "type=" + flagType + "" + ";title='" + Utils.AlertMessage(model.Title) + "';id='" + model.LableID + "'");
                    break;
                case 2:
                    Utils.RunJavaScript(this, "type=2;errmsg='标签名已经存在，请重新填写！" + "';id='" + model.LableID + "'");
                    break;
                default:
                    WriteLog(GetLogValue(model.LableName, Action, "Lable", false), "", 2);
                    Utils.RunJavaScript(this, "type=2;errmsg='操作失败，请重试！" + "';id='" + model.LableID + "'");
                    break;
            }
        }

    }
}
