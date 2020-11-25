<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowKeyword.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.ShowKeyword" %>

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
<li style=" padding-top:8px; padding-left:5px;">选中内容：</li><li><input type="text" class="antext" readonly="readonly"  id="Selected" name="Selected" />&nbsp;<input class="AddBtn" type="button" onclick="removeAllSelected('Keyword')" value="删除全部" /></li>
</ul>
<ul class="selected">
        <li style=" padding-top:8px; padding-left:5px;">搜索：</li>
        <li><asp:DropDownList ID="ddlSearchType" runat="server">
            <asp:ListItem Value="Name" Text="关键字"></asp:ListItem>
        </asp:DropDownList></li>
        <li>  <asp:TextBox ID="txtSearch"  class="itext"  runat="server"></asp:TextBox></li>
        <li><asp:Button ID="Button1" runat="server" Text="搜索" CssClass="AddBtn" OnCommand="btnSearch_Click" /></li>
    </ul>     <div class="anthorContainer">
        
        <div class="antables">
              <ul  id="KeywordInfoList">
              <asp:Repeater ID="rptKeyword" runat="server">
              <ItemTemplate>
                <li onclick="SetKeyword(this,' ','Keyword')"><%#Eval("Name") %></li>
              </ItemTemplate>
              </asp:Repeater>
          </ul>            
            
            <webdiyer:AspNetPager ID="Split" CssClass="page" runat="server" PageSize="100" AlwaysShow="True" OnPageChanged="Split_PageChanged"
                        ShowCustomInfoSection="Left" ShowPageIndexBox="always"
                        PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
                    </webdiyer:AspNetPager>
        </div>
    </div>
</div>
</form>
<script type="text/javascript">    KeywordPageInit(" ");</script>
</body>
</html>
