<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseUploaded.aspx.cs"
  Inherits="PowerEasy.SiteFactory.WebSite.Editor.BrowseUploaded" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server"> 
   <script src="Popup.js" language="javascript" type="text/javascript"></script>
  <table width="100%" border="0" cellpadding="2" cellspacing="1">
    <tr>
      <td>
        <pe:ExtendedLiteral ID="ElShowType" HtmlEncode="false" runat="server"></pe:ExtendedLiteral>
      </td>
      <td style="width: 74%" align="right">&nbsp;
        <asp:Literal ID="Literal10" runat="server" Text="<%$ Res: Editor_Editor_dialog_fck_ShowUploadFiles_Literal10,搜索文件：%>"></asp:Literal>
        <asp:TextBox ID="TxtSearchKeyword" runat="server"></asp:TextBox>
        <asp:Button ID="BtnSearch" runat="server" Text="<%$ Res: Editor_Editor_dialog_fck_ShowUploadFiles_BtnSearch,搜索%>" />
      </td>
    </tr>
  </table>
  <br />
  <asp:Repeater ID="RptFiles" runat="server">
    <HeaderTemplate>
      <table width="100%" cellpadding="0" cellspacing="1" border="0" class="border">
        <tr class="title" align="center">
          <%if (ShowType != 1)
            { %>
          <td colspan="2">
            <asp:Localize ID="Localize1" Text="<%$ Res: Editor_Editor_dialog_fck_ShowUploadFiles_Localize1,名称 %>"
              runat="server" />
          </td>
          <%}
            else
            {%>
          <td colspan="2">
            <asp:Literal ID="Literal13" runat="server" Text="<%$ Res: Editor_Editor_dialog_fck_ShowUploadFiles_Localize13,图像%>"></asp:Literal>
          </td>
          <%} %>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg" align="center">
        <%if (ShowType != 1)
          { %>
        <td align="left">
          <%# GetShowExtension(Eval("FileType").ToString().Replace("文件",""))%>
          <%if (FileType == "image")
            {%>
          <%# "<span onmouseover=\"ShowADPreview('" + GetFileContent(Eval("Name").ToString(), Eval("FileType").ToString().Replace("文件", ""), Eval("Path").ToString(), 0) + "')\" onmouseout=\"hideTooltip('dHTMLADPreview')\">" + "<a href='javascript:ReturnUrl(\"" + Eval("Path") + "\")'>" + Eval("Name") + "</a></span>"%>
          <%}
            else
            { %>
          <%# "<a href='javascript:ReturnUrl(\"" + Eval("Path") + "\")'>" + Eval("Name") + "</a>"%>
          <%} %>
        </td>
        <%}
          else
          {%>
        <td align="center">
          <%# "<a href='javascript:ReturnUrl(\"" + Eval("Path") + "\")'>" + GetFileContent(Eval("Name").ToString(), Eval("FileType").ToString().Replace("文件", ""), Eval("Path").ToString(),1).Replace("\\", "") + "</a>"%>
        </td>
        <%}%>
      </tr>
      <%
        ItemIndex++;
      %>
    </ItemTemplate>
    <FooterTemplate>
      </table></FooterTemplate>
  </asp:Repeater>
  <div id="dHTMLADPreview" style="z-index: 1000; left: 0px; visibility: hidden; width: 10px;
    position: absolute; top: 0px; height: 10px"></div>
  <center>
    <pe:AspNetPager ID="Pager" runat="server" CustomInfoSectionWidth="20%" OnPageChanged="Pager_PageChanged"
      ShowPageSize="False" ShowFirstLast="False">
    </pe:AspNetPager>
  </center>
  <script language="javascript" type="text/javascript">
    function ReturnUrl(url) {
       window.parent.CKEDITOR.tools.callFunction(<%=CKEditorFuncNum %>, '<%= MBasePath %>' + url, '');
    }
  </script>
  </form>
</body>
</html>
