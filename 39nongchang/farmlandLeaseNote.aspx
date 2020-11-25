<%@ Page Language="C#" AutoEventWireup="true" CodeFile="farmlandLeaseNote.aspx.cs" Inherits="farmlandLeaseNote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
    <link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="scripts/authority/commonAll.js"></script>
    <script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
    <script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
    <script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript">
        $(document).ready(function () {
            /*
             * 取消
             */
            $("#cancelbutton").click(function () {
                /**  关闭弹出iframe  **/
                window.parent.$.fancybox.close();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ui_content">
            <div class="ui_tb">
                <input id="cancelbutton" type="button" value="关闭" class="ui_input_btn01" />
                <asp:GridView ID="GridView1" runat="server" CssClass="table" CellPadding="0" CellSpacing="0" AutoGenerateColumns="false" Width="100%" BorderWidth="0">
                    <Columns>
                        <asp:BoundField HeaderText="土地编号" DataField="farmlandCode" />
                        <asp:BoundField HeaderText="土地名称" DataField="farmlandName" />
                        <asp:BoundField HeaderText="土地转出者" DataField="fromUserName" />
                        <asp:BoundField HeaderText="土地接收者" DataField="toUserName" />
                        <asp:BoundField HeaderText="时间" DataField="createDate" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
