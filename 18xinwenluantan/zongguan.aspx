<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_aueme-2d" enableeventvalidation="False" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .style3
        {
            width: 241px;
        }
        .style4
        {
            width: 260px;
            height: 103px;
        }
        .style5
        {
            height: 24px;
        }
        .style8
        {
            font-size: xx-large;
            width: 183px;
        }
        .style9
        {
            font-size: x-large;
            width: 243px;
            height: 31px;
        }
        .style15
        {
            width: 243px;
            height: 103px;
        }
        .style16
        {
            width: 243px;
        }
        .style18
        {
            width: 183px;
        }
        .style20
        {
            font-size: x-large;
            font-weight: bold;
            color: #CC00CC;
            height: 31px;
        }
        .style24
        {
            width: 243px;
            height: 34px;
        }
        .style25
        {
            width: 243px;
            height: 24px;
        }
        
        .style27
        {
            width: 170px;
        }
        .style28
        {
            height: 24px;
            width: 170px;
        }

        .style29
        {
            width: 93px;
        }
        .style30
        {
            height: 24px;
            width: 93px;
        }

        .style38
        {
            height: 24px;
            width: 183px;
        }

        .style39
        {
            width: 229px;
        }
        .style40
        {
            height: 24px;
            width: 229px;
        }

        .style41
        {
            width: 183px;
            height: 34px;
        }
        .style42
        {
            width: 229px;
            height: 34px;
        }
        .style43
        {
            width: 170px;
            height: 34px;
        }
        .style44
        {
            width: 93px;
            height: 34px;
        }
        .style45
        {
            height: 34px;
        }

        .style46
        {
            width: 243px;
            height: 33px;
        }
        .style47
        {
            font-size: x-large;
            font-weight: bold;
            color: #CC00CC;
            height: 33px;
        }
        .style48
        {
            width: 229px;
            height: 33px;
        }
        .style49
        {
            width: 170px;
            height: 33px;
        }
        .style50
        {
            height: 33px;
        }

        </style>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style15">
                    </td>
                <td colspan ="6" bgcolor="#333399" 
                    style="font-size: xx-large; font-weight: 900; color: #FFFFFF"#FFFFFF"" align="center">
                    新闻发布</td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style8"   >
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Width="136px"></asp:TextBox>
                </td>
                  <td class="style39" >
                      <asp:Button ID="Button3" runat="server" ForeColor="Blue" 
                          Text="搜索" Width="88px"  />
                        <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                      </td>
                    <td class="style27">
                        <asp:TextBox ID="TextBox2" runat="server" Width="102px"></asp:TextBox>
                    </td>
                    <td class="style18">
                        <asp:Label ID="Label2" runat="server" Text="密码："></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" Width="90px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="style29">
                        <asp:Button ID="Button1" runat="server" Text="登录" Width="39px" onclick="Button1_Click1" 
                           />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" ForeColor="#FF3300" Text="注册" 
                            Width="39px" onclick="Button2_Click1"  />
                    </td>   
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr style="border-style: double; border-width: inherit; ">
                <td class="style16">
                    &nbsp;</td>
                    <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href =main.aspx>首页|</a></td>
                     <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href =yule.aspx>娱乐|</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href =jingji.aspx>经济</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                  <a href =  keji.aspx>科技</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                   <a href = shenghuo.aspx>生活</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large" 
                    bgcolor="#9933FF">
                    <a href ="luntan.aspx"><a href =luntan.aspx>论坛|</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    </td> <td class="style20" colspan ="6" 
                    style="font-size: medium; color: #3333FF" >
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        Width="1160px" DataKeyNames="userid" 
                        onpageindexchanging="GridView1_PageIndexChanging" PageSize="7" 
                        onrowdeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:HyperLinkField DataTextField="userid" HeaderText="用户名" >
                                <HeaderStyle BackColor="#CCCCFF" />
                            </asp:HyperLinkField>
                            <asp:HyperLinkField DataTextField="username" HeaderText="真实姓名" >
                                <HeaderStyle BackColor="#CCCCFF" />
                            </asp:HyperLinkField>
                            <asp:HyperLinkField DataTextField="rolesname" HeaderText="角色名" >
                                <HeaderStyle BackColor="#CCCCFF" />
                            </asp:HyperLinkField>
                            <asp:HyperLinkField DataTextField="isquan" HeaderText="是否授权">
                                <HeaderStyle BackColor="#CCCCFF" />
                            </asp:HyperLinkField>
                            <asp:CommandField ShowDeleteButton="True">
                                <HeaderStyle BackColor="#CCCCFF" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </td>
             <td >&nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td colspan="2" style="font-size: large; color: #000000">
                                        
                    &nbsp;</td>
                <td >&nbsp;</td>
                <td class="style18"colspan="4" style="font-size: large; color: #000000">
                    &nbsp;</td>

                    <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style24">
                    </td>
                <td class="style41">
                                                                                                                                                                <p>
                                                                                                                                                                    &nbsp;</p>
                </td>
                <td class="style42">
                    用户名：</td>
                <td class="style43">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                <td class="style41">
                                        <p>
                                            &nbsp;</p>
                </td>
                <td class="style44">
                    &nbsp;</td>
                <td class="style45">
                    </td>
                <td class="style45">
                    </td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style20">
                         &nbsp;</td>
                <td class="style39">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style20">
                                        &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style46">
                    </td>
                <td class="style47">
                         </td>
                <td class="style48">
                    角色名：</td>
                <td class="style49">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="93px">
                    </asp:DropDownList>
                </td>
                <td class="style47">
                                        </td>
                <td class="style50">
                    </td>
                <td class="style50">
                    </td>
            </tr>
            <tr>
                <td class="style16">
                    </td>
                <td  style="font-size: large">
                    </td>
                <td class="style28">
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="确认修改" />
                    </td>
                    <td class="style28">
                        <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="置空" />
                    </td>
                    <td class="style28">
                    </td>
                <td colspan="3" style="font-size: large">
                    &nbsp;</td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style25">
                    </td>
                <td>
         
                    &nbsp;</td>
                <td class="style40">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>

                <td class="style38">
                    </td>
                <td class="style30">
                    &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td></td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style3">
                    <p>
                        &nbsp;</p>
                </td>
                <td class="style39">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style18">
                                        <p>
                                            &nbsp;</p>
                </td>
                <td class="style29">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style24">
                </td>
                <td  colspan =6 bgcolor="#333399" align="center" style="color: #FFFFFF">
                鄂ICP备07017567 Copyright @ 2011新闻网 All Rights Reserved 
                  <a href="admlogin.aspx" style="color: #FF0000">  [管理入口]</a></td>
                <td class="style3">
                    </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
