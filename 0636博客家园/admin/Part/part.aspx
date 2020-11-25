<%@ Page Language="C#" AutoEventWireup="true" CodeFile="part.aspx.cs" Inherits="admin_Part_part" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>栏目管理</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />

    <script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>

    <script type="text/javascript">
        $(function() {
            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); //隔行变色
            $(".msgtable tr").hover(
			    function() {
			        $(this).addClass("tr_hover_col");
			    },
			    function() {
			        $(this).removeClass("tr_hover_col");
			    }
		    );
        });
    </script>

</head>
<body style="padding: 10px;">
    <form id="form1" runat="server">
        <div class="navigation">
            <span class="add"><a href="add.aspx">增加栏目</a></span><b>您当前的位置：首页 &gt; 栏目管理 &gt; 栏目列表</b></div>
        <div style="padding-bottom: 10px;">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="50" align="center" style="height: 22px">
                    请选择：</td>
                <td style="height: 22px">
                    <asp:DropDownList ID="ddlClassId" runat="server" CssClass="select" AutoPostBack="True"
                        Width="112px" OnSelectedIndexChanged="ddlClassId_SelectedIndexChanged">
                        <asp:ListItem Value="-1">请选择类型...</asp:ListItem>
                        <asp:ListItem Value="1">文章类</asp:ListItem>
                        <asp:ListItem Value="2">相册类</asp:ListItem>
                        <asp:ListItem Value="3">新闻类</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
        </table>
        <div class="spClear">
        </div>
        <asp:Repeater ID="rptClassList" runat="server">
            <HeaderTemplate>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                    <tr>
                        <th width="6%">
                            选择
                        </th>
                        <th width="7%">
                            编号</th>
                        <th align="left">
                            栏目名称</th>
                        <th align="left" width="200">
                            栏目名称</th>
                        <th align="left" width="150">
                            管理操作</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td align="center">
                        <asp:CheckBox ID="cb_id" CssClass="checkall" runat="server" />
                    </td>
                    <td align="center">
                        <asp:Label ID="lb_id" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                    </td>
                    <td>
                        <asp:Literal ID="LitFirst" runat="server"></asp:Literal>
                        <%# Eval("StrName")%>
                    </td>
                    <td align="left">
                        <%#GetType(Eval("StrType").ToString()) %>
                    </td>
                    <td align="left">
                        <span><a href="edit.aspx?Id=<%# Eval("Id") %>">修改</a></span>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <div class="spClear">
        </div>
        <div style="line-height: 30px; height: 30px;">
            <div class="left">
                 <span class="btn_bg">
                    <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm( '确定要删除这些记录吗？ ');"
                        OnClick="lbtnDel_Click">删 除</asp:LinkButton>
                </span>
            </div>
        </div>
    </form>
</body>
</html>
