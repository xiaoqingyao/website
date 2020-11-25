<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsUC.ascx.cs" Inherits="UserControl_NewsUC" %>
<link href="../css/css.css" rel="stylesheet" />
<table cellpadding="0" cellspacing="0" border="0" width="200" style="BORDER-COLLAPSE: collapse;">

	<tr>
		 <td><div align="center"><div class="DivBorder Fs_Kstd">
<div class="Fs_Kstd_Top"><span class="Fs_Dot"><img height="9" 
src="../images/Ddot.jpg" width="9" border="0"></span> <span class="Fs_Text">新闻</span></div>

<div class="Fs_Kstd_Bottom"><marquee id="ScrollNews" scrollamount="1" scrolldelay="50" direction="up" behavior="scroll"
				height="117" onmousemove="stop()" onmouseout="start()">
				<table>
				    <tr>
				        <td><a href="http://localhost:45304/WYGL/main11.aspx">小区防盗温馨提示</a></td>
				    </tr>
                    <tr><td></td></tr>
				    <tr>
				        <td><a href="http://localhost:45304/WYGL/main22.aspx">小区好人好事(图)</a></td>
				    </tr>
                    <tr><td></td></tr>
				    <tr>
				        <td><a href="http://localhost:45304/WYGL/main33.aspx">义务保洁，改善小区环境卫生</a></td>
				    </tr>
                    <tr><td></td></tr>
				    <tr>
				        <td><a href="http://localhost:45304/WYGL/main44.aspx">小区内张贴寻物启事</a></td>
				    </tr>
				</table>
			</marquee>	</div>	</div></div></td>
			
	</tr>
</table>
