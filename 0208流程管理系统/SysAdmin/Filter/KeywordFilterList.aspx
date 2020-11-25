<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeywordFilterList.aspx.cs" Inherits="AllPower.Web.Admin.KeywordFilterList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>关键字过滤</title>
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
<form id="theForm" name="theForm" method="post" runat="server">
<input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
<div class="container">
     <h4>位置： <a href="#">扩展应用</a><a> &gt;</a>  <span class="breadcrumb_current" >关键字列表</span> </h4>
     
      <div id="searchContainer">
           <p>
                <span><%=Resources.KeywordFilter.Keywrod %></span>
                <asp:TextBox ID="txtKeyword" runat="server"  ></asp:TextBox>
                
                 <%=Resources.KeywordFilter.ReplaceStr%>
                 <asp:TextBox ID="txtReplace" runat="server"  ></asp:TextBox>
                 
                <%=Resources.Member.IsDisable%>
                <asp:CheckBox ID="chkDisable" runat="server" />                
               
                <asp:Button ID="btnQuery"  runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnQuery_Click" />
                
            </p>
         </div>
         
      <div class="function">    
       <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" style="display:none" />
            <asp:Button ID="btnAdd" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnAdd_Click" />           
             <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />   
      </div>      
      
                    <ul class="ulheader" >
                         <li style="width:10%;">
                           <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /> 
                        </li>
                        
                        <li style="width:20%;">
                            <%= Resources.KeywordFilter.Keywrod%>
                        </li>
                        <li style="width:20%;">
                            <%=Resources.KeywordFilter.ReplaceStr%>
                        </li>
                        <li style="width:5%;">
                            <%= Resources.Member.IsDisable%>
                        </li>
                        <li style="width:20%;">
                            <%= Resources.Common.Operation%>
                        </li>
                    </ul>
                            <asp:Repeater ID="rptKeyword" runat="server">
                                <ItemTemplate>
                                     <ul class="ulheader ulbody">
                                      <li style="width:10%;">
                                            <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' />
                                         </li>                                         
                                        <li style="width:20%;">
                                        <span id="Title<%# Eval("ID")%>">                                          
                                            <%#Eval("Keyword") %></span>
                                          </font>
                                        </li>
                                       <li style="width:20%;">
                                           <%#Eval("ReplaceStr") %>
                                        </li>                              
                                        <li style="width:5%;">
                                            <%# AllPower.Common.Utils.ParseState(1- AllPower.Common.Utils.ParseInt(Eval("IsDisable"),0),"") %>
                                        </li>                                      
                                       <li style="width:20%;">
                                       
                                            <asp:LinkButton ID="lbtnDel"   Text="<%$ Resources:Common,Del%> "  OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" runat="server" CssClass="abtn" ></asp:LinkButton>  
                                                 <asp:LinkButton ID="lbtnDisable" OnCommand="lbtnDisable_Click" CommandArgument='<%#Eval("ID") %>'
                                                Text='<%# AllPower.Common.Utils.ParseStateTitle(Eval("IsDisable"),"") %>'  
                                                runat="server" CssClass="abtn" ></asp:LinkButton>
                                                 <a href='KeywordFilterEdit.aspx?action=edit&id=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>' class="abtn">
                                                <%= Resources.Common.Update%></a>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
                           
                           <ul>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="page" PageSize="20" AlwaysShow="True" UrlPaging="true"
                                    ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                                    PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>" 
                                    HorizontalAlign="Center" NumericButtonCount="6">
                                </webdiyer:AspNetPager>
                                </ul>
                       </div>
</form>
</body>
</html>