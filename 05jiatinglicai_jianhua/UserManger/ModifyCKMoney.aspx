<%@ Page Language="C#"   AutoEventWireup="true" CodeFile="ModifyCKMoney.aspx.cs" Inherits="ModifyCKMoney" Title="Untitled Page" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭财务管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td  class='title'><span>
                        修改存款信息</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="left">
    
    
<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td rowspan="3" valign="top" style="width: 779px" align="center" >
            <table style="width:100%;">
                <tr>
                    <td style="text-align: left;" valign="top" align="left">
                        <table border="0" cellpadding="0" cellspacing="0" class="text008" width="100%">
                            <tr align="center" class="bg04">
                                <td align="right" height="35" style="width: 128px">
                                    存款银行：</td>
                                <td align="left">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="392px"></asp:TextBox></td>
                            </tr>
                            <tr align="center" class="bg04">
                                <td align="right" height="35" style="width: 128px">
                                    存款金额：</td>
                                <td align="left">
                                    <asp:TextBox ID="TxtMoney" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr align="center" class="bg04">
                                <td align="right" height="35" style="width: 128px">
                                    存款类型：</td>
                                <td align="left">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="91px">
                                        <asp:ListItem>活期</asp:ListItem>
                                        <asp:ListItem>定期</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr align="center">
                                <td align="right" height="168" style="width: 128px" valign="top">
                                    <div class="mar009">
                                        备注</div>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="TxtStatement" runat="server" Height="157px" TextMode="MultiLine"
                                        Width="545px"></asp:TextBox>
                                    &nbsp;</td>
                            </tr>
                            <tr align="center">
                                <td align="center" colspan="2" style="height: 21px" valign="top">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
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
