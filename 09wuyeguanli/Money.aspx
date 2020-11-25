<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Money.aspx.cs" Inherits="Money" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .style1
        {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding-top:15px">
        <table style="border:1px solid #cbcbcb; background-color:#EEEEEE" cellpadding="4" cellspacing="0" align="center">
	    <tr>
		    <td align="center" colspan="2" class="style1"><strong>住户『<%=userinfo%>』的水电气费信息</strong></td>
	    </tr>
	    <tr>
		    <td align="center" style=" margin-left:30px" colspan="2" style="font-size:12px">
                <asp:DataGrid ID="GridView1" runat="server" AllowPaging="True" 
                     PageSize="18" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <SelectedItemStyle BackColor="#FF6666" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" 
                        Mode="NumericPages" Visible="False" />
                    <AlternatingItemStyle BackColor="#9ABFE9" />
                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Height="14px" />
                    <Columns>
                         <asp:TemplateColumn HeaderText="编号">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" Font-Size="13px" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Font-Size="12px"/>
                            <ItemTemplate>
                                 <%# DataBinder.Eval(Container, "DataItem.rownum")%>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                       <asp:TemplateColumn HeaderText="收费时间">                         
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="220px" Height="25px" Font-Size="13px"/>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="14px"  Font-Size="12px"/>
                                <ItemTemplate>
                                <%# DataBinder.Eval(Container, "DataItem.收费时间", "{0:yyyy-MM-dd}") %>
                            </ItemTemplate>   
                        </asp:TemplateColumn>
                        
                       
                        <asp:TemplateColumn HeaderText="水费金额">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px"  Font-Size="13px"/>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"  Font-Size="12px"/>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container, "DataItem.水费金额", "{0:C}") %>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="电费金额">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px"  Font-Size="13px"/>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"  Font-Size="12px"/>
                            <ItemTemplate>
                               <%# DataBinder.Eval(Container, "DataItem.电费金额", "{0:C}") %>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="气费金额">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px"  Font-Size="13px"/>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"  Font-Size="12px"/>
                            <ItemTemplate>
                            <%# DataBinder.Eval(Container, "DataItem.气费金额", "{0:C}")%>                        
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="是否缴费">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px"  Font-Size="13px"/>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"  Font-Size="12px"/>
                            <ItemTemplate>
                            <%# DataBinder.Eval(Container, "DataItem.是否缴费", "{0}")%>                        
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <HeaderStyle BackColor="#4292C6" Font-Bold="True" 
                        ForeColor="#F7F7F7" Font-Size="18pt" Height="25px" />
                </asp:DataGrid>
            </td>
	    </tr>
	    <tr>
	    <td align="right" colspan="2" style="font-size:12px">总记录数：<%= zjl %>条 共<%= pagecount%>页/第<%= cruentpage%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <asp:LinkButton ID="lbtfirst" runat="server" onclick="lbtfirst_Click">首页</asp:LinkButton>
		    &nbsp;
		    <asp:LinkButton ID="lbtprev" runat="server" onclick="lbtprev_Click">上一页</asp:LinkButton>
		    &nbsp;
		    <asp:LinkButton ID="lbtnext" runat="server" onclick="lbtnext_Click">下一页</asp:LinkButton>
		    &nbsp;
		    <asp:LinkButton ID="lbtlast" runat="server" onclick="lbtlast_Click">末页</asp:LinkButton></td>
	    </tr>
	    <tr height="22">
		<td align="center">已交费金额</td>
		<td align="center"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
        
	</tr>
	<tr height="22">
		<td align="center">未交费金额</td>
		<td align="center"><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
	</tr>
	</table>
    </div>   
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>
