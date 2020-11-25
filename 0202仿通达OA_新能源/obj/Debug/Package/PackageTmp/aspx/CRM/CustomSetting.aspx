<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomSetting.aspx.cs" Inherits="OA.aspx.CRM.CustomSetting" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;客户管理&nbsp;>>&nbsp;客户参数设置</td>
                <td align="right" valign="middle" style=" height: 30px;">
                    &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
        </table>
        
    </div>
        <table style="width: 100%">
            <tr>
            <td ><asp:GridView id="GVData" runat="server" Width="100%" OnRowCancelingEdit="GVData_RowCancelingEdit" OnRowUpdating="GVData_RowUpdating" OnRowEditing="GVData_RowEditing" OnRowDeleting="GVData_RowDeleting" OnRowCommand="GVData_RowCommand" PageSize="5" OnRowDataBound="GVData_RowDataBound" BorderWidth="1px" BorderStyle="Solid" AutoGenerateColumns="False" AllowSorting="True">
                                <PagerSettings Mode="NumericFirstLast"  />
                                <PagerStyle BackColor="LightSteelBlue" HorizontalAlign="Right"  />
                                <HeaderStyle BackColor="#F3F3F3" Font-Size="12px" ForeColor="Black" Height="30px" />
                                <Columns>                                    
                                    <asp:BoundField DataField="CanShuName" HeaderText="参数内容" >                                                               
                                    </asp:BoundField>           
                                    <asp:CommandField ShowEditButton="True">
                                        <ItemStyle ForeColor="Blue"  />
                                    </asp:CommandField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>' Font-Underline="False" ForeColor="green"  >移除</asp:LinkButton>
                                        </ItemTemplate>
                                        
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle HorizontalAlign="Center" Height="30px"  />
                                <EmptyDataTemplate>
                                    &nbsp; 无相关数据！
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <hr style="color: #006633; height:1px;">
                &nbsp; &nbsp; &nbsp;选择类别：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="ERPCustomInfo">客户信息</asp:ListItem>
                        <asp:ListItem Value="ERPLinkMan">客户联系人</asp:ListItem>
                        <asp:ListItem Value="ERPLinkLog">联系记录</asp:ListItem>
                        <asp:ListItem Value="ERPCustomNeed">需求记录</asp:ListItem>
                        <asp:ListItem Value="ERPBaoJia">报价记录</asp:ListItem>
                        <asp:ListItem Value="ERPCustomFuWu">服务记录</asp:ListItem>
                        <asp:ListItem Value="ERPCustomHuiFang">回访记录</asp:ListItem>
                        <asp:ListItem Value="ERPTouSu">投诉记录</asp:ListItem>
                        <asp:ListItem Value="ERPSongYang">送样记录</asp:ListItem>
                    </asp:DropDownList>
                    选择参数：<asp:DropDownList ID="DropDownList2" runat="server"> 
                    
                    </asp:DropDownList>
                    
<asp:Button ID="iButton4" runat="server" CssClass="btn btn-blue" Text="查询" OnClick="iButton4_Click" />
                    &nbsp; &nbsp; &nbsp;
                    添加参数内容：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton1_Click" />&nbsp;
                <hr style="color: #006633; height:1px;"></td>
        </tr>
        </table>
    </form>
</body>
</html>