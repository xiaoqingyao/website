using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.BLL.SysManage;
using System.Data;
using AllPower.Web.Admin;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月19日
    功能描述： 模板节点管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class TemplateNodeManage : AllPower.Web.Admin.AdminPage
    {
        #region  URL参数
        private string _templateid = null;
        public string TemplateID
        {
            get
            {
                if (this._templateid == null)
                {
                    this._templateid = Request.QueryString["TemplateID"];
                    // 参数格式验证，非法则重置为空字符串
                }
                return this._templateid;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               
                StringBuilder sb = new StringBuilder();
                sb.Append("\n<script Type='text/javascript'>").Append("\n");
                sb.Append("<!--").Append("\n");
                sb.Append("d = new dTree('d');").Append("\n");
                sb.Append("d.config.closeSameLevel=true;");

                //读取数据 
                AllPower.BLL.SysManage.WebSiteTemplateNode bll = new AllPower.BLL.SysManage.WebSiteTemplateNode();
                DataTable dt = bll.GetList("WEBSITE", Utils.getOneParams(TemplateID));

                if (dt != null)
                {
                    try
                    {
                        string stremp2 = dt.Rows.Count.ToString();
                        string parentid = "";
                        foreach (DataRow dr in dt.Rows)
                        {
                            if (dr["NodeCode"].ToString().Length <= 3)
                            {
                                parentid = "-1";
                            }
                            else
                            {
                                parentid = dr["NodeCode"].ToString().Substring(0, dr["NodeCode"].ToString().Length - 3);
                            }
                            string strPer = "&nbsp;&nbsp;<a HREF=TemplateNodeEdit.aspx?Action=New&TemplateID=" + TemplateID + "&NodeCode=" + dr["NodeCode"] + "&IsFolder=" + dr["NodeType"] + "&Nodeid=" + NodeID + "><img SRC=../images/folder.gif border=0 alt=添加子栏目></a>&nbsp;&nbsp;<a HREF=TemplateNodeEdit.aspx?Action=Edit&ID=" + dr["ID"] + "&TemplateID=" + TemplateID + "&NodeCode=" + dr["NodeCode"] + "><img SRC=../images/pen.gif border=0 alt=修改></a>";
                            //if (parentid == "-1")
                            //{
                            //    sb.Append("d.add(").Append(dr["NodeCode"]).Append(",")
                            //        .Append(parentid).Append(",'").Append(dr["NodeName"])
                            //        .Append("');").Append("\n");
                            //}
                            //else
                            //{
                                sb.Append("d.add(").Append(dr["NodeCode"]).Append(",")
                                        .Append(parentid).Append(",'").Append(dr["NodeName"]).Append(strPer)
                                        .Append("');").Append("\n");
                            //}
                        }
                    }
                    catch (Exception err)
                    {
                        string stremp = err.Message;
                    }
                }

                sb.Append("document.write(d);").Append("\n");
                //打开所有节点     
                sb.Append(" d.openAll();").Append("\n");
                sb.Append("//-->").Append("\n");
                sb.Append("</script>").Append("\n");
                menutree.InnerHtml = sb.ToString();

            }
        }

        //新增按钮
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("TemplateNodeEdit.aspx?Action=NEWPARENTNODE&IsFolder=1&TemplateID=" + this.TemplateID + "&NodeID=" + NodeID);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有新增模板节点的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
