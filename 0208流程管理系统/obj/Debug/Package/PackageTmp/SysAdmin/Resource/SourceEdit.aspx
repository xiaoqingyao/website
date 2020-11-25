<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SourceEdit.aspx.cs" ValidateRequest="false"  Inherits="AllPower.Web.Admin.SourceEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>来源编辑</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript">
        var id;
       <%=jsMessage %>
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(function() {
            var name = "来源编辑";
            var listUrl = "SourceList.aspx<%=BackParam %>";
            var addUrl = "SourceEdit.aspx?action=add&NodeCode=<%=NodeCode%>";
            var updateUrl = "SourceEdit.aspx?action=edit&NodeCode=<%=NodeCode%>&id=" + id;
            showEditMessage(name, listUrl, addUrl, updateUrl);
        });
    </script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="theForm" runat="server">
<div class="container">
<h4>位置:<%GetPageNav(NodeCode);%></h4> 
    

                                <dl>
                                    <dt> * 名称：</dt>
                                    <dd><asp:TextBox ID="txtName" CssClass="validate[required,length[1,64]]" runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt> 联系人：</dt>
                                    <dd><asp:TextBox ID="txtLinkMan" CssClass="validate[optional,length[4,64]]" runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt>联系电话：</dt>
                                    <dd><asp:TextBox ID="txtTel"  CssClass="validate[optional,regex[((?:13\d|15[89])-?\d{5}(\d{3}|\*{3}))|((([0\+]\d{2,3}-?)?(0\d{2,3})-?)(\d{7,8})(-?(\d{3,}))?),联系电话格式错误，为手机或固定电话号码]]" runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt> 传真：</dt>
                                    <dd><asp:TextBox ID="txtFax" CssClass="validate[optional,custom[fax]]" runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt>联系地址：</dt>
                                    <dd><asp:TextBox ID="txtLinkAddress"  CssClass="validate[optional,length[4,512]]"  runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt> 主页：</dt>
                                    <dd><asp:TextBox ID="txtHomePage" Text="http://"   runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt>邮箱：</dt>
                                    <dd><asp:TextBox ID="txtEmail"  CssClass="validate[optional,custom[email]]"  runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt>即时通讯：</dt>
                                    <dd><asp:TextBox ID="txtIM"  CssClass="validate[optional,length[0,128]]"  runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt> 是否启用：</dt>
                                    <dd><asp:RadioButtonList ID="radlIsEnable" RepeatDirection="Horizontal" runat="server">
                                            <asp:ListItem Text="是" Selected="True" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="否"  Value="0"></asp:ListItem>
                                        </asp:RadioButtonList></dd>
                                </dl>
                                    <dl>
        <dt>推荐：</dt>
        <dd><asp:CheckBox ID="chkIsRecommend" runat="server" /></dd>
    </dl>
    <dl>
        <dt>置顶：</dt>
        <dd><asp:CheckBox ID="chkIsTop" runat="server" /></dd>
    </dl>

                                <dl>
                                    <dt>  排序：</dt>
                                    <dd><asp:TextBox ID="txtOrders"   ReadOnly="true"  runat="server"></asp:TextBox></dd>
                                </dl>
                                <dl>
                                    <dt>简介：</dt>
                                    <dd><asp:TextBox ID="txtBriefIntroduction" TextMode="MultiLine" Rows="6" Columns="50"
                                            runat="server"></asp:TextBox></dd>
                                </dl>
            <div class="Submit">
                <asp:HiddenField ID="hdnID" runat="server" />
                <asp:Button ID="btnSource" runat="server" Text="<%$Resources:Common,Add %>" OnCommand="Source_Edit" Style="height: 26px" />
                            <input type="button" onclick="location.href='SourceList.aspx?<%=BackParam %>';" value='<%=Resources.Common.Back %>' />
            </div>
        </div> 
   </form>
</body>
</html>
