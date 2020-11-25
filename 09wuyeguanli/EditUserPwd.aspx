<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditUserPwd.aspx.cs" Inherits="EditUserPwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>密码修改</title>
    <style type="text/css">
        .txt{ text-align:right; width:80px; height:40px}
    </style>
</head>
<body style="font-size:14px; background-color:#fff; padding-top:30px">
    <form id="form1" runat="server">
     <div style="width:100%; height:70px; border-bottom:2px solid #f18200">
            <center>
                <div style=" width:1000px">
                <div style="float:left"><a href="Default.aspx"><img src="Images/xinxinlogo2.png" alt="" border="0" /></a></div>
                <div style="float:left; font-size:16px; font-weight:bold; color:#444444; padding-left:20px; line-height:60px">密码修改</div>
                </div>
            </center>
        </div>
    <center>
    <table>
        <tr>
            <td style="width:573; height:394px;">
                <img src="Images/m.jpg" alt="" />
            </td>
            <td>
                <div style="width:327px; height:280px; border:1px solid #cbcbcb; background-color:#f7f7f7;">
                    <table>   
                        <tr>
                            <td colspan="2" style="font-size:15px; font-weight:bold; color:#444444; padding-left:15px" align="left"></td>
                        </tr>                 
                        <tr>
                            <td class="txt">用户名：</td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" ></asp:TextBox><asp:TextBox ID="txt_oldPassword" runat="server" Visible="False"></asp:TextBox></td>
                        </tr>   
                        <tr>
                            <td class="txt">旧密码：</td>
                            <td><asp:TextBox ID="OldPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                        </tr>              
                        <tr>
                            <td></td>
                            <td><asp:RequiredFieldValidator id="rfO" runat="server" ErrorMessage="旧密码不能为空！" ControlToValidate="OldPassword" Display="Dynamic" CssClass="GbText"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="txt">新密码：</td>
                            <td><asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                        </tr>            
                        <tr>
                            <td></td>
                            <td><asp:RequiredFieldValidator ID="rfN" runat="server" ControlToValidate="NewPassword" Display="Dynamic" ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
					         <td class="txt">确认密码：</td>
					        <td>
						        <asp:textbox id="PasswordStr" runat="server"  TextMode="Password"></asp:textbox></td>
				        </tr>
				         <tr>
					         <td class="txt"></td>
					        <td>
						        <asp:CompareValidator ID="cvN" runat="server" ControlToCompare="NewPassword" ControlToValidate="PasswordStr"
							         ErrorMessage="两次输入的密码不相同！"></asp:CompareValidator></td></tr>
                       
                        <tr> <td></td>
                            <td valign="middle"><asp:ImageButton ID="SureBtn" runat="server" ImageUrl="~/Images/btnok.png" onclick="SureBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="Default.aspx">返回首页</a></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    </center>
    </form>
</body>
</html>
