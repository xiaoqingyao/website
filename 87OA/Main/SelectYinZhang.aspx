<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectYinZhang.aspx.cs" Inherits="Main_SelectYinZhang" %>

<HTML>
	<HEAD>
		<title>选择条件</title>
		<meta http-equiv="Content-Language" content="zh-cn">
		<LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<base target=_self />	
		<script  language="javascript">
           function  sendFromChild()  
            {       
                window.returnValue=document.getElementById('DropDownList1').value;  
//                window.close();  
            }
            
            function  CCC()  
            {       
                window.returnValue="";  
//                window.close();  
            }
        </script> 	
</HEAD>
	<body scroll="no">
		<form id="Form1" method="post" runat="server">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%" bordercolorlight="#c0c0c0" bordercolordark="#ffffff">
				<tr>
					<td height="22" background="../images/show_02.gif" align="left" style="font-size: 12px; font-family: 宋体"> 　请选择印章，输入密码，然后点“确定”！</td>
				</tr>
				<tr>
			    <td valign="top" style="text-align: center">				  
                    <table  border="0" cellspacing="0" cellpadding="0" style="width: 318px; height: 49px">
                        <tr>
                            <td colspan="2" style="height: 31px; text-align: left">
                                &nbsp; 选择印章：<asp:DropDownList ID="DropDownList1" runat="server" Width="200px">
                                </asp:DropDownList></td>
                        </tr>
                    <tr>
                        <td colspan="2" style="height: 31px; text-align: left;">
                            &nbsp; 印章密码：<asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="200px"></asp:TextBox></td>
                    </tr>
                      <tr>
                          <td colspan="2" style="height: 31px; text-align: center;">
                              <asp:Button ID="Button1"  runat="server" Text="确定" Width="47px" OnClick="Button1_Click" />
                              </td>
                      </tr>                        
                    </table></td>
				</tr>
				<tr>
					<td height="22" background="../images/show_02.gif">
					</td>
				</tr>
			</table>
		</form>
	</body>			
</HTML>