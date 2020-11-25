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
        ZWL.Common.PublicMethod.CheckSession();

        if (!Page.IsPostBack)
        {
            LineContent = "";
            ContentLable = "";
            FlowNumber.Text = Request.QueryString["WorkFlowID"].ToString();
            string SQL_GetList = "select * from ERPNWorkFlowNode   where  WorkFlowID=" + Request.QueryString["WorkFlowID"] + "  order by NodeSerils asc,ID desc";
            DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet(SQL_GetList);
            int i1 = 20;
            for (int jkl = 0; jkl < MYDT.Tables[0].Rows.Count; jkl++)
            {
                //生成的方块偏左
                int xleft = 250;
                //生成的方块高度+60
                int xtop = i1;
                //生成工作流节点块
                if (MYDT.Tables[0].Rows[jkl]["NodeAddr"].ToString() == "开始")
                {
                    ContentLable += "<vml:roundrect id=" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + " ondblclick=Edit_Process(" + MYDT.Tables[0].Rows[jkl]["ID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: " + ReturnDefault("10", MYDT.Tables[0].Rows[jkl]["NodeLeft"].ToString()) + "px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: " + ReturnDefault("100", MYDT.Tables[0].Rows[jkl]["NodeTop"].ToString()) + "px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：" + MYDT.Tables[0].Rows[jkl]["NextNode"].ToString() + "&#13;&#10;--&#13;&#10;默认审批：" + MYDT.Tables[0].Rows[jkl]["SPDefaultList"].ToString() + "&#13;&#10;--&#13;&#10;审批选择模式：" + MYDT.Tables[0].Rows[jkl]["SPType"].ToString() + "&#13;&#10;--&#13;&#10;评审模式：" + MYDT.Tables[0].Rows[jkl]["PSType"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + MYDT.Tables[0].Rows[jkl]["JieShuHours"].ToString() + "小时未审批自动催办\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#00EE00\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "</b><br>" + MYDT.Tables[0].Rows[jkl]["NodeName"].ToString() + "\" passCount=\"0\" flowType=\"start\" table_id=\"" + MYDT.Tables[0].Rows[jkl]["ID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "</B><BR>" + MYDT.Tables[0].Rows[jkl]["NodeName"].ToString() + "</vml:textbox></vml:roundrect>";

                }
                else if (MYDT.Tables[0].Rows[jkl]["NodeAddr"].ToString() == "结束")
                {
                    ContentLable += "<vml:roundrect id=" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + " ondblclick=Edit_Process(" + MYDT.Tables[0].Rows[jkl]["ID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: " + ReturnDefault("500", MYDT.Tables[0].Rows[jkl]["NodeLeft"].ToString()) + "px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: " + ReturnDefault("100", MYDT.Tables[0].Rows[jkl]["NodeTop"].ToString()) + "px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：结束&#13;&#10;--&#13;&#10;默认审批：" + MYDT.Tables[0].Rows[jkl]["SPDefaultList"].ToString() + "&#13;&#10;--&#13;&#10;审批选择模式：" + MYDT.Tables[0].Rows[jkl]["SPType"].ToString() + "&#13;&#10;--&#13;&#10;评审模式：" + MYDT.Tables[0].Rows[jkl]["PSType"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + MYDT.Tables[0].Rows[jkl]["JieShuHours"].ToString() + "小时未审批自动催办\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#F4A8BD\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "</b><br>" + MYDT.Tables[0].Rows[jkl]["NodeName"].ToString() + "\" passCount=\"0\" flowType=\"end\" table_id=\"" + MYDT.Tables[0].Rows[jkl]["ID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "</B><BR>" + MYDT.Tables[0].Rows[jkl]["NodeName"].ToString() + "</vml:textbox></vml:roundrect>";

                }
                else
                {
                    //生成的方块高度+60
                    i1 = i1 + 80;
                    ContentLable += "<vml:roundrect id=" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + " ondblclick=Edit_Process(" + MYDT.Tables[0].Rows[jkl]["ID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: " + ReturnDefault(xleft.ToString(), MYDT.Tables[0].Rows[jkl]["NodeLeft"].ToString()) + "px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: " + ReturnDefault(xtop.ToString(), MYDT.Tables[0].Rows[jkl]["NodeTop"].ToString()) + "px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：" + MYDT.Tables[0].Rows[jkl]["NextNode"].ToString() + "&#13;&#10;--&#13;&#10;默认审批：" + MYDT.Tables[0].Rows[jkl]["SPDefaultList"].ToString() + "&#13;&#10;--&#13;&#10;审批选择模式：" + MYDT.Tables[0].Rows[jkl]["SPType"].ToString() + "&#13;&#10;--&#13;&#10;评审模式：" + MYDT.Tables[0].Rows[jkl]["PSType"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + MYDT.Tables[0].Rows[jkl]["JieShuHours"].ToString() + "小时未审批自动催办\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#EEEEEE\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "</b><br>" + MYDT.Tables[0].Rows[jkl]["NodeName"].ToString() + "\" passCount=\"0\" flowType=\"\" table_id=\"" + MYDT.Tables[0].Rows[jkl]["ID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "</B><BR>" + MYDT.Tables[0].Rows[jkl]["NodeName"].ToString() + "</vml:textbox></vml:roundrect>";

                }        
                //生成工作流箭头线条
                if (MYDT.Tables[0].Rows[jkl]["NodeAddr"].ToString() != "结束")
                {
                    string[] MyNextNode = MYDT.Tables[0].Rows[jkl]["NextNode"].ToString().Split(',');
                    for (int i = 0; i < MyNextNode.Length; i++)
                    {
                        LineContent = LineContent + "<vml:line title=\"\" style=\"DISPLAY: none; Z-INDEX: 2; POSITION: absolute\" to=\"0,0\" from=\"0,0\" coordsize=\"21600,21600\" arcsize=\"4321f\" object=\"" + MyNextNode[i].ToString() + "\" source=\"" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "\" mfrID=\"" + MYDT.Tables[0].Rows[jkl]["NodeSerils"].ToString() + "\"><vml:stroke endarrow=\"block\"></vml:stroke><vml:shadow offset=\"1px,1px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow></vml:line>";
                    }
                }
            }

            if (LineContent.Trim().Length == 0)
            {
                LineContent = "<br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style=\"color: #990033;font-size:12px;\">当前流程未定义任何审批节点！请先进行“节点定义”！</strong>";
            }
        }
    }

    /// <summary>
    /// 后一个参数是否为空或者为0，如果是用前面的默认值，否则返回自身
    /// </summary>
    /// <param name="DefaultStr"></param>
    /// <param name="PanDuanStr"></param>
    /// <returns></returns>
    public string ReturnDefault(string DefaultStr, string PanDuanStr)
    {
        string ReturnStr = DefaultStr;
        if (PanDuanStr.Trim().Length > 0 && PanDuanStr.Trim() != "0")
        {
            ReturnStr = PanDuanStr;
        }
        return ReturnStr;
    }
}
