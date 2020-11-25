<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberModelFieldList.aspx.cs" Inherits="AllPower.Web.Admin.MemberModelFieldList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会员模型字段管理</title>
  <link href="../css/public.css" rel="stylesheet" type="text/css" />
  <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>
    
     <script type="text/javascript" src="../js/listcheck.js"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    
    <script type="text/javascript" src="../JS/jquery.ui.form.select.js"></script>
 
<script type="text/javascript">
    $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
</head>
<body>
<form id="theForm"  runat="server">
 <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
  <div class="container">
        <h4>位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">会员管理</a><a> &gt;</a> 
                <span class="breadcrumb_current" > <asp:Label ID="lblModelName" runat="server" Text=""></asp:Label> 模型字段管理</span> 
         </h4>
         
          <div class="function">
              <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnNew_Click" />
              <asp:Button ID="btnOrders" runat="server"  Text="<%$Resources:Common,ModelOrder %>" onclick="btnOrders_Click" />
                <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>" onclick="btnDelete_Click" />
          </div>
   
         <ul class="ulheader">
              <li style="width: 5%;">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
            </li>
              <li style="width:10%"> <%= Resources.Common.Orders%></li>
               <li style="width:20%"><%= Resources.Model.ModelListFieldName%></li>
               <li style="width:20%"> <%= Resources.Model.ModelListFieldAlias%></li>
               <li style="width:10%"><%= Resources.Model.ModelListFiledType%></li>
               <li style="width:5%"><%= Resources.Member.IsShow%></li>
               <li style="width:20%" ><%= Resources.Common.Operation%></li>
        </ul>
    
    <asp:Repeater ID="rptFieldList" runat="server">
      <ItemTemplate>
         <ul class="ulheader ulbody">
         <li style="width:5%;">
                    <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' />
                </li>
                <li style="width:10%"> 
                     <asp:TextBox ID="txtOrders" runat="server" Width="20" Text='<%#Eval("Orders") %>'
                         CssClass="validate[required,custom[onlyNumber],length[0,3]]"></asp:TextBox>
                     <asp:HiddenField ID="hidIds" runat="server" Value='<%#Eval("ID") %>' />
                </li>
                
           <li style="width:20%"><%#Eval("Name")%></li>
           <li style="width:20%"><%#Eval("Alias")%></li>      
           <li style="width:10%"><%#GetDictionaryValue(Eval("Type")) %></li>
           <li style="width:5%"><%# AllPower.Common.Utils.ParseModelFieldState(Eval("IsVisible"),"0")%></li>
           
           <li style="width:20%">
               <!-- 删除 -->
              <asp:LinkButton ID="lbtnDel" runat="server" Text="<%$Resources:Common,Del %>" 
              OnClientClick='<%# ("return confirm(\""+Resources.Common.DelConfirm+"\")") %>'
                  OnCommand="lbtnDel_Click" CommandArgument='<%#Eval("id") %>' CssClass="abtn"></asp:LinkButton>
 
              <!-- 修改 -->
              <a href='MemberModelFieldEdit.aspx?action=edit&ID=<%#Eval("ID") %>&mid=<%# Eval("ModelID") %>' class="abtn">
                       <%= Resources.Common.Update%>
              </a>                              
           
              <!-- 禁用 -->
              <asp:LinkButton ID="lbtnEnable" runat="server" 
                Text='<%#AllPower.Common.Utils.ParseState(!Convert.ToBoolean(Eval("IsVisible")),Resources.Common.ON) %>'   
                OnCommand="lbtnEnable_Click" CommandArgument='<%#Eval("id")%>' CssClass="abtn">
              </asp:LinkButton>
          </li>
        </ul>
      </ItemTemplate>
    </asp:Repeater>
    
         <span class="function fr">
 
  </span>
                <webdiyer:AspNetPager CssClass="page" ID="AspNetPager1" runat="server" PageSize="12" AlwaysShow="True"
                            OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left" 
                            ShowPageIndexBox="always" PageIndexBoxType="DropDownList" 
                            CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
                            UrlPaging="True">
                </webdiyer:AspNetPager>
         
  </div>
</form>
</body>
</html>