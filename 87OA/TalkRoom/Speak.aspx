<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Speak.aspx.cs" Inherits="TalkRoom_Speak" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body scroll="no">
    <form id="form1" runat="server">
    <div>    
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td align="right" style="width: 90px; height:5px;">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 90px;" align="right">
                    聊天对象：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" style="border-top-style: none; border-bottom: dimgray 1px solid; border-right-style: none; border-left-style: none" BorderWidth="0px" Width="200px">所有人</asp:TextBox>&nbsp;<span
                        style="color: #9999cc"> ( * 如需改变聊天对象，请在右侧选择您要聊天的对象。)</span></td>
            </tr>
            <tr>
                <td style="width: 90px" align="right">
                    聊天内容：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" style="border-right: dimgray 1px solid; border-top: dimgray 1px solid; border-left: dimgray 1px solid; border-bottom: dimgray 1px solid" Height="50px" TextMode="MultiLine" Width="90%" MaxLength="8000"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 90px">
                </td>
                <td>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/Button/BtnSend.jpg" OnClick="ImageButton1_Click" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>