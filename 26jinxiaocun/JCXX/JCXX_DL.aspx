<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JCXX_DL.aspx.cs" Inherits="JCXX_JCXX_DL" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>某进销存管理系统--登录</title>
</head>
<body style="MARGIN-TOP: 0px; PADDING-TOP: 0px; TEXT-ALIGN: center" bgcolor="#000000">
		<div style="WIDTH: 1000px; BACKGROUND-COLOR: #ccff99; margin-top: 0px; padding-top: 0px;">
			<div align="center" style="BACKGROUND-IMAGE: url(/images/logo.jpg);WIDTH: 1000px;HEIGHT: 100px;BACKGROUND-COLOR: transparent"></div>
			<form id="Formd" method="post" runat="server">
                <div style="MARGIN-TOP: 80px; WIDTH: 307px; HEIGHT: 262px; BACKGROUND-COLOR: #66ff33"align="center">
                    <div style="MARGIN-TOP: 5px; WIDTH: 297px; HEIGHT: 252px; BACKGROUND-COLOR: #ccff99"align="center">
                    <br />
                    <span style="font-size: 24pt; font-family: 宋体">欢迎登录</span><br />
                    身&nbsp;&nbsp;&nbsp;&nbsp;份：&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlsf" runat="server" Width="155px"></asp:DropDownList><br />
                    <div style="MARGIN-TOP: 5px; WIDTH: 280px; HEIGHT: 10px; BACKGROUND-COLOR: #ccff99"></div>
                    用户名：&nbsp;&nbsp;
                    <asp:TextBox ID="txtbuser" runat="server"></asp:TextBox><br />
                    <div style="MARGIN-TOP: 5px; WIDTH: 280px; HEIGHT: 10px; BACKGROUND-COLOR: #ccff99"></div>
                    密&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;
                    <asp:TextBox ID="txtbpwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox><br />
                    <div style="MARGIN-TOP: 5px; WIDTH: 280px; HEIGHT: 10px; BACKGROUND-COLOR: #ccff99"></div>
                        <asp:Button ID="btndl" runat="server" Text="登录" Width="75px" OnClick="btndl_Click1" BackColor="#CCFF99" BorderColor="#66FF33" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnqx" runat="server" Text="取消" Width="75px" OnClick="btnqx_Click1" BackColor="#CCFF99" BorderColor="#66FF33" />
                    <div style="MARGIN-TOP: 5px; WIDTH: 280px; HEIGHT: 20px; BACKGROUND-COLOR: #ccff99">
                    <asp:Label ID="lblmassage" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                    </div>
				</div>
                &nbsp;<div align="center" style="WIDTH: 1000px; HEIGHT: 75px">
				</div>
			</form>
			<div align="center" style="BACKGROUND-IMAGE: url(/images/icp.jpg);WIDTH: 1000px;HEIGHT: 50px;TEXT-ALIGN: center">
			</div>
		</div>
	</body>
</html>
