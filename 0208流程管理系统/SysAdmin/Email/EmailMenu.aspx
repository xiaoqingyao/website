<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailMenu.aspx.cs" Inherits="AllPower.WEB.Admin.Email.EmailMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>菜单栏</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <div>        
        <dl>
            <dt>
                &nbsp;</dt>
            <dd>
                &nbsp;</dd>
        </dl>
        <dl>
            <dt>
                <a href="EmailList.aspx?fg=rec" target="main">收件箱(<asp:Label ID="lblRBoxSum" runat="server"></asp:Label>
                )</a></dt>
            <dd>
                &nbsp;</dd>
        </dl>
        <dl>
            <dt>
                <a href="EmailList.aspx?fg=draf" target="main">草稿箱(<asp:Label ID="lblDrafBoxSum" runat="server"></asp:Label>
                )</a></dt>
            <dd>
                &nbsp;</dd>
        </dl>
        <dl>
            <dt>
                <a href="EmailList.aspx?fg=snd" target="main">已发送(<asp:Label ID="lblSendBoxSum" runat="server"></asp:Label>
                )</a></dt>
            <dd>
                &nbsp;</dd>
        </dl>
        <dl>
            <dt>
                <a href="EmailList.aspx?fg=del" target="main">已删除(<asp:Label ID="lblDeleteBoxSum" runat="server"></asp:Label>
                )</a></dt>
            <dd>
                &nbsp;</dd>
        </dl>
        <dl>
            <dt>
                &nbsp;</dt>
            <dd>
                &nbsp;</dd>
        </dl>  
    </div>
    </form>
    </body>
</html>
