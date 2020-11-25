<%@ Control Language="C#" AutoEventWireup="true" CodeFile="side.ascx.cs" Inherits="users_side" %>
<table border="0" cellpadding="0" cellspacing="0" style="width: 208px;" bgcolor="#e4e4e4">
    <tr>
        <td height='54' style="background-image: url('images/ztop.jpg'); background-repeat: no-repeat;">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td bgcolor="#e4e4e4" align="center" style="background-image: url('images/zmid.jpg');
            background-repeat: repeat-y;">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 200px; line-height: 30px;">
                <tr>
                    <td colspan="2" align="center">
                        <img src="../UpFile/Photos/<%=myphoto %>" width="100" height="100" />
                    </td>
                </tr>
                <tr>
                    <td width="60">
                    </td>
                    <td align="left">
                        <%=mynickname%>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left">
                        <%=mysex%>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left">
                        <a href="myinfos.aspx?uid=<%=uuid %>">查看个人档案</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height='20' style="background-image: url('images/zbot.jpg'); background-repeat: no-repeat;">
            &nbsp;
        </td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" style="width: 208px;" bgcolor="#e4e4e4">
    <tr>
        <td height='54' style="background-image: url('images/wzlb.jpg'); background-repeat: no-repeat;">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td bgcolor="#e4e4e4" align="center" style="background-image: url('images/zmid.jpg');
            background-repeat: repeat-y;">
            <%=GetArType()%>
        </td>
    </tr>
    <tr>
        <td height='10' style="background-image: url('images/zbot.jpg'); background-repeat: no-repeat;">
            &nbsp;
        </td>
    </tr>
</table>
