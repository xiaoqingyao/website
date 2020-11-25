<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyDeskSetting.aspx.cs" Inherits="OA.aspx.Main.MyDeskSetting" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle" style=" height: 30px;">
                    &nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                    <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;桌面管理 &gt;&gt; 桌面显示设置
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton1_Click" />
                    
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button>
                </td>
            </tr>
            <tr>
                <td height="3px" colspan="2" style="background-color: #ffffff">
                </td>
            </tr>
        </table>
        <table style="width: 600px" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>备选信息列表</strong>
                </td>
                <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>已选显示列表</strong>
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff; height: 25px; padding-left: 5px; text-align: center;">
                    <asp:ListBox ID="ListBox1" runat="server" Height="310px" Width="210px" SelectionMode="Multiple">
                        <asp:ListItem Value="016">待办工作</asp:ListItem>
                        <asp:ListItem Value="015">我的工作</asp:ListItem>
                        <asp:ListItem Value="001">内部邮件</asp:ListItem>
                        <asp:ListItem Value="004">单位公告通知</asp:ListItem>
                        <asp:ListItem Value="005">投票</asp:ListItem>
                        <asp:ListItem Value="006">日程安排</asp:ListItem>
                        <asp:ListItem Value="007">工作日志</asp:ListItem>
                        <asp:ListItem Value="008">公共通讯簿</asp:ListItem>
                        <asp:ListItem Value="009">共享通讯簿</asp:ListItem>
                        <asp:ListItem Value="010">个人通讯簿</asp:ListItem>
                        <asp:ListItem Value="062">我参与的会议</asp:ListItem>
                        <asp:ListItem Value="029">个人文件</asp:ListItem>
                        <asp:ListItem Value="030">单位文件</asp:ListItem>
                        <asp:ListItem Value="031">项目文件</asp:ListItem>
                        <asp:ListItem Value="032">电子刊物</asp:ListItem>
                        <asp:ListItem Value="033">重要文件</asp:ListItem>
                        <asp:ListItem Value="034">机密文件</asp:ListItem>
                        <asp:ListItem Value="035">知识库</asp:ListItem>
                        <asp:ListItem Value="036">技术文件</asp:ListItem>
                        <asp:ListItem Value="037">共享文件</asp:ListItem>
                        <asp:ListItem Value="A011">待审批销售单</asp:ListItem>
                        <asp:ListItem Value="A016">待审批采购单</asp:ListItem>
                        <asp:ListItem Value="A015">待采购销售单</asp:ListItem>
                        <asp:ListItem Value="A010">我的销售订单</asp:ListItem>
                    </asp:ListBox>
                </td>
                <td align="right" style="width: 170px; background-color: #f9f9f7; height: 25px; text-align: center;">
                    
<asp:ImageButton ID="iButton2" runat="server" ImageUrl="~/images/Button/Right.gif" Height="40px" ImageAlign="AbsMiddle" ToolTip="添加到已选项" OnClick="iButton2_Click" />
                    <br />
                    <br />
                    
<asp:ImageButton ID="iButton3" runat="server" ImageUrl="~/images/Button/Left.gif" Height="40px" ImageAlign="AbsMiddle" OnClick="iButton3_Click" ToolTip="删除已选项" />
                </td>
                <td style="background-color: #ffffff; height: 25px; padding-left: 5px; text-align: center;">
                    <asp:ListBox ID="ListBox2" runat="server" Height="310px" Width="210px" SelectionMode="Multiple">
                    </asp:ListBox>
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    
<asp:ImageButton ID="iButton4" runat="server" ImageUrl="~/images/Button/Up.gif" Height="35px" ImageAlign="AbsMiddle" ToolTip="顺序提升向前" OnClick="iButton4_Click" />
                    <br />
                    <br />
                    
<asp:ImageButton ID="iButton5" runat="server" ImageUrl="~/images/Button/Down.gif" Height="35px" ImageAlign="AbsMiddle" ToolTip="顺序下降向后" OnClick="iButton5_Click" />
                </td>
            </tr>
        </table>
        <strong>点击条目时，可以组合CTRL或SHIFT键进行多选</strong></div>
    </form>
</body>
</html>
