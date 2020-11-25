<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="admin_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>心灵阶梯博客网站管理系统中心首页</title>
    <link rel="stylesheet" type="text/css" href="images/style.css" />

    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>

</head>
<body style="padding: 10px;">
    <form id="form1" runat="server">
        <div class="navigation">
            <b>您当前的位置：首页 &gt; 管理中心 &gt; 管理中心首页</b></div>
        <div class="spClear">
        </div>
        <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
            <tr>
                <th colspan="2" align="left">
                    系统基本信息</th>
            </tr>
            <tr>
                <td width="25%" align="right">
                    网站名称：</td>
                <td width="75%">
                    心灵阶梯博客网站管理系统
                </td>
            </tr>
            <tr>
                <td align="right">
                    网站域名：</td>
                <td>
                    http://www.xxblog.cn
                </td>
            </tr>
            <tr>
                <td align="right">
                    联系电话：</td>
                <td>
                    13000000000
                </td>
            </tr>
            <tr>
                <td align="right">
                    传真号码：</td>
                <td>
                    010-22222222
                </td>
            </tr>
            <tr>
                <td align="right">
                    电子邮箱：</td>
                <td>
                    xxblog@xxblog.com
                </td>
            </tr>
            <tr>
                <th colspan="2" align="left">
                    服务器信息</th>
            </tr>
            <tr>
                <td align="right">
                    服务器名称：</td>
                <td>
                    <%=Server.MachineName%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    服务器IP：</td>
                <td>
                    <%=Request.ServerVariables["LOCAL_ADDR"] %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    NET框架版本：</td>
                <td>
                    <%=Environment.Version.ToString()%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    操作系统：</td>
                <td>
                    <%=Environment.OSVersion.ToString()%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    IIS环境：</td>
                <td>
                    <%=Request.ServerVariables["SERVER_SOFTWARE"]%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    服务器端口：</td>
                <td>
                    <%=Request.ServerVariables["SERVER_PORT"]%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    虚拟目录绝对路径：</td>
                <td>
                    <%=Request.ServerVariables["APPL_PHYSICAL_PATH"]%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    HTTPS支持：</td>
                <td>
                    <%=Request.ServerVariables["HTTPS"]%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    seesion总数：</td>
                <td>
                    <%=Session.Keys.Count.ToString()%>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
