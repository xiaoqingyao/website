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

namespace OA.aspx.TalkRoom{ 
 public partial class TalkRoomIn: System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            iButton3.Visible = FTD.Unit.PublicMethod.StrIFIn("|118D|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete from ERPTalkInfo where TalkRoomName='" + Request.QueryString["TalkRoomName"].ToString() + "'");
        FTD.Unit.MessageBox.Show(this, "聊天记录已经删除完毕！");
    }
}}