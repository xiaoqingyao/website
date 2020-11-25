using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using AllPower.Common;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      
    创建时间：  
 
// 更新日期        更新人      更新原因/内容
//2010年9月10日   胡志瑶      页面大小、
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class LableFreeFirstEdit : AdminPage
    {
        public string List1 = string.Empty;
        public string List2 = string.Empty;
        public string JoinFlds1 = string.Empty;        
        public string JoinFlds2 = string.Empty;
        public string lblsql = string.Empty;
        public string TopNum = string.Empty;
        public string TabList1 = string.Empty;
        public string TabList2 = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region AJAX
            if (Request.Form["Option"] != null && Request.Form["Option"].Equals("GetFields") && Request.Form["TableName"] != null && !Request.Form["TableName"].Equals(""))
            {
                IList<AllPower.Model.SysManage.TableInfo> tbFields = new AllPower.BLL.Template.Lable().GetFields(Request.Form["TableName"]);
                int i = 0;
                foreach (AllPower.Model.SysManage.TableInfo model in tbFields)
                {
                    if (i > 0)
                        Response.Write(";");
                    Response.Write(model.TableName + "," + model.TableType);
                    i++;
                }
                Response.End();
            }
            //判断sql语句是否正确
            if (Request.Form["Option"] == "checksql")
            {
                string pattern = @"select(\s+top\s\d+)?\s+(?<fields>.+?)\s+from";
                Regex reg = new Regex(pattern, RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = reg.Match(Request["SqlStr"]);
                if (m.Success)
                {
                    string Fields = m.Groups["fields"].Value.Trim();
                    if (Fields.Equals(""))
                    {
                        Response.Write("SQL语句无效,没有要显示的字段名!");  //没有要显示的字段名
                        Response.End();
                    }
                    else
                    {
                        Response.Write("SQL语句检测成功!");  //成功
                        Response.End();
                    }
                }
                else
                {
                    Response.Write("语句非法或无效!");  //失败
                    Response.End();
                }
            }
            
            #endregion AJAX
            if (!Page.IsPostBack)
            {
                PageInit();
            }

        }

        private void PageInit()
        {
            string tab1 = "", tab2 = "";
            AllPower.Model.Template.LableFreeInfo freeModel = null;
            int freeId = 0;
            if (Request.QueryString["id"] != null)
            {
                freeId = Convert.ToInt32(Request.QueryString["id"].ToString());
                string action = Request.QueryString["action"];
                hidAction.Value = action;
                hidId.Value = freeId.ToString();

                freeModel = new AllPower.BLL.Template.Lable().GetLableFreeInfo(freeId);
                lblsql = freeModel.LabelSQL;
                lblIdentification.Text = freeModel.LableName.ToString().Substring(0, freeModel.LableName.LastIndexOf('_') + 1);
                TxtName.Text = freeModel.Title;
                if (Action.ToUpperInvariant() == "COPY")
                {
                    TxtName.Text = "复制" + TxtName.Text; 
                }
                       
                string pattern = @"select\s(top\s(?<tp>\d+)\s)?(?<flds>.+?)\sfrom\s(?<tb1>[^\s,]+)(,(?<tb2>\S+))?(\s?where\s(?<con>.+))?";
                if (lblsql.ToLower().IndexOf(" order by ") > 0)
                    pattern += @"\sorder\sby\s(?<odr>.+)";
                Regex reg = new Regex(pattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
                Match m = reg.Match(lblsql);
                if (m.Success)
                {
                    string con = "", ord = "";
                    string flds = m.Groups["flds"].Value.Trim();
                    tab1 = m.Groups["tb1"].Value.Trim();
                    if (m.Groups["tp"] != null) TopNum = m.Groups["tp"].Value.Trim();
                    if (m.Groups["tb2"] != null) tab2 = m.Groups["tb2"].Value.Trim();
                    if (m.Groups["con"] != null) con = m.Groups["con"].Value.Trim();
                    if (m.Groups["odr"] != null) ord = m.Groups["odr"].Value.Trim();

                    TxtNum.Text = TopNum;

                    bool flagdbl = false;
                    string jnfld1 = "", jnfld2 = "";
                    if (!tab1.Equals("") && !tab2.Equals(""))
                    {
                        flagdbl = true;
                        string profile = tab1 + @"\.(?<jn1>[^=]+)\s?=\s?" + tab2 + @"\.(?<jn2>\S+)";
                        Regex regex = new Regex(profile, RegexOptions.Compiled | RegexOptions.IgnoreCase);
                        Match match = regex.Match(con);
                        if (match.Success)
                        {
                            jnfld1 = match.Groups["jn1"].Value.Trim();
                            jnfld2 = match.Groups["jn2"].Value.Trim();
                            con = regex.Replace(con, "");
                        }
                    }
                    if (!tab1.Equals(""))
                    {
                        string option = "";
                        List1 = GetFields(freeModel, tab1, flds, con, ord, flagdbl, jnfld1, out option);
                        JoinFlds1 = option;
                    }
                    if (!tab2.Equals(""))
                    {
                        string option = "";
                        List2 = GetFields(freeModel, tab2, flds, con, ord, flagdbl, jnfld2, out option);
                        JoinFlds2 = option;
                    }
                }
            }
            else
            {
                TxtNum.Text = "10";
            }

            IList<AllPower.Model.SysManage.TableInfo> tableList = new AllPower.BLL.Template.Lable().GetDbTable();
            if (tableList != null)
            {

                foreach (AllPower.Model.SysManage.TableInfo model in tableList)
                {
                    TabList1 += "<option";
                    if (model.TableName.Equals(tab1))
                        TabList1 += " selected=\"selected\"";
                    TabList1 += " value=\"" + model.TableName + "\">" + model.TableName + "</option>\r";
                    TabList2 += "<option";
                    if (model.TableName.Equals(tab2))
                        TabList2 += " selected=\"selected\"";
                    TabList2 += " value=\"" + model.TableName + "\">" + model.TableName + "</option>\r";
                }
            }
        }
      

       

        private string GetFields(AllPower.Model.Template.LableFreeInfo model, string tabnm, string fdlst, string cond, string ordr, bool dbflag, string jnfld, out string opt)
        {
            string ret = "";
            opt = "";
            IList<AllPower.Model.SysManage.TableInfo> fds = new AllPower.BLL.Template.Lable().GetFields(tabnm);
            foreach (AllPower.Model.SysManage.TableInfo info in fds)
            {
                opt += "<option";
                if (info.TableName == jnfld)
                    opt += " selected=\"selected\"";
                opt += " value=\"" + info.TableName + "\">" + info.TableName + "</option>\r";
                string fld = info.TableName;
                if (dbflag)
                    fld = tabnm + "." + info.TableName;
                ret += "<tr style=\"cursor:hand\" onclick=\"RowClick(this)\" height=\"22\">\r";
                ret += "<td>" + info.TableName + "</td>\r";
                ret += "<td>" + info.TableType + "</td>\r<td align=\"center\">";
                if (fdlst.IndexOf(fld) >= 0)
                    ret += "√";
                ret += "</td>\r<td align=\"center\">";
                if (cond.IndexOf(fld) >= 0)
                {
                    string pattern = fld + @"\s?(?<con>\S+\s*\S+)";
                    Regex reg = new Regex(pattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
                    Match m = reg.Match(cond);
                    if (m.Success)
                    {
                        string con = m.Groups["con"].Value.Trim();
                        ret += con;
                    }
                }
                ret += "</td>\r<td align=\"center\">";
                if (ordr.IndexOf(fld + " ASC") >= 0)
                    ret += "升序";
                else if (ordr.IndexOf(fld + " DESC") >= 0)
                    ret += "降序";
                ret += "</td>\r</tr>";
            }
            return ret;
        }
    }
}
