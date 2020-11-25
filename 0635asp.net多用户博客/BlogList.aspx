<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogList.aspx.cs" Inherits="BlogList" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<%@ Register src="Controls/Left.ascx" tagname="Left" tagprefix="uc3" %>
<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人博客系统[毕业设计]</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form runat="server">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="250" valign="top">
    
    <uc3:Left ID="Left1" runat="server" />

    </td>
    <td align="center" valign="top"><table width="677" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">
          
          <table width="677" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
            <tr>
            <td style="border-bottom:#a5c94f solid 1px;">
                <div class="aa_1">博客日志列表<font color="#db0000"><asp:Literal ID="ltlArea" runat="server"></asp:Literal></font></div></td>
                </tr>
            <tr><td align="left" style="line-height:25px;padding-top:10px;">
                
<asp:Repeater ID="rptListBlog" runat="server">
<ItemTemplate>
    <div style="text-align:left;width:100%; float:left; border-bottom:dashed 1px #ddd; font-size:14px;">
        <div style="float:left;width:650px;padding-left:20px; background:url(images/_38.gif) 20px 5px no-repeat;">
            <div style="float:left;padding:10px 0 10px 0;width:100%;">
                <a href="Bloginfo.aspx?id=<%#Eval("BlogId") %>" target="_blank"><font style="color:green; font-weight:bold;"><%#Eval("Blogname") %></font></a>
                <br /><%#DB.GetSubString(DB.RemoveHTML(DB.ConvertStringToHtml(Eval("jieshao").ToString())), 60, "...")%>
            </div>
            <div style="float:left;padding:0 0 0 0;width:100%;font-size:12px;">
                <div style="float:left;color:#888;">
                    分类：<%#Eval("typename")%>&nbsp;&nbsp;&nbsp;&nbsp;
                    发布人：<%#Eval("username")%>&nbsp;&nbsp;&nbsp;&nbsp;
                    浏览量<%#Eval("hits")%> 次&nbsp;&nbsp;&nbsp;&nbsp;
                    评论：<%#Eval("plcount") %> 次
                </div>
                
                <div style="float:right;padding:0 10px 0 0;color:#888;font-size:12px;"><%#Eval("AddTime")%></div>
            </div>
            
        </div>
    </div>
</ItemTemplate>
</asp:Repeater>
    
            </td></tr>
            <tr>
            <td style="padding:10px 0; text-align:center; background:#f3f3f3;">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" 
                CustomInfoHTML="当前第 %CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条" 
                                            FirstPageText="首页" HorizontalAlign="Center" LastPageText="尾页" 
                                            LayoutType="Table" NextPageText="下一页" PrevPageText="上一页" 
                                            ShowCustomInfoSection="Left" ShowPageIndexBox="Never" SubmitButtonText="Go" 
                                            TextAfterPageIndexBox="Page" TextBeforePageIndexBox="Go" OnPageChanging="AspNetPager1_PageChanging">
                                        </webdiyer:AspNetPager>
            </td>
            </tr>
          </table>

          

          <table width="100" border="0" cellspacing="0" cellpadding="0"><tr><td height="20"></td></tr></table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>