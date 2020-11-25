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

public partial class TalkRoom_ShowMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select top 100 * from ERPTalkInfo where TalkRoomName='" + Request.QueryString["TalkRoomName"].ToString() + "' and (UserName='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' or ToUser='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' or ToUser='所有人') order by ID desc");
            for(int i=0;i<MYDT.Tables[0].Rows.Count;i++)
            {
                this.Label1.Text = this.Label1.Text + "(" + MYDT.Tables[0].Rows[i]["TimeStr"].ToString() + ")&nbsp;&nbsp;<font color=Red>" + MYDT.Tables[0].Rows[i]["UserName"].ToString() + "</font>&nbsp;&nbsp;对&nbsp;&nbsp;<font color=Blue>" + MYDT.Tables[0].Rows[i]["ToUser"].ToString() + "</font>&nbsp;说道：&nbsp;" + MYDT.Tables[0].Rows[i]["ContentStr"].ToString() + "<hr style=\"height:1px; color: #006600;\">";
            }            
        }
        catch
        { }
    }
}
