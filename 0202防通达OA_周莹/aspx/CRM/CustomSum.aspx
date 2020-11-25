<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomSum.aspx.cs" Inherits="OA.aspx.CRM.CustomSum" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<SCRIPT LANGUAGE="JavaScript">
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

    function CheckDel1() {
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
            alert("请选择需要转移的客户数据！");
            return false;
        }
        if (window.confirm("你确认将选中客户转移给选定的业务员吗？")) {
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



		</SCRIPT>  
<body>
    <form id="form1" runat="server">
    <div>    
     <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px; ">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;客户管理&nbsp;>>&nbsp;客户信息统计</td>
                <td align="right" valign="middle" style=" height: 30px;">
                    &nbsp;</td>
            </tr>
        </table>
        
    </div>
        <table style="width: 100%">
            <tr>
            <td ><asp:GridView ID="GVData" CssClass="gridview_m"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                    BorderStyle="Groove" BorderWidth="1px" OnRowDataBound="GVData_RowDataBound" PageSize="15"
                    Width="100%">
                    <PagerSettings Mode="NumericFirstLast" Visible="False" />
                    <PagerStyle BackColor="LightSteelBlue" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#F3F3F3" Font-Size="12px" ForeColor="Black" Height="30px" /><AlternatingRowStyle BackColor="#f9f9f7" />
                    <Columns>
                        <asp:BoundField DataField="TongJiFenLei" HeaderText="统计分类" >
                        </asp:BoundField>                         
                        <asp:TemplateField HeaderText="统计数量">
                            <ItemTemplate>                                
                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="False" ForeColor="green"
                                    NavigateUrl='<%# "CustomInfo.aspx?TextStr="+ DataBinder.Eval(Container.DataItem, "TongJiFenLei")+"&DropStr="+ DataBinder.Eval(Container.DataItem, "DropStr")%>'><%# DataBinder.Eval(Container.DataItem, "TongJiShuLiang")%> </asp:HyperLink>
                            </ItemTemplate>    
                            </asp:TemplateField>                     
                    </Columns>
                    <RowStyle HorizontalAlign="Center" Height="25px" />
                <EmptyDataTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" style="border-right: black 1px; border-top: black 1px;
                                border-left: black 1px; border-bottom: black 1px; background-color: #f9f9f7;">
                                该列表中暂时无数据！</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                </asp:GridView>
                </td>
        </tr>
        <tr>
            <td style="border-top: #eeeeee 1px solid;border-bottom: #eeeeee 1px solid">
                &nbsp; &nbsp; 请选择统计分组参数：<asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="UserName">按照业务员统计</asp:ListItem>
                    <asp:ListItem Value="XingZhi">按照客户性质统计</asp:ListItem>
                    <asp:ListItem Value="LaiYuan">按照客户来源统计</asp:ListItem>
                    <asp:ListItem Value="QuYu">按照所在区域统计</asp:ListItem>
                    <asp:ListItem Value="ZhuangTai">按照客户状态统计</asp:ListItem>
                    <asp:ListItem Value="LeiBie">按照客户类别统计</asp:ListItem>
                    <asp:ListItem Value="JiBie">按照客户级别统计</asp:ListItem>
                    <asp:ListItem Value="YeWuFanWei">按照业务范围统计</asp:ListItem>
                    <asp:ListItem Value="HangYe">按照所属行业统计</asp:ListItem>
                    <asp:ListItem Value="BackInfoA">信息化管理统计</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<img src="../../images/TreeImages/@sms.gif" /><asp:LinkButton ID="LinkButton1" runat="server"
                    Font-Bold="True" ForeColor="Red" OnClick="LinkButton1_Click">开始客户统计</asp:LinkButton>
                &nbsp; &nbsp; 当前系统中共有客户：<asp:Label ID="Label1" runat="server" ForeColor="Blue"></asp:Label>
                个</td>
        </tr>
        </table>
    </form>
</body>
</html>