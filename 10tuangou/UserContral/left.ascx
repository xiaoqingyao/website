<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="UserContral_left" %>
<%@ Register Src="login.ascx" TagName="login" TagPrefix="uc1" %>
<%@ Register Src="hotControl.ascx" TagName="hotControl" TagPrefix="uc2" %>
<table style="width: 200px" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <uc1:login ID="Login1" runat="server" />
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
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/9.gif" Width="194px" /></td>
              
            </tr>
            <tr>
                <td style=" height: 29px; text-align: center; background-color: #daf1f7;">
                    <uc2:hotControl ID="HotControl1" runat="server" />
                </td>
              
            </tr>
        </table>
        </td>
     
    </tr>
     <tr>
        <td><table cellpadding="0" cellspacing="0" style="width: 100%; height: 29px; vertical-align: middle; text-align: center;">
            <tr>
                <td style="vertical-align: bottom; width: 35px; height: 8px; text-align: center;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/9.gif" Width="188px" /></td>
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