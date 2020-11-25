using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.BLL.Content;
using System.Data;
using AllPower.Common;
using System.Text;
using System.IO;

namespace AllPower.WEB.main.Plus.Form
{
    public partial class FormDeal : System.Web.UI.Page
    {
        #region  变量
        private string _nodeCode;
        private string _fromID;
        private string _siteID;
        AllPower.Model.SelectParams selParam;
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
                    string xml = Server.MapPath("../../config/SiteParam.config");
                    this._siteID = AllPower.Common.Utils.XmlRead(xml, "SiteParamConfig/SiteID", "");
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
                    this._nodeCode = Request.QueryString["NodeCode"];
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
            selParam = new AllPower.Model.SelectParams();
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
            BLL.Content.ControlFormEdit bllFormEdit = new AllPower.BLL.Content.ControlFormEdit();
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
                jsMessage = "alert(\"表单已经禁用!\");";
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
                //如果以后有邮件模板功能,则此处从邮件模板读取
                //具体邮件发送方法

                AllPower.Common.Email email = new AllPower.Common.Email();
                //此处要从配置文件读取邮件发送配置

                email.SendEmail("zhoupei1", "zhoupei1@163.com", "", "表单信息提交", GetEmailBody(), drManage["emails"].ToString(), "smtp.163.com");
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

            string[] tbID = AllPower.BLL.Public.GetTableID("0", drManage["TableName"].ToString());

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
                WriteLog(userName + "提交表单内容失败。", msg, 3, userName);
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
            string fieldName, fieldValue;
            selParam = new AllPower.Model.SelectParams();
            StringBuilder sbEmailBody = new StringBuilder(49);
            sbEmailBody.Append("<table>");
            selParam.S1 = FormID;
            DataTable dtModelField = fieldManage.GetList("ALLModelIdList", selParam); //得到当前模板列表     

            foreach (DataRow drModelField in dtModelField.Rows)
            {
                fieldName = drModelField["Name"].ToString();
                fieldValue = Request.Form[fieldName];

                if (!string.IsNullOrEmpty(fieldValue) && fieldValue.Trim() != "")
                {
                    sbEmailBody.Append("<tr><td>" + fieldName + "</td><td>" + fieldValue + "</td></tr>");
                }

            }
            sbEmailBody.Append("</table>");
            return sbEmailBody.ToString();
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
            logType = AllPower.Common.Utils.XmlRead(xml, "SiteParamConfig/LogType", "");
            logDir = AllPower.Common.Utils.XmlRead(xml, "SiteParamConfig/LogDir", "");
            string ip = Utils.GetIP();       //IP地址
            string ScriptName = HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"] + "?" + HttpContext.Current.Request.ServerVariables["QUERY_STRING"]; //提交的页面地址

            if (logType == "0")  //保存到数据库
            {
                AllPower.Model.SysManage.SysLog objlog = new AllPower.Model.SysManage.SysLog();
                AllPower.BLL.SysManage.SysLog objBllLog = new AllPower.BLL.SysManage.SysLog();
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
