<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QueryUC.ascx.cs" Inherits="UserControl_QueryUC" %>
<link href="../css/css.css" rel="stylesheet" />

<table cellpadding="0" cellspacing="0" border="0" width="200" style="BORDER-COLLAPSE: collapse;">
	<tr>	
		<td valign="top">
		    <div class="DivBorder Fs_Kstd">
                <div class="Fs_Kstd_Top"><SPAN class=Fs_Dot><IMG height=9 src="images/Ddot.jpg" width=9 border=0></SPAN> <SPAN class=Fs_Text>联系我们</SPAN></DIV>
                <div class="Fs_Kstd_Bottom">
                <br />
                    <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width:70px; text-align:left"  valign="top">物业名称：</td>
                           <td align="left" style="height:25px" valign="top">
                               <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="text-align:left;height:26px">物业规模：</td>
                            <td align="left"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                             <td style="text-align:left;height:26px">负责人：</td>
                             <td align="left"><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="text-align:left;height:26px">联系电话：</td>
                            <td align="left"><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="text-align:left;height:26px">物业地址：</td>
                             <td align="left"><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                    </table>     
                </div>
            </div>
        </td>		
	</tr>
</table>