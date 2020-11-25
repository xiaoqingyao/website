<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberGroupList.aspx.cs" Inherits="AllPower.Web.Admin.MemberGroupList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>会员组管理</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    
    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
<form id="theForm" name="theForm" method="post" runat="server">
<input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
<div class="container">
     <h4>位置： <a href="#">系统管理</a><a> &gt;</a> <a href="MemberList.aspx">会员管理</a><a> &gt;</a> <span class="breadcrumb_current" > 会员组列表</span> </h4>
     
       <div id="searchContainer">
           <p> 
                  <span><%=Resources.Member.MemberGroup %></span>
                <asp:TextBox ID="txtGroupName" runat="server" Width="100px" >
                </asp:TextBox>
                        
                <%=Resources.Member.IsDisable%>
                  <asp:DropDownList ID="ddlState" runat="server">
                      <asp:ListItem Text="不限" Value=""></asp:ListItem>
                     <asp:ListItem Text="是" Value="1"></asp:ListItem>
                     <asp:ListItem Text="否" Value="0"></asp:ListItem>
                </asp:DropDownList>
 
                <asp:Button ID="btnQuery"  runat="server"   Text="<%$Resources:Common,Search %>" OnClick="btnQuery_Click" />
                
            </p>
         </div>
         
      <div class="function">    
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnNew_Click" />
            <asp:Button ID="btnOrders" runat="server"  Text="<%$Resources:Common,ModelOrder %>" onclick="btnOrders_Click" />
            <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>" onclick="btnDelete_Click" />
            <asp:Button ID="btnDisable" runat="server"  Text="<%$Resources:Common,ONTitle %>" onclick="btnDisable_Click" />
            <asp:Button ID="btnUnDisable" runat="server"  Text="<%$Resources:Common,OFFTitle %>" onclick="btnUnDisable_Click" />
               
      </div>      
      
                    <ul class="ulheader">
                        <li style="width: 5%;">
                            <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
                        </li>
                        <li style="width:10%;">
                            <%= Resources.Common.ModelOrder%>
                        </li>
                        <li style="width:10%;">
                            <%= Resources.Member.MemberGroup%>
                        </li>
                        <li style="width:20%;">
                            <%= Resources.Member.ServerIntro%>
                        </li>
                        <li style="width:5%;">
                            <%= Resources.Member.MemberCount%>
                        </li>
                        <li style="width:5%;">
                            <%= Resources.Member.Pub %>
                        </li>
                        <li style="width:5%;">
                            <%= Resources.Member.Visit%>
                        </li>
                        <li style="width:5%;">
                             <%=Resources.Member.IsDisable%>
                        </li>
                        <li style="width:20%;">
                            <%= Resources.Common.Operation%>
                        </li>
                    </ul>
                            <asp:Repeater ID="rptGroup" runat="server">
                                <ItemTemplate>
                                    <ul class="ulheader ulbody">
                                        <li style="width: 5%;">
                                            <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' />
                                        </li>
                                        <li style="width: 10%;">
                                            <asp:TextBox ID="txtOrders" runat="server" Style="width: 20px; border: " Text='<%#Eval("Orders") %>'
                                                CssClass="validate[required,custom[onlyNumber],length[0,3]]"></asp:TextBox>
                                            <asp:HiddenField ID="hidIds" runat="server" Value='<%#Eval("ID") %>' />
                                        </li>
                                        <li style="width: 10%;">
                                            <%#Eval("GroupName")%>
                                        </li>
                                        <li style="width: 20%;">
                                            <%# AllPower.Common.Utils.GetShortString(AllPower.Common.Utils.DropHtmlTag(Eval("ServerIntro").ToString()),20,true)%>
                                        </li>
                                        <li style="width: 5%;">
                                            <%#Eval("MemberCount")%>
                                        </li>
                                        <li style="width: 5%;">
                                            <%# AllPower.Common.Utils.ParseModelFieldState(AllPower.Common.Utils.ParseBool(Eval("IsPub")), "")%>
                                        </li>
                                         <li style="width: 5%;">
                                            <%#AllPower.Common.Utils.ParseModelFieldState(AllPower.Common.Utils.ParseBool(Eval("IsVisit")),"")%>
                                        </li>
                                        <li style="width: 5%;">
                                            <%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsDisable"), "")%>
                                        </li>
                                        <li style="width: 20%;">
                                            <asp:LinkButton ID="lbtnDel" OnCommand="lbtnDel_Click" CommandArgument='<%#Eval("ID") %>'
                                                Text="<%$ Resources:Common,Del%> " OnClientClick='<%# ("return confirm(\""+Resources.Common.DelConfirm+"\")") %>'
                                                runat="server" CssClass="abtn"></asp:LinkButton>
                                                
                                                 <asp:LinkButton ID="lbtnState" OnCommand="lbtnState_Click" CommandArgument='<%#Eval("ID") %>'
                                                Text='<%# GetOperatorText(Eval("IsDisable")) %>'                                                
                                                runat="server" CssClass="abtn"></asp:LinkButton>
                                                
                                            <a href='MemberGroupEdit.aspx?action=edit&ID=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>' class="abtn">
                                                <%= Resources.Common.Update%></a> </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
                           
                              <span class="function fr">
                              </span>
                              
                                <webdiyer:AspNetPager ID="AspNetPager1"  CssClass="page" runat="server" PageSize="10" AlwaysShow="True"
                                    OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"  
                                    ShowPageIndexBox="always" PageIndexBoxType="DropDownList" 
                                    CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
                                    UrlPaging="True">
                                </webdiyer:AspNetPager>
                       </div>
</form>
</body>
</html>