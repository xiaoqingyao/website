<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomFormList.aspx.cs" Inherits="KingTop.Web.Admin.ControlFormList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
</head>
<body>
<form id="f1" runat="server">
<div>
  <table>  
  <asp:Repeater ID="rptListInfo" runat="server"><ItemTemplate><tr>

</tr>

<tr style="display:<%#GetReplyDisplay()%>;">

</tr>

</ItemTemplate></asp:Repeater>
 </table>
 </div>
 <br /><br />
 <div>
<webdiyer:aspnetpager id="Split" runat="server" PageSize="20" UrlPaging="True" AlwaysShow="True" OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="��<font color='red'><b>%currentPageIndex%</b></font>ҳ����%PageCount%ҳ��ÿҳ��ʾ%PageSize%����¼"></webdiyer:aspnetpager><br /><br />
</div>
<asp:HiddenField ID="hdnForignTableCol" value="" runat="server" />

<asp:HiddenField ID="hdnShowCol" value=",K_F_messbox.orders" runat="server" /><asp:HiddenField ID="hdnModelID" Value=000000000132380 runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_F_messbox" runat="server" /> 
</form>
</body>
</html>
