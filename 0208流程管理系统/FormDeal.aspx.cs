using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.BLL.Content;
using System.Data;
using KingTop.Common;
using System.Text;
using System.IO;

namespace KingTop.WEB.main.Plus.Form
{
    public partial class FormDeal : System.Web.UI.Page
    {
        #region  变量
        private string _nodeCode;
        private string _fromID;
        private string _siteID;
        KingTop.Model.SelectParams selParam;
        BLL.Content.FieldManage fieldManage;
        protected string jsMessage = string.Empty;
        #endregion

        #region 属性
        public string SiteID
        {
            get
            {
                if (string.IsNullOrEmpty(this._siteID))
                {
                    this._siteID = Request.Form["sid"];
                }

                return this._siteID;
            }
        }
        /// <summary>
        /// 节点NodeCode
        /// </summary>
        public string NodeCode
        {
            get
            {
                if (string.IsNullOrEmpty(this._nodeCode))
                {
                    this._nodeCode = Request.Form["nc"];
                }

                return this._nodeCode;
            }
        }

        /// <summary>
        /// 所属表单主键
        /// </summary>
        public string FormID
        {
            get
            {
                if (string.IsNullOrEmpty(this._fromID))
                {
                    this._fromID = Request.Form["SelfDefinedFormID"];
                }

                return this._fromID;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Save();
            }
        }

        /// <summary>
        /// 保存
        protected void Save()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            DataTable dtField;
            DataRow drManage;
            string fieldName;
            string fieldValue;


            fieldManage = new FieldManage(null, null);
            selParam = new KingTop.Model.SelectParams();
            selParam.S1 = FormID;
            BLL.Content.CustomForm bllCustomForm = new CustomForm();
            //得到当前表名
            dtField = bllCustomForm.GetList("ONE", selParam);

            if (dtField == null || dtField.Rows.Count < 1)
            {
                return;
            }
            else
            {
                drManage = dtField.Rows[0];
            }

            //判断IP段是否在限制之中
            BLL.Content.ControlFormEdit bllFormEdit = new KingTop.BLL.Content.ControlFormEdit();
            if (bllFormEdit.isLimitIP(drManage["SubmitLimitIP"].ToString()))  //如果存在此ip段中,则不让他进入 
            {
                Utils.UrlRedirect(this, "", "您的IP地址已经被限制提交表单,如有疑问,请联系管理员!");
                return;
            }
            //判断两次提交时间是否在限制中
            int iSubmitLimitTime = Utils.ParseInt(drManage["SubmitLimitTime"], 0); //限制时间            
            if (iSubmitLimitTime != 0) //为0则不限制提交时间
            {
                DataTable dtForm = bllFormEdit.GetAddressLog(Utils.GetIP(), drManage["tableName"].ToString());
                if (dtForm.Rows.Count > 0) //如果大于0,则存在记录再进行比较 如果不存在,则不用比较
                {
                    if ((DateTime.Now - Convert.ToDateTime(dtForm.Rows[0][0].ToString())).Seconds <= iSubmitLimitTime)  //如果数据库中保存的最后一条记录,和当前时间比较时间间隔小于设定的时间间隔,则禁止再次提交
                    {
                        jsMessage = "alert(\"您的提交速度过快,系统规定" + iSubmitLimitTime.ToString() + "秒后才能再次提交!\");history.back();";
                        return;
                    }
                }
            }
            if (!Utils.ParseBool(drManage["IsEnable"]))  //是否启用
            {
                jsMessage = "alert(\"当前操作已经禁用!\");";
                return;
            }
            if (Utils.ParseBool(drManage["IsAuthcode"]))  //是否要验证码
            {
                //先进行验证码的判断,看输入是否正确,不确定则退出

                if (Session[SystemConst.SESSION_VALIDATECODE] != null)
                {
                    if (Utils.ReqFromParameter("validate").ToLower() != Session[SystemConst.SESSION_VALIDATECODE].ToString().ToLower())
                    {
                        jsMessage = "alert(\"验证码输入错误,请重新输入!\");history.back();";
                        return;
                    }
                }
            }

            //还要根据是否会员才能查看进行判断
            if (Utils.ParseBool(drManage["IsUserAnswer"]))  //只能会员才能查看
            {
                //判断是否登录,没登录则返回
            }
            if (Utils.ParseBool(drManage["IsSendAdminPhone"]))  //是否发送到指定的手机
            {
                //具体手机发送方法

            }
            if (Utils.ParseBool(drManage["IsSendAdminEmail"]))  //是否发送到指定的email
            {
                string emialContent;
                string title;
                string[] toEmail;

                title = Request.Form["Title"];


                if (string.IsNullOrEmpty(title) || title.Trim() == "")
                {
                    title += " 的申请，请查阅";
                }
                else
                {
                    title = "在线申请，请查阅";
                }

                try
                {
                    toEmail = drManage["Emails"].ToString().Trim().Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                }
                catch { toEmail = null; }

                emialContent = GetEmailBody();

                if (toEmail != null && toEmail.Length > 0)
                {
                    try
                    {
                        sendMail("szprimecredit@gmail.com", toEmail, "szprimecredit@gmail.com", "szprimecredit_2009", title, emialContent);
                    }
                    catch (Exception e) { string e1 = e.Message; }
                }
            }
            switch (drManage["IsCheck"].ToString())  //是否审核
            {
                case "1": //不用审核
                    dicWhere.Add("FlowState", "99"); //直接通过终审
                    break;
                case "2": //会员不用审核
                    //判断是否会员,如果是会员则直接通过终审 否则状态为待审
                    dicWhere.Add("FlowState", "3");
                    break;
                case "3": //都要审核 
                    dicWhere.Add("FlowState", "3");
                    break;
                default:
                    dicWhere.Add("FlowState", "99");
                    break;
            }

            StringBuilder sbLog = new StringBuilder(16);
            selParam.S1 = FormID;
            DataTable dtModelField = fieldManage.GetList("ALLModelIdList", selParam); //得到当前模板列表     

            foreach (DataRow drModelField in dtModelField.Rows)
            {
                fieldName = drModelField["Name"].ToString();
                fieldValue = Request.Form[fieldName];

                if (!string.IsNullOrEmpty(fieldValue) && fieldValue.Trim() != "")
                {
                    dicWhere.Add(fieldName, fieldValue);
                }

            }
            //如果是会员登录,则还要添加会员id
            //如果选择的是问题码验证,则还要自动生成一个问题码,并保存到数据库中
            dicWhere.Add("SiteId", SiteID);
            dicWhere.Add("NodeCode", NodeCode);

            string userName;
            if (Request.Cookies["memberusername"] != null)
            {
                userName = Request.Cookies["memberusername"].ToString();
            }
            else
            {
                userName = "游客";
            }

            string[] tbID = KingTop.BLL.Public.GetTableID("0", drManage["TableName"].ToString());

            if (drManage["FieldFromUrlParamValue"] != null && drManage["FieldFromUrlParamValue"].ToString().Trim() != "")
            {
                string[] arrField;

                arrField = drManage["FieldFromUrlParamValue"].ToString().Trim().Split(new char[] { ',' });

                foreach (string field in arrField)
                {
                    if (!string.IsNullOrEmpty(field) && Request.QueryString[field] != null)
                    {
                        dicWhere.Add(field, Request.QueryString[field]);
                    }
                }
            }

            dicWhere.Add("ID", tbID[0]);
            dicWhere.Add("Orders", tbID[1]);
            dicWhere.Add("IP", Utils.GetIP());
            dicWhere.Add("AddMan", userName);
            string msg = bllFormEdit.Save(dicWhere, drManage["TableName"].ToString());

            if (msg != "1")  // 失败
            {
                WriteLog(userName + "提交内容失败。", msg, 3, userName);
                jsMessage = "alert(\"对不起，内容提交失败，请重试!\");";
            }
            else
            {
                jsMessage = "alert(\"恭喜您，内容提交成功!\");";
            }

            jsMessage += "history.back();";
        }

        /// <summary>
        /// 获取表单信息
        /// </summary>
        string GetEmailBody()
        {
            StringBuilder sbEmailContent;

            sbEmailContent = new StringBuilder();

            sbEmailContent.Append("<table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#eeeeee\" style=\"font-size:12px;\">");
            sbEmailContent.Append("<tr>");
            sbEmailContent.Append("<td width=\"132\" height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">申请贷款额度：</td>");
            sbEmailContent.Append("<td width=\"468\" bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["sqed"]);
            sbEmailContent.Append(" 元");
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("</tr>");
            sbEmailContent.Append("<tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">申请人姓名：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["Title"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("</tr>");
            sbEmailContent.Append("<tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">贷款期数：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["qs"]);
            sbEmailContent.Append(" 个月");
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("</tr>");
            sbEmailContent.Append("<tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">性别：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            if (Request.Form["xb"] == "1")
            {
                sbEmailContent.Append("女");
            }
            else
            {
                sbEmailContent.Append("男");
            }
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("</tr>");
            sbEmailContent.Append("<tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">身份证号码：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["sfz"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append(" </tr>");
            sbEmailContent.Append(" <tr>");
            sbEmailContent.Append(" <td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">联系电话：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["dhhm"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("</tr>");
            sbEmailContent.Append("  <tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">电邮地址：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["email"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append(" </tr>");
            sbEmailContent.Append("<tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">工作单位：</td>");
            sbEmailContent.Append("  <td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["gzdw"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("</tr>");
            sbEmailContent.Append(" <tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">单位电话：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["dwdh"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("</tr>");
            sbEmailContent.Append(" <tr>");
            sbEmailContent.Append("<td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">每月基本月薪：</td>");
            sbEmailContent.Append(" <td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["myyx"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append("  </tr>");
            sbEmailContent.Append(" <tr>");
            sbEmailContent.Append(" <td height=\"28\" align=\"right\" bgcolor=\"#FFFFFF\" style=\"color:#005e1a; font-weight:bold;\">其他收入：</td>");
            sbEmailContent.Append("<td bgcolor=\"#FFFFFF\" style=\"padding-left:10px; color:#666;\">");
            sbEmailContent.Append(Request.Form["qtsr"]);
            sbEmailContent.Append("</td>");
            sbEmailContent.Append(" </tr>");
            sbEmailContent.Append("</table>");
            return sbEmailContent.ToString();
        }

        protected void sendMail(string M_from, string[] M_to, string M_UserName, string M_Password, string title, string msgContent)
        {
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            mailMessage.From = new System.Net.Mail.MailAddress(M_from);

            foreach (string to_mail in M_to)
            {
                mailMessage.To.Add(to_mail);
            }

            mailMessage.Subject = title;
            mailMessage.Body = msgContent;
            mailMessage.BodyEncoding = System.Text.Encoding.UTF8;
            mailMessage.IsBodyHtml = true;
            mailMessage.Priority = System.Net.Mail.MailPriority.Normal;
            //string smtpHost = "smtp.gmail.com";
            //System.Net.Mail.SmtpClient mail = new System.Net.Mail.SmtpClient(smtpHost, 587);
            //mail.EnableSsl = true;

            System.Net.Mail.SmtpClient mail = new System.Net.Mail.SmtpClient();
            mail.Host = "smtp.gmail.com";
            mail.EnableSsl = true;
            mail.Port = 587;
            
            mail.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            mail.UseDefaultCredentials = false;
            mail.Credentials = new System.Net.NetworkCredential(M_UserName, M_Password);
            mail.Send(mailMessage);

           
        }

        #region 保存日志:ycl@360hqb.com
        /// <summary>
        /// 保存日志:ycl@360hqb.com
        /// </summary>
        /// <param Name="Content">日志内容</param>
        /// <param Name="PostContent">提交内容</param>
        /// <param Name="LogType">日志类型，1=登录日志，2=操作日志，3=错误日志</param>
        public void WriteLog(string Content, string PostContent, int LogType, string userNo)
        {
            string xml = Server.MapPath("../../config/SiteParam.config");
            string logType;
            string logDir;
            logType = KingTop.Common.Utils.XmlRead(xml, "SiteParamConfig/LogType", "");
            logDir = KingTop.Common.Utils.XmlRead(xml, "SiteParamConfig/LogDir", "");
            string ip = Utils.GetIP();       //IP地址
            string ScriptName = HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"] + "?" + HttpContext.Current.Request.ServerVariables["QUERY_STRING"]; //提交的页面地址

            if (logType == "0")  //保存到数据库
            {
                KingTop.Model.SysManage.SysLog objlog = new KingTop.Model.SysManage.SysLog();
                KingTop.BLL.SysManage.SysLog objBllLog = new KingTop.BLL.SysManage.SysLog();
                objlog.IP = ip;
                objlog.Content = Content;
                objlog.LogType = LogType;

                // objlog.NodeId = NodeId;

                objlog.NodeCode = NodeCode;

                objlog.PostContent = PostContent;
                objlog.ScriptName = ScriptName;
                try
                {
                    objlog.SiteID = int.Parse(this.SiteID);
                }
                catch
                {
                    objlog.SiteID = 1;
                }
                objlog.UserNo = userNo;
                objBllLog.Save("NEW", objlog);
            }
            else  //保存到文件
            {
                string logPath = logDir;
                StreamWriter sw = null;
                DateTime date = DateTime.Now;
                string FileName = date.Year + "-" + date.Month;
                if (logPath.IndexOf(":") == -1)  //相对路径
                {
                    if (logPath.Trim().Length == 0)  //路径为空
                    {
                        logPath = "hqbLogs";
                    }
                    logPath = HttpContext.Current.Server.MapPath("~/" + logPath);
                }

                try
                {

                    FileName = logPath + "/" + userNo + "_" + FileName + "-" + DesSecurity.DesEncrypt(FileName, "hqbonline") + "-s.log";

                    #region 检测日志目录是否存在

                    if (!Directory.Exists(logPath))
                    {
                        Directory.CreateDirectory(logPath);
                    }

                    if (!File.Exists(FileName))
                        sw = File.CreateText(FileName);
                    else
                    {
                        sw = File.AppendText(FileName);
                    }
                    #endregion

                    sw.WriteLine("[NodeCode]       :" + NodeCode + "\r");
                    sw.WriteLine("[SiteID]       :" + this.SiteID + "\r");
                    sw.WriteLine("[Content]      :" + Content);
                    sw.WriteLine("[AddDate]      :" + date.ToString("yyyy-MM-dd hh:mm:ss") + "\r");
                    sw.WriteLine("[UserNo]       :" + userNo + "\r");
                    sw.WriteLine("[IP]           :" + ip + "\r");
                    sw.WriteLine("[ScriptName]   :" + ScriptName + "\r");
                    sw.WriteLine("[PostContent]  :" + PostContent + "\r");
                    sw.WriteLine("[LogType]      :" + LogType + "\r");
                    sw.WriteLine("≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡\r");
                    sw.Flush();
                }
                finally
                {
                    if (sw != null)
                        sw.Close();
                }
            }

        }
        #endregion

    }
}
