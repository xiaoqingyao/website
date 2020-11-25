<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cropManage.aspx.cs" Inherits="cropManage" %>


<%@ Register Assembly="UcfarPager" Namespace="UcfarPager" TagPrefix="pager" %>
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
    <script type="text/javascript">
        $(document).ready(function () {
            /** 新增   **/
            $("#addBtn").fancybox({
                'href': 'cropEdit.aspx',
                'width': 733,
                'height': 530,
                'type': 'iframe',
                'hideOnOverlayClick': false,
                'showCloseButton': false,
                'onClosed': function () {
                    window.location.href = 'cropManage.aspx';
                }
            });
            /**编辑   **/
            $("a.edit").fancybox({
                'width': 733,
                'height': 530,
                'type': 'iframe',
                'hideOnOverlayClick': false,
                'showCloseButton': false,
                'onClosed': function () {
                    window.location.href = 'cropManage.aspx';
                }
            });
        });

    </script>
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
                            种植名称：<asp:TextBox ID="txtName" runat="server" CssClass="ui_input_txt02"></asp:TextBox>
                        </div>
                        <div id="box_bottom">
                            <asp:Button runat="server" Text="查询" CssClass="ui_input_btn01" OnClick="Unnamed_Click" ID="select" />
                            <input type="button" value="新增" class="ui_input_btn01" id="addBtn" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui_content">
                <div class="ui_tb">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" CellPadding="0" CellSpacing="0" AutoGenerateColumns="false" Width="100%" BorderWidth="0">
                        <Columns>
                           <asp:BoundField HeaderText="编号" DataField="code" />
                            <asp:BoundField HeaderText="姓名" DataField="name" />
                            <asp:BoundField HeaderText="承租人" DataField="tenantryName" />
                            <asp:BoundField HeaderText="种植时间从" DataField="dtFrm" />
                            <asp:BoundField HeaderText="种植时间到" DataField="dtTo" />
                            <asp:BoundField HeaderText="生长期" DataField="totalDay" />
                            <asp:BoundField HeaderText="地块" DataField="farmlandName" />
                            <asp:BoundField HeaderText="工人名称" DataField="WorkerName" />
                             <asp:BoundField HeaderText="状态" DataField="status" />
                            <asp:HyperLinkField DataNavigateUrlFormatString="~/cropEdit.aspx?code={0}" DataNavigateUrlFields="code" Text="编辑" ControlStyle-CssClass="edit" />
                            <asp:HyperLinkField DataNavigateUrlFormatString="~/cropManage.aspx?code={0}" DataNavigateUrlFields="code" Text="删除"  />
                        </Columns>
                    </asp:GridView>

                </div>
                <div>
                    <pager:UcfarPager ID="ucPager" runat="server" OnPageChanged="ucPager_PageChanged">
                    </pager:UcfarPager>
                </div>
            </div>
        </div>
    </form>
    <div style="display: none">
        <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
    </div>
</body>
</html>
