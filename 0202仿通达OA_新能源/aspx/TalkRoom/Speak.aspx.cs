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
 public partial class Speak: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPTalkInfo Model = new FTD.BLL.ERPTalkInfo();

        Model.TalkRoomName = Request.QueryString["TalkRoomName"].ToString();        
        Model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        Model.ToUser = this.TextBox1.Text;
        Model.ContentStr = this.TextBox2.Text;
        Model.TimeStr = DateTime.Now;
        Model.Add();

        this.TextBox2.Text = "";
    }
}
}