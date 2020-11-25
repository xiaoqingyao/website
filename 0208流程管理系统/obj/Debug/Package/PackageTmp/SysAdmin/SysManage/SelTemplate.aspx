<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelTemplate.aspx.cs" Inherits="AllPower.Web.Admin.SelTemplate" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>上传文件管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function GetTemplatePath(tempUrl)
        {
            parent.document.getElementById("<%=GetContrName()%>").value = tempUrl;
            parent.Closed();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" style="font-size:12px">
        <table border=0 cellpadding=0 width=100%>
            <tr><td height=20 colspan=2><img src="../images/ext/dir.gif" /> <%=parentPath %></td></tr>
            <tr><td style="padding-left:20px;border-bottom:1px solid #CCCCCC" height=30 colspan=2> 注： 双击模板文件选择</td></tr>
        <asp:Repeater ID="rptFileList" runat="server"  >
            <ItemTemplate>
               <%# GetDirPath(Eval("FullName").ToString(), Eval("FileName").ToString(), Convert.ToBoolean(Eval("IsDir")), Eval("ExtensionPhoto").ToString(), Eval("FileSize").ToString ())%> 
            </ItemTemplate>
        </asp:Repeater>
       </table>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
