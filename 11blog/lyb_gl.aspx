<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lyb_gl.aspx.cs" Inherits="lyb_gl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="rpt1" runat="server">
            <ItemTemplate>
                <table bgcolor="#009900" border="0" cellpadding="0" cellspacing="1" class="tb" width="100%">
                    <!--DWLayoutTable-->
                    <tr>
                        <td bgcolor="#FFFFFF" rowspan="3" valign="top" width="11">
                            <!--DWLayoutEmptyCell-->
                            &nbsp;</td>
                        <td align="center" bgcolor="#FFFFFF" rowspan="2" valign="middle" width="85">
                            <%#"<img width='70'height='70' src=img/" + Eval("Face") + ".gif border=0>"%>
                        </td>
                        <td align="left" bgcolor="#FFFFFF" height="20" valign="middle" width="528">
                            &nbsp; &nbsp; 留言于:<%#Eval("adddate")%>
                        </td>
                        <td align="center" bgcolor="#FFFFFF" valign="middle" width="136">
                            &nbsp;
                            <%# show_admin(Convert.ToInt32(Eval("id"))) %>
                        </td>
                        <td bgcolor="#FFFFFF" rowspan="3" style="width: 10px" valign="top" width="12">
                            <!--DWLayoutEmptyCell-->
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" bgcolor="#FFFFFF" colspan="2" height="78" valign="top">
                            &nbsp;&nbsp;<%# showbody(Convert.ToBoolean(Eval("IsHidden")),Eval("body").ToString())%>
                            <%# showrely((bool)Eval("isrely"),Eval("rebody").ToString()) %>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#FFFFFF" style="height: 25px" valign="middle">
                            姓名:<%#Eval("username")%></td>
                        <td align="left" bgcolor="#FFFFFF" colspan="2" style="height: 25px" valign="middle">
                            &nbsp; &nbsp; 邮 箱:<%#Eval("email")%>>&nbsp; &nbsp; QQ:<%#Eval("qq")%>&nbsp; &nbsp;
                            主页:<%#Eval("homepage")%></td>
                    </tr>
                </table>
                <br>
            </ItemTemplate>
        </asp:Repeater>
        <table id="Table1" border="0" cellpadding="1" cellspacing="1" width="100%">
            <tr>
                <td align="center" style="width: 775px; height: 18px">
                    共 <font face="宋体"><b>
                        <asp:Label ID="lbTotalPage" runat="server">1</asp:Label></b></font><span style="font-family: 宋体">
                            页 &nbsp; | &nbsp; </span>
                    <asp:HyperLink ID="hlkFirstPage" runat="server">首页</asp:HyperLink>
                    &nbsp; | &nbsp;
                    <asp:HyperLink ID="hlkPrevPage" runat="server">上一页</asp:HyperLink>
                    &nbsp; | &nbsp;
                    <asp:HyperLink ID="hlkNextPage" runat="server">下一页</asp:HyperLink>
                    &nbsp; | &nbsp;
                    <asp:HyperLink ID="hlkLastPage" runat="server">末页</asp:HyperLink>
                    &nbsp; | &nbsp; 第 <font face="宋体"><b>
                        <asp:Label ID="lbCurrentPage" runat="server">1</asp:Label></b></font> 页
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
