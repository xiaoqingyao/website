<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_4opltx4w" %>

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

        .style31
        {
            width: 229px;
            height: 31px;
        }
        .style32
        {
            width: 170px;
            height: 31px;
        }
        
        .style36
        {
            font-size: x-large;
            font-weight: bold;
            color: #CC00CC;
            height: 31px;
            width: 183px;
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
                    style="font-size: xx-large; font-weight: 1500; color: #FFFFFF"#FFFFFF"" 
                    align="center">
                   
<marquee direction=left scrollamount=4 style=width=500 height=20><CENTER>
<font style=font:45pt face=华文新魏 color=cccccc><b style="font-size: xx-large; color: #FFFFFF; font-weight: 900;">
　　新闻网----触手可及的世界</b></FONT></marquee>
<BR> </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style8" style="font-size: medium" align="center"   >
                    友情链接：<a href =http://www.china.com.cn />中国网</td>
                  <td class="style39" align="center" >
                        &nbsp;&nbsp;&nbsp; 
                        &nbsp;<asp:Label ID="Label3" runat="server" Text="用户名：" ></asp:Label>
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
                    <td class="style3">
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
                class="style39" bgcolor="#9933FF">
                    <a href =yule.aspx>娱乐|</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href =jingji.aspx>经济</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style18" bgcolor="#9933FF">
                  <a href =  keji.aspx>科技</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style29" bgcolor="#9933FF">
                   <a href = shenghuo.aspx>生活</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style3" bgcolor="#9933FF">
                    <a href ="luntan.aspx"><a href =luntan.aspx>论坛|</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    </td> <td class="style20" >
                    娱乐</td>
                <td class="style31">
                    &nbsp;<a href =yule.aspx><asp:Image ID="Image1" runat="server" 
                        ImageUrl="~/images/20117413593662293.jpg" Height="85px" Width="108px"  /></a>
                </td>
               
                <td class="style32" >
                    &nbsp;</td>
                <td class="style36" >
                    经济 </td>
<td>
<a href =jingji.aspx>
    <asp:Image ID="Image2" runat="server" Height="88px" 
        ImageUrl="~/images/8816.jpg" Width="99px"  /></a>
                </td> 
<td>&nbsp;</td>
<td >&nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td colspan="2" style="font-size: large; color: #000000">
                                        
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines =None>
                        <Columns>
                            <asp:HyperLinkField DataTextField="title" 
                                DataNavigateUrlFormatString="newsdetail.aspx?id={0}" 
                                DataNavigateUrlFields="id" />
                        </Columns>
                    </asp:GridView>
                                        
                </td>
                <td >&nbsp;</td>
                <td class="style18"colspan="4" style="font-size: large; color: #000000">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" GridLines =None>
                        <Columns>
                            <asp:HyperLinkField DataTextField="title" DataNavigateUrlFields="id" 
                                DataNavigateUrlFormatString="newsdetail.aspx?id={0}" />
                        </Columns>
                    </asp:GridView>
                    </td>

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
                    <a href =yule.aspx>更多内容<asp:Image ID="Image9" runat="server" 
                        ImageUrl="~/images/more.gif" />
                </td>
                <td class="style43">
                    </td>
                <td class="style41">
                                        <p>
                                            &nbsp;</p>
                </td>
                <td class="style44">
                    <a href =jingji.aspx>更多内容<asp:Image ID="Image8" runat="server" 
                        ImageUrl="~/images/more.gif" Width="26px" />
                </td>
                <td class="style45">
                    </td>
                <td class="style45">
                    </td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style20">
                         科技</td>
                <td class="style39">
                <a href =keji.aspx>
                    <asp:Image ID="Image5" runat="server" Height="77px" 
                        ImageUrl="~/images/20110113164122571.jpg" Width="119px" /></a>
                </td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style20">
                                        生活</td>
                <td class="style29">
                <a href =shenghuo.aspx>
                    <asp:Image ID="Image4" runat="server" Height="89px" 
                        ImageUrl="~/images/0404nortel1.jpg" Width="118px" /></a>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    </td>
                <td colspan ="2" style="font-size: large">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        Width="440px" GridLines=None>
                        <Columns>
                            <asp:HyperLinkField DataTextField="title" DataNavigateUrlFields="id" 
                                DataNavigateUrlFormatString="newsdetail.aspx?id={0}" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="style28">
                    </td>
                <td colspan="3" style="font-size: large">
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                        Width="401px" GridLines =None>
                        <Columns>
                            <asp:HyperLinkField DataTextField="title" DataNavigateUrlFields="id" 
                                DataNavigateUrlFormatString="newsdetail.aspx?id={0}" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style25">
                    </td>
                <td>
         
                    &nbsp;</td>
                <td class="style40">
                   <a href = keji.aspx>更多内容<asp:Image ID="Image6" runat="server" ImageUrl="~/images/more.gif" />
                </td>
                <td >
                    &nbsp;</td>

                <td class="style38">
                    </td>
                <td class="style30">
                    <a href =shenghuo.aspx>更多内容<asp:Image ID="Image10" runat="server" Height="16px" 
                        ImageUrl="~/images/more.gif" Width="26px" />
                    </a></td>
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
