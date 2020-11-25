<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="List" %>

<%@ Register Src="UserContral/GatherTypeIndex.ascx" TagName="GatherTypeIndex" TagPrefix="uc4" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc1" %>
<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc2" %>
<%@ Register Src="UserContral/DisplayControl.ascx" TagName="DisplayControl" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>团购查看</title>
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
                        <table style="width: 200px" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" style="background-image: url(Image/6.jpg);
                width: 100%; height: 146px; vertical-align: middle; text-align: center;">
                <tr>
                    <td style="vertical-align: bottom; width: 35px; height: 35px">
                        <img src="Image/icon_login.gif" /></td>
                    <td style="vertical-align: bottom; height: 35px" colspan="2">
                        用户登陆</td>
                      <td style="height: 35px; width: 23px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 35px; height: 29px;">
                    </td>
                    <td style="height: 29px; width: 67px;">
                        用户名：</td>
                    <td style="width: 67px; height: 29px;">
                        <asp:TextBox ID="TextBox1" runat="server" Width="87px"></asp:TextBox></td>
                      <td style="height: 29px; width: 23px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 35px; height: 22px;">
                    </td>
                    <td style="height: 22px; width: 67px;">
                        密码：</td>
                    <td style="width: 67px; height: 22px;">
                        <asp:TextBox ID="TextBox2" runat="server" Width="89px" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                      <td style="height: 22px; width: 23px;">
                    </td>
                </tr>
                  <tr>
                    <td style="width: 35px; height: 18px;">
                    </td>
                    <td style="height: 18px; width: 67px;">
                    </td>
                    <td style="width: 67px; height: 18px;">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="记住密码" Width="88px" /></td>
                      <td style="height: 18px; width: 23px;">
                          </td>
                </tr>
                  <tr>
                    <td style="width: 35px; height: 28px;">
                    </td>
                    <td style="width: 67px; height: 28px;">
                        <asp:Button ID="Button1" runat="server" Text="登陆" /></td>
                    <td style="width: 67px; height: 28px;">
                        <asp:Button ID="Button2" runat="server" Text="注册" /></td>
                      <td style="width: 23px; height: 28px;">
                         </td>
                </tr>
            </table>
        </td>
      
    </tr>
    <tr>
        <td style="height: 165px"><table cellpadding="0" cellspacing="0" style="background-image: url(Image/6.jpg);
                width: 100%; height: 146px; vertical-align: middle; text-align: center;">
            <tr>
                <td style="vertical-align: bottom; width: 35px; height: 12px">
                    <img src="Image/c_icon02.gif" /></td>
                <td style="vertical-align: bottom; height: 12px" colspan="2">
                    团购搜索</td>
                <td style="height: 12px; width: 23px;">
                </td>
            </tr>
            <tr>
                <td style="width: 35px; height: 29px;">
                </td>
                <td style="height: 29px; width: 67px;">
                    名称：</td>
                <td style="width: 67px; height: 29px;">
                    <asp:TextBox ID="TextBox3" runat="server" Width="87px"></asp:TextBox></td>
                <td style="height: 29px; width: 23px;">
                </td>
            </tr>
            <tr>
                <td style="width: 35px; height: 22px;">
                </td>
                <td style="height: 22px; width: 67px;">
                    </td>
                <td style="width: 67px; height: 22px;">
                    <asp:Button ID="Button3" runat="server" Text="搜索 " OnClick="Button3_Click" /></td>
                <td style="height: 22px; width: 23px;">
                </td>
            </tr>
          
          
        </table>
        </td>
   
    </tr>
    <tr>
        <td style="height: 19px"><table cellpadding="0" cellspacing="0" style="width: 100%; height: 146px; vertical-align: middle; text-align: center;">
            <tr>
                <td style="vertical-align: bottom;  height: 8px; text-align: center;background-color: #daf1f7;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/9.gif" /></td>
              
            </tr>
            <tr>
                <td style=" height: 29px; text-align: center; background-color: #daf1f7;">
                    <uc4:GatherTypeIndex id="GatherTypeIndex1" runat="server">
                    </uc4:GatherTypeIndex>
                    &nbsp;
                </td>
              
            </tr>
            <tr>
                <td style="width: 35px; height: 50px;">
                </td>
             
            </tr>
        </table>
        </td>
     
    </tr>
     <tr>
        <td><table cellpadding="0" cellspacing="0" style="width: 100%; height: 37px; vertical-align: middle; text-align: center;">
            <tr>
                <td style="vertical-align: bottom;  height: 8px; text-align: center;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="Image/9.gif" /></td>
            </tr>
        </table>
        </td>
     
    </tr>
     <tr>
        <td>
        </td>
     
    </tr>
      <tr>
        <td>
            </td>
     
    </tr>
</table>
                            
                        </td>
                        <td style="vertical-align: top; text-align: left">
                        <table width="100%" style="border-right: darkgray 1px solid; border-top: darkgray 1px solid; border-left: darkgray 1px solid; border-bottom: darkgray 1px solid">
                        <tr>
                            <td style="height: 15px">
                            </td>
                            <td style="height: 15px">
                            </td>
                            <td style="height: 15px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="vertical-align: top; text-align: center ; left; height: 681px;">
                              
                                <uc3:DisplayControl id="DisplayControl1" runat="server">
                                </uc3:DisplayControl>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 133px">
                        </td>
                        <td>
                        </td>
                    </tr>
                  
                </table>
                    <uc1:Bootom ID="Bootom1" runat="server" />
                </td>
            </tr>
            <tr>
              
                <td>
                </td>
            </tr>
        </table>
    </center>
    </form>
</body>
</html>