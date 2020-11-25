<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteList.aspx.cs" Inherits="AllPower.Web.Admin.VoteList"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>投票管理</title>
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="Form1" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> &gt;<font color="blue">投票管理</font>
        </h4>
        <div id="searchContainer">
            <p>
                <%= Resources.Common.Name%><asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                <asp:Button ID="btnKeySerach" runat="server" Text="<%$Resources:Common,Search %>"
                    OnClick="btnKeySerach_Click" />
            </p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnLogicDel_Click" Style="display: none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />
            <asp:Button ID="btnLogicDelete" runat="server" Text="<%$Resources:Common,Del %>"
                OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 30px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%;">
                <%= Resources.Common.Name%></li>
            <li style="width: 30%">调用的代码</li>
            <li style="width: 5%;">复选 </li>
            <li style="width: 10%">
                <%= Resources.Model.LastTime%>
            </li>
            <li style="width: 3%">状态</li>
            <li style="width: 30%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 30px">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 10%"><span id="Title<%# Eval("ID")%>">
                        <%# Eval("Name")%></span></li>
                    <li style="width: 30%;">
                        <textarea rows='1' cols='20' readonly="readonly" onclick="setCopy(this)" style='height: 18px;
                            width: 88%;' name="JSCode"><%#GetJsCode(Convert.ToString(Eval("FileName")),Eval("ID").ToString())%></textarea>
                    </li>
                    <li style="width: 5%">
                        <%#Eval("Type").ToString() == "1" ? Resources.Common.Yes : Resources.Common.No%></li>
                    <li style="width: 10%">
                        <%#Eval("LimitTime").ToString()%></li>
                    <li style="width: 3%">
                        <%#AllPower.Common.Utils.ParseState(Convert.ToBoolean(Eval("IsEnable")),Resources.Common.ON) %></li>
                    <li style="width: 30%">
                        <asp:LinkButton ID="lnkbDelete" CssClass="abtn" Text="<%$ Resources:Common,Del%> "
                            OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                            runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="lbtnState" CssClass="abtn" OnCommand="lbtnEnable_Click" CommandArgument='<%#Eval("id")+"|"+Eval("IsEnable") %>'
                            runat="server" Text='<%#AllPower.Common.Utils.ParseStateTitle(!Convert.ToBoolean(Eval("IsEnable")),Resources.Common.ON) %>'></asp:LinkButton>
                        <a class="abtn" id="lnkEdit" runat="server" href='<%#"VoteEdit.aspx?action=edit&NodeCode="+NodeCode+"&id="+Eval("id") %>'>
                            <%= Resources.Common.Update%></a>
                        <asp:LinkButton ID="lbtnPub" CssClass="abtn" OnCommand="lbtnPub_Click" CommandArgument='<%#Eval("id")+"|"+Eval("VotePath")+"|"+Eval("FileName") %>'
                            runat="server" Text="生成"></asp:LinkButton>
                        <a class="abtn" href="../../<%=SiteDir %>/Plus/Vote/<%#Eval("FileName") %>" target="_blank">
                            预览</a> <a class="abtn" href="VoteShow.aspx?NodeCode=<%=NodeCode %>&nid=<%#Eval("id") %>">
                                查看投票</a> </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul>
            <webdiyer:AspNetPager ID="AspNetPager1" CssClass="page" runat="server" PageSize="15"
                AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"
                ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                UrlPaging="True">
            </webdiyer:AspNetPager>
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
