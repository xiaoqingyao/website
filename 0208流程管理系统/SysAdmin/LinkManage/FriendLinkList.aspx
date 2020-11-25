<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="FriendLinkList.aspx.cs" Inherits="AllPower.Web.Admin.FriendLinkList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>友情链接</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> &gt; <span class="breadcrumb_current"> 友情链接</span>
        </h4>
     <div id="searchContainer">
            <p>
            <span><%=Resources.FriendLink.DisplayOptions%> </span>
             <asp:RadioButtonList runat="server" ID="radlCheck" 
                RepeatDirection="Horizontal" RepeatLayout="Flow" 
                onselectedindexchanged="radlCheck_SelectedIndexChanged" AutoPostBack="true" >
             <asp:ListItem Text="<%$Resources:FriendLink,YesCheck %>" Value="1" Selected="True"></asp:ListItem>
             <asp:ListItem Text="<%$Resources:FriendLink,NoCheck %>" Value="0"></asp:ListItem>
             </asp:RadioButtonList>
            <span><%=Resources.FriendLink.Keyword%> </span> 
            <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
            <asp:RadioButtonList runat="server" ID="radlLinkType" RepeatDirection="Horizontal" RepeatLayout="Flow">             
             </asp:RadioButtonList>
            <asp:CheckBox ID="chkCommend" runat="server" Text="<%$Resources:FriendLink,Commend%>"  />
            
            
            <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" 
                onclick="btnQuery_Click"/></p>
    </div>
    <div class="function">    
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnAdd_Click" />
            <asp:Button ID="btnOrder" runat="server"  Text="<%$Resources:Common,ModelOrder %>" onclick="btnOrders_Click" />
            <asp:Button ID="btnCommend" runat="server" Text="<%$Resources:FriendLink,CommendLink %>" OnClick="btnCommend_Click" />
            <asp:Button ID="btnCancelCommend" runat="server" Text="<%$Resources:FriendLink,CancelCommend %>" OnClick="btnCancelCommend_Click" />
            <asp:Button ID="btnCheck" runat="server" Text="<%$Resources:FriendLink,CheckLink %>" OnClick="btnCheckLink_Click" />
            <asp:Button ID="btnCancelCheck" runat="server"  Text="<%$Resources:FriendLink,CancelLink %>" onclick="btnCancelLink_Click" />
            <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:FriendLink,DelLink %>"  OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"/>
      </div>      
      
                    <ul class="ulheader">
                        <li style="width:10%;">
                           <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /> 
                        </li>
                        <li style="width:10%;">
                            <%= Resources.Common.ModelOrder%>
                        </li>
                         <li style="width:10%;">
                            <%= Resources.FriendLink.WebName%>
                        </li>
                         <li style="width:10%;">
                            <%= Resources.FriendLink.WebLogo%>
                        </li>
                        <li style="width:10%;">
                            <%= Resources.FriendLink.LinkClass%>
                        </li>
                        <li style="width:10%;">
                            <%= Resources.FriendLink.LinkType%>
                        </li>
                        <li style="width:5%;">
                            <%= Resources.FriendLink.Bold%>
                        </li>
                         <li style="width:5%;">
                            <%= Resources.Common.Review%>
                        </li>                         
                        <li style="width:5%;">
                            <%= Resources.FriendLink.ClickNum%>
                        </li>
                        <li style="width:10%;">
                            <%= Resources.Common.Operation%>
                        </li>
                    </ul>
                            <asp:Repeater ID="rptFriendLink" runat="server">
                                <ItemTemplate>
                                     <ul class="ulheader ulbody">
                                         <li style="width:10%;">
                                            <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' />
                                         </li>
                                        <li style="width:10%;">
                                           <asp:TextBox ID="txtOrders" runat="server" style="width:20px; border:" Text='<%#Eval("Orders") %>' 
                                                CssClass="validate[required,custom[onlyNumber],length[0,3]]"></asp:TextBox>
                                            <asp:HiddenField ID="hidIds" runat="server" Value='<%#Eval("ID") %>' />                                         
                                        </li>
                                        <li style="width:10%;">
                                         <a href='<%# Eval("WebUrl") %>' target="_blank" id="Title<%#Eval("ID") %>">
                                                 <%# IsBoldCommandTextColor(Eval("WebName").ToString(), Eval("IsBold"), Eval("LinkColor"), Eval("IsCommend"))%> 
                                         </a>
                                        </li>
                                       <li style="width:10%;">
                                        <%# String.IsNullOrEmpty(Eval("logo").ToString()) ? "" : "<img src='" +GetUploadImg()+ Eval("logo").ToString() + "' style='height:50px;'/>"%>
                                        </li>
                                         <li style="width:10%;">
                                            <%# Eval("Class")%>
                                        </li>
                                         <li style="width:10%;">
                                            <%# odLink.getDictionaryValue(Eval("LinkType").ToString())%>
                                        </li>
                                         <li style="width:5%;">
                                            <font color=red><%# AllPower.Common.Utils.ParseModelFieldState2(Eval("IsBold"), "")%></font>
                                        </li>     
                                          <li style="width:5%;">
                                           <font color=red><%# AllPower.Common.Utils.ParseModelFieldState2(Eval("IsCheck"),"")%></font>
                                        
                    </li>
                    <li style="width: 5%;">
                        <%#Eval("ClickNum")%>
                    </li>
                    <li style="width: 10%;">
                        <asp:LinkButton ID="lbtnDelete" CommandArgument='<%#Eval("ID") %>' Text="<%$ Resources:Common,Del%>"
                            runat="server" CssClass="abtn" OnClientClick='<%# ("selectThisRow();selfconfirm({msg:\""+Resources.Common.DelConfirm+"\",fn:function(data){setAction(data)}});return false;")%>'></asp:LinkButton>
                        <a href='FriendLinkEdit.aspx?action=edit&id=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>'
                            class="abtn">
                            <%= Resources.Common.Update%></a> </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
    </div>
    </form>
</body>
</html>
