<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecyclingList.aspx.cs" Inherits="AllPower.Web.Admin.RecyclingList" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>回收站信息管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
<script type="text/javascript" src="../js/publicform.js"></script>
<script type="text/javascript" src="../js/listcheck.js"></script>
<script type="text/javascript" src="../js/regExp.js"></script>
<link href="../css/dialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.dialog.js"></script>
<script type="text/javascript" src="../js/win.js"></script>
 <script type="text/javascript" src="../js/Common.js"></script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form id="Form1" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
<div class="container">
  <h4>位置： <%GetPageNav(NodeCode); %></h4>
  <div id="searchContainer">
  <p><%= Resources.Common.Name%><asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>     <asp:DropDownList ID="ddlTable" runat="server"></asp:DropDownList>
                            <asp:Button ID="btnKeySerach" runat="server" Text="<%$Resources:Common,Search %>"       onclick="btnKeySerach_Click" />                           
      </p>
  </div> 
  <div class="function">
            <asp:Button ID="btnNew" runat="server" Text="还原" OnClick="btnRese_Click"  OnClientClick="return GetSelectTitle()"  />                      
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClick="btnDel_Click" OnClientClick="return GetSelectTitle()"  />
        </div>
  <ul class="ulheader">  
   <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>  
  <li style="width:50%">标题</li>
    <li style="width:10%">所属节点</li>
   <li style="width:10%">删除时间</li>
  <li style="width:20%;"><%= Resources.Common.Operation%></li>
  </ul>
       <asp:Repeater ID="rptModelFileGroup" runat="server">
                <ItemTemplate>   
  <ul class="ulheader ulbody">   
             <li style="width: 40px">            
                        <input type="checkbox" name="chkId" id="chkId" value='<%#Eval("id").ToString()+"|"+Eval("tableName2").ToString() %>' />
                        <input type="hidden" name="hdnFile" value='<%#Eval("title") %>' />
                        </li>
 
  <li style="width:50%"><span id="Title<%#Eval("id").ToString()+"|"+Eval("tableName2").ToString() %>">
                        <%# Eval("title")%></span></li> 
      <li style="width:10%"><%#Eval("NodeName").ToString()%></li>
     <li style="width:10%"><%#Eval("deltime").ToString()%></li>
  <li style="width:20%">
	<asp:Button ID="Button2" runat="server" Text="还原"   CommandArgument='<%#Eval("id").ToString()+"|"+Eval("tableName2").ToString() %>' OnCommand="btn_rese" />
	<asp:Button ID="Button1" runat="server" Text="<%$Resources:Common,Del %>" OnCommand="btn_Del" CommandArgument='<%#Eval("id").ToString()+"|"+Eval("tableName2").ToString() %>'  />    			     
   </li>
  </ul>
  </ItemTemplate>
                </asp:Repeater>
   <span class="function fr">
<asp:Button ID="btnNew2" runat="server" Text="还原" OnClick="btnRese_Click"  OnClientClick="return GetSelectTitle()"  />          
<asp:Button ID="btnDelete2" runat="server" Text="<%$Resources:Common,Del %>" OnClick="btnDel_Click" OnClientClick="return GetSelectTitle()"  />
  </span>
  
  <ul>
    <webdiyer:aspnetpager id="AspNetPager1" CssClass="page" runat="server" PageSize="15" 
                          AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" 
                          ShowCustomInfoSection="Left"
                          ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    
                          CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录" 
                          UrlPaging="True"></webdiyer:aspnetpager>       
 </ul>
  <br clear="left" />
</div>  
</form>

</body>
</html>