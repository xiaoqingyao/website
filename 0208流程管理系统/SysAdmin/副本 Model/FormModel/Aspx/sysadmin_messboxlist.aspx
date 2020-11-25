<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlFormList.aspx.cs" Inherits="KingTop.Web.Admin.ModelList" %>

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
    <div class="link" style=" padding:3px; margin:5px;"></div>
    <div class="link" style=" padding:3px; margin:5px;"></div>
    <div>
    <table id="_ListInfoListTable" style="width: 100%;" border="0">  
        <li style="width:30%;" >操作</li>
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
         <ul class="ulheader ulbody"><li style="width:30%;" ></li></ul>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
    </div>
    </div>
    <div>        <table style="width: 100%">
            <tr>
                <td class="btd">
    <webdiyer:aspnetpager id="Split" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" CustomInfoSectionWidth="20%" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"></webdiyer:aspnetpager>
    </td></tr></table>
   </div>
   <asp:HiddenField ID="hdnModelID" Value="000000000132380" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_F_messbox" runat="server" /><asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />   <asp:HiddenField ID="hdnForignTableCol" value="" runat="server" /><asp:HiddenField ID="hdnShowCol" value="1 as ktype" runat="server" />
   </form>
   <form name="searchForm" method="post" action="?">
    <div>
        <div><input type="submit" value="搜索" /></div>
        </div>
    </form>
    
    
</body>
</html>