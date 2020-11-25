<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc1" %>
<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc2" %>
<%@ Register Src="UserContral/left.ascx" TagName="left" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:0; text-align:center">
    <form id="form1" runat="server">
    <center>
       <table cellpadding="0" cellspacing="0" width="770">
            <tr>
              
                <td>
                    <uc2:top ID="Top2" runat="server" />
                </td>
            </tr>
            <tr>
              
                <td>
                    
                </td>
            </tr>
            <tr>
            
                <td><table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 133px">
                            <uc3:left ID="Left2" runat="server" />
                        </td>
                        <td style="vertical-align: top; text-align: left">

                            &nbsp;<table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="height: 12px; text-align:center;">
                                        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Label" Width="628px" ForeColor="#FF8000"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="height: 12px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 12px;">
                                        <asp:Label ID="Label2" runat="server" Text="Label" Width="600px" ForeColor="Black"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="height: 12px; text-align :right;">
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 133px">
                        </td>
                        <td>
                        </td>
                    </tr>
                  
                </table>
                </td>
            </tr>
            <tr>
              
                <td>
                    <uc1:Bootom ID="Bootom1" runat="server" />
                </td>
            </tr>
        </table>
    </center>
    </form>
</body>
</html>