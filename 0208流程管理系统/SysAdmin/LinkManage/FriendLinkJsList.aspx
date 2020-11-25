<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendLinkJsList.aspx.cs"
    Inherits="AllPower.Web.Admin.FriendLinkJsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>友情链接静态文件管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script type="text/javascript" src="../js/regExp.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/Common.js"></script>

</head>
<body>
    <form id="Form1" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> &gt;友情链接管理&gt; <span class="breadcrumb_current">友情链接模板列表</span>
        </h4>
        <ul class="ulheader">
            <li style="width: 8%;">
                <%= Resources.Common.Name%></li>
            <li style="width: 45%;">调用的代码</li>
            <li style="width: 10%;">
                <%= Resources.Model.Type%></li>
            <li style="width: 5%;">状态</li>
            <li style="width: 15%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 8%;">文字链接模板</li>
            <li style="width: 45%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 25px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CharLinkTemplate.aspx")%></textarea></li>
            <li style="width: 10%;">文字链接</li>
            <li style="width: 5%;"><font color="red">√</font> </li>
            <li style="width: 15%;"><a id="A2" class="abtn" href="LinkPageEdit.aspx?src=CharLinkTemplate.aspx&NodeCode=<%=NodeCode %>">
                编辑模板 </a></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 8%;">Logo链接模板</li>
            <li style="width: 45%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 25px;
                    width: 88%;' name="JSCode"><%=GetJsCode("LogoLinkTemplate.aspx")%></textarea></li>
            <li style="width: 10%;">Logo链接</li>
            <li style="width: 5%;"><font color="red">√</font> </li>
            <li style="width: 15%;"><a id="A1" class="abtn" href="LinkPageEdit.aspx?src=LogoLinkTemplate.aspx&NodeCode=<%=NodeCode %>">
                编辑模板 </a></li>
        </ul>
        <br clear="left" />
    </div>
    </form>

    <script type="text/javascript" language="javascript">
        //复制调用代码到windows粘贴板
        function setCopy(jsItem) {
            jsItem.select();
            var txt = jsItem.innerHTML.replaceAll("&lt;", "<").replaceAll("&gt;", ">");       //进行标签的转换
            var isok = false;
            if (window.clipboardData) {
                window.clipboardData.clearData();
                window.clipboardData.setData("Text", txt);
                isok = true;
            } else if (navigator.userAgent.indexOf("Opera") != -1) {
                window.location = txt;
                isok = true;
            } else if (window.netscape) {                   //修改其他浏览器设置
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
                }
                var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
                if (!clip)
                    return;
                var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
                if (!trans)
                    return;
                trans.addDataFlavor('text/unicode');
                var str = new Object();
                var len = new Object();
                var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
                var copytext = txt;
                str.data = copytext;
                trans.setTransferData("text/unicode", str, copytext.length * 2);
                var clipid = Components.interfaces.nsIClipboard;
                if (!clip)
                    return false;
                clip.setData(trans, null, clipid.kGlobalClipboard);
                isok = true;
            }
            if (isok) {
                alert({ msg: '复制成功,然后将此代码粘贴(Ctrl+V)加到页面要调用的位置!', title: '提示消息' });
            }
        }
    </script>

</body>
</html>
