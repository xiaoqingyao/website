<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ckeditorupload.aspx.cs" Inherits="AllPower.WEB.SysAdmin.upfiles.ckeditorupload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<script language="javascript" type="text/javascript">
    window.name = "fileUpload";
     function checkData(frm)
     {
         if (document.getElementById('txtFileUpload').value == "") {
             alert("<%=Resources.Common.UploadMsg7%>"); 
            return false;
        }
        document.getElementById ("Table2").style.display ="";
        document.getElementById ("Table1").style.display ="none";
        return true;
     }
    </script>
<body>
    <form name="form1" id="form1" method="post" target="fileUpload" enctype="multipart/form-data" runat="server">
    <span id="span1" runat="server">
    <table width="100%" border="0" align="center" id="Panel_Content" cellpadding="0" cellspacing="1" bgcolor="darkgray">
			<tr>
				<td bgcolor="#ffffff" height="400" valign="top" align="center" id="tdContent">
				    <table width="100%" border="0" cellpadding="4" cellspacing="1" id="Table2" style="display:none" bgcolor="white">
						<tr id="Tr5">
							<td width="50px"></td>
							<td align="center" colspan="2" style="height: 100px" id="tdMsg"><div style ="float :left "><img src="../images/animated_loading.gif" /></div><div style="float :left;padding-left:10px;padding-top:10px "><%=Resources.Common.UploadMsg8%></div></td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="4" cellspacing="1" id="Table1" bgcolor="white">
						<tr id="mouseeffect_2">
							<td align="left" colspan="2" style="height: 24px">&nbsp;<b><%=Resources.Common.UploadMsg1%></b></td>
						</tr>
						<tr id="Tr1">
							<td align="right">&nbsp;<%=Resources.Common.UploadMsg2%>:</td>
							<td align="center" width="80%">
                            <%--<asp:FileUpload ID="txtFileUpload" runat="server" style="WIDTH:320px;HEIGHT:20px"  CssClass="botton" onkeydown="return false" oncontextmenu="return false"/>--%>
                            <input type="file" name="txtFileUpload" />
							</td>
						</tr>
						<tr id="tr3" runat="server">
						<td align="right">&nbsp;<%=Resources.Common.UploadMsg3%>:</td>
							<td align="center" width="80%">
							<input type="checkbox" id="chkIshumbnail" name="chkIshumbnail" value="1"/> 
                             <%=Resources.Common.UploadMsg4%>
							</td>
						</tr>
						<tr id="Tr2">
							<td align="left" colspan="2"></td>
						</tr>
						<tr id="Tr3">
							<td align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label><br />&nbsp;&nbsp;&nbsp;&nbsp;2.<%=Resources.Common.UploadMsg5%><span id="spanSize" runat ="server"></span>M。</td>
						</tr>
						<tr id="Tr4">
							<td align="center" colspan="2">
                                &nbsp;<asp:Button ID="btnUpload" runat="server" Text='<%$Resources:Common,UploadSubmit%>' CssClass="btn" OnClick="btnUpload_Click" OnClientClick="return checkData(this)" />
								<input type="button" name="button1" value="<%=Resources.Common.UploadClose%>" class="btn" onclick="javascript:window.close();" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div id="Layer1" style="DISPLAY:none;Z-INDEX:1;LEFT:110px;WIDTH:200px;POSITION:absolute;TOP:30px;HEIGHT:60px">		        
		</div>
		</span>
		<span id="span2" runat="server" visible="false">
		<div align="center"><%=Resources.Common.UploadMsg6%></div>
		</span>
    </form>
</body>
</html>

