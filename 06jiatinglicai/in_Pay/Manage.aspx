<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="in_Pay_Manage" Title="" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td align="center" class="tdbg">
<strong> 收支人员</strong><asp:DropDownList ID="ddlfamily_Id" runat="server" Width="150">
</asp:DropDownList><strong> 收支类别</strong><asp:DropDownList ID="ddlinId" runat="server" Width="150">
</asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="查询"  OnClick="btnSearch_Click" ></asp:Button>   
        </td>
    </tr>
</table>
          
<table width="100%" border="0" cellspacing="0" cellpadding="1" class="tbbc">
  <tr height='30'>
    <th width="5%">编号</th>
    <th >收支日期</th>
    <th >收支人员</th>
 
    <th >收支类别</th>
    <th >收支金额</th>
    <th >收支类型</th>
       <th >状态</th>
    <th >操作</th>
   </tr>
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >
<td align="center">
<%# Container.ItemIndex+1 %></td>
 <td align="center"><%# Eval("in_Date","{0:yyyy-MM-dd}")%></td>
 <td align="center"><%# Eval("family_Name")%></td>
 <td align="center"><%# Eval("inTitle")%></td>
 <td align="center"><%# Eval("in_Money")%></td>
 <td align="center"><%# Eval("in_Leixing").ToString() == "收入" ? "<span style='color:Green'>收入</span>" : "<span style='color:Red'>支出</span>"%></td>
 <td align="center"><%# Eval("zt").ToString() == "审核通过" ? "<span style='color:Green'>审核通过</span>" :Eval("zt").ToString() == ""?"待审核": "<span style='color:Red'>审核不过</span>"%></td>

<td align="center">
    <a href="Detail.aspx?id=<%# Eval("ip_Id") %>"><img src="../images/ico_view.gif" width="16" height="16" style="border:0px;" title="查看该记录" /></a> 
    
    <% if (Session["power"].ToString() == "管理员")
       { %>
       <a href="Detail1.aspx?id=<%# Eval("ip_Id") %>">审核</a>
    <a href="Modify.aspx?id=<%# Eval("ip_Id") %>"><img src="../images/ico_edit.gif" width="16" height="16" style="border:0px;" title="修改该记录" /></a> 
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/ico_del.gif" ToolTip="删除该记录"  OnClick="del_Click"  CommandArgument='<%# Eval("ip_Id") %>' OnClientClick='return confirm("您确定要删除此信息么？");' />
<%} %>
</td>
</tr>
    </ItemTemplate>
    </asp:Repeater>
</table>


<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
  <tr>
  <td align="left"> &nbsp;&nbsp;&nbsp;&nbsp; 共收入：<asp:Label ID="Label2" 
          runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#00CC00"></asp:Label>元，共支出：<asp:Label 
          ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" 
          Text="Label"></asp:Label>元</td>
<td align="right"> <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="false" FirstPageText="首页" LastPageText="末页" NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged"  PageIndexBoxType="DropDownList" PageSize="10" PrevPageText="上一页" ShowPageIndexBox="Always" Width="90%" ></webdiyer:AspNetPager></td>

  </tr>


</table>
    </td>
</asp:Content>

