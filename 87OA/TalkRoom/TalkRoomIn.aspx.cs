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

public partial class TalkRoom_TalkRoomIn : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ImageButton3.Visible = ZWL.Common.PublicMethod.StrIFIn("|118D|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPTalkInfo where TalkRoomName='" + Request.QueryString["TalkRoomName"].ToString() + "'");
        ZWL.Common.MessageBox.Show(this, "聊天记录已经删除完毕！");
    }
}