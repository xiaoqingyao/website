<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlFormList.aspx.cs" Inherits="KingTop.Web.Admin.ControlFormList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="../css/controlmanagelist.css" />
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../JS/Common.js"></script>
    <script language="javascript" src="../JS/ControlManageList.js" type="text/javascript"></script>
    <!--{$ParseModel.Include.JS$}-->
</head>
<body>
    <form id="form1" runat="server">
    <div style=" padding:3px; margin:5px;"><!--{$ParseModel.ListLink$}--></div>
    <div style=" padding:3px; margin:5px;"><!--{$ParseModel.ListButton$}--></div>
    <div>
    <table id="_ListInfoListTable">  
        <!--{$ParseModel.ListInfo.Header$}--> 
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
        <!--{$ParseModel.ListInfo.Item$}-->
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
    </div>

    <div>
    <webdiyer:aspnetpager id="Split" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" CustomInfoSectionWidth="20%" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"></webdiyer:aspnetpager>
   </div>
   <!--$ParseModel.ServerControl$-->
   <asp:HiddenField ID="hdnModelID" Value="" runat="server" />
   <asp:HiddenField ID="hdnTableName" Value="" runat="server" />
   <asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />
   <asp:HiddenField ID="hdnForignTableCol" Value="" runat="server" />
    <asp:HiddenField ID="hdnShowCol" runat="server" />

   <input type="checkbox" name="_chkID" />
      </form>
    
   <form name="searchForm" method="post" action="?">
   <div>
        <div><!--{$ParseModel.Search$}--> </div>
        <div><input type="submit" value="搜索" /></div>
    </div>
    </form>
    
</body>
</html>