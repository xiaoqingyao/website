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

public partial class TalkRoom_TalkRoomList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();            
        }
    }
    public void DataBindToGridview()
    {
        string TableStr = "";
        ZWL.BLL.ERPTalkSetting MyModel = new ZWL.BLL.ERPTalkSetting();
        MyModel.GetModel();
        string[] TalkRoomList = MyModel.TalkName.Split('|');
        int j = 0;
        for (int i = 0; i < TalkRoomList.Length; i++)
        {            
            if (TalkRoomList[i].Trim().Length > 0)
            {
                j = j + 1;
                if (j%2 != 0)
                {                    
                    TableStr = TableStr + "<tr><td style=\"background-color: #ffffff;\" align=center width=100px height=70px><a class=\"heiBold\" href=\"TalkRoomIn.aspx?TalkRoomName=" + TalkRoomList[i].ToString() + "\"><img border=0 src=\"../images/TalkRoom.gif\" ></a></td><td style=\"background-color: #ffffff;\" ><img src=\"../images/JianTou.gif\" ><a class=\"heiBold\" href=\"TalkRoomIn.aspx?TalkRoomName=" + TalkRoomList[i].ToString() + "\">" + TalkRoomList[i].ToString() + "</a></td>";
                }
                else
                {
                    TableStr = TableStr + "<td style=\"background-color: #ffffff;\" align=center width=100px height=70px><a class=\"heiBold\" href=\"TalkRoomIn.aspx?TalkRoomName=" + TalkRoomList[i].ToString() + "\"><img border=0 src=\"../images/TalkRoom.gif\" ></a></td><td style=\"background-color: #ffffff;\" ><img src=\"../images/JianTou.gif\" ><a class=\"heiBold\" href=\"TalkRoomIn.aspx?TalkRoomName=" + TalkRoomList[i].ToString() + "\">" + TalkRoomList[i].ToString() + "</a></td></tr>";
                    //TableStr = TableStr + "<tr><td style=\"background-color: #ffffff;\" align=center width=100px height=70px><a class=\"heiBold\" href=\"TalkRoomIn.aspx?TalkRoomName=" + TalkRoomList[i].ToString() + "\"><img border=0 src=\"../images/TalkRoom.gif\" ></a></td><td style=\"background-color: #ffffff;\" ><img src=\"../images/JianTou.gif\" ><a class=\"heiBold\" href=\"TalkRoomIn.aspx?TalkRoomName=" + TalkRoomList[i].ToString() + "\">" + TalkRoomList[i].ToString() + "</a></td></tr>";
                }
            }
        }
        if (j % 2 != 0)
        {
            TableStr = TableStr + "<td style=\"background-color: #ffffff;\" align=center width=100px height=70px></td><td style=\"background-color: #ffffff;\" ></td></tr>";
        }
        this.Label1.Text = "<table width=100% bgcolor=\"#999999\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\">" + TableStr + "</table>";
    }
}