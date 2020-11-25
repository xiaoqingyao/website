<%@ Page Language="C#" AutoEventWireup="true" Inherits="AllPower.Web.Admin.ImportWord" Codebehind="ImportWord.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    
       
</head>
<body style="margin:0px;background-color:#f2f7fe">
    <form id="form1" method="post" runat="server">
    <div>
        <input id="fileWord" runat="server" type="file" size=42/>
    </div>
    <div style="display:none">
        &nbsp;<asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="导入" />
        <textarea id="Textarea2" style="width: 648px; height: 201px" runat="server"></textarea>
      
        </div>
        <div style="display:none" id="divJs" runat="server"></div>
    </form>
</body>
</html>
