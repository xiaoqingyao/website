using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
using System.Data;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 全能系统

    作者:      阿波
    创建时间： 2010年3月31日

    功能描述： 栏目管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class typeclasslist : AdminPage
    {
        protected ModuleNode BllModuleNode = new ModuleNode();
        private StringBuilder sb = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                sb.Append("\n<script Type='text/javascript'>").Append("\n");
                sb.Append("<!--").Append("\n");
                sb.Append("d = new dTree('d');").Append("\n");
                sb.Append("d.config.closeSameLevel=true;");

                //读取数据 

                string sql = "select * from K_Types where menuid='{0}'   order by orders asc";
                sql = string.Format(sql, "105015002");
                DataTable dt = AllPower.Common.Tools.GetDataSet(sql);

                if (dt != null)
                {
                    try
                    {
                        CreateTree(dt, "00");
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

 

        private void CreateTree(DataTable dt, string parentNode)
        {
            string parentid = "";
            DataRow[] dr1 = dt.Select("typeparent='" + parentNode + "'", "orders ASC");
            //foreach (DataRow dr in dt.Rows)
            for (int i = 0; i < dr1.Length; i++)
            {
                DataRow dr = dr1[i];
               

                string strPer = "&nbsp;&nbsp;";

                if (dr["typeid"].ToString().Length <= 3)
                {
                    parentid = "-1";
                }
                else
                {
                    parentid = dr["typeid"].ToString().Substring(0, dr["typeid"].ToString().Length - 3);
                }

              

                if (dr["typeexpandint"].ToString() == "1")
                {

                    strPer += "<a HREF=typeclassedit.aspx?Action=New&typeid=" + dr["typeid"] + "&menuid=" + dr["menuid"] + "&IsParent=" + dr["typeexpandint"] + "&typeparent=" + dr["typeparent"] + " title=添加子栏目><img SRC=../images/folder.gif border=0 style=padding-right:5px;padding-left:5px></a>";

                    strPer += "<a HREF=typeclassedit.aspx?Action=Edit&typeid=" + dr["typeid"] + "&menuid=" + dr["menuid"] + "&IsParent=" + dr["typeexpandint"] + "&typeparent=" + dr["typeparent"] + " title=修改><img SRC=../images/pen.gif border=0   style=padding-right:5px;padding-left:5px></a>";
  

                    if (dr["ispub"].ToString() != "1")
                        strPer += "未发布";

                    sb.Append("d.add(").Append(dr["typeid"]).Append(",")
                            .Append(parentid).Append(",'").Append(dr["typename"]).Append(strPer)
                            .Append("');").Append("\n");

                    CreateTree(dt, dr["typeid"].ToString());
                }
                else
                {
                    strPer += "<a HREF=typeclassedit.aspx?Action=Edit&typeid=" + dr["typeid"] + "&menuid=" + dr["menuid"] + "&IsParent=" + dr["typeexpandint"] + "&typeparent=" + dr["typeparent"] + " title=修改><img SRC=../images/pen.gif border=0   style=padding-right:5px;padding-left:5px></a>";
            
                    if (dr["ispub"].ToString() != "1")
                        strPer += "未发布";
                    sb.Append("d.add(").Append(dr["typeid"]).Append(",")
                            .Append(parentid).Append(",'").Append(dr["typename"]).Append(strPer)
                            .Append("');").Append("\n");
                }


            }
        }
    }
}
