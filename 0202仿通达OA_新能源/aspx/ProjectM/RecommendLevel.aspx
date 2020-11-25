<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendLevel.aspx.cs" Inherits="FTD.Web.UI.aspx.ProjectM.RecommendLevel" %>


<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
    <link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<script language="JavaScript">
    var a;
    function CheckValuePiece() {
        if (window.document.form1.GoPage.value == "") {
            alert("请输入跳转的页码！");
            window.document.form1.GoPage.focus();
            return false;
        }
        return true;
    }
    function CheckAll() {
        if (a == 1) {
            for (var i = 0; i < window.document.forms['form1'].elements.length; i++) {
                var e = form1.elements[i];
                e.checked = false;
            }
            a = 0;
        }
        else {
            for (var i = 0; i < window.document.forms['form1'].elements.length; i++) {
                var e = form1.elements[i];
                e.checked = true;
            }
            a = 1;
        }
    }
    function CheckDel() {
        var number = 0;
        for (var i = 0; i < window.document.forms['form1'].elements.length; i++) {
            var e = form1.elements[i];
            if (e.Name != "CheckBoxAll") {
                if (e.checked == true) {
                    number = number + 1;
                }
            }
        }
        if (number == 0) {
            alert("请选择需要删除的项！");
            return false;
        }
        if (window.confirm("你确认删除吗？")) {
            return true;
        }
        else {
            return false;
        }
    }

    function CheckModify() {
        var Modifynumber = 0;
        for (var i = 0; i < window.document.forms['form1'].elements.length; i++) {
            var e = form1.elements[i];
            if (e.Name != "CheckBoxAll") {
                if (e.checked == true) {
                    Modifynumber = Modifynumber + 1;
                }
            }
        }
        if (Modifynumber == 0) {
            alert("请至少选择一项！");
            return false;
        }
        if (Modifynumber > 1) {
            alert("只允许选择一项！");
            return false;
        }

        return true;
    }



</script>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle" style="height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                        <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;项目管理&nbsp;>>&nbsp;项目信息
                    </td>
                    <td align="right" valign="middle" style="height: 30px;">查询：<asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="80px"></asp:TextBox>
                        <asp:Button ID="iButton4" runat="server" CssClass="btn btn-blue" Text="查询" />&nbsp; &nbsp;
                    
                        <asp:Button ID="iButton1" runat="server" CssClass="btn btn-aqua" Text="添加" />

                        <asp:Button ID="iButton5" runat="server" CssClass="btn btn-green" Text="修改" OnClientClick="javascript:return CheckModify();" />

                        <asp:Button ID="iButton3" runat="server" OnClientClick="javascript:return CheckDel();" CssClass="btn btn-red" Text="删除" />
                        &nbsp;
                        <asp:Button ID="iButton2" runat="server" CssClass="btn btn-aqua" Text="导出" />&nbsp;
                        <button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
                </tr>
            </table>

        </div>
        <table style="width: 100%">
            <tr>
                <td>
                    <asp:GridView ID="GVData" CssClass="gridview_m" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                        BorderStyle="Groove" BorderWidth="1px" PageSize="25"
                        Width="100%">
                        <PagerSettings Mode="NumericFirstLast" Visible="False" />
                        <PagerStyle BackColor="LightSteelBlue" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#F3F3F3" Font-Size="12px" ForeColor="Black" Height="30px" />
                        <AlternatingRowStyle BackColor="#f9f9f7" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="LabVisible" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "1")%>'
                                        Visible="False"></asp:Label><asp:CheckBox ID="CheckSelect" runat="server" />
                                </ItemTemplate>
                                <HeaderStyle Width="35px" />
                                <HeaderTemplate>
                                    <input id="CheckBoxAll" onclick="CheckAll()" type="checkbox" />
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编号">
                                <ItemTemplate>
                                     <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="项目实施阶段名称">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="False" ForeColor="green"
                                        NavigateUrl='<%# "ProjectView.aspx?ID="+ DataBinder.Eval(Container.DataItem, "0")%>'><%# DataBinder.Eval(Container.DataItem, "1")%></asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>

                        </Columns>
                        <RowStyle HorizontalAlign="Center" Height="25px" />
                        <EmptyDataTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="center" style="border-right: black 1px; border-top: black 1px; border-left: black 1px; border-bottom: black 1px; background-color: #f9f9f7;">该列表中暂时无数据！</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="border-top: #eeeeee 1px solid; border-bottom: #eeeeee 1px solid">
                    <asp:ImageButton ID="BtnFirst" runat="server" CommandName="First" ImageUrl="../../images/Button/First.jpg" />
                    <asp:ImageButton ID="BtnPre" runat="server" CommandName="Pre" ImageUrl="../../images/Button/Pre.jpg" />
                    <asp:ImageButton ID="BtnNext" runat="server" CommandName="Next" ImageUrl="../../images/Button/Next.jpg" />
                    <asp:ImageButton ID="BtnLast" runat="server" CommandName="Last" ImageUrl="../../images/Button/Last.jpg" />
                    &nbsp;第<asp:Label ID="LabCurrentPage" runat="server" Text="Label"></asp:Label>页&nbsp; 共<asp:Label
                        ID="LabPageSum" runat="server" Text="Label"></asp:Label>页&nbsp;
                <asp:TextBox ID="TxtPageSize" runat="server" CssClass="TextBoxCssUnder2" Height="30px"
                    Width="35px">15</asp:TextBox>
                    行每页 &nbsp; 转到第<asp:TextBox ID="GoPage" runat="server" CssClass="TextBoxCssUnder2"
                        Height="30px" Width="33px"></asp:TextBox>
                    页&nbsp;
                <asp:ImageButton ID="ButtonGo" runat="server" OnClientClick="javascript:return CheckValuePiece();" ImageUrl="../../images/Button/Jump.jpg" /></td>
            </tr>
        </table>
    </form>
</body>
</html>