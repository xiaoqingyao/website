using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using AllPower.Web.Admin;
using AllPower.Common;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:     胡志瑶
    创建时间： 2010年9月15日
    功能描述： 系统标签/通用列表类型
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class PublicListType : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["op"] == "getfields")
                {
                    Response.Write(GetFields(Request.QueryString["modelID"]));
                    Response.End();
                }
                AllPower.BLL.Template.Lable lableBll = new AllPower.BLL.Template.Lable();
                //页面初始化
                string id = Request.QueryString["id"];
                if (id != null)
                {
                    DataTable dt = lableBll.GetLable("OneLable", Utils.getOneParams(id)).Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        ltlJs.Text = "<script>SetAttribute('" + dt.Rows[0]["LableContent"].ToString().Replace("\r\n", "::br::") + "');</script>";                        
                    }
                }
              
                BindData();
                TableName.Attributes.Add("onchange", "getfields('')");
            }
        }

        private string GetFields(string tableName)
        {
            //获得模型字段               
            DataTable dt = new BLL.Content.FieldManage("", "").GetList("GETFIELDBYTABLENAME", Utils.getOneParams(tableName));
            StringBuilder strBtns = new StringBuilder();
            foreach(DataRow dr in dt.Rows)
            {
                strBtns.Append("<input type=button class=abtn id=" + dr["Name"] + " value=" + dr["FieldAlias"] + " onclick=showDailog('" + dr["Name"] + "','" + dr["BasicField"] + "') /> ");
            }
            strBtns.Append("|");
            //获得栏目
            AllPower.BLL.SysManage.ModuleNode module = new AllPower.BLL.SysManage.ModuleNode();
            DataView dv = new DataView(module.Publish_GetNodeFromCache());
            dv.RowFilter = "TableName='" + tableName + "' and WebSiteID=" + SiteID + "";
            foreach (DataRow dr in dv.ToTable().Rows)
            {
                strBtns.Append("<option value='" + dr["NodeCode"] + "'>" + dr["NodeName"] + "</option>");
            }
            return strBtns.ToString();
        }

        private void BindData()
        {
            AllPower.BLL.SysManage.Module module = new AllPower.BLL.SysManage.Module();

            DataTable dt = module.GetList("ALLBYTABLENAME", Utils.getOneParams(""));
            DataView dv = new DataView(dt);
            dv.RowFilter = " TableName<>'K_U_Commend'";   //去掉推荐模型
            //绑定模型下拉列表
            TableName.DataSource = dv.ToTable();
            TableName.DataTextField = "ModuleName";
            TableName.DataValueField = "TableName";
            TableName.DataBind();
            //初始化字段名
            ClientScript.RegisterStartupScript(GetType(), "aa", "$('#spanFields').html(\"" + GetFields(TableName.SelectedValue).Split('|')[0] + "\");", true);
        }
    }
}
