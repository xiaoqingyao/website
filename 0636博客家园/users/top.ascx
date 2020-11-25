<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="users_top" %>
<table border="0" cellpadding="0" cellspacing="0" width="999">
    <tr>
        <td rowspan="4" style="width: 156px">
            <img src="images/logo.jpg" /></td>
        <td colspan="2">
        </td>
    </tr>
    <tr>
        <td colspan="2" height="30">
            <span style="color: #FFCC11; font-size: 16px; font-weight: bold;">
                <%=info %>
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="2" height="30">
            <span style="color: #CDCDCD; font-size: 16px; font-weight: bold;">&nbsp;&nbsp;<%=descrp%></span>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="right" style="width: 530px;">
        <div style="float: right; padding-right: 20px;">
            <table id="tbMenu" border="0" cellpadding="0" cellspacing="0" style="background-color: #336699;
                width: 500px; height: 30px;">
                <tr>
                    <td style="width: 100px">
                    <a href="mysite.aspx?uid=<%=uuid %>">主页</a>
                    </td>
                    <td style="width: 100px"><a href="myarticle.aspx?uid=<%=uuid %>">文章</a>
                    </td>
                    <td style="width: 100px"><a href="myphoto.aspx?uid=<%=uuid %>">相册</a>
                    </td>
                    <td style="width: 100px"><a href="myfred.aspx?uid=<%=uuid %>">好友</a>
                    </td>
                    <td style="width: 100px"><a href="myinfos.aspx?uid=<%=uuid %>">档案</a>
                    </td>
                </tr>
            </table></div>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #e4e4e4; height: 10px;" >
        &nbsp;
        </td>
    </tr>
</table>
