<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="bank_Manage" Title="" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td align="center" class="tdbg">
        
        <strong> 所属银行</strong>
<asp:DropDownList ID="ddlbank_Type" runat="server" Width="150">
    <asp:ListItem Value="">---全部---</asp:ListItem>
    <asp:ListItem>中国银行</asp:ListItem>
    <asp:ListItem>中国农业银行</asp:ListItem>
    <asp:ListItem>中国工商银行</asp:ListItem>
    <asp:ListItem>中国建设银行</asp:ListItem>
</asp:DropDownList>
<strong> 卡号:</strong><asp:TextBox ID="txt_bank_No" runat="server" width="150"></asp:TextBox>

        <asp:Button ID="btnSearch" runat="server" Text="查询"  OnClick="btnSearch_Click" ></asp:Button>   
        </td>
    </tr>
</table>
          
<table width="100%" border="0" cellspacing="0" cellpadding="1" class="tbbc">
  <tr height='30'>
    <th width="5%">编号</th>
    <th >卡号</th>
    <th >所属银行</th>
    <th >户主姓名</th>
    <th >初始金额</th>
    <th >余额</th>
    <th >开户日期</th>
    <th >操作</th>
   </tr>
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >
<td align="center">
<%# Container.ItemIndex+1 %></td>
 <td align="center"><%# Eval("bank_No")%></td>
 <td align="center"><%# Eval("bank_Type")%></td>
 <td align="center"><%# Eval("bank_Name")%></td>
 <td align="center"><%# Eval("bank_Money1")%></td>
 <td align="center"><%# Eval("bank_Money2")%></td>
 <td align="center"><%# Eval("bank_Time1")%></td>

<td align="center">
     
    <a href="Modify.aspx?id=<%# Eval("bank_Id") %>"><img src="../images/ico_edit.gif" width="16" height="16" style="border:0px;" title="修改该记录" /></a> 
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/ico_del.gif" ToolTip="删除该记录"  OnClick="del_Click"  CommandArgument='<%# Eval("bank_Id") %>' OnClientClick='return confirm("您确定要删除此信息么？");' />
</td>
</tr>
    </ItemTemplate>
    </asp:Repeater>
</table>


<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
  <tr>
<td align="right"> <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="false" FirstPageText="首页" LastPageText="末页" NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged"  PageIndexBoxType="DropDownList" PageSize="10" PrevPageText="上一页" ShowPageIndexBox="Always" Width="90%" ></webdiyer:AspNetPager></td>
  </tr>


</table>
    </td>
</asp:Content>

