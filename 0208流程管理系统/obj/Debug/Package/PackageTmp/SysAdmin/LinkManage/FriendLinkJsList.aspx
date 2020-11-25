<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendLinkJsList.aspx.cs"
    Inherits="AllPower.Web.Admin.FriendLinkJsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>�������Ӿ�̬�ļ�����</title>
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
            λ�ã� <a href="#">��չӦ��</a> &gt;�������ӹ���&gt; <span class="breadcrumb_current">��������ģ���б�</span>
        </h4>
        <ul class="ulheader">
            <li style="width: 8%;">
                <%= Resources.Common.Name%></li>
            <li style="width: 45%;">���õĴ���</li>
            <li style="width: 10%;">
                <%= Resources.Model.Type%></li>
            <li style="width: 5%;">״̬</li>
            <li style="width: 15%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 8%;">��������ģ��</li>
            <li style="width: 45%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 25px;
                    width: 88%;' name="JSCode"><%=GetJsCode("CharLinkTemplate.aspx")%></textarea></li>
            <li style="width: 10%;">��������</li>
            <li style="width: 5%;"><font color="red">��</font> </li>
            <li style="width: 15%;"><a id="A2" class="abtn" href="LinkPageEdit.aspx?src=CharLinkTemplate.aspx&NodeCode=<%=NodeCode %>">
                �༭ģ�� </a></li>
        </ul>
        <ul class="ulheader ulbody">
            <li style="width: 8%;">Logo����ģ��</li>
            <li style="width: 45%;">
                <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 25px;
                    width: 88%;' name="JSCode"><%=GetJsCode("LogoLinkTemplate.aspx")%></textarea></li>
            <li style="width: 10%;">Logo����</li>
            <li style="width: 5%;"><font color="red">��</font> </li>
            <li style="width: 15%;"><a id="A1" class="abtn" href="LinkPageEdit.aspx?src=LogoLinkTemplate.aspx&NodeCode=<%=NodeCode %>">
                �༭ģ�� </a></li>
        </ul>
        <br clear="left" />
    </div>
    </form>

    <script type="text/javascript" language="javascript">
        //���Ƶ��ô��뵽windowsճ����
        function setCopy(jsItem) {
            jsItem.select();
            var txt = jsItem.innerHTML.replaceAll("&lt;", "<").replaceAll("&gt;", ">");       //���б�ǩ��ת��
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
