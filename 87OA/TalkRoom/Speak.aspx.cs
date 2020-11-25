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

public partial class TalkRoom_Speak : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPTalkInfo Model = new ZWL.BLL.ERPTalkInfo();

        Model.TalkRoomName = Request.QueryString["TalkRoomName"].ToString();        
        Model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        Model.ToUser = this.TextBox1.Text;
        Model.ContentStr = this.TextBox2.Text;
        Model.TimeStr = DateTime.Now;
        Model.Add();

        this.TextBox2.Text = "";
    }
}
