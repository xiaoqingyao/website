<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Src="usercontrols/login.ascx" TagName="login" TagPrefix="uc3" %>
<%@ Register Src="usercontrols/bott.ascx" TagName="bott" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/top.ascx" TagName="top" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>心灵阶梯博客</title>
    <link href="Css/comm.css" rel="stylesheet" type="text/css" />
    <link href="Css/ys.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:top ID="Top1" runat="server" />
        <table width="974" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="10" style="background-image: url('images/left.jpg'); background-repeat: repeat-y;">
                </td>
                <td width="240" align="right" valign="top">
                    <uc3:login ID="Login1" runat="server" />
                    <table border="0" cellpadding="0" cellspacing="0" width="230" style="text-align: left;
                        line-height: 30px; font-size: 14px;">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" width="230">
                                    <tr>
                                        <td width="52" height="38" style="background-image: url('images/newsleft.jpg'); background-repeat: no-repeat;">
                                        </td>
                                        <td width="163" align="left" style="background-image: url('images/newmiddle.jpg');
                                            background-repeat: repeat-x;">
                                            &nbsp;&nbsp;&nbsp;&nbsp;<strong>新人推荐</strong>
                                        </td>
                                        <td width="15" style="background-image: url('images/newright.jpg'); background-repeat: no-repeat;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <%=BindUser() %>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="center" valign="top">
                    <div style="width: 696px; height: 347px;">
                        <!--焦点图开始-->

                        <script type="text/javascript">

                    var interval_time = 5 //图片停顿时间，单位为秒，为0则停止自动切换
                    var focus_width = 692 //宽度
                    var focus_height = 347 //高度
                    var text_height = 0 //标题高度
                    var text_align = 'center' //标题文字对齐方式(left、center、right)
                    var swf_height = focus_height + text_height //相加之和最好是偶数,否则数字会出现模糊失真的问题

                    var pics = '<%=strpics %>'; //图片地址
                    var links = '<%=strlinks %>'; //相对于图片的链接地址
                    var texts = '<%=strtexts %>'; //标题文字

                    document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="' + focus_width + '" height="' + swf_height + '">');
                    document.write('<param name="movie" value="pixviewer.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0FFFF">');
                    document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
                    document.write('<param name="FlashVars" value="pics=' + pics + '&links=' + links + '&texts=' + texts + '&borderwidth=' + focus_width + '&borderheight=' + focus_height + '&textheight=' + text_height + '&text_align=' + text_align + '&interval_time=' + interval_time + '">');
                    document.write('<embed src="pixviewer.swf" wmode="opaque" FlashVars="pics=' + pics + '&links=' + links + '&texts=' + texts + '&borderwidth=' + focus_width + '&borderheight=' + focus_height + '&textheight=' + text_height + '&text_align=' + text_align + '&interval_time=' + interval_time + '" menu="false" bgcolor="#ffffff" quality="high" width="' + focus_width + '" height="' + swf_height + '" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
                    document.write('</object>');

                        </script>

                        <!--焦点图结束-->
                    </div>
                    <table border="0" cellpadding="0" cellspacing="0" width="690">
                        <tr>
                            <td width="52" height="38" style="background-image: url('images/newsleft.jpg'); background-repeat: no-repeat;">
                                &nbsp;
                            </td>
                            <td width="623" align="left" style="background-image: url('images/newmiddle.jpg');
                                background-repeat: repeat-x;">
                                &nbsp;&nbsp;&nbsp;&nbsp;<strong>新闻动态</strong>
                            </td>
                            <td width="15" style="background-image: url('images/newright.jpg'); background-repeat: no-repeat;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="left" style="padding-top: 12px; padding-bottom: 12px;">
                                <%=BindNews() %>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="8" style="background-image: url('images/right.jpg'); background-repeat: repeat-y;">
                </td>
            </tr>
        </table>
        <uc2:bott ID="Bott1" runat="server" />
    </form>
</body>
</html>
