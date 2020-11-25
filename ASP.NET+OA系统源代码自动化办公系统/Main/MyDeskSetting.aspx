<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyDeskSetting.aspx.cs" Inherits="Main_MyDeskSetting" %>
<html>
	<head>
		<title>企业OA综合管理平台</title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;桌面管理 &gt;&gt; 桌面显示设置
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle" ImageUrl="../images/Button/Submit.jpg" OnClick="ImageButton1_Click" />
                    <img src="../images/Button/JianGe.jpg" />&nbsp;
                    <img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 600px" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">            
        <tr>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                <strong>备选信息列表</strong></td>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
            </td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                <strong>已选显示列表</strong></td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
            </td>
        </tr>
        
        <tr>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px; text-align: center;" >
                    <asp:ListBox ID="ListBox1" runat="server" Height="310px" Width="210px" SelectionMode="Multiple">
                        <asp:ListItem>待办工作</asp:ListItem>
                        <asp:ListItem>我的工作</asp:ListItem>
                        <asp:ListItem>内部邮件</asp:ListItem>
                        <asp:ListItem>Internet邮件</asp:ListItem>
                        <asp:ListItem>手机短信</asp:ListItem>
                        <asp:ListItem>单位公告通知</asp:ListItem>
                        <asp:ListItem>部门公告通知</asp:ListItem>
                        <asp:ListItem>投票</asp:ListItem>
                        <asp:ListItem>日程安排</asp:ListItem>
                        <asp:ListItem>工作日志</asp:ListItem>
                        <asp:ListItem>公共通讯簿</asp:ListItem>
                        <asp:ListItem>共享通讯簿</asp:ListItem>
                        <asp:ListItem>个人通讯簿</asp:ListItem>
                        <asp:ListItem>我的会议</asp:ListItem>
                        <asp:ListItem>我的计划</asp:ListItem>
                        <asp:ListItem>个人文件</asp:ListItem>
                        <asp:ListItem>共享文件</asp:ListItem>
                        <asp:ListItem>我的硬盘</asp:ListItem>
                        <asp:ListItem>共享硬盘</asp:ListItem>
                        <asp:ListItem>接收文件</asp:ListItem>
                        <asp:ListItem>我的客户</asp:ListItem>
                    </asp:ListBox></td>
                     <td align="right" style="width: 170px; background-color: #cccccc; height: 25px; text-align: center;" >
                         <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/Right.gif" Height="40px" ImageAlign="AbsMiddle" ToolTip="添加到已选项" OnClick="ImageButton2_Click" />
                         <br />
                         <br />
                         <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/Button/Left.gif" Height="40px" ImageAlign="AbsMiddle" OnClick="ImageButton3_Click" ToolTip="删除已选项" /></td>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px; text-align: center;" >
                    <asp:ListBox ID="ListBox2" runat="server" Height="310px" Width="210px" SelectionMode="Multiple"></asp:ListBox></td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/Button/Up.gif" Height="35px" ImageAlign="AbsMiddle" ToolTip="顺序提升向前" OnClick="ImageButton4_Click" />
                         <br />
                         <br />
                         <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/images/Button/Down.gif" Height="35px" ImageAlign="AbsMiddle" ToolTip="顺序下降向后" OnClick="ImageButton5_Click" /></td>
        </tr>
        </table>
        <strong>点击条目时，可以组合CTRL或SHIFT键进行多选</strong></div>
    </form>
</body>
</html>