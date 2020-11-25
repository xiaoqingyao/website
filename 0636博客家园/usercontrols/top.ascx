<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="usercontrols_top" %>

<script type="text/javascript">
    function addFav() {   //加入收藏夹   
        if (document.all) {
            window.external.addFavorite('http://www.xxblog.com', '心灵阶梯博客网站');
        }
        else if (window.sidebar) {
            window.sidebar.addPanel('心灵阶梯博客网站', 'http://www.xxblog.com', "");
        }
    }
    function SetHome(obj) {  //设为首页
        try {
            obj.style.behavior = 'url(#default#homepage)';
            obj.setHomePage('http://www.xxblog.com');
        } catch (e) {
            if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                };
            } else {
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将'http://www.xxblog.com/'设置为首页。");
            };
        };
    };   
</script>

<table width="974" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="90" style="background-image: url('images/topbg.jpg'); background-repeat: no-repeat;
            text-align: right; vertical-align: top;">
            <div id="divTop" style="float: right; padding-top: 5px; padding-right: 10px;">
                <a href="javascript:void(0);" onclick="SetHome(this)">设为首页</a><br />
                <a href="javascript:void(0);" onclick="addFav()">加入收藏</a></div>
        </td>
    </tr>
</table>
