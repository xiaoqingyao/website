<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rep_Count.aspx.cs" Inherits="FTD.Web.UI.aspx.ProjectM.Rep_Count" %>

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
                        <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;统计查询&nbsp;>>&nbsp;各市区项目汇总表
                    </td>
                    <td align="right" valign="middle" style="height: 30px;">查询：<asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="80px"></asp:TextBox>
                        <asp:Button ID="iButton4" runat="server" CssClass="btn btn-blue" Text="查询" />&nbsp; &nbsp;
                    
                        <asp:Button ID="iButton1" runat="server" CssClass="btn btn-aqua" Text="刷新" />
                         
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
                            <asp:BoundField DataField="0" HeaderText="项目类别"></asp:BoundField>
                            <asp:BoundField DataField="1" HeaderText="新能源汽车"></asp:BoundField>
                            <asp:BoundField DataField="2" HeaderText="智能电网与储能"></asp:BoundField>
                            <asp:BoundField DataField="3" HeaderText="氢能"></asp:BoundField>
                            <asp:BoundField DataField="4" HeaderText="可燃冰"></asp:BoundField>
                            <asp:BoundField DataField="5" HeaderText="海洋能"></asp:BoundField>
                            <asp:BoundField DataField="6" HeaderText="风能"></asp:BoundField>
                             <asp:BoundField DataField="7" HeaderText="太阳能"></asp:BoundField>
                             <asp:BoundField DataField="8" HeaderText="生物质能"></asp:BoundField>
                             <asp:BoundField DataField="9" HeaderText="热泵"></asp:BoundField>
                             <asp:BoundField DataField="10" HeaderText="其它"></asp:BoundField>
                             <asp:BoundField DataField="11" HeaderText="合计"></asp:BoundField>

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
            
        </table>
    </form>
</body>
</html>

