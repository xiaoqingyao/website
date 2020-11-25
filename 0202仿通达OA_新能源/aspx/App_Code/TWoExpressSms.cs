using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.InteropServices;

/// <summary>
///TWoExpressSms 的摘要说明
/// </summary>
public static class TWoExpressSms
{
    const string path = "D:\\sms\\sms.dll";
    /// <summary>
    /// 应用程序的主入口点。
    /// </summary>
    /// 
    [STAThread]

    [DllImport(path, EntryPoint = "Sms_Connection")]
    public static extern uint Sms_Connection(string CopyRight, uint Com_Port, uint Com_BaudRate, out string Mobile_Type, out string CopyRightToCOM);

    [DllImport(path, EntryPoint = "Sms_Disconnection")]
    public static extern uint Sms_Disconnection();

    [DllImport(path, EntryPoint = "Sms_Send")]
    public static extern uint Sms_Send(string Sms_TelNum, string Sms_Text);

    [DllImport(path, EntryPoint = "Sms_Receive")]
    public static extern uint Sms_Receive(string Sms_Type, out string Sms_Text);

    [DllImport(path, EntryPoint = "Sms_Delete")]
    public static extern uint Sms_Delete(string Sms_Index);

    [DllImport(path, EntryPoint = "Sms_AutoFlag")]
    public static extern uint Sms_AutoFlag();

    [DllImport(path, EntryPoint = "Sms_NewFlag")]
    public static extern uint Sms_NewFlag();
    /// <summary>
    /// 连接短信猫设备
    /// </summary>
    /// <returns>返回连接状态</returns>
    public static bool GetConnection()
    {
        String TypeStr = "";
        String CopyRightToCOM = "";
        String CopyRightStr = "//上海迅赛信息技术有限公司,网址www.xunsai.com//";

        if (Sms_Connection(CopyRightStr, uint.Parse("1"), 9600, out TypeStr, out CopyRightToCOM) == 1) ///5为串口号，0为红外接口，1,2,3,...为串口
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// 发送短信
    /// </summary>
    /// <param name="phone">手机号码</param>
    /// <param name="content">短信内容</param>
    /// <returns>返回发送结果</returns>
    public static bool SendMsg(string phone, string content)
    {
       
        try
        {
            if (GetConnection())
            {
                if (Sms_Send(phone.Trim(), content.Trim()) == 1)
                {
                   
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
                return false;
        }
        finally
        {
            CloseConnection();
        }
    }

    public static void CloseConnection()
    {
        Sms_Disconnection();
    }

   
}