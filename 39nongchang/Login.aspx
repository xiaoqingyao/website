<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>田园农场管理系统-登录</title>
<link href="style/authority/login_css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login_sub").click(function(){
			$("#submitForm").attr("action", "index.html").submit();
		});
	});
	
	/*回车事件*/
	function EnterPress(e){ //传入 event 
		var e = e || window.event; 
		if(e.keyCode == 13){ 
			$("#submitForm").attr("action", "index.html").submit();
		} 
	} 
</script>
</head>
<body>
	<div id="login_center">
		<div id="login_area">
			<div id="login_box">
				<div id="login_form">
					<form id="submitForm" runat="server">
						<div id="login_tip">
							<span id="login_err" class="sty_txt2"></span>
						</div>
						<div>
							 用户名：<asp:TextBox runat="server" id="Name" CssClass="username"></asp:TextBox>
						</div>
						<div>
							密&nbsp;&nbsp;&nbsp;码：
                            <asp:TextBox runat="server" id="pwd" CssClass="pwd" onkeypress="EnterPress(event)" onkeydown="EnterPress()" TextMode="Password"></asp:TextBox>
						</div>
                        <div>
                            角&nbsp;&nbsp;&nbsp;色：
                            <asp:DropDownList runat="server" ID="role" CssClass="pwd">
                                <asp:ListItem Value="0">-----------农场主-----------</asp:ListItem>
                                <asp:ListItem Value="1">-----------承租人-----------</asp:ListItem>
                                <asp:ListItem Value="2">-----------管理员-----------</asp:ListItem>
                            </asp:DropDownList>
                        </div>
						<div id="btn_area">
                            <asp:Button ID="login_btn" runat="server" Text="登  录" CssClass="login_btn" OnClick="login_btn_Click"/>
							<input type="reset" class="login_btn" id="login_ret" value="重 置">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
