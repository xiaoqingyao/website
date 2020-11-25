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
using System.Management;
using Microsoft.Win32;

public partial class SerilsSetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.TextBox1.Text = GetMoAddress();
        }
    }

    //获得网卡序列号----MAc地址
    public string GetMoAddress()
    {
        try
        {
            //读取硬盘序列号
            ManagementObject disk;
            disk = new ManagementObject("win32_logicaldisk.deviceid=\"c:\"");
            disk.Get();



            string MoAddress = "BD-CNSOFTWEB";
            ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
            ManagementObjectCollection moc2 = mc.GetInstances();
            foreach (ManagementObject mo in moc2)
            {
                if ((bool)mo["IPEnabled"] == true)
                {
                    string a = mo["MacAddress"].ToString();
                    string c = disk.GetPropertyValue("VolumeSerialNumber").ToString();
                    MoAddress = "BD-" + a + "-" + c + "-CNSOFTWEB";
                    break;
                }
            }
            return MoAddress.ToString().Replace(":", "");
        }
        catch
        {
            return "BD-ERR-CNSOFTWEB";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string SqlStr = "update ERPSerils set SerilsStr='" + this.TextBox2.Text.Trim().Split('-')[0] + "',DateStr='" + this.TextBox2.Text.Trim().Split('-')[1] + "',DanWeiStr='" + this.TextBox2.Text.Trim().Split('-')[2] + "',UserNum='" + this.TextBox2.Text.Trim().Split('-')[3] + "'";
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL(SqlStr);
            ZWL.Common.MessageBox.ShowAndRedirect(this, "系统授权码已经写入完毕！", "Default.aspx");
        }
        catch
        {
            ZWL.Common.MessageBox.ShowAndRedirect(this, "系统授权码写入时发生错误！请重新获取！", "SerilsSetting.aspx");
        }
    }
}
