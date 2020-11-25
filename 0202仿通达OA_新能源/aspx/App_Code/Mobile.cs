using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Net;
using System.Text;

namespace OA.App_Code 
{

    /// <summary>
    /// Mobile 的摘要说明
    /// </summary>
    public class Mobile
    {
        public Mobile()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        #region 数据发送
        public static string send(string UserList, string Content)
        {
            Content += ConfigurationManager.AppSettings["enLastName"].ToString();
            string sendurl = "http://api.sms7.cn/tx/";
            string mobile = UserList;// "15023125763";  //发送号码
            string strContent = Content;// "这是一条测试短信";
            StringBuilder sbTemp = new StringBuilder();
            string uid = ConfigurationManager.AppSettings["enCode"].ToString();
            string Pass = ConfigurationManager.AppSettings["enPassword"].ToString();//GetMD5Hash(pwd + uid); //密码进行MD5加密
            //POST 传值
            sbTemp.Append("uid=" + uid + "&pwd=" + Pass + "&mobile=" + mobile + "&content=" + strContent);
            byte[] bTemp = System.Text.Encoding.GetEncoding("GBK").GetBytes(sbTemp.ToString());
            String postReturn = doPostRequest(sendurl, bTemp);
            if (postReturn.Trim() == "100") { return "发送成功"; }
            else if (postReturn.Trim() == "106") { return "号码过多"; }
            else if (postReturn.Trim() == "112") { return "号码不正确"; }
            else if (postReturn.Trim() == "120") { return "系统升级"; }
            else { return "发送失败" + postReturn; }

            //' 100 发送成功
            //' 101 验证失败
            //' 102 短信不足
            //' 103 操作失败
            //' 104 非法字符
            //' 105 内容过多
            //' 106 号码过多
            //' 107 频率过快
            //' 108 号码内容空
            //' 109 账号冻结
            //' 110 禁止频繁单条发送
            //' 111 系统暂定发送
            //' 112 号码不正确
            //' 120 系统升级

            return postReturn;
        }
        public static String UserToTel(string UserList, string SendContent)    //将选择的人名转换为电话列表并发送 //发送人列表，发送内容
        {
            //SendContent += "【协同办公】";
            //string UserListOk = "";  //用户名列表
            //string OneUser = "";  //记录用户
            //int OnUser = 0;     //为1表示用户名
            //for (int i = 0; i < UserList.Length; i++)
            //{
            //    if (UserList[i] == '(') { OnUser = 1; }
            //    else if (UserList[i] == ')')
            //    {
            //        OnUser = 0;
            //        if (UserListOk.Trim() != "") { UserListOk += ","; }
            //        UserListOk += "'" + OneUser + "'";

            //        OneUser = "";
            //    }
            //    if (UserList[i] != '(' && UserList[i] != ')' && OnUser != 0)
            //    {
            //        OneUser += UserList[i];
            //    }
            //}


            string StrMobile = "";
            string WrongUser = "";
            DataSet MyDT = FTD.DBUnit.DbHelperSQL.GetDataSet("select JiaTingDianHua from ERPUser where UserName in('" + UserList.Replace(",", "','") + "')");
            for (int i = 0; i < MyDT.Tables[0].Rows.Count; i++)
            {
                if (!string.IsNullOrEmpty(MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString()))
                {
                    if (StrMobile != "") { StrMobile += ","; }
                    StrMobile += MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString().Trim();
                }
            }
            /*
            DataSet MobileList = FTD.DBUnit.DbHelperSQL.GetDataSet("select UI_strTrueName,UI_cTel from UserInfo where UI_nActive = 1 and UI_strLoginName in (" + UserList + ")");

            if (MobileList.Tables[0].Rows.Count > 30)
            {
                System.Web.HttpContext.Current.Response.Write("<script>alert('超出人员上限（30人）!');</script>");
                return "0";
            }
            for (int i = 0; i < MobileList.Tables[0].Rows.Count; i++)
            {
                if (MobileList.Tables[0].Rows[i]["UI_cTel"].ToString().Trim() == "" || Mobile.GetCount(MobileList.Tables[0].Rows[i]["UI_cTel"].ToString().Trim()) == 0)   //表示不是正确的手机号
                {
                    if (WrongUser != "") { WrongUser += ","; }
                    WrongUser += MobileList.Tables[0].Rows[i]["UI_strTrueName"].ToString().Trim();
                }
                else    //表示手机号没有问题
                {
                    if (StrMobile != "") { StrMobile += ","; }
                    StrMobile += MobileList.Tables[0].Rows[i]["UI_cTel"].ToString().Trim();
                }
            }*/
            if (StrMobile == "")
            {
                System.Web.HttpContext.Current.Response.Write("<script>alert('选择用户的手机号码有误，请确定！');</script>");
                return "0";
            }

            FTD.BLL.ERPMobile MyModel = new FTD.BLL.ERPMobile();

            MyModel.ToUserList = UserList;    //发送人
            //MyModel.Active = 1;
            MyModel.ContentStr = SendContent;    //发送内容
            MyModel.FaSongUser = FTD.Unit.PublicMethod.GetSessionValue("UserName").ToString().Trim();  //发送人
            //MyModel.Count = GetCount(StrMobile);   //发送条数
            // MyModel.TypeStr = Mobile.send(StrMobile, MyModel.ContentStr); //发送人和发送内容,返回发送状态
            string TypeStr = Mobile.send(StrMobile, MyModel.ContentStr); //发送人和发送内容,返回发送状态
            if (TypeStr == "发送失败")
            { TypeStr = Mobile.send(StrMobile, MyModel.ContentStr); }
            if (TypeStr == "发送失败")
            { TypeStr = Mobile.send(StrMobile, MyModel.ContentStr); }
            MyModel.Add();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户发送短信(" + UserList + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            if (WrongUser.Trim() == "")
            {
                return "1";
            }
            else
            {
                return WrongUser.Trim();
            }
        }

        public static int GetCount(string ConTent)   //统计发送次数
        {
            int Count = 0;
            string[] StrList = ConTent.Split(',', '，');
            for (int i = 0; i < StrList.Length; i++)
            {
                if (StrList[i] != "" && IsHandset(StrList[i]))
                {
                    Count++;
                }
            }
            if (StrList.Length == 0) { if (IsHandset(ConTent)) { Count++; } }
            return Count;
        }
        public static bool IsHandset(string str_handset)    //判断手机号
        {
            return System.Text.RegularExpressions.Regex.IsMatch(str_handset, @"^[1]+[3,5,8]+\d{9}");
        }

        //POST方式发送得结果
        public static String doPostRequest(string url, byte[] bData)
        {
            System.Net.HttpWebRequest hwRequest;
            System.Net.HttpWebResponse hwResponse;

            string strResult = string.Empty;
            try
            {
                hwRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(url);
                hwRequest.Timeout = 5000;
                hwRequest.Method = "POST";
                hwRequest.ContentType = "application/x-www-form-urlencoded";
                hwRequest.ContentLength = bData.Length;

                System.IO.Stream smWrite = hwRequest.GetRequestStream();
                smWrite.Write(bData, 0, bData.Length);
                smWrite.Close();
            }
            catch (System.Exception err)
            {
                WriteErrLog(err.ToString());
                return strResult;
            }

            //get response
            try
            {
                hwResponse = (HttpWebResponse)hwRequest.GetResponse();
                StreamReader srReader = new StreamReader(hwResponse.GetResponseStream(), Encoding.ASCII);
                strResult = srReader.ReadToEnd();
                srReader.Close();
                hwResponse.Close();
            }
            catch (System.Exception err)
            {
                WriteErrLog(err.ToString());
            }
            return strResult;
        }
        public static void WriteErrLog(string strErr)
        {
            Console.WriteLine(strErr);
            System.Diagnostics.Trace.WriteLine(strErr);
        }
        #endregion

        public static void SendSMS(string FaSongUser, string ToUserList, string ContentStr)
        {
            //针对不同的短信猫接口，请修改此方法   
            //根据用户名列表获取手机号码 admin,test,,test123
            DataSet MyDT = FTD.DBUnit.DbHelperSQL.GetDataSet("select JiaTingDianHua from ERPUser where UserName in('" + ToUserList.Replace(",", "','") + "')");
            for (int i = 0; i < MyDT.Tables[0].Rows.Count; i++)
            {
                if (!string.IsNullOrEmpty(MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString()))
                {
                    //TWoExpressMail mail = new TWoExpressMail();
                    //mail.Body = ContentStr;
                    //mail.Subject = "提醒";
                    //mail.ToMail = MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString();
                    //mail.SendMail();
                    TWoExpressSms.SendMsg(MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString(), ContentStr);

                }
            }

            //发送短信
            //MobCallClient.SMS MySms = new MobCallClient.SMS();
            //string StateStr=MySms.SendSMS(ConfigurationManager.AppSettings["enCode"], ConfigurationManager.AppSettings["enPassword"], ConfigurationManager.AppSettings["userName"], MobTelList, ContentStr);
        }


        //发送外部短信，直接是手机号码列表
        public static void SendSMS2(string FaSongUser, string ToUserList, string ContentStr)
        {
            string[] sr = ToUserList.Split(',');
            for (int i = 0; i < sr.Length; i++)
            {
                if (!string.IsNullOrEmpty(sr[i]))
                {
                    string MobTelList = sr[i];
                    //TWoExpressMail mail = new TWoExpressMail();
                    //mail.Body = ContentStr;
                    //mail.Subject = "提醒";
                    //mail.ToMail = MobTelList;
                    //mail.SendMail();
                    TWoExpressSms.SendMsg(MobTelList, ContentStr);
                }
            }

            //发送短信
            //MobCallClient.SMS MySms = new MobCallClient.SMS();
            //string StateStr = MySms.SendSMS(ConfigurationManager.AppSettings["enCode"], ConfigurationManager.AppSettings["enPassword"], ConfigurationManager.AppSettings["userName"], MobTelList, ContentStr);
        }
    }

}
