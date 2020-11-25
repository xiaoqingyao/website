using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Net;
using System.IO;

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
    public static void SendSMS(string FaSongUser, string ToUserList, string ContentStr)
    {
        //针对不同的短信猫接口，请修改此方法        
        string MobTelList = "";
        //根据用户名列表获取手机号码 admin,test,SDLX,test123
        DataSet MyDT = SDLX.DBUtility.DbHelperSQL.GetDataSet("select JiaTingDianHua from ERPUser where UserName in('" + ToUserList.Replace(",", "','") + "')");
        for (int i = 0; i < MyDT.Tables[0].Rows.Count; i++)
        {
            if (MobTelList == "")
            {
                MobTelList = MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString();
            }
            else
            {
                if (MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString().Trim().Length > 0)
                {
                    MobTelList = MobTelList + "," + MyDT.Tables[0].Rows[i]["JiaTingDianHua"].ToString();
                }
            }
        }
        //发送短信
        string uid = "8103339";			//用户名
        string pass = "x12345";	//密码
        string mobile = ToUserList;  //发送号码
        string strContent = ContentStr;
        StringBuilder sbTemp = new StringBuilder();
        pass = FormsAuthentication.HashPasswordForStoringInConfigFile(pass, "MD5"); //密码进行MD5加密
        //POST 传值
        sbTemp.Append("uid=" + uid + "&pwd=" + pass + "&mobile=" + mobile + "&content=" + strContent);
        byte[] bTemp = System.Text.Encoding.GetEncoding("GBK").GetBytes(sbTemp.ToString());
        //请将 localhost 改成 短信接口地址
        String postReturn = doPostRequest("http://www.dx0556.com/tx/", bTemp);
        //MobCallClient.SMS MySms = new MobCallClient.SMS();
        //string StateStr=MySms.SendSMS(ConfigurationManager.AppSettings["enCode"], ConfigurationManager.AppSettings["enPassword"], ConfigurationManager.AppSettings["userName"], MobTelList, ContentStr);
    }

    //POST方式发送得结果
    private static String doPostRequest(string url, byte[] bData)
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
    private static void WriteErrLog(string strErr)
    {
        Console.WriteLine(strErr);
        System.Diagnostics.Trace.WriteLine(strErr);
    }

    //发送外部短信，直接是手机号码列表
    public static void SendSMS2(string FaSongUser, string ToUserList, string ContentStr)
    {
        string MobTelList = ToUserList;
        //发送短信
        string uid = "8103339";			//用户名
        string pass = "x12345";	//密码
        string mobile = MobTelList;  //发送号码
        string strContent = ContentStr;
        StringBuilder sbTemp = new StringBuilder();
        pass = FormsAuthentication.HashPasswordForStoringInConfigFile(pass, "MD5"); //密码进行MD5加密
        //POST 传值
        sbTemp.Append("uid=" + uid + "&pwd=" + pass + "&mobile=" + mobile + "&content=" + strContent);
        byte[] bTemp = System.Text.Encoding.GetEncoding("GBK").GetBytes(sbTemp.ToString());
        //请将 localhost 改成 短信接口地址
        String postReturn = doPostRequest("http://http.sms0551.com/tx/", bTemp);
        ////发送短信
        //MobCallClient.SMS MySms = new MobCallClient.SMS();
        //string StateStr = MySms.SendSMS(ConfigurationManager.AppSettings["enCode"], ConfigurationManager.AppSettings["enPassword"], ConfigurationManager.AppSettings["userName"], MobTelList, ContentStr);
    }
    public static void GetSMS(string GetUserName)
    {
        //针对不同的短信猫接口，请修改此方法
    }
}
