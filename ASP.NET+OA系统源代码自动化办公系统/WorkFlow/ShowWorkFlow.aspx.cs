using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class WorkFlow_ShowWorkFlow : System.Web.UI.Page
{    
    public static string ContentLable, LineContent;
    protected void Page_Load(object sender, EventArgs e)
    {
        SDLX.Common.PublicMethod.CheckSession();

        if (!Page.IsPostBack)
        {
            LineContent = "";
            ContentLable = "";
            FlowNumber.Text = Request.QueryString["ID"].ToString();
            string SQL_GetList = "select * from ERPWorkFlowJieDian   where  WorkFlowID='" + Request.QueryString["ID"] + "'  ";
            SqlDataReader NewReader = SDLX.DBUtility.DbHelperSQL.GetDataReader(SQL_GetList);
            int i1 = 20;
            while (NewReader.Read())
            {
                //生成的方块偏左
                int xleft = 250;
                //生成的方块高度+60
                int xtop =i1;
                //生成工作流节点块
                if (NewReader["JieDianAddr"].ToString() == "开始")
                {
                    ContentLable += "<vml:roundrect id=" + NewReader["JieDianSerils"].ToString() + " ondblclick=Edit_Process(" + NewReader["ID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: 10px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: 100px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：" + NewReader["NextJieDianSerils"].ToString() + "&#13;&#10;--&#13;&#10;经办人姓名：" + NewReader["JingBanRenYuanList"].ToString() + "&#13;&#10;--&#13;&#10;审批人员选择：" + NewReader["ShengPiUserSetting"].ToString() + "&#13;&#10;--&#13;&#10;评审模式：" + NewReader["PingShenMoShi"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + NewReader["JieShuHours"].ToString() + "小时未审批自动结束\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#00EE00\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + NewReader["JieDianSerils"].ToString() + "</b><br>" + NewReader["JieDianName"].ToString() + "\" passCount=\"0\" flowType=\"start\" table_id=\"" + NewReader["ID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + NewReader["JieDianSerils"].ToString() + "</B><BR>" + NewReader["JieDianName"].ToString() + "</vml:textbox></vml:roundrect>";

                }
                else if (NewReader["JieDianAddr"].ToString() == "结束")
                {
                    ContentLable += "<vml:roundrect id=" + NewReader["JieDianSerils"].ToString() + " ondblclick=Edit_Process(" + NewReader["ID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: 500px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: 100px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：结束&#13;&#10;--&#13;&#10;经办人姓名：" + NewReader["JingBanRenYuanList"].ToString() + "&#13;&#10;--&#13;&#10;审批人员选择：" + NewReader["ShengPiUserSetting"].ToString() + "&#13;&#10;--&#13;&#10;评审模式：" + NewReader["PingShenMoShi"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + NewReader["JieShuHours"].ToString() + "小时未审批自动结束\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#F4A8BD\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + NewReader["JieDianSerils"].ToString() + "</b><br>" + NewReader["JieDianName"].ToString() + "\" passCount=\"0\" flowType=\"end\" table_id=\"" + NewReader["ID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + NewReader["JieDianSerils"].ToString() + "</B><BR>" + NewReader["JieDianName"].ToString() + "</vml:textbox></vml:roundrect>";

                }
                else
                {
                    //生成的方块高度+60
                    i1 = i1 + 80;
                    ContentLable += "<vml:roundrect id=" + NewReader["JieDianSerils"].ToString() + " ondblclick=Edit_Process(" + NewReader["ID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: " + xleft.ToString()+ "px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: "+xtop.ToString()+"px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：" + NewReader["NextJieDianSerils"].ToString() + "&#13;&#10;--&#13;&#10;经办人姓名：" + NewReader["JingBanRenYuanList"].ToString() + "&#13;&#10;--&#13;&#10;审批人员选择：" + NewReader["ShengPiUserSetting"].ToString() + "&#13;&#10;--&#13;&#10;评审模式：" + NewReader["PingShenMoShi"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + NewReader["JieShuHours"].ToString() + "小时未审批自动结束\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#EEEEEE\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + NewReader["JieDianSerils"].ToString() + "</b><br>" + NewReader["JieDianName"].ToString() + "\" passCount=\"0\" flowType=\"\" table_id=\"" + NewReader["ID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + NewReader["JieDianSerils"].ToString() + "</B><BR>" + NewReader["JieDianName"].ToString() + "</vml:textbox></vml:roundrect>";

                }               
                //生成工作流箭头线条
                if (NewReader["JieDianAddr"].ToString() != "结束")
                {
                    string[] MyNextNode = NewReader["NextJieDianSerils"].ToString().Split(',');
                    for (int i = 0; i < MyNextNode.Length; i++)
                    {
                        LineContent = LineContent + "<vml:line title=\"\" style=\"DISPLAY: none; Z-INDEX: 2; POSITION: absolute\" to=\"0,0\" from=\"0,0\" coordsize=\"21600,21600\" arcsize=\"4321f\" object=\"" + MyNextNode[i].ToString() + "\" source=\"" + NewReader["JieDianSerils"].ToString() + "\" mfrID=\"" + NewReader["JieDianSerils"].ToString() + "\"><vml:stroke endarrow=\"block\"></vml:stroke><vml:shadow offset=\"1px,1px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow></vml:line>";
                    }
                }
            }
            NewReader.Close();
        }
    }
}
