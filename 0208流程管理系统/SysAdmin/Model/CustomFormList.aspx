<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomFormList.aspx.cs"
    Inherits="AllPower.Web.Admin.CustomFormList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>�Զ����</title>
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="Form1" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            λ�ã� ��չӦ��>><a href="#"><span style="color: Blue">�Զ����</span></a></h4>
        <div id="searchContainer">
            <p>
                <%= Resources.Model.ModelGroupName%><asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                <asp:Button ID="btnKeySerach" runat="server" Text="<%$Resources:Common,Search %>"
                    OnClick="btnKeySerach_Click" />
            </p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnLogicDel_Click" Style="display: none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />
            <asp:Button ID="btnLogicDelete" runat="server" Text="<%$Resources:Common,Del %>"
                OnClientClick="selfconfirm({msg:'ȷ��Ҫִ��ɾ��������',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 3%">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%;">
                <%= Resources.Common.Name%></li>
            <li style="width: 10%;">
                <%= Resources.Model.TableName%></li>
            <li style="width: 10%">
                <%= Resources.Model.Summary%></li>
            <li style="width: 20%">���õĴ���</li>
            <li style="width: 3%">״̬</li>
            <li style="width: 40%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 3%">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 10%"><span id="Title<%# Eval("ID")%>">
                        <%# Eval("Name")%></span></li>
                    <li style="width: 10%">
                        <%#Eval("tablename")%></li>
                    <li style="width: 10%">
                        <%# Eval("intro")%></li>
                    <li style="width: 20%">
                        <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                            width: 98%;' name="JSCode">{form[<%#Eval("id")%>]}</textarea>
                    </li>
                    <li style="width: 3%">
                        <%#AllPower.Common.Utils.ParseState((Eval("IsEnable")), "0")%></li>
                    <li style="width: 40%">
                        <asp:LinkButton ID="lnkbDelete" CssClass="abtn" Text="<%$ Resources:Common,Del%> "
                            OnClientClick="selectThisRow();selfconfirm({msg:'ȷ��Ҫִ��ɾ��������',fn:function(data){setAction(data)}});return false;"
                            runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="lnkbState" CssClass="abtn" OnCommand="lbtnEnable_Click" CommandArgument='<%#Eval("id")+"|"+Eval("IsEnable") %>'
                            runat="server" Text='<%#AllPower.Common.Utils.ParseStateTitle(!Convert.ToBoolean(Eval("IsEnable")),Resources.Common.ON) %>'></asp:LinkButton>
                        <a id="lnkEdit" runat="server" class="abtn" href='<%# "CustomFormEdit.aspx?action=edit&NodeCode="+NodeCode+"&id="+Eval("id") %>'><%= Resources.Common.Update%></a> 
                            <a class="abtn" href="FieldManageList.aspx?NodeCode=<%=NodeCode %>&modelid=<%#Eval("ModelID") %>&TableName=<%#Eval("TableName")%>&ModelName=<%#Eval("Name") %>"><%= Resources.Model.FieldManage%></a>
                            <asp:LinkButton CssClass="abtn" ID="LinkButton1" OnCommand="lbtnRelease_Click" CommandArgument='<%#Eval("ModelID") %>' CommandName='<%#Eval("ID") %>'  ToolTip='<%#Eval("IsAuthcode") %>'  runat="server" Text='ģ������'></asp:LinkButton>
                               <asp:Button CssClass="abtn" ID="lbtnPageRelease" OnCommand="lbtnPageRelease_Click" CommandArgument='<%#Eval("id")%>' style="display:none;" runat="server" Text='ҳ������'></asp:Button>
                               <input type="button" onclick="location.href='Template.aspx?ID=<%#Eval("ID") %>&TableName=<%#Eval("TableName") %>&NodeCode=<%=NodeCode %>'" value="ģ�����" /></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <webdiyer:AspNetPager ID="AspNetPager1" CssClass="page" runat="server" PageSize="15"
            AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"
            ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
            UrlPaging="True">
        </webdiyer:AspNetPager>
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
