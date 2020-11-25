<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessageQuery.aspx.cs" Inherits="MessageQuery" %>

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
                'href': 'MessageEdit.aspx',
                'width': 733,
                'height': 530,
                'type': 'iframe',
                'hideOnOverlayClick': false,
                'showCloseButton': false,
                'onClosed': function () {
                    window.location.href = 'MessageManage.aspx';
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
                    window.location.href = 'MessageManage.aspx';
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
                            标题：<asp:TextBox ID="txtTitle" runat="server" CssClass="ui_input_txt02"></asp:TextBox>
                        </div>
                        <div id="box_bottom">
                            <asp:Button runat="server" Text="查询" CssClass="ui_input_btn01" OnClick="Unnamed_Click" ID="select" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui_content">
                <div class="ui_tb">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" CellPadding="0" CellSpacing="0" AutoGenerateColumns="false" Width="100%" BorderWidth="0">
                        <Columns>
                            <asp:BoundField HeaderText="主题" DataField="title" />
                            <asp:BoundField HeaderText="内容" DataField="content" />
                            <asp:BoundField HeaderText="发布时间" DataField="pubdate" />
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
