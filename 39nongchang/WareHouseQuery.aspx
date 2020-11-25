<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WareHouseQuery.aspx.cs" Inherits="WareHouseQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
    <link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="scripts/authority/commonAll.js"></script>
    <script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
    <script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
    <script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
    <title>信息管理系统</title>

    <style>
        .alt td {
            background: black !important;
        }
    </style>
</head>
<body>
    <form id="submitForm" runat="server">
        <div id="container">
            <div class="ui_content">
                <div class="ui_text_indent">
                    <div id="box_border">
                        <div id="box_top">搜索</div>
                        <div id="box_center">
                            出入库时间从：<asp:TextBox ID="dtFrm" runat="server" CssClass="ui_input_txt02"></asp:TextBox>
                            出入库时间到：<asp:TextBox ID="dtTo" runat="server" CssClass="ui_input_txt02"></asp:TextBox>
                            存货分类：<asp:DropDownList runat="server" ID="Category">
                                 <asp:ListItem Value="" Text="全部"></asp:ListItem>
                                <asp:ListItem Value="生产物资" Text="生产物资"></asp:ListItem>
                                <asp:ListItem Value="农药化肥" Text="农药化肥"></asp:ListItem>
                                <asp:ListItem Value="种子" Text="种子"></asp:ListItem>
                                <asp:ListItem Value="收货产品" Text="收货产品"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button runat="server" Text="查询" CssClass="ui_input_btn01" OnClick="select_Click" ID="select" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui_content">
                <div class="ui_tb">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" CellPadding="0" CellSpacing="0" AutoGenerateColumns="false" Width="100%" BorderWidth="0">
                        <Columns>
                            <asp:BoundField HeaderText="存货分类" DataField="Category" />
                            <asp:BoundField HeaderText="数量" DataField="ct" />
                        </Columns>
                    </asp:GridView>

                </div>

            </div>
        </div>
    </form>
    <div style="display: none">
        <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
    </div>
</body>
</html>
