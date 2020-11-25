<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectCondition.aspx.cs"
    Inherits="OA.aspx.Moa.Main.SelectCondition" %>

<html>
<head>
    <title>移动手机浙江金海环境移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../../Style/Mobile/pics/homescreen.gif" rel="apple-touch-icon" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />

    <script src="../../JS/jquery-1.4.1.js" type="text/javascript"></script>

    <link href="../../JS/jquery-ui-mobile-1.7.2.custom.css" rel="stylesheet" type="text/css" />

    <script src="../../JS/jquery-ui-1.7.2.custom.min.js" type="text/javascript"></script>

    <script src="../../JS/jquery.bgiframe.min.js" type="text/javascript"></script>

    <link href="../../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />

    <script src="../../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
    <style type="text/css">
        body
        {
            overflow: hidden;
        }
    </style>

    <script language="javascript" type="text/javascript">
        //var getFromParent = window.dialogArguments;
        function CheckSelect() {
            var aaaa = "";
            for (var i = 0; i < window.document.Form1.elements.length; i++) {
                var e = Form1.elements[i];
                if (e.checked) {
                    if (aaaa == "") {
                        aaaa = e.value;
                    }
                    else {
                        aaaa = aaaa + "," + e.value;
                    }
                }
            }
            return aaaa;
        }

        function sendFromChild() {
            var name = document.getElementById('tablename').value;
            if (name == "ERPBuMen") {
                parent.SetBM(CheckSelect());
                parent.closeBMDialog();
            }
            else {
                parent.SetJS(CheckSelect());
                parent.closeJSDialog();
            }
            //            window.returnValue = CheckSelect();
            //            window.close();
        }

        function CCC() {
            var name = document.getElementById('tablename').value;
            if (name == "ERPBuMen") {
                parent.closeBMDialog();
            }
            else {
                parent.closeJSDialog();
            }
            //            window.returnValue = "";
            //            window.close();
        }
    </script>

</head>
<body scroll="no">
    <form id="Form1" method="post" runat="server">
    <table border="0" width="100%" cellspacing="0" align="center" cellpadding="0" height="100%" bordercolorlight="#c0c0c0"
        bordercolordark="#ffffff">
        <tr>
            <td height="22" background="../../images/show_02.gif" align="left" style="font-size: 12px;
                font-family: 宋体">
                请选择您需要的项，然后点“确定”！
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="text-align: center">
                查询：<asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="100px"></asp:TextBox>
<asp:Button ID="iButton4" runat="server" CssClass="btn btn-blue" Text="查询" OnClick="iButton4_Click" /><br />
                <table border="0" cellspacing="0" align="center" cellpadding="0" style="width: 318px; height: 49px">
                    <tr>
                        <td colspan="2" style="height: 31px; text-align: center;">
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                BorderWidth="1px" Width="100%" ShowHeader="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                                PageSize="10">
                                <PagerSettings FirstPageText="首页" LastPageText="最后一页" NextPageText="下一页" PreviousPageText="上一页" />
                                <FooterStyle BackColor="#F2F5FA" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <input id="Checkbox1" value='<%#DataBinder.Eval(Container.DataItem, "SelectContent")%>'
                                                type="checkbox" />
                                        </ItemTemplate>
                                        <ItemStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "SelectContent")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle Height="30px" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    &nbsp;你所查看的选项无可用信息！
                                </EmptyDataTemplate>
                                <PagerStyle BackColor="White" />
                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="12px"
                                    Font-Strikeout="False" Font-Underline="False" ForeColor="green" Height="30px" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 31px; text-align: center;">
                            &nbsp;<input type="button" value="确定" onclick="sendFromChild();" style="width: 70px"
                                class="BottonCss"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="22" background="../../images/show_02.gif">
            </td>
            <asp:TextBox ID="tablename" runat="server" Width="0" Height="0"/>
        </tr>
    </table>
    </form>
</body>
</html>
