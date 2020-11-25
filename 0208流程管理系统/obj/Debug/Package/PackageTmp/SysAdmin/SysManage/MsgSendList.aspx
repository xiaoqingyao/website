<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgSendList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.MsgSend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>操作管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>    
    <script type="text/javascript" src="../js/common.js"></script>
    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">我的工作台</a> &gt; <span class="breadcrumb_current"> 我发送的短信息</span>
        </h4>
         <ul id="tags">
        	<li><a href="MsgReceiveList.aspx">己接收的短消息</a> </li>
        	<li class="selectTag"><a href="MsgSendList.aspx">己发送的短消息</a></li>
        	<li><a href="MsgAdd.aspx?action=New">发送内部短信</a></li>
        </ul> 
        <div class="mynotesearch">   
        <div id="searchContainer">
                 <p>
                <span> 短消息内容：</span>
                <asp:TextBox ID="txtSearch" Width=200PX runat="server"></asp:TextBox>
                短消息时间：<asp:TextBox ID="txtDate1" Width=100px runat="server" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"></asp:TextBox>到<asp:TextBox Width="100px"  onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" ID="txtDate2" runat="server"></asp:TextBox>
                               
                <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="<%$Resources:Common,Search %>"/></p>
        </div>
          
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btndel_Click" style="display:none" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
             />
        </div>
        <ul class="ulheader">
            <li style="width: 5%; text-align:center" >
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 6%;text-align:center">收信人</li>
            <li style="width: 55%;text-align:center">内容</li>
            <li style="width: 10%;text-align:center">发送时间</li>
            <%--<li style="width: 5%;text-align:center">状态</li>--%>
            <li style="width: 13%">操作</li>
        </ul>
        <asp:Repeater ID="rptMessageList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 5%;text-align:center">
                     <input type="checkbox" name="chkId" value='<%#Eval("ID")%>' />
                    </li>
                    <li style="width: 6%;text-align:center">
                        <%#GetUserName(Eval("SendeeUID").ToString(), Eval("UserName").ToString())%></li>
                    <li style="width: 55%"><a href='#' id="Title<%# Eval("ID")%>"><%#AllPower.Common.Utils.DropHtmlTag(Eval("Content").ToString())%></a></li>
                   
                    <li style="width: 10%;text-align:center">
                        <%#Eval("AddDate","{0:yyyy-MM-dd hh:mm}")%>
                    </li>
                   <%-- <li style="width: 5%;text-align:center">
                        <%#ShowIsRead(Eval("IsRead").ToString())%>
                    </li>--%>
                    <li style="width: 13%">
                       <asp:LinkButton ID="lnkbDelete" cssclass="abtn" runat="server" OnCommand="MsgReceiveList_Del"
                            CommandName="deldp" CommandArgument='<%#Eval("ID") %>'
                            OnClientClick='selectThisRow();selfconfirm({msg:"确定要执行删除操作吗？",fn:function(data){setAction(data)}});return false;'>删除</asp:LinkButton>    
                        <a class="abtn" href='MsgAdd.aspx?NodeCode=<%=NodeCode %>&ID=<%#Eval("MessageID")%>'>转发</a>
                    </li>
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
        </div>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
