<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendLinkEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.FriendLinkEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加友情链接</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        var id = "<%=Request.QueryString["id"] %>";
        window.onload = function() {
            if (type > -1) {
                var name = "友情链接";
                var listUrl = "FriendLinkList.aspx<%=StrPageParams %>";
                var addUrl = "FriendLinkEdit.aspx?action=NEW&NodeCode=<%=NodeCode%>";
                var updateUrl = "?action=edit&NodeCode=<%=NodeCode%>&id="+id;
                showEditMessage(name, listUrl, addUrl, updateUrl);
            }
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a><a> &gt;</a> <a href="FriendLinkList.aspx?NodeCode=<%=NodeCode %>">
                友情链接</a><a> &gt;</a> <span style="color: Blue">添加/修改友情链接</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.LinkClass%></dt>
                    <dd>
                        <asp:DropDownList ID="dropClass" runat="server">
                        </asp:DropDownList>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.LinkType%></dt>
                    <dd>
                        <asp:RadioButtonList ID="radlLinkType" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow" OnSelectedIndexChanged="radlLinkType_SelectedIndexChanged"
                            AutoPostBack="true">
                        </asp:RadioButtonList>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.WebName%></dt>
                    <dd>
                        <asp:TextBox ID="txtWebName" Style="width: 200px" CssClass="validate[required,length[2,20]]"
                            runat="server"></asp:TextBox>
                        <font color="red">*</font></dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.LinkColor%></dt>
                    <dd>
                        <asp:DropDownList ID="dropLinkColor" runat="server">
                        </asp:DropDownList>
                        <asp:CheckBox ID="chkIsBold" runat="server" /><%=Resources.FriendLink.Bold%></dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.WebUrl%></dt>
                    <dd>
                        <asp:TextBox ID="txtWebUrl" Style="width: 200px" runat="server" Text="" CssClass="validate[required,custom[url]]"></asp:TextBox>
                        <font color="red">* 正确格式为:http(s)://www.360hqb.com(.cn等)</font>
                    </dd>
                </dl>
                <asp:Panel ID="plLogo" runat="server" Visible="false">
                    <dl>
                        <dt>
                            <%=Resources.FriendLink.WebLogo%></dt>
                        <dd>
                            <input type="text" style="font-size: 9pt; height: 15px; width: 280px;" runat="server"
                                id="ImgLogo" name="ImgLogo" value="" class="validate[required]" />
                            <input type='button' onclick="InputFile('theForm','ImgLogo','image',1,'',4096,'')"
                                value='上传' class="subButton" />
                        </dd>
                    </dl>
                </asp:Panel>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.WebSiteName%></dt>
                    <dd>
                        <asp:TextBox ID="txtWebSiteName" Style="width: 200px" runat="server"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.Intro%></dt>
                    <dd>
                        <asp:TextBox ID="txtIntro" TextMode="MultiLine" Rows="5" Columns="50" runat="server"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.Commend%></dt>
                    <dd>
                        <asp:RadioButtonList ID="radlCommend" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow">
                            <asp:ListItem Text="<%$Resources:Common,Yes %>" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<%$Resources:Common,No %>" Value="0" Selected="True"></asp:ListItem>
                        </asp:RadioButtonList>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.Common.Review%></dt>
                    <dd>
                        <asp:RadioButtonList ID="radlCheck" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Text="<%$Resources:Common,Yes %>" Value="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="<%$Resources:Common,No %>" Value="0"></asp:ListItem>
                        </asp:RadioButtonList>
                    </dd>
                </dl>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click"
                CssClass="subButton" />
            <input type="button" name="back" value="<%= Resources.Common.Back %>" onclick='location.href="FriendLinkList.aspx<%=StrPageParams %>";'
                class="subButton" />
        </div>
    </div>
    </form>
</body>
</html>
