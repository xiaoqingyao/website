<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecyclingAssociatedList.aspx.cs" Inherits="KingTop.Web.Admin.RecyclingAssociatedList" %>

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
  <h4>位置： <a href="#">内容管理</a><a> &gt;</a> 回收站信息关联表管理</h4>

  <div class="function">
            <asp:Button ID="Button1" runat="server" Text="返回信息表管理" OnClientClick="location.href='RecyclingManageList.aspx';return false;" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />                      
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClick="btnDel_Click" OnClientClick="return GetSelectTitle()"  />
        </div>
  <ul class="ulheader">  
   <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>  
   <li style="width:10%;">关联表名</li>    
     <li style="width:10%;">关联字段</li>    
  <li style="width:30%">关联条件</li>
    <li style="width:10%">添加人</li>
   <li style="width:10%"><%= Resources.Common.AddTime%> </li>
  <li style="width:20%;"><%= Resources.Common.Operation%></li>
  </ul>
       <asp:Repeater ID="rptModelFileGroup" runat="server">
                <ItemTemplate>   
  <ul class="ulheader ulbody">   
             <li style="width: 40px">            
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' />
                        <input type="hidden" name="hdnFile" value='<%#Eval("RecyclingManageID") %>' />
                        </li>
 
  <li style="width:10%"><span id="Title<%# Eval("ID")%>">
                        <%# Eval("tableName")%></span></li>
    <li style="width:10%"><%#Eval("AssociatedKey").ToString()%></li>
    <li style="width:30%"><%#Eval("AssociatedWhere").ToString()%></li>
      <li style="width:10%"><%#Eval("addMan").ToString()%></li>
     <li style="width:10%"><%#Eval("AddDate").ToString()%></li>
  <li style="width:20%">
	 <a class="abtn" id="lnkEdit" runat="server" href='<%#"RecyclingAssociatedEdit.aspx?action=edit&nodecode="+NodeCode+"&id="+Eval("id")+"&pid="+strPid %>'><%= Resources.Common.Update%></a>	 	 				     
   </li>
  </ul>
  </ItemTemplate>
                </asp:Repeater>
   <span class="function fr">
     <asp:Button ID="Button2" runat="server" Text="返回信息表管理" OnClientClick="location.href='RecyclingManageList.aspx';return false;" />
<asp:Button ID="btnNew2" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />          
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