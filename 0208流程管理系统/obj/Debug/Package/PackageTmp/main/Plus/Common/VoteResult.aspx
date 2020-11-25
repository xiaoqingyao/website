<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteResult.aspx.cs" Inherits="AllPower.WEB.main.Plus.Common.VoteResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>投票结果查看</title>
    <link href="/SysAdmin/CSS/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="frmVoteResult" runat="server">
    <div style="width: 100%; text-align: center">
        <ul class="ulheader">
            <li style="width: 20%">选项</li>
            <li style="width: 10%;">票数</li>
            <li style="width: 12%;">百分比 </li>
            <li style="width: 35%;">图示</li>
        </ul>
        <asp:Repeater ID="rptVoteRes" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 20%">
                        <%#Eval("Name") %></li>
                    <li style="width: 10%">
                        <%#Eval("VoteCount").ToString()%></li>
                    <li style="width: 12%">
                        <%#GetPercent(Convert.ToDouble(Eval("VoteCount")))%>% </li>
                    <li style="width: 35%">
                        <img src="images/show.gif" alt="结果图示" width='<%#GetPercent(Convert.ToDouble(Eval("VoteCount")))%>%'
                            style='<%#GetDisplay(Convert.ToInt32(Eval("VoteCount")))%>' />
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <%-- <div style="width: 100%; text-align: center">
            <input id="btnReturn" type="button" style="color: Blue; height: 30px" value="返回上一页"
                onclick="JavaScript:history.go(-1);" /></div>--%>
    </div>
    </form>
</body>
</html>
