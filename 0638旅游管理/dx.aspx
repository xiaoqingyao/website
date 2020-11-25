<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dx.aspx.cs" Inherits="dx" %>

<%@Register TagPrefix="dntb" Namespace="DotNetTextBox" Assembly="DotNetTextBox"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <LINK href="StyleSheet.css" type=text/css rel=stylesheet>
    <link href="system_dntb/skin/xp/toolbar.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" style="width: 98%">
        <tr>
            <td align="left" style="height: 539px" valign="top">
                <table bgcolor="#fbd79f" border="0" cellpadding="0" cellspacing="1" height="280"
                    width="100%">
                    <!--DWLayoutTable-->
                    <tr>
                        <td align="left" bgcolor="#ccffff" colspan="5" style="height: 24px" valign="middle">
                            <span style="background-color: #fff5e1">编辑<%=lbtxt%></span></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#fff5e1" style="width: 68px; height: 293px" valign="middle">
                            内容</td>
                        <td align="left" bgcolor="#fff5e1" colspan="1" style="width: 2px; height: 293px"
                            valign="top">
                        </td>
                        <td align="left" bgcolor="#fff5e1" colspan="3" style="height: 293px" valign="top">
                            &nbsp;&nbsp;
                            <dntb:WebEditor ID="WebEditor1" runat="server" Skin="skin/xp/" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#fff5e1" style="width: 68px; height: 20px;" valign="middle">
                            &nbsp;</td>
                        <td bgcolor="#fff5e1" colspan="1" style="width: 2px; height: 20px;">
                        </td>
                        <td bgcolor="#fff5e1" colspan="3" style="height: 20px">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="border-right: #003333 1px solid;
                                border-top: #003333 1px solid; font: menu; border-left: #003333 1px solid; border-bottom: #003333 1px solid"
                                Text="确定修改" Width="83px" />
                            </td>
                    </tr>
                </table>
                
                </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>

