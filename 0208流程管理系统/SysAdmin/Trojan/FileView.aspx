<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileView.aspx.cs" Inherits="AllPower.Web.Admin.FileView" ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>编辑页面</title>
  <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    
       <script src="../JS/Common.js" type="text/javascript"></script>
    
    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>    
    
     <script type="text/javascript" src="../js/public.js"></script> 

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="TrojanScan.aspx">木马扫描</a><a> &gt;</a>
             <a href="ScanResult.aspx">扫描列表</a><a> &gt;</a>
            <span class="breadcrumb_current">文件查看</span>
        </h4>
        <div id="panel">
            <fieldset>
            <dl>
                <dt><%=Resources.Trojan.FileName%></dt>
                <dd>
                <asp:Label ID="lblFileName" runat="server" >  </asp:Label>
                </dd>
            </dl>
                <dl>
                    <dt><%=Resources.Common.Content%></dt>
                    <dd><asp:TextBox ID="txtContent" TextMode="MultiLine" Rows="30" Columns="120" runat="server" >  </asp:TextBox>
               
                       </dd>
                </dl>
               
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="<%$Resources:Common,Save %>"  CssClass="subButton"  />
        <input type="button" name="Submit422" value="<%= Resources.Common.Back %>" onclick='location.href="ScanResult.aspx<%=StrPageParams %>";'
            class="subButton" />
            
        </div>
    </div>
    </form>
</body>
</html> 