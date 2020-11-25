using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.XPath;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace AllPower.WEB.SysAdmin
{
    public partial class QuestionnaireList : System.Web.UI.Page
    {
        protected string jsMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            string editSQL;
            List<SqlParameter> lstEditParam;

            lstEditParam = new List<SqlParameter>();

            lstEditParam.Add(new SqlParameter("@ID", e.CommandName));
            editSQL = "update K_Questionnaire set IsEnable=@IsEnable where ID=@ID";

            if (Common.Utils.ParseBool(e.CommandArgument))
            {
                lstEditParam.Add(new SqlParameter("@IsEnable", false));
            }
            else
            {
                lstEditParam.Add(new SqlParameter("@IsEnable", true));
            }

            try
            {
                SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            PageInit();
        }

        protected void Delete(object sender, CommandEventArgs e)
        {
            string editSQL;
            List<SqlParameter> lstEditParam;

            lstEditParam = new List<SqlParameter>();

            lstEditParam.Add(new SqlParameter("@ID", e.CommandArgument));
            editSQL = "DELETE FROM  K_Questionnaire where ID=@ID";

            try
            {
                SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            Response.Redirect("QuestionnaireList.aspx");
        }

        void PageInit()
        {
            DataTable dt;
            SqlDataReader sqlReader;
            string selSQL;

            dt = new DataTable();
            selSQL = "select * from K_Questionnaire";

            try
            {
                sqlReader = SQLHelper.ExecuteReader(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, selSQL, null);
                dt.Load(sqlReader);
                rptQuest.DataSource = dt;
                rptQuest.DataBind();
            }
            catch { }
        }

        protected void Create(object sender, CommandEventArgs e)
        {
            string editSQL;
            List<SqlParameter> lstEditParam;
            int effectRow;
            string htmlCode;

            lstEditParam = new List<SqlParameter>();

            htmlCode = GetHtmlCode(e.CommandArgument.ToString());
            effectRow = 0;

            lstEditParam.Add(new SqlParameter("@ID", e.CommandArgument));
            lstEditParam.Add(new SqlParameter("@HtmlCode", htmlCode));

            editSQL = "UPDATE K_Questionnaire SET HtmlCode=@HtmlCode WHERE ID=@ID;";

            try
            {
                effectRow = SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            if (effectRow > 0)
            {
                if (!Directory.Exists(Server.MapPath("/Questionnaire_Tag/")))
                {
                    Directory.CreateDirectory(Server.MapPath("/Questionnaire_Tag/"));
                }

                File.WriteAllText(Server.MapPath("/Questionnaire_Tag/" + e.CommandArgument.ToString() + ".txt"), DateTime.Now.ToString());

                jsMessage = "alert({title:\"操作提示\",msg:\"恭喜您，生成成功！\"});";
            }
            else
            {
                jsMessage = "alert({title:\"操作提示\",msg:\"对不起，生成失败，请重试。\"});";
            }
        }

        string GetHtmlCode(string id)
        {
            DataTable dt;
            ItemTemplate item;
            StringBuilder sbHtmlCode;

            sbHtmlCode = new StringBuilder();

            dt = GetQuestionnaireItem(Common.Utils.ParseInt(id, 0));
            item = GetTemplate(Common.Utils.ParseInt(id, 0));

            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    switch (dr["ItemType"].ToString())
                    {
                        case "1":       // 单选
                            sbHtmlCode.Append(Regex.Replace(item.SingleHeader, @"\[#content#\]", dr["Title"].ToString(), RegexOptions.IgnoreCase | RegexOptions.Singleline));
                            sbHtmlCode.Append(item.SingleItemHeader);
                            sbHtmlCode.Append(GenerateList(dr["ID"].ToString(),item.SingleItem, dr["Item"].ToString().Split(new string[]{"\r\n"},StringSplitOptions.RemoveEmptyEntries),true));
                            sbHtmlCode.Append(item.SingleItemFooter);
                            break;
                        case "2":       // 多选
                            sbHtmlCode.Append(Regex.Replace(item.MultiHeader, @"\[#content#\]", dr["Title"].ToString(), RegexOptions.IgnoreCase | RegexOptions.Singleline));
                            sbHtmlCode.Append(item.MultiItemHeader);
                            sbHtmlCode.Append(GenerateList(dr["ID"].ToString(),item.MultiItem, dr["Item"].ToString().Split(new string[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries), false));
                            sbHtmlCode.Append(item.MultiItemFooter);
                            break;
                        case "3":       // 问答
                            sbHtmlCode.Append(Regex.Replace(item.AnserHeader, @"\[#content#\]", dr["Title"].ToString(), RegexOptions.IgnoreCase | RegexOptions.Singleline));
                            sbHtmlCode.Append(Regex.Replace(item.Anser, @"\[#content#\]", "<textarea name=\"Q_"+ dr["ID"].ToString() +"\" id=\"Q_"+ dr["ID"].ToString() +"\"></textarea>", RegexOptions.IgnoreCase | RegexOptions.Singleline));
                            break;
                    }
                }
            }

            return sbHtmlCode.ToString();
        }

        string GenerateList(string id,string template,string[] arrItem,bool isSingle)
        {
            StringBuilder sbList;
            string lableID;
            int i = 0;

            sbList = new StringBuilder();

            foreach (string item in arrItem)
            {
                lableID = Guid.NewGuid().ToString();

                if (isSingle)
                {
                    sbList.Append(Regex.Replace(template, @"\[#content#\]", "<input type=\"radio\" value=\""+ i.ToString() +"\" name=\"Q_" + id + "\" id=\"" + lableID + "\" /><label for=\"" + lableID + "\">" + item + "</label>", RegexOptions.IgnoreCase | RegexOptions.Singleline));
                }
                else
                {
                    sbList.Append(Regex.Replace(template, @"\[#content#\]", "<input type=\"checkbox\" value=\"" + i.ToString() + "\"  name=\"Q_" + id + "\" id=\"" + lableID + "\" /><label for=\"" + lableID + "\">" + item + "</label>", RegexOptions.IgnoreCase | RegexOptions.Singleline));
                }

                i++;
            }

            return sbList.ToString();
        }


        DataTable GetQuestionnaireItem(int id)
        {
            DataTable dt;
            SqlDataReader sqlReader;
            string selSQL;
            SqlParameter[] selParam;

            dt = new DataTable();
            selParam = new SqlParameter[] { new SqlParameter("@QID", id) };
            selSQL = "select * from K_QuestionnaireItem where IsEnable=1 and QID=@QID order by Orders asc";

            try
            {
                sqlReader = SQLHelper.ExecuteReader(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, selSQL, selParam);
                dt.Load(sqlReader);
            }
            catch { }

            return dt;
        }

        ItemTemplate GetTemplate(int id)
        {
            SqlParameter[] selParam;
            XmlDocument xmlDOC;
            XPathNavigator xpathNav;
            XPathNavigator nodeNav;
            object showTemplate;
            byte[] xmlByte;
            ItemTemplate item;
            string[] temp;

            selParam = new SqlParameter[] { new SqlParameter("@ID", id) };
            item = new ItemTemplate();

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
                    temp = nodeNav.Value.Split(new string[] { "[loop]", "[/loop]" }, StringSplitOptions.None);

                    try
                    {
                        item.SingleItemHeader = temp[0];
                        item.SingleItem = temp[1];
                        item.SingleItemFooter = temp[2];
                    }
                    catch { }
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/Multi");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    temp = nodeNav.Value.Split(new string[] { "[loop]", "[/loop]" }, StringSplitOptions.None);

                    try
                    {
                        item.MultiItemHeader = temp[0];
                        item.MultiItem = temp[1];
                        item.MultiItemFooter = temp[2];
                    }
                    catch { }
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/Answer");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    item.Anser = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/SingleTitle");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    item.SingleHeader = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/MultiTitle");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    item.MultiHeader = nodeNav.Value;
                }
                nodeNav = xpathNav.SelectSingleNode("/Root/AnswerTitle");

                if (nodeNav != null && nodeNav.MoveToFirstChild())
                {
                    item.AnserHeader = nodeNav.Value;
                }
            }

            return item;
        }

        struct ItemTemplate
        {
            public string SingleHeader;
            public string SingleItemHeader;
            public string SingleItem;
            public string SingleItemFooter;
            public string MultiHeader;
            public string MultiItemHeader;
            public string MultiItem;
            public string MultiItemFooter;
            public string AnserHeader;
            public string Anser;
        }
    }

}
