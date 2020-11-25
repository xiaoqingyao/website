<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentTemplateList.aspx.cs"
    Inherits="KingTop.WEB.SysAdmin.Model.CommentTemplateList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>����ģ���б�</title>
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
            λ�ã� <a href="#">��չӦ��</a> &gt;���۹���&gt;<font color="blue"> ����ģ���б�</font></h4>
        <ul class="ulheader">
            <li style="width: 10%;">����</li>
            <li style="width: 35%">���õĴ��� </li>
            <li style="width: 15%">�޸�ʱ�� </li>
            <li style="width: 5%">״̬</li>
            <li style="width: 30%">����</li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 10%">��������ģ��</li>
            <li style="width: 35%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CommentFifth.aspx?NewsId={$NewsId}&amp;NodeCode={$NodeCode}")%></textarea>
            </li>
            <li style="width: 15%">
                <input name="txtUpdateTime" type="text" value="<%=strNowTime %>" /></li>
            <li style="width: 5%">����</li>
            <li style="width: 30%"><a class="abtn" href="CommentPageEdit.aspx?src=CommentFifth.aspx&NodeCode=<%=NodeCode %>">
                �༭ģ�� </a></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 10%">�����б�ģ��</li>
            <li style="width: 35%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CommentListTemp.aspx?NewsId={$NewsId}&amp;NodeCode={$NodeCode}")%></textarea>
            </li>
            <li style="width: 15%">
                <input name="txtUpdateTime2" type="text" value="<%=strNowTime %>" /></li>
            <li style="width: 5%">����</li>
            <li style="width: 30%"><a class="abtn" href="CommentPageEdit.aspx?src=CommentListTemp.aspx&NodeCode=<%=NodeCode %>">
                �༭ģ�� </a></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 10%">���۱�ģ��</li>
            <li style="width: 35%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CommentForm.aspx?NewsId={$NewsId}&amp;NodeCode={$NodeCode}")%></textarea>
            </li>
            <li style="width: 15%">
                <input name="txtUpdateTime3" type="text" value="<%=strNowTime %>" /></li>
            <li style="width: 5%">����</li>
            <li style="width: 30%"><a class="abtn" href="CommentPageEdit.aspx?src=CommentForm.aspx&NodeCode=<%=NodeCode %>">
                �༭ģ�� </a></li>
        </ul>
        <br clear="left" />
    </div>
    </form>

    <script type="text/javascript" language="javascript">
        //���Ƶ��ô��뵽windowsճ����
        function setCopy(jsItem) {
            jsItem.select();
            var txt = jsItem.innerHTML.replaceAll("&lt;", "<").replaceAll("&amp;", "&").replaceAll("&gt;", ">");       //���б�ǩ��ת��
            var isok = false;
            if (window.clipboardData) {
                window.clipboardData.clearData();
                window.clipboardData.setData("Text", txt);
                isok = true;
            } else if (navigator.userAgent.indexOf("Opera") != -1) {
                window.location = txt;
                isok = true;
            } else if (window.netscape) {                   //�޸��������������
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    alert("��������ܾ���\n�����������ַ������'about:config'���س�\nȻ��'signed.applets.codebase_principal_support'����Ϊ'true'");
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
                alert({ msg: '���Ƴɹ�,Ȼ�󽫴˴���ճ��(Ctrl+V)�ӵ�ҳ��Ҫ���õ�λ��!', title: '��ʾ��Ϣ' });
            }
        }
    </script>

</body>
</html>
