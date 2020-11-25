<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectUser1.aspx.cs" Inherits="OA.aspx.Moa.Main.SelectUser1" %>

<html>
<head>
    <title>选择条件</title>
    <meta http-equiv="Content-Language" content="zh-cn">
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self" />

    <script language="javascript">
        var allCheckStr;
        var getFromParent = window.dialogArguments;
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

        function AddSelect() {
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
            if (document.getElementById('TextBox4').value.length > 0) {
                document.getElementById('TextBox4').value = document.getElementById('TextBox4').value + "," + aaaa;
            }
            else {
                document.getElementById('TextBox4').value = aaaa;
            }

            for (var i = 0; i < window.document.Form1.elements.length; i++) {
                var e = Form1.elements[i];
                e.checked = false;
            }
        }

        function AllSelect() {
            var aaaa = "";
            for (var i = 0; i < window.document.Form1.elements.length; i++) {
                var e = Form1.elements[i];
                if (e.id == "Checkbox1") {
                    if (aaaa == "") {
                        aaaa = e.value;
                    }
                    else {
                        aaaa = aaaa + "," + e.value;
                    }
                }
            }
            if (document.getElementById('TextBox4').value.length > 0) {
                document.getElementById('TextBox4').value = document.getElementById('TextBox4').value + "," + aaaa;
            }
            else {
                document.getElementById('TextBox4').value = aaaa;
            }
        }

        function sendFromChild() {
            //window.returnValue=CheckSelect();  
            window.returnValue = document.getElementById('TextBox4').value;
            window.close();
        }

        function CCC() {
            window.returnValue = "";
            window.close();
        }
    </script>

</head>
<body scroll="no">
    <form id="Form1" method="post" runat="server">
    <table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%" bordercolorlight="#c0c0c0"
        bordercolordark="#ffffff">
        <tr>
            <td height="22" background="../../images/show_02.gif" align="left" style="font-size: 12px;
                font-family: 宋体">
                请选择您需要的项，然后点“确定”！
            </td>
        </tr>
        <tr>
            <td valign="top" style="text-align: center">
                <table border="0" cellspacing="0" cellpadding="0" style="width: 318px; height: 49px">
                    <tr>
                        <td colspan="2" style="height: 31px; text-align: left">
                            部&nbsp; 门：<asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="85px"></asp:TextBox>
                            <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPBuMen&LieName=BuMenName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox2').value=wName;}"
                                src="../../images/Button/search.gif" />
                            角色：<asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="85px"></asp:TextBox>
                            <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPJiaoSe&LieName=JiaoSeName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox3').value=wName;}"
                                src="../../images/Button/search.gif" /><br />
                            用户名：<asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="85px"></asp:TextBox>&nbsp;
                            
<asp:Button ID="iButton4" runat="server" CssClass="btn btn-blue" Text="查询" OnClick="iButton4_Click" />
                            <input type="button" value="全部加入" onclick="AllSelect();" style="width: 69px" class="BottonCss"
                                id="Button2">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 31px; text-align: center;">
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                BorderWidth="1px" Width="100%" ShowHeader="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                                    Font-Strikeout="False" Font-Underline="False" ForeColor="green"  Height="30px" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 31px; text-align: center;">
                            已选：<asp:TextBox ID="TextBox4" runat="server" Width="175px"></asp:TextBox><input type="button"
                                value="加入" onclick="AddSelect();" style="width: 49px" class="BottonCss" id="Button1"><input
                                    type="button" value="确定" onclick="sendFromChild();" style="width: 48px" class="BottonCss">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="22" background="../../images/show_02.gif">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
