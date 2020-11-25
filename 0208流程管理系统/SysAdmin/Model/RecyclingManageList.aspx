<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecyclingManageList.aspx.cs" Inherits="AllPower.Web.Admin.RecyclingManageList" %>

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
  <p><%= Resources.Common.Name%><asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                            <asp:Button ID="btnKeySerach" runat="server" Text="<%$Resources:Common,Search %>" 
                                onclick="btnKeySerach_Click" />                           
      </p>
  </div> 
  <div class="function">
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />                      
            <asp:Button ID="Button1" runat="server" Text="检查表是否正确" OnClick="btnCheck_Click" />  
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClick="btnDel_Click" OnClientClick="return GetSelectTitle()"  />
        </div>
  <div style="padding-left:20px">注：不正确的表可能是因为表名、字段名不存在，需要重新填写，否则回收站中不会显示这个表被删除的信息</div>
  <ul class="ulheader">  
   <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li> 
  <li style="width:10%;">表名</li>   
  <li style="width:40%">描述</li>
    <li style="width:10%">是否正确</li>
   <li style="width:10%"><%= Resources.Common.AddTime%> </li>
  <li style="width:20%;"><%= Resources.Common.Operation%></li>
  </ul>
       <asp:Repeater ID="rptModelFileGroup" runat="server">
                <ItemTemplate>   
  <ul class="ulheader ulbody">   
             <li style="width: 40px">            
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' />
                        <input type="hidden" name="hdnFile" value='<%#Eval("tableName") %>' />
                        </li>
 
  <li style="width:10%"><span id="Title<%# Eval("ID")%>">
                        <%# Eval("tableName")%></span></li>
 
    <li style="width:40%"><%#Eval("desc").ToString()%></li>
      <li style="width:10%"><%#Eval("IsError").ToString()=="True"?"<font color=red>错误</font>":"正确"%></li>
     <li style="width:10%"><%#Eval("AddDate").ToString()%></li>
  <li style="width:20%">
	 <a class="abtn" id="lnkEdit" runat="server" href='<%#"RecyclingManageEdit.aspx?action=edit&nodecode="+NodeCode+"&id="+Eval("id") %>'><%= Resources.Common.Update%></a>	 
	  <a class="abtn" href='<%#"RecyclingAssociatedList.aspx?nodecode="+NodeCode+"&pid="+Eval("id") %>'>关联表管理</a>	 				     
   </li>
  </ul>
  </ItemTemplate>
                </asp:Repeater>
   <span class="function fr">
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