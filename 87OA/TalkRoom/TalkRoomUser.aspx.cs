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

public partial class TalkRoom_TalkRoomUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //判断当前Session["UserName"]在不在ERPTalkOnlineUser表中，在就更新时间，不在就添加
            int i = 0;//存在为1，不存在为0
            DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select ID from ERPTalkOnlineUser where LoginUser='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' and TalkRoomName='" + Request.QueryString["TalkRoomName"].ToString() + "'");
            if (MYDT.Tables[0].Rows.Count>0)
            {
                i = 1;
            }
            
            if (i == 1)
            {
                ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPTalkOnlineUser set TimeStr=getdate() where LoginUser='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' and TalkRoomName='" + Request.QueryString["TalkRoomName"].ToString() + "'");
            }
            else
            {
                ZWL.BLL.ERPTalkOnlineUser MyModel = new ZWL.BLL.ERPTalkOnlineUser();
                MyModel.LoginUser = ZWL.Common.PublicMethod.GetSessionValue("UserName");
                MyModel.TalkRoomName = Request.QueryString["TalkRoomName"].ToString();
                MyModel.TimeStr = DateTime.Now;
                MyModel.Add();
            }

            BindUser();
        }
        catch
        { }
    }
    private void BindUser()
    {
        try
        {
            DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select LoginUser from ERPTalkOnlineUser where (datediff(minute,TimeStr,getdate())<1) and TalkRoomName='" + Request.QueryString["TalkRoomName"].ToString() + "' order by LoginUser");
            for(int i=0;i<MYDT.Tables[0].Rows.Count;i++)
            {
                if (this.Label1.Text.Trim().Length > 0)
                {
                    this.Label1.Text = this.Label1.Text + "<br><img src=\"../images/U03.gif\" /><a href=\"Javascript:void(0);\" onclick=\"parent.frames['Speak'].document.getElementById('TextBox1').value='" + MYDT.Tables[0].Rows[i]["LoginUser"].ToString() + "'\" >" + MYDT.Tables[0].Rows[i]["LoginUser"].ToString() + "</a>";
                }
                else
                {
                    this.Label1.Text = "<img src=\"../images/U03.gif\" /><a href=\"Javascript:void(0);\" onclick=\"parent.frames['Speak'].document.getElementById('TextBox1').value='" + MYDT.Tables[0].Rows[i]["LoginUser"].ToString() + "'\" >" + MYDT.Tables[0].Rows[i]["LoginUser"].ToString() + "</a>";
                }
            }            
        }
        catch
        { }
    }
}
