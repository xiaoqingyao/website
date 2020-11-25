<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowSource.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.ShowSource" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
    <link href="../css/resource.css" rel="stylesheet" type="text/css" />
      <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
      <link href="../css/public.css" rel="stylesheet" type="text/css" />
      
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script src="../JS/ShowResource.js" type="text/javascript"></script>
</head>

<body>
<form id="Form1" runat="server">
<div id="anthorContainer">
    
    <div class="anthorContainer">
<ul class="selected">
        <li style=" padding-top:8px; padding-left:5px;">搜索：</li>
        <li><asp:DropDownList ID="ddlSearchType" runat="server">
            <asp:ListItem Value="Name" Text="名称"></asp:ListItem>
            <asp:ListItem Value="BriefIntroduction" Text="简介"></asp:ListItem>
        </asp:DropDownList></li>
        <li>  <asp:TextBox ID="txtSearch"  class="itext"  runat="server"></asp:TextBox></li>
        <li><asp:Button ID="Button1" runat="server" Text="搜索" CssClass="AddBtn" OnCommand="btnSearch_Click" /></li>
    </ul>     <div class="anthorContainer">
        <div class="antables">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" id="ResourceInfoList">
              <tr>
                <th width="80">名称</th>
                <th>简介</th>
              </tr>
              
              <asp:Repeater ID="rptAuthor" runat="server">
              <ItemTemplate>
              <tr onclick="SetSource(this, 'Source')">
                <td><%#Eval("Name") %></td>
                <td><%#Eval("BriefIntroduction") %></td>
              </tr>
              </ItemTemplate>
              </asp:Repeater>
            </table>
            
            <webdiyer:AspNetPager ID="Split" CssClass="page" runat="server" PageSize="18" AlwaysShow="True" OnPageChanged="Split_PageChanged"
                        ShowCustomInfoSection="Left" ShowPageIndexBox="always"
                        PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
                    </webdiyer:AspNetPager>
        </div>
    </div>
</div>
</form>
    <script type="text/javascript">        $(SourcePageInit());</script>

</body>
</html>
