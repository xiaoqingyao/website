<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员登陆</title>
    <style type="text/css">
    body
    {
       margin:0;
       padding:0;
      
    }
        .auto-style14 {
            width: 733px;
            height: 296px;
        }
    </style>
</head>
<body style="margin-top: 0">
    <form id="form1" runat="server" style="width: 1600px; height: 1600px; text-align: center;"> 
  
               
         <div style="margin-top: 50px; background-image: url('images/houtiabg.png'); background-repeat: no-repeat; width: 1200px; height: 600px; margin-left: 400px;">
     <div class="auto-style14" style="text-align: center; padding-top: 220px; padding-left: 80px;" dir="ltr">
    <div>
    <div >用户名：<asp:TextBox ID="txt_name" runat="server" Width="128px" Height="16px"></asp:TextBox></div>
        密　码：<asp:TextBox ID="txt_pwd" runat="server" TextMode="Password" 
            Width="128px"></asp:TextBox>
        <br />
        类　型：<asp:DropDownList ID="DropDownList1" runat="server" 
            Height="16px" Width="128px" >
            <asp:ListItem Value="0">普通管理员</asp:ListItem>
            <asp:ListItem Value="1">超级管理员</asp:ListItem>
        </asp:DropDownList>
        </div>
    <div style="margin-top:5px;">
        　　<asp:Button ID="Button1" runat="server" Text="登录" Height="28px" 
            Width="56px" onclick="Button1_Click" />　　　<asp:Button ID="Button2"
            runat="server" Text="返回" Height="28px" Width="56px" /></div>
           </div>
         </div>
    </form>
</body>
</html>
