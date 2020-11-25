<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jiudianxinxi_detail.aspx.cs" Inherits="jiudianxinxi_detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
            cellpadding="4" cellspacing="0" width="95%">
            <tr bgcolor="#4296e7">
                <td colspan="4">
                    <div align="center">
                        <font color="#ffffff">酒店信息详细</font></div>
                </td>
            </tr>
            <tr>
                <td width='11%'>编号：</td><td width='39%'><%=nbianhao%></td><td width='11%'>名称：</td><td width='39%'><%=nmingcheng%></td></tr><tr><td width='11%'>星级：</td><td width='39%'><%=nxingji%></td><td width='11%'>地址：</td><td width='39%'><%=ndizhi%></td></tr><tr><td width='11%'>电话：</td><td width='39%'><%=ndianhua%></td><td width='11%'>照片：</td><td width='39%'><%=nzhaopian%></td></tr><tr><td width='11%'>备注：</td><td width='39%'><%=nbeizhu%></td><td>&nbsp;</td><td>&nbsp;</td>
            </tr>
            
            <tr>
                <td height="25" nowrap="nowrap" align="center" colspan="4">&nbsp;<font
                        face="宋体">&nbsp;<a href="javascript:history.back();">返回</a></font></td>
            </tr>
            <tr bgcolor="#4296e7">
                <td colspan="4">&nbsp;
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

