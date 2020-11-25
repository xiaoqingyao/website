<%@ Page Language="C#" AutoEventWireup="true" CodeFile="farmlandEdit.aspx.cs" Inherits="farmlandEdit" %>

<!DOCTYPE html>
<html>
<head>
    <title>信息管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
    <link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="scripts/authority/commonAll.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery-1.4.4.min.js"></script>
    <script src="scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer="defer"></script>
    <script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            /*
             * 取消
             */
            $("#cancelbutton").click(function () {
                /**  关闭弹出iframe  **/
                window.parent.$.fancybox.close();
            });

            var result = 'null';
            if (result == 'success') {
                /**  关闭弹出iframe  **/
                window.parent.$.fancybox.close();
            }
        });
    </script>
</head>
<body>
    <form id="submitForm" runat="server">
        <input type="hidden" name="fyID" value="14458625716623" id="fyID" />
        <div id="container">
            <div id="page_close">
                <a href="javascript:parent.$.fancybox.close();">
                    <img src="images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;" />
                </a>
            </div>
        </div>
        <div class="ui_content">
            <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                <tr>
                    <td class="ui_text_rt" width="120">土地编号：</td>
                    <td class="ui_text_lt">
                        <asp:TextBox runat="server" ID="code" CssClass="ui_input_txt01" Width="200" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt">土地名称：</td>
                    <td class="ui_text_lt">
                        <asp:TextBox runat="server" ID="name" CssClass="ui_input_txt01" Width="200"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt">面积(平方米)：</td>
                    <td class="ui_text_lt">
                        <asp:TextBox runat="server" ID="area" CssClass="ui_input_txt01" Width="200"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="ui_text_rt">地址：</td>
                    <td class="ui_text_lt">
                        <asp:TextBox runat="server" ID="address" CssClass="ui_input_txt01" Width="300" Height="200" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt">所属农场主：</td>
                    <td class="ui_text_lt">
                        <asp:TextBox runat="server" ID="farmercode" CssClass="ui_input_txt01" Width="200" ReadOnly="true" BackColor="#999999"></asp:TextBox>(不允许修改)
                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt">状态：</td>
                    <td class="ui_text_lt">
                        <asp:DropDownList runat="server" ID="status" Enabled="false">
                            <asp:ListItem Value="待出租">待出租</asp:ListItem>
                            <asp:ListItem Value="已出租">已出租</asp:ListItem>
                        </asp:DropDownList>(不允许修改)
                        <asp:HiddenField ID="chengzurencode" runat="server"/>
                        <asp:HiddenField ID="chengzurenname" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="ui_text_lt">&nbsp;<asp:Button runat="server" Text="提交" CssClass="ui_input_btn01" OnClick="Unnamed_Click" />
                        &nbsp;<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div style="display: none">
        <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
    </div>
</body>
</html>
