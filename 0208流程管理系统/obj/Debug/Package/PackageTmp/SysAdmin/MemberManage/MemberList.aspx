<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="AllPower.Web.Admin.MemberList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>会员管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<link href="../css/public.css" rel="stylesheet" type="text/css" />
<link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
<link href="../css/dialog.css" rel="stylesheet" type="text/css" />
<script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="../js/listcheck.js"></script>
<script type="text/javascript" src="../js/jquery.dialog.js"></script>
<script type="text/javascript" src="../js/win.js"></script>
<script type="text/javascript" src="../js/publicform.js"></script>
</head>
<body>
<form id="theForm" name="theForm" method="post" runat="server">
 <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
<div class="container">
     <h4>位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">会员管理</a><a> &gt;</a> <span class="breadcrumb_current" > 会员列表</span> </h4>
     
     <div id="searchContainer">
           <p>
                <span><%=Resources.Member.UserName %></span>
                <asp:TextBox ID="txtUserName" runat="server" Width="100px" >
                </asp:TextBox>
                
                <%=Resources.Member.MemberGroup %>
                <asp:DropDownList ID="ddlGroup" runat="server">
                </asp:DropDownList>
                
                <%--<%=Resources.Member.MemberModel%>  
                <asp:DropDownList ID="ddlMemberModel" runat="server">
                </asp:DropDownList>  --%>
                               
                 <%=Resources.Member.MemberState %> 
                  <asp:DropDownList ID="ddlState" runat="server">
                  <asp:ListItem Text="不限" Value=""></asp:ListItem>
                </asp:DropDownList>
                
                 <%=Resources.Member.Email %> 
                <asp:TextBox ID="txtEmail" runat="server" Width="100px"  ></asp:TextBox>
                <asp:Button ID="btnSearch"  runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnSearch_Click" />
                
            </p>
         </div>
     
     <div class="function">
        <asp:Button ID="btnAdd" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnAdd_Click" />
        <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>" onclick="btnDelete_Click" />
        <asp:Button ID="btnLock" runat="server" Text="<%$Resources:Member,Islock %>" OnClick="btnLock_Click" />
        <asp:Button ID="btnUnlock" runat="server"  Text="<%$Resources:Member,Unlock %>" onclick="btnUnlock_Click" />
     </div>                                      
    <ul class="ulheader">
        <li style="width: 5%;">
            <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
        </li>
        <li style="width: 10%">
            <%= Resources.Member.UserName%></li>
        <li style="width: 10%">
            <%= Resources.Member.MemberGroup%></li>
        <%--<li style="width: 10%">
            <%= Resources.Member.MemberModel%></li>--%>
        <li style="width: 5%">
            <%= Resources.Member.Funds%></li>
        <li style="width: 5%">
            <%= Resources.Member.Integral%></li>
            <li style="width: 10%">
            <%= Resources.Member.Email%></li>
        <li style="width: 5%">
            <%= Resources.Member.MemberState%></li>
        <li style="width: 10%">
            <%= Resources.Member.LastLogin%></li>
        <li style="width: 20%">
            <%= Resources.Common.Operation%></li>
    </ul>
     
        <asp:Repeater ID="rptMember" runat="server">
            <ItemTemplate>
               <ul class="ulheader ulbody">
                <li style="width:5%;">
                    <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("memberID")%>' />
                </li>
                    <li style="width:10%"><%#Eval("UserName")%></li>
                    <li style="width:10%"><%#Eval("GroupName")%></li>
                    <%--<li style="width:10%"><%# GetMemberModelByModelID(Eval("ModleID").ToString())%></li>--%>
                    <li style="width:5%"><%#Eval("Funds")%></li>
                    <li style="width:5%"><%#Eval("Integral")%></li>
                    <li style="width:10%"><%#Eval("Email")%></li>
                    <li style="width:5%"><%#odLink.getDictionaryValue(Eval("StateID").ToString()) %></li>
                    <li style="width:10%"><%# AllPower.Common.Utils.GetStandardDateTime(Eval("LastLoginDate").ToString())%></li>
                    <li style="width:20%">
                    
                    <a href='MemberEdit.aspx?action=edit&memberID=<%#Eval("MemberID") %>&NodeCode=<%=NodeCode %>' class="abtn">
                            <%=Resources.Common.Update%></a>
                            
                        <asp:LinkButton ID="lbtnDel" OnCommand="lbtnDel_Click" CommandArgument='<%#Eval("memberID") %>'
                            Text="<%$ Resources:Common,Del%> " 
                            OnClientClick='<%# ("return confirm(\""+Resources.Common.DelConfirm+"\")") %>'
                            runat="server" CssClass="abtn"></asp:LinkButton>
                         
                         <asp:LinkButton ID="lbtnState" OnCommand="lbtnState_Click" CommandArgument='<%#Eval("memberID") %>'
                            Text='<%# GetOperatorLock(Eval("StateID")) %>' 
                            runat="server" CssClass='<%# AllPower.Common.Utils.ParseInt(Eval("StateID"),1)==1?"abtn":"" %>'></asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
                    <span class="function fr">
 
                    </span>
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" PageSize="15" AlwaysShow="True"
                            OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"  
                            ShowPageIndexBox="always" PageIndexBoxType="DropDownList" 
                            CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
                            UrlPaging="True" CssClass="page">
                        </webdiyer:AspNetPager>
                   
                  </div>
</form>
</body>
</html>