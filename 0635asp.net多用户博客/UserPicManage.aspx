<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserPicManage.aspx.cs" Inherits="UserPicManage" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
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
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
      <tr>
        <td valign="top" style="width:180px;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd; font-size:14px;">
            <br /><br />
            <a href="usermain.aspx"><font color="#2d7e17">个人基本信息</font></a><br /><br />
            <a href="userguanzhu.aspx"><font color="#2d7e17">我的收藏</font></a><br /><br />
            <a href="userpicoper.aspx"><font color="#2d7e17">上传相册</font></a><br /><br />
            <a href="userpicmanage.aspx"><font color="#2d7e17">我的相册管理</font></a><br /><br />
            <a href="userblogoper.aspx"><font color="#2d7e17">发布博客</font></a><br /><br />
            <a href="userBlogmanage.aspx"><font color="#2d7e17">我的博客管理</font></a><br /><br />
            <a href="userhaoyou.aspx"><font color="#2d7e17">我的好友</font></a><br /><br />
            <a href="userxinmanage.aspx"><font color="#2d7e17">站内信</font></a><br /><br />
            <a href="userlogout.aspx"><font color="#2d7e17">退出登录</font></a><br />
        </td>
        <td align="center" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width:100%;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd;">
                &nbsp;&nbsp;&nbsp;&nbsp;我的相册管理
                </td>
            </tr>
            <tr>
                <td style="padding:10px 0 10px 10px;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9FBD65" onmouseover="changeto()"  onmouseout="changeback()" class="tab1">
                            <tr class="top_tr">
                                <td width="5%" align="center">ID</td>
                                <td align="center">相册名称</td>
                                <td align="center">所属分类</td>
                                <td width="10%" align="center">操作</td>
                            </tr>
                            <asp:Repeater ID="rptList" runat="server"   onitemcommand="rptList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center"><asp:Label ID="lblId" runat="server" Text='<%#Eval("PicId")%>'></asp:Label></td>
                                        <td align="center" valign="absmiddle">
                                            <a href="Picinfo.aspx?id=<%#Eval("PicId") %>" target="_blank"><img src="<%#Eval("PicAddress").ToString().Substring(1) %>" width="115" height="80" border="0" class="img1" />
                                            <%#Eval("PicName")%></a>
                                        </td>
                                        <td align="center"><%#Eval("PicClassName")%></td>
                                        <td align="center">
                                            <a href="userPicoper.aspx?Id=<%#Eval("PicId") %>">修改</a>&nbsp; &nbsp;
                                            <asp:LinkButton ID="LinkButton1"  OnClientClick="JavaScript:return confirm('确定要删除吗？')" runat="server" CommandArgument='<%#Eval("PicId") %>' CommandName="del">删除</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                </td>
            </tr>
        </table>
        </td>
        
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>