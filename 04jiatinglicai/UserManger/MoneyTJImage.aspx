<%@ Page Language="C#"   AutoEventWireup="true" CodeFile="MoneyTJImage.aspx.cs" Inherits="MoneyTJImage" Title="Untitled Page" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
    <script src="../JavaScript/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td  class='title'><span>
                        收支统计图</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="left">
    
    
<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td rowspan="3" valign="top" style="width: 764px" align="center" >
            <table style="width:100%;">
                <tr>
                    <td style="text-align: center;" valign="top" align="center">
                        统计时间从：<asp:TextBox runat="server" ID="df" onclick="WdatePicker()" ></asp:TextBox>到：<asp:TextBox runat="server" ID="dt" onclick="WdatePicker()" ></asp:TextBox>&nbsp; <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成统计图" />
                        <br />
                         <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="ShowData.gif" /></td>
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
