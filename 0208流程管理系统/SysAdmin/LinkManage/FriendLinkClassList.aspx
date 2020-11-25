<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="FriendLinkClassList.aspx.cs"
    Inherits="AllPower.Web.Admin.FriendLinkClassList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>分类管理</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="theForm" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a>&gt; <span style="color: Blue">友情链接分类列表</span>
        </h4>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" Style="display: none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnAdd_Click" />
            <asp:Button ID="btnOrder" runat="server" Text="<%$Resources:Common,ModelOrder %>"
                OnClick="btnOrders_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:FriendLink,DelLink %>"
                OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 10%;">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
            </li>
            <li style="width: 10%;">
                <%= Resources.Common.ModelOrder%>
            </li>
            <li style="width: 10%;">
                <%= Resources.FriendLink.ClassName%>
            </li>
            <li style="width: 20%;">
                <%= Resources.FriendLink.ClassDesc%>
            </li>
            <li style="width: 5%;">
                <%= Resources.FriendLink.Bold%>
            </li>
            <li style="width: 20%;">
                <%= Resources.Common.Operation%>
            </li>
        </ul>
        <asp:Repeater ID="rptClass" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 10%;">
                        <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' />
                    </li>
                    <li style="width: 10%;">
                        <asp:TextBox ID="txtOrders" runat="server" Style="width: 20px; border: " Text='<%#Eval("Orders") %>'
                            CssClass="validate[required,custom[onlyNumber],length[0,3]]"></asp:TextBox>
                        <asp:HiddenField ID="hidIds" runat="server" Value='<%#Eval("ID") %>' />
                    </li>
                    <li style="width: 10%;" id="Title<%#Eval("ID")%>">
                        <%# IsBoldTextColor(Eval("ClassName").ToString(), Eval("IsBold"), Eval("LinkColor"))%>
                        </font> </li>
                    <li style="width: 20%;">
                        <%# AllPower.Common.Utils.GetShortString(Eval("ClassDesc").ToString(),20,true)%>
                    </li>
                    <li style="width: 5%; color: red">
                        <%# AllPower.Common.Utils.ParseModelFieldState2(Eval("IsBold"), "")%>
                    </li>
                    <li style="width: 20%;">
                        <asp:LinkButton ID="lbtnDelete" CommandArgument='<%#Eval("ID") %>' Text="<%$ Resources:Common,Del%> "
                            OnClientClick='<%# ("selectThisRow();selfconfirm({msg:\""+Resources.Common.DelConfirm+"\",fn:function(data){setAction(data)}});return false;")%>'
                            runat="server" CssClass="abtn"></asp:LinkButton>
                        <a href='FriendLinkClassEdit.aspx?action=edit&id=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>'
                            class="abtn">
                            <%= Resources.Common.Update%></a> </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <span class="function fr"></span>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
    </div>
    </form>
</body>
</html>
