<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="left1.ascx" TagName="left1" TagPrefix="uc3" %>
<%@ Register Src="left2.ascx" TagName="left2" TagPrefix="uc4" %>
<%@ Register Src="userlog.ascx" TagName="userlog" TagPrefix="uc2" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>人工智能教学网站</title>
    <link href="qtimages/StyleSheet.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        .STYLE2 {
            color: #FFFFFF;
        }

        .STYLE4 {
            color: #FFFFFF;
            font-weight: bold;
        }

        .STYLE6 {
            color: #198A95;
            font-weight: bold;
        }
        -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="900" height="964" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
                <tr>
                    <td>
                        <uc1:top ID="Top1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="541">
                        <table id="Table2" width="900" height="532" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="532" valign="top">
                                    <table id="Table3" width="220" height="532" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="2">
                                                <img src="qtimages/img_02_01_01.gif" width="220" height="3" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td width="9" height="100%" rowspan="3" background="qtimages/img_02_01_02.gif">&nbsp;</td>
                                            <td width="211" valign="middle" background="qtimages/img_02_01_03.gif" style="height: 144px">
                                                <uc2:userlog ID="Userlog1" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="183">
                                                <uc3:left1 ID="Left1_1" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="183">
                                                <uc4:left2 ID="Left2_1" runat="server" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="10" colspan="2" background="qtimages/img_02_01_07.gif">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="4" background="qtimages/img_02_02.gif">&nbsp;</td>
                                <td valign="top">
                                    <table id="Table6" width="676" height="506" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="193">
                                                <table id="Table7" width="676" height="193" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>

                                                        <td width="676" height="34" background="qtimages/img_02_03_02_01.gif">
                                                            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width: 30px;"></td>
                                                                    <td class="STYLE6">最新资讯</td>
                                                                </tr>
                                                            </table>


                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td width="451" height="162" valign="top">
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="200px"
                                                                Width="94%">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="序号">
                                                                        <ItemTemplate>
                                                                            <%#DataBinder.Eval(Container.DataItem, "id") %>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="30px" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="标题">
                                                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                            Font-Underline="False" HorizontalAlign="Left" />
                                                                        <ItemTemplate>
                                                                            <a href='ggdetail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>
                                                                                <%#DataBinder.Eval(Container.DataItem, "title") %>
                                                                            </a>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="200px" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="addtime" HeaderText="发布时间"></asp:BoundColumn>
                                                                </Columns>
                                                            </asp:DataGrid></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="136">
                                                <table id="Table8" width="676" height="136" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="676" height="34" background="qtimages/img_02_03_02_01.gif">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="14%" align="center"><span class="STYLE6">学生作品</span></td>
                                                                    <td width="86%"><a href="xueshengzuopin.aspx"><font class="STYLE6">更多</font>&gt;&gt;</a></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="676" height="111" background="qtimages/img_02_03_02_02.gif">
                                                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" Width="100%">
                                                                <ItemTemplate>
                                                                    <table width="120" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse: collapse">
                                                                        <tr>
                                                                            <td height="100" align="center"><a href='<%# Eval("tupian") %>' target="_blank">
                                                                                <asp:Image ID="Image1" runat="server" Height="100" ImageUrl='<%# Eval("tupian") %>'
                                                                                    Width="116" /></a></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("mingcheng") %>'></asp:Label></td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img src="qtimages/img_02_03_02_03.gif" width="676" height="1" alt=""></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="171">
                                                <table id="Table9" width="676" height="171" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <table id="Table10" width="324" height="171" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="324" height="29" background="qtimages/img_02_03_04_01_01.gif">
                                                                        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" class="STYLE6" style="width: 39%">最新注册用户</td>
                                                                                <td width="68%" align="right" class="STYLE6">&nbsp;&nbsp;&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="324" height="142" background="qtimages/img_02_03_04_01_02.gif">
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                                                            Width="100%" Height="142px">
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="序号">
                                                                                    <ItemTemplate>
                                                                                        <img border="0" src='qtimages/3.gif'>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Width="30px" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn HeaderText="用户名">
                                                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                                        Font-Underline="False" HorizontalAlign="Left" />
                                                                                    <ItemTemplate>

                                                                                        <%#DataBinder.Eval(Container.DataItem, "yonghuming") %>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Width="100px" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="addtime" HeaderText="注册时间"></asp:BoundColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <img src="qtimages/img_02_03_04_02.gif" width="5" height="171" alt=""></td>
                                                        <td>
                                                            <table id="Table11" width="347" height="171" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="347" height="29" background="qtimages/img_02_03_04_03_01.gif">
                                                                        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="32%" align="right" class="STYLE6">最新教学课件</td>
                                                                                <td width="68%" align="right"><a href="jiaoxuekejianlist.aspx"><font class="STYLE6">更多</font>&gt;&gt;</a>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
                                &nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="347" height="142" background="qtimages/img_02_03_04_03_02.gif">
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False"
                                                                            Width="92%" Height="142px">
                                                                            <Columns>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <img border="0" src='qtimages/3.gif'>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Width="30px" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn HeaderText="名称">
                                                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                                        Font-Underline="False" HorizontalAlign="Left" />
                                                                                    <ItemTemplate>
                                                                                        <a href='jiaoxuekejian_detail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>
                                                                                            <%#DataBinder.Eval(Container.DataItem, "mingcheng") %>
                                                                                        </a>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Width="100px" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="kecheng" HeaderText="课程"></asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="addtime" HeaderText="发布时间"></asp:BoundColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>


                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <uc1:footer runat="server" ID="footer" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
