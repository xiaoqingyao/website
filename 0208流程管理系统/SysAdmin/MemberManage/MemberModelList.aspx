<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberModelList.aspx.cs" Inherits="AllPower.Web.Admin.MemberModelList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>会员模型列表</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    
    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    
    <script type="text/javascript" src="../js/publicform.js"></script>
    
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
   <div class="container">
        <!---- 导航 ---->
        <h4>位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">会员模型</a><a> &gt;</a> <span class="breadcrumb_current" > 模型列表</span> </h4>
        
        <div id="searchContainer">
           <p><span><%=Resources.Model.ModelName%></span>
                <asp:TextBox ID="txtName" runat="server" Width="100px" />
                  <%=Resources.Member.IsDisable%>
                  <asp:DropDownList ID="ddlState" runat="server">
                      <asp:ListItem Text="不限" Value=""></asp:ListItem>
                     <asp:ListItem Text="启用" Value="1"></asp:ListItem>
                     <asp:ListItem Text="禁用" Value="0"></asp:ListItem>
                </asp:DropDownList>
 
                <asp:Button ID="btnQuery"  runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnQuery_Click" />
                </p>
         </div> 
        
        <!---- 操作按钮 ----> 
        <div class="function">
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnNew_Click" />
            <asp:Button ID="btnOrders" runat="server"  Text="<%$Resources:Common,ModelOrder %>" onclick="btnOrders_Click" />
            <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>" onclick="btnDelete_Click" />
            <asp:Button ID="btnDisable" runat="server"  Text="<%$Resources:Common,ON %>" onclick="btnDisable_Click" />
            <asp:Button ID="btnUnDisable" runat="server"  Text="<%$Resources:Common,OFF %>" onclick="btnUnDisable_Click" />
        </div>
        
        <!---- 记录列表 ---->
          <ul class="ulheader">
                <li style="width: 5%;">
                    <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
                </li>
               <li style="width:5%;"><%= Resources.Common.Orders%></li>
              <li style="width:15%;"><%= Resources.Common.Name%></li>
              <li style="width:5%;"><%= Resources.Member.MemberCount%></li>
              <li style="width:5%;"><%= Resources.Model.ModelEnable%></li>
              <li style="width:20%;"><%= Resources.Common.Describe%></li>
              <li style="width:30%;"><%= Resources.Common.Operation%></li>
          </ul>
        
            <asp:Repeater ID="rptModelManage" runat="server">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 5%;">
                            <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' />
                        </li>
                        <li style="width: 5%;">
                            <asp:TextBox ID="txtOrders" runat="server" Style="width: 20px; border: " Text='<%#Eval("Orders") %>'
                                CssClass="validate[required,custom[onlyNumber],length[0,3]]"></asp:TextBox>
                            <asp:HiddenField ID="hidIds" runat="server" Value='<%#Eval("ID") %>' />
                        </li>
                        <li style="width: 15%;"><a href='MemberModelFieldList.aspx?action=edit&id=<%# Eval("ID")%>'>
                            <%# Eval("Name")%></a> </li>
                        <li style="width: 5%;">
                            <%# Eval("MemberCount") %></li>
                        <li style="width: 5%;">
                            <%#AllPower.Common.Utils.ParseState(Eval("IsValid"), "")%>
                        </li>
                        <li style="width: 20%;">
                            <%#Eval("Description") %>
                        </li>
                        <li style="width: 30%;">
                            <a href='MemberModelFieldList.aspx?mid=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>'class="abtn">字段管理</a> 
                            
                            <a href='MemberModelEdit.aspx?action=edit&id=<%# Eval("ID")%>'class="abtn">修改</a>
                            
                            <asp:LinkButton ID="lbtnDel" runat="server" CommandName="deldp" ToolTip='<%#Eval("Name")%>'
                                CommandArgument='<%#Eval("ID") %>' OnCommand="lbtnDel_Click" CssClass="abtn"
                                OnClientClick='<%# ("return confirm(\""+Resources.Common.DelConfirm+"\")") %>'
                                Text="<%$ Resources:Common,Del%> ">                                
                            </asp:LinkButton>
                            
                            <asp:LinkButton ID="lbtnNew" CommandName='<%#Eval("Name")%>' CommandArgument='<%#Eval("ID") %>'
                                OnCommand="CreateModel" runat="server" Text='<%$Resources:Common,Create %>' CssClass="abtn">
                            </asp:LinkButton>
                            
                            <a href='<%#"inc/"+Eval("Name").ToString() + ".html"%>' class="abtn">
                                <%=Resources.Common.Browse%></a>
                                
                            <asp:LinkButton ID="lbtnState" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID")%>'
                                runat="server" Text='<%# GetOperatorText(Eval("IsValid").ToString())%>' class="abtn"> 
                            </asp:LinkButton>
                            
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        
                            <span class="function fr">
                            </span>
                              
                    <webdiyer:aspnetpager id="Split" runat="server" PageSize="18" AlwaysShow="True" OnPageChanged="Split_PageChanged"
                        ShowCustomInfoSection="Left"   ShowPageIndexBox="always" CssClass="page"
                        PageIndexBoxType="DropDownList" 
                        CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
                    </webdiyer:aspnetpager>
       
         </div>
    
    </form>
</body>
</html>
