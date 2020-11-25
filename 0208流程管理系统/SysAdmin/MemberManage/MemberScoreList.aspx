<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberScoreList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.MemberManage.MemberScoreList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>会员积分</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
        <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="searchContainer">
            <p>
                <asp:DropDownList ID="ddlSource" runat="server"></asp:DropDownList>
                
                <span> 用户名：</span>
                <asp:TextBox ID="txtSearch" Width=120PX runat="server"></asp:TextBox>
                积分时间：<asp:TextBox ID="txtDate1" Width=80px runat="server" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"></asp:TextBox>到<asp:TextBox Width="80px"  onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" ID="txtDate2" runat="server"></asp:TextBox>
                               
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" 
                    onclick="btnQuery_Click"/></p>
        </div>   
        <div class="function">
            
        </div>    
        <ul class="ulheader">
            <li style="width:10%; text-align:center">用户名</li>
            <li style="width: 10%; text-align:center">积分数</li>
            <li style="width: 10%; text-align:center">积分来源</li>
            <li style="width: 10%; text-align:center">日期</li>
            <li style="width: 50%; text-align:center">备注</li>
        </ul>
        <asp:Repeater ID="rptScoreList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    
                    <li style="width: 10%; text-align:center">
                        <%#Eval("UserName")%></li>
                        <li style="width: 10%; text-align:center">
                        <%#Eval("Score")%></li>
                        <li style="width: 10%; text-align:center">
                        <%#GetSource(Eval("Source").ToString())%></li>
                    <li style="width: 10%; text-align:center">
                        <%#Eval("AddDate","{0:yyyy-MM-dd}")%></a></li>
                    
                    <li style="width: 50%; text-align:center">
                        <%#Eval("Remark")%></li>
                    
                </ul>
            </ItemTemplate>
        </asp:Repeater>      
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True" UrlPaging="true"
                ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>" 
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
