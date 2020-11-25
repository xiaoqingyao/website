<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentTemplateList.aspx.cs"
    Inherits="KingTop.WEB.SysAdmin.Model.CommentTemplateList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>评论模板列表</title>
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
    <form id="frmCommentTemList" name="frmCommentTemList" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> &gt;评论管理&gt;<font color="blue"> 评论模板列表</font></h4>
        <ul class="ulheader">
            <li style="width: 10%;">名称</li>
            <li style="width: 35%">调用的代码 </li>
            <li style="width: 15%">修改时间 </li>
            <li style="width: 5%">状态</li>
            <li style="width: 30%">操作</li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 10%">最新五条模板</li>
            <li style="width: 35%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CommentFifth.aspx?NewsId={$NewsId}&amp;NodeCode={$NodeCode}")%></textarea>
            </li>
            <li style="width: 15%">
                <input name="txtUpdateTime" type="text" value="<%=strNowTime %>" /></li>
            <li style="width: 5%">正常</li>
            <li style="width: 30%"><a class="abtn" href="CommentPageEdit.aspx?src=CommentFifth.aspx&NodeCode=<%=NodeCode %>">
                编辑模板 </a></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 10%">评论列表模板</li>
            <li style="width: 35%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CommentListTemp.aspx?NewsId={$NewsId}&amp;NodeCode={$NodeCode}")%></textarea>
            </li>
            <li style="width: 15%">
                <input name="txtUpdateTime2" type="text" value="<%=strNowTime %>" /></li>
            <li style="width: 5%">正常</li>
            <li style="width: 30%"><a class="abtn" href="CommentPageEdit.aspx?src=CommentListTemp.aspx&NodeCode=<%=NodeCode %>">
                编辑模板 </a></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 10%">评论表单模板</li>
            <li style="width: 35%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CommentForm.aspx?NewsId={$NewsId}&amp;NodeCode={$NodeCode}")%></textarea>
            </li>
            <li style="width: 15%">
                <input name="txtUpdateTime3" type="text" value="<%=strNowTime %>" /></li>
            <li style="width: 5%">正常</li>
            <li style="width: 30%"><a class="abtn" href="CommentPageEdit.aspx?src=CommentForm.aspx&NodeCode=<%=NodeCode %>">
                编辑模板 </a></li>
        </ul>
        <br clear="left" />
    </div>
    </form>

    <script type="text/javascript" language="javascript">
        //复制调用代码到windows粘贴板
        function setCopy(jsItem) {
            jsItem.select();
            var txt = jsItem.innerHTML.replaceAll("&lt;", "<").replaceAll("&amp;", "&").replaceAll("&gt;", ">");       //进行标签的转换
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
