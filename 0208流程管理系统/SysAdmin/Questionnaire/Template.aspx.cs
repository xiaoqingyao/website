using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AllPower.Common;
using System.Xml;
using System.Xml.XPath;
using System.Text;
using System.IO;

namespace AllPower.WEB.SysAdmin.Questionnaire
{
    public partial class Template : System.Web.UI.Page
    {
        protected string jsMessage;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PageInit();
            }
        }

        void PageInit()
        {
            SqlParameter[] selParam;
            XmlDocument xmlDOC;
            XPathNavigator xpathNav;
            XPathNavigator nodeNav;
            object showTemplate;
            byte[] xmlByte;

            selParam = new SqlParameter[] { new SqlParameter("@ID", Request.QueryString["ID"]) };

            try
            {
                xmlDOC = new XmlDocument();
                showTemplate = SQLHelper.ExecuteScalar(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, "select ShowTemplate from K_Questionnaire where ID=@ID", selParam);
                xmlByte = Encoding.UTF8.GetBytes(showTemplate.ToString());

                using (MemoryStream xmlStream = new MemoryStream(xmlByte))
                {
                    xmlDOC.Load(xmlStream);
                }
            }
            catch { xmlDOC = null; }

            if (xmlDOC != null)
            {
                xpathNav = xmlDOC.CreateNavigator();
                nodeNav = xpathNav.SelectSingleNode("/Root/Single");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    txtSingleSel.Text = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/Multi");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    txtMultiSel.Text = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/Answer");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    txtAnswer.Text = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/SingleTitle");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    txtSingleSelTitle.Text = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/MultiTitle");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    txtMultiSelTitle.Text = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/AnswerTitle");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    txtAnswerTitle.Text = nodeNav.Value;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string editSQL;
            List<SqlParameter> lstEditParam;
            int effectRow;

            lstEditParam = new List<SqlParameter>();

            effectRow = 0;

            lstEditParam.Add(new SqlParameter("@ID", Request.QueryString["ID"]));
            lstEditParam.Add(new SqlParameter("@ShowTemplate", GetXmlDoc()));

            editSQL = "UPDATE K_Questionnaire SET ShowTemplate=@ShowTemplate WHERE ID=@ID;";

            try
            {
                effectRow = SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            if (effectRow > 0)
            {
                jsMessage = "alertClose({title:\"操作提示\",msg:\"恭喜您，操作成功！\"},function(data){location.href='QuestionnaireList.aspx';});";
            }
            else
            {
                jsMessage = "alert({title:\"操作提示\",msg:\"对不起，操作失败，请重试。\"});";
            }
        }

        string GetXmlDoc()
        {
            StringBuilder sbXML;

            sbXML = new StringBuilder();

            sbXML.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
            sbXML.Append("<Root>");
            sbXML.Append("<SingleTitle><![CDATA[");
            sbXML.Append(txtSingleSelTitle.Text);
            sbXML.Append("]]></SingleTitle>");
            sbXML.Append("<Single><![CDATA[");
            sbXML.Append(txtSingleSel.Text);
            sbXML.Append("]]></Single>");
            sbXML.Append("<MultiTitle><![CDATA[");
            sbXML.Append(txtMultiSelTitle.Text);
            sbXML.Append("]]></MultiTitle>");
            sbXML.Append("<Multi><![CDATA[");
            sbXML.Append(txtMultiSel.Text);
            sbXML.Append("]]></Multi>");
            sbXML.Append("<AnswerTitle><![CDATA[");
            sbXML.Append(txtAnswerTitle.Text);
            sbXML.Append("]]></AnswerTitle>");
            sbXML.Append("<Answer><![CDATA[");
            sbXML.Append(txtAnswer.Text);
            sbXML.Append("]]></Answer>"); 
            sbXML.Append("</Root>");

            return sbXML.ToString();
        }
    }
}
