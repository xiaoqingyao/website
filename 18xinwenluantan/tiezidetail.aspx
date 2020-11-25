<%@ page language="C#" autoeventwireup="true" inherits="tiezidetail, App_Web_gmcx2wqp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-right: 0px;
        }
        .style2
        {
            height: 36px;
        }
        .style3
        {
            height: 44px;
        }
        .style4
        {
            width: 201px;
        }
        .style5
        {
            width: 204px;
        }
        .style6
        {
            width: 472px;
        }
        .style7
        {
            width: 671px;
        }
        .style8
        {
            width: 2px;
        }
        .style9
        {
            width: 38px;
        }
        .style10
        {
            width: 172px;
        }
        .style11
        {
            width: 201px;
            height: 2px;
        }
        .style12
        {
            width: 172px;
            height: 2px;
        }
        .style13
        {
            width: 671px;
            height: 2px;
        }
        .style14
        {
            width: 2px;
            height: 2px;
        }
        .style15
        {
            width: 38px;
            height: 2px;
        }
        .style16
        {
            height: 2px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td colspan ="6" class="style3">
    
        <table class="style1" align="center">
            <tr bgcolor="#3366FF">
                <td style="color: #FFFFFF" class="style2">
                    [七嘴八舌]论坛欢迎您！</td>
            </tr>
        </table>
    
                </td>
            </tr>
            <tr>
                <td colspan ="6">
                    <asp:Image ID="Image1" runat="server" Height="133px" ImageUrl="~/images/00.jpg" 
                        Width="1330px" />
                </td>
            </tr>
          <tr  bgcolor="#3366FF"style="color: #FFFFFF; font-weight: bold; font-size: x-large">
        <td class="style13">
           <a href ="main.aspx"> 首页|</a></td>
        <td class="style13">
        <a href =yule.aspx>娱乐|</a></td>
        <td class="style13">
           <a href = jingji.aspx>经济</a></td>
        <td class="style13">
           <a href = keji.aspx>科技</a></td>
        <td class="style13">
            <a href =shenghuo.aspx>生活</a></td>
        <td class="style13">
           <a href = luntan.aspx>论坛</a></td>
    </tr>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Button ID="Button1" runat="server" ForeColor="#660066" 
                        onclick="Button1_Click" Text="发帖" />
                </td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    <asp:Button ID="Button2" runat="server" Text="回复" onclick="Button2_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4" >
                   <a href = userlogin.aspx>用户登录</a></td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4" >
                   <a href = register.aspx>用户注册</a></td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4" >
                    &nbsp;</td>
                <td colspan="5" align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                     &nbsp;</td>
                <td colspan ="5" style="margin-left: 40px">
                    <asp:DataList ID="DataList2" runat="server" BackColor="White" 
                        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"  Width="1061px" 
                        CellSpacing="1">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <ItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan=3>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("body") %>'></asp:Label>
                                    </td>
                                         </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                     </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td colspan ="5">
                    <asp:DataList ID="DataList1" runat="server" BackColor="LightGoldenrodYellow" 
                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" Width="1063px" 
                        ForeColor="Black">
                        <FooterStyle BackColor="Tan" />
                        <AlternatingItemStyle BackColor="PaleGoldenrod" />
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <ItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>' 
                                            ForeColor="#0000CC"></asp:Label>
                                    </td>
                                    <td rowspan="2">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("body") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("huitiedate") %>' 
                                            ForeColor="#0000CC"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td colspan ="3">
                    <asp:TextBox ID="TextBox1" runat="server" Height="125px" TextMode="MultiLine" 
                        Width="600px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Button ID="Button3" runat="server" Text="提交评论" onclick="Button3_Click" />
                </td>
                <td class="style8">
                    <asp:Button ID="Button4" runat="server" Text="取消" onclick="Button4_Click" />
                </td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
