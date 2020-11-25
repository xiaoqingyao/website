<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<%@ Register src="Controls/Left.ascx" tagname="Left" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人博客系统[毕业设计]</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script>
function showaa(id){
    if(id=="1"){
        document.getElementById("aa1").className="aa_1";
        document.getElementById("aa2").className="aa_0";
        
        document.getElementById("aainfo1").style.display="block";
        document.getElementById("aainfo2").style.display="none";
    }
    else{
        document.getElementById("aa2").className="aa_1";
        document.getElementById("aa1").className="aa_0";
        
        document.getElementById("aainfo2").style.display="block";
        document.getElementById("aainfo1").style.display="none";
    }
}
</script>
</head>

<body>
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0" style="background:#fff;">
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
                <div class="aa_1">热门博客日志推荐</div></td>
            </tr>
            <tr><td align="left" style="line-height:25px;padding-top:10px;">
<asp:Repeater ID="rptListBlog1" runat="server">
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
                <td style="border-bottom:#a5c94f solid 1px;">
                <div class="aa_1">最新博客日志推荐</div></td>
            </tr>
            <tr><td align="left" style="line-height:25px;padding-top:10px;">
<asp:Repeater ID="rptListBlog2" runat="server">
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
          </table>
          
          
          
          <table width="677" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
              <td style="border-bottom:#a5c94f solid 1px;">
              <div class="aa_1">最新相册</div>
              </td>
            </tr>
            <tr><td style="border:#a5c94f solid 1px; border-top:0;">
                <asp:Repeater ID="rptList1" runat="server">
                <ItemTemplate>
                <div style="text-align:center; float:left; width:135px;padding-top:10px;padding-bottom:10px;">
                    <div style="text-align:center; float:left; width:100%;"><a href="Picinfo.aspx?id=<%#Eval("PicId") %>" target="_blank"><img src="<%#Eval("PicAddress").ToString().Substring(1) %>" width="115" height="100" border="0" class="img1" /></a></div>
                    <div style="text-align:center; float:left; width:100%;padding-top:3px;"><a href="Picinfo.aspx?id=<%#Eval("PicId") %>" target="_blank"><%#Eval("PicName") %></a></div>
                </div>
                </ItemTemplate>
                </asp:Repeater>
            </td></tr>
          </table>

          

          <table width="100" border="0" cellspacing="0" cellpadding="0"><tr><td height="20"></td></tr></table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</body>
</html>