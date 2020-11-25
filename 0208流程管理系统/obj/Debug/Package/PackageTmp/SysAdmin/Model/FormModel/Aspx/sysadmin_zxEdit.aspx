<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlFormTemplate.aspx.cs" Inherits="AllPower.Web.Admin.ControlFormTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/mm.css" type="text/css">
    <link rel="stylesheet" href="../../css/main.css" type="text/css">
    <meta name="Microsoft Theme" content="none, default">
    <meta name="Microsoft Border" content="none, default">
    <script src="../../../JS/jquery-3.2.min.js" type="text/javascript"></script>
     <script src="../../../JS/jquery-validationEngine.js" type="text/javascript"></script>
     <script src="../../../JS/jquery-validationEngine-cn.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../../../JS/Common.js"></script>
    <script language="javascript" src="../../../JS/ControlManageList.js" type="text/javascript"></script>
    <style type="text/css">
ul{
 list-style:none;
 clear:both;
}
ul li{
	 float:left; padding-right:5px;
}
.link a{ padding:5px; margin:5px;}
</style>
</head>
<body>
    <form id="form1" runat="server">   
    <div>
    <table id="_ListInfoListTable" style="width: 100%;" border="0">  
               
         <asp:Panel ID="plReply" runat="server">   </asp:Panel>  
   <tr><td>回复内容:</td><td> <asp:TextBox ID="txtReplyAdminContent" runat="server" TextMode="MultiLine" 
            Height="155px" Width="241px"></asp:TextBox></td></tr>
    <tr><td>回复人:</td><td><asp:Label ID="lblAdmin" runat="server"></asp:Label></td></tr>
<tr><td>回复时间:</td><td><asp:Label ID="lblReplyTime" runat="server"></asp:Label></td></tr>
<tr><td></td><td><asp:Button ID="btnReply" runat="server" Text="回复" 
        onclick="btnReply_Click" /></td></tr>

    </table>   
    <div>            
        
   </div> 
   <asp:HiddenField ID="hdnModelID" Value="000000000279398" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_F_zx" runat="server" /><asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />   <asp:HiddenField ID="hdnForignTableCol" value="" runat="server" /><asp:HiddenField ID="hdnShowCol" value="" runat="server" />   
   </form>    
</body>
</html>
