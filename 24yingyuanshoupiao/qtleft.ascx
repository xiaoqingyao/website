<%@ Control Language="C#" AutoEventWireup="true" CodeFile="qtleft.ascx.cs" Inherits="qtleft" %>
<table id="Table2" border="0" cellpadding="0" cellspacing="0" width="258">
    <tr>
        <td>
            <table id="Table3" border="0" cellpadding="0" cellspacing="0" height="193" width="258">
                <tr>
                    <td colspan="3">
                        <img alt="" height="47" src="qtimages/index_04_01_01_01.gif" width="258" /></td>
                        

                </tr>

                <tr>
                    <td>
                        <img alt="" height="146" src="qtimages/index_04_01_01_02.gif" width="17" /></td>
                    <td align="center" background="qtimages/1.gif" height="146" valign="middle" width="229">
                        <asp:Panel ID="Panel1" runat="server" Height="81" Width="193">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" height="103" width="211">
                                <tr>
                                    <td align="right">
                                        用户名:</td>
                                    <td align="left">
                                        <asp:TextBox ID="TextBox1" runat="server" Style="border-right: #cadcb2 1px solid;
                                            border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                                            width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        密码:</td>
                                    <td align="left">
                                        <asp:TextBox ID="TextBox2" runat="server" Style="border-right: #cadcb2 1px solid;
                                            border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                                            width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"
                                            TextMode="Password"></asp:TextBox></td>
                                </tr>
                                <tr style="display:none">
                                    <td align="right">
                                        权限:</td>
                                    <td align="left">
                                        <asp:DropDownList ID="cx" runat="server">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Height="18px" OnClick="Button1_Click"
                                            Style="border-right: #cadcb2 1px solid; border-top: #cadcb2 1px solid; font-size: 12px;
                                            border-left: #cadcb2 1px solid; color: #81b432; border-bottom: #cadcb2 1px solid"
                                            Text=" 登 陆 " Width="46px" />
                                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Style="border-right: #cadcb2 1px solid;
                                            border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                                            color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px" Text="用户注册" /></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" Height="50px" Width="200px">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" height="103" width="211">
                                <tr>
                                    <td align="right" style="width: 63px">
                                        用户名:</td>
                                    <td align="left">
                                        <%=Session["username"].ToString().Trim() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 63px">
                                        您的权限:</td>
                                    <td align="left">
                                        <%=Session["cx"].ToString().Trim() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;<asp:Button ID="Button2" runat="server" Height="18px" OnClick="Button2_Click"
                                            Style="border-right: #cadcb2 1px solid; border-top: #cadcb2 1px solid; font-size: 12px;
                                            border-left: #cadcb2 1px solid; color: #81b432; border-bottom: #cadcb2 1px solid"
                                            Text=" 退 出 " Width="46px" />
                                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Style="border-right: #cadcb2 1px solid;
                                            border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                                            color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px" Text="个人后台" /></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td style="width: 13px">
                        <img alt="" height="146" src="qtimages/index_04_01_01_04.gif" width="12" /></td>
                </tr>
            </table>
        </td>
    </tr>
    
    <tr>
        <td style="height: 204px">
            <table id="Table5" border="0" cellpadding="0" cellspacing="0" height="199" width="258">
                <tr>
                    <td background="qtimages/index_04_01_04_01.gif" colspan="3" height="43">
                        <table border="0" cellpadding="0" cellspacing="0" height="21" width="100%">
                            <tr>
                                <td align="right" width="34%">
                                    <span class="STYLE1" style="color: white"><strong>友情连接</strong></span></td>
                                <td style="font-weight: bold; color: #d84828" width="66%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td background="qtimages/index_04_01_04_02.gif" height="144" width="20">
                        &nbsp;</td>
                    <td height="144" width="223">
                        &nbsp;<asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="130px"
                            ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateColumn HeaderText="gregre">
                                    <ItemTemplate>
                                        <img src="qtimages/5.gif" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="20px" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="友情链接">
                                    <ItemTemplate>
                                        <a href='<%#DataBinder.Eval(Container.DataItem, "wangzhi") %>'>
                                            <%#DataBinder.Eval(Container.DataItem, "wangzhanmingcheng") %>
                                        </a>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" />
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid></td>
                    <td background="qtimages/index_04_01_04_04.gif" height="144" width="15">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <img alt="" height="12" src="qtimages/index_04_01_04_05.gif" width="258" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table id="Table4" border="0" cellpadding="0" cellspacing="0" height="199" width="258">
                <tr>
                    <td background="qtimages/index_04_01_04_01.gif" colspan="3" height="43">
                        <table border="0" cellpadding="0" cellspacing="0" height="21" width="100%">
                            <tr>
                                <td align="right" width="34%">
                                    <span class="STYLE1" style="color:white"><strong>系统公告</strong></span></td>
                                <td style="font-weight: bold; color: white" width="66%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td background="qtimages/index_04_01_04_02.gif" height="144" width="20">
                        &nbsp;</td>
                    <td height="144" width="223">
                        <marquee border="0" direction="up" height="138" onmouseout="start()" onmouseover="stop()"
                            scrollamount="1" scrolldelay="50"><TABLE 
            height="100%" cellSpacing=5 cellPadding=0 width="92%" align=center 
            border=0><TBODY><TR><TD><P>&nbsp;&nbsp;由杨乐乐担纲制作人的喜剧片《大人物》将于3月11日在全国上映，在娱乐圈沉浮了30多年的吴孟达终于变身男一号，在这部励志题材的电影里，他仿佛演的就是自己过往的种种经历。

昨日，《大人物》导演谭华带着主演吴孟达、李伯清来黄龙溪古镇为该片宣传造势，李伯清的徒弟们廖健、闵天浩、钟燕平、叮当、矮冬瓜也在片中出演重要戏份，他们也全来了，一桌混合了泡菜风味的无厘头喜剧大餐正式开席！</P></TD></TR></TBODY></TABLE></marquee>
                    </td>
                    <td background="qtimages/index_04_01_04_04.gif" height="144" width="15">
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
