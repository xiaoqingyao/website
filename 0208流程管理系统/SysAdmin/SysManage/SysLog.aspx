<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysLog.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SysLog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>日志管理</title>
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
    <script language="javascript" type="text/javascript">
        function selOne() {
            var chkList = document.getElementsByName("chkId");
            chkList[0].checked = true;
        }
    </script>
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
                <select name="selType">
                <option value="">日志类型</option>
                <option value="1"<%if (Request.QueryString["selType"]=="1"){Response.Write(" selected");} %>>登录日志</option>
                <option value="2"<%if (Request.QueryString["selType"]=="2"){Response.Write(" selected");} %>>操作日志</option>
                <option value="3"<%if (Request.QueryString["selType"]=="3"){Response.Write(" selected");} %>>错误日志</option>
                </select>
                <span> 关键词：</span>
                <asp:TextBox ID="txtSearch" Width=120PX runat="server"></asp:TextBox>
                日志时间：<asp:TextBox ID="txtDate1" Width=80px runat="server" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"></asp:TextBox>到<asp:TextBox Width="80px"  onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" ID="txtDate2" runat="server"></asp:TextBox>
                               
                <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="<%$Resources:Common,Search %>"/></p>
        </div>   
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnHide_Click" style="display:none" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="document.getElementById('btnHidAction').value=1;selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"/>
            <asp:Button ID="btnClear" runat="server" Text="清空" OnClientClick="document.getElementById('btnHidAction').value=2;selOne();selfconfirm({msg:'确定要执行清空操作吗？<div style=\'color:red\'>注：1.清空后不能恢复<div style=\'padding-left:24px\'>2.只能清空一周之前的日志</div></div>',width:300,fn:function(data){setAction(data)}});return false;"/>
            <asp:Button ID="btnExport" runat="server" Text="导出" OnClick="btnExport_Click"/>
        </div>    
        <ul class="ulheader">
            <li style="width: 4%; text-align:center" >
            <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width:28%">日志内容</li>
            <li style="width: 10%; text-align:center">栏目</li>
            <li style="width: 8%; text-align:center">操作时间</li>
            <li style="width: 5%; text-align:center">操作人</li>
            <li style="width: 10%; text-align:center">IP地址</li>
            <li style="width: 25%">页面地址</li>
        </ul>
        <asp:Repeater ID="rptLogList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 4%;text-align:center">
                     <input type="checkbox" name="chkId" id="chkId" value='<%#Eval("ID")%>'<%#DateTime.Parse(Eval("AddDate").ToString()).AddDays(7)>DateTime.Now?" disabled":"" %>/>
                    </li>
                    <li style="width: 28%">
                        <%#Eval("Content")%></li>
                        <li style="width: 10%; text-align:center">
                        <%#getNodeName(Eval("NodeCode").ToString())%>
                    <li style="width: 8%; text-align:center">
                        <%#Eval("AddDate","{0:yy-MM-dd hh:mm}")%></a></li>
                    
                    </li>
                    <li style="width: 5%; text-align:center">
                        <%#Eval("UserNo")%>
                    </li>
                    <li style="width: 10%; text-align:center">
                        <%#Eval("Ip")%>
                    </li>
                    <li style="width: 25%">
                         <span id="Title<%#Eval("ID") %>"><%#Eval("ScriptName")%></span>
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
        <br clear="left" />
    </div>
    </form>
</body>
</html>
