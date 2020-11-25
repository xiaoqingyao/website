<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="users_left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>心灵阶梯博客会员管理中心</title>

    <script src="../js/prototype.lite.js" type="text/javascript"></script>

    <script src="../js/moo.fx.js" type="text/javascript"></script>

    <script src="../js/moo.fx.pack.js" type="text/javascript"></script>

    <style>
        body
        {
            font: 12px Arial, Helvetica, sans-serif;
            color: #000;
            background-color: #EEF2FB;
            margin: 0px;
            padding: 0px;
        }
        #container
        {
            width: 182px;
            padding-top: 0px;
        }
        H1
        {
            font-size: 12px;
            margin: 0px;
            width: 182px;
            cursor: pointer;
            height: 30px;
            line-height: 20px;
        }
        H1 a
        {
            display: block;
            width: 182px;
            color: #000;
            height: 30px;
            text-decoration: none;
            moz-outline-style: none;
            background-image: url(images1/menu_bgS.gif);
            background-repeat: no-repeat;
            line-height: 30px;
            text-align: center;
            margin: 0px;
            padding: 0px;
        }
        .content
        {
            width: 182px;
            height: 26px;
        }
        .MM ul
        {
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            display: block;
        }
        .MM li
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 26px;
            color: #333333;
            list-style-type: none;
            display: block;
            text-decoration: none;
            height: 26px;
            width: 182px;
            padding-left: 0px;
        }
        .MM
        {
            width: 182px;
            margin: 0px;
            padding: 0px;
            left: 0px;
            top: 0px;
            right: 0px;
            bottom: 0px;
            clip: rect(0px,0px,0px,0px);
        }
        .MM a:link
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 26px;
            color: #333333;
            background-image: url(images1/menu_bg1.gif);
            background-repeat: no-repeat;
            height: 26px;
            width: 182px;
            display: block;
            text-align: center;
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            text-decoration: none;
        }
        .MM a:visited
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 26px;
            color: #333333;
            background-image: url(images1/menu_bg1.gif);
            background-repeat: no-repeat;
            display: block;
            text-align: center;
            margin: 0px;
            padding: 0px;
            height: 26px;
            width: 182px;
            text-decoration: none;
        }
        .MM a:active
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 26px;
            color: #333333;
            background-image: url(images1/menu_bg1.gif);
            background-repeat: no-repeat;
            height: 26px;
            width: 182px;
            display: block;
            text-align: center;
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            text-decoration: none;
        }
        .MM a:hover
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 26px;
            font-weight: bold;
            color: #006600;
            background-image: url(images1/menu_bg2.gif);
            background-repeat: no-repeat;
            text-align: center;
            display: block;
            margin: 0px;
            padding: 0px;
            height: 26px;
            width: 182px;
            text-decoration: none;
        }
    </style>
    <link href="images1/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
            <tr>
                <td width="182" valign="top">
                    <div id="container">
                        <h1 class="type">
                            <a href="javascript:void(0)">常规管理</a></h1>
                        <div class="content">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="images1/menu_topline.gif" width="182" height="5" />
                                    </td>
                                </tr>
                            </table>
                            <ul class="MM">
                                <li><a href="myinfo.aspx?sid=<%=Session["userid"].ToString() %>" target="main">个人信息</a></li>
                                <li><a href="upwd.aspx" target="main">修改密码</a></li>
                                <li><a href="mybkinfo.aspx" target="main">博客信息</a></li>
                            </ul>
                        </div>
                        <h1 class="type">
                            <a href="javascript:void(0)">文章管理</a></h1>
                        <div class="content">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="images1/menu_topline.gif" width="182" height="5" />
                                    </td>
                                </tr>
                            </table>
                            <ul class="MM">
                                <li><a href="articleadd.aspx" target="main">发布文章</a></li>
                                <li><a href="article.aspx" target="main">文章列表</a></li>
                            </ul>
                        </div>
                        <h1 class="type">
                            <a href="javascript:void(0)">评论管理</a></h1>
                        <div class="content">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="images1/menu_topline.gif" width="182" height="5" />
                                    </td>
                                </tr>
                            </table>
                            <ul class="MM">
                                <li><a href="comments.aspx" target="main">别人给我的评论</a></li>
                            </ul>
                        </div>
                        <h1 class="type">
                            <a href="javascript:void(0)">相册管理</a></h1>
                        <div class="content">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="images1/menu_topline.gif" width="182" height="5" />
                                    </td>
                                </tr>
                            </table>
                            <ul class="MM">
                                <li><a href="uphotos.aspx" target="main">上传照片</a></li>
                                <li><a href="photos.aspx" target="main">所有照片</a></li>
                            </ul>
                        </div>
                    </div>

                    <script type="text/javascript">
                    var contents = document.getElementsByClassName('content');
                    var toggles = document.getElementsByClassName('type');

                    var myAccordion = new fx.Accordion(
			toggles, contents, { opacity: true, duration: 400 }
		);
                    myAccordion.showThisHideOpen(contents[0]);
                    </script>

                </td>
            </tr>
        </table>
    </form>
</body>
</html>
