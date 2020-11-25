<%@ Page Language="C#" AutoEventWireup="true" CodeFile="huodongliebiao.aspx.cs" Inherits="huodongliebiao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>活动列表页</title>

    <script type="text/javascript">
        function openDetail(openUrl) {
            //showModalDialog 显示的页面不刷新，加随机数即可实现随时刷新
            window.showModalDialog(openUrl, 'newwindow', 'center:yes;dialogHeight:400px;dialogWidth:600px;status:no;scroll:yes');
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-top: 5px; margin-left: 5px;">
        <table width="90%">
            <tr>
                <td>
                    已发布活动列表，单击报名数可以查看报名明细
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="90%"
                        OnRowDataBound="GridView1_OnRowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="序号" DataField="listid" />
                            <asp:BoundField HeaderText="标题" DataField="biaoti" />
                            <asp:BoundField HeaderText="赠送积分" DataField="jifen" />
                            <asp:BoundField HeaderText="报名数" DataField="bms" />
                            <asp:BoundField HeaderText="最大人数上限" DataField="maxrenshu" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_DEL" runat="server" Text="删除活动" OnClick="btn_DEL_Click" CommandArgument='<%#Eval("listid") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
