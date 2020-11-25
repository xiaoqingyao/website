<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthorEdit.aspx.cs" Inherits="AllPower.Web.Admin.AuthorEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>作者编辑</title>
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
            var name = "作者编辑";
            var listUrl = "AuthorList.aspx?<%=BackParam %>";
            var addUrl = "AuthorEdit.aspx?action=add&NodeCode=<%=NodeCode%>";
            var updateUrl = "AuthorEdit.aspx?action=edit&NodeCode=<%=NodeCode%>&id=" + id;
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
    <h4>位置:<%GetPageNav(NodeCode);%> </h4> 
    <dl>
        <dt>  *姓名：</dt>
        <dd><asp:TextBox ID="txtName" CssClass="validate[required,length[0,64]]" runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt> 会员：</dt>
        <dd><asp:TextBox ID="txtUsername"  CssClass="validate[optional,length[0,20]]"  runat="server"></asp:TextBox></dd>
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
        <dt> 性别：</dt>
        <dd><asp:RadioButtonList ID="radlGender" RepeatDirection="Horizontal" runat="server">
                                            <asp:ListItem Text="男" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="女" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="保密" Value="-1" Selected="True"></asp:ListItem>
                                        </asp:RadioButtonList></dd>
    </dl>
    
    
    <dl>
        <dt> 出生日期：</dt>
        <dd><asp:TextBox ID="txtBirthday" runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>联系地址：</dt>
        <dd><asp:TextBox ID="txtLinkAddress"  CssClass="validate[optional,length[4,512]]"  runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt> 联系电话：</dt>
        <dd><asp:TextBox ID="txtTel"  CssClass="validate[optional,regex[((?:13\d|15[89])-?\d{5}(\d{3}|\*{3}))|((([0\+]\d{2,3}-?)?(0\d{2,3})-?)(\d{7,8})(-?(\d{3,}))?),联系电话格式错误，为手机或固定电话号码]]"  runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>传真：</dt>
        <dd><asp:TextBox ID="txtFax"  CssClass="validate[optional,custom[fax]]"  runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt> 工作单位：</dt>
        <dd><asp:TextBox ID="txtCompany"  CssClass="validate[optional,length[4,128]]"  runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>部门：</dt>
        <dd><asp:TextBox ID="txtDepartment"  CssClass="validate[optional,length[0,128]]"  runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>邮政编码：</dt>
        <dd><asp:TextBox ID="txtZipCode"  CssClass="validate[optional,custom[zipcode]]"  runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>类型：</dt>
        <dd><asp:RadioButtonList ID="radlTypeName"  RepeatDirection="Horizontal" runat="server">
                                            <asp:ListItem Text="大陆作者" Value="大陆作者"></asp:ListItem>
                                            <asp:ListItem Text="港台作者" Value="港台作者"></asp:ListItem>
                                            <asp:ListItem Text="海外作者" Value="海外作者"></asp:ListItem>
                                            <asp:ListItem Text="本站特约" Value="本站特约"></asp:ListItem>
                                            <asp:ListItem Text="其他作者" Value="其他作者" Selected="True"></asp:ListItem>
                                        </asp:RadioButtonList></dd>
    </dl>
<dl>
    <dt>头像：</dt>
    <dd><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <input name="btnPhone" type="button" value="浏览" onclick="InputFile('theForm','txtPhone','image',1,'gif|jpg|jpeg|png|bmp',4096,'')" />
    </dd>
</dl>  

<dl>
    <dt> 主页：</dt>
    <dd><asp:TextBox ID="txtHomePage"  Text=""  runat="server"></asp:TextBox></dd>
</dl>  
<dl>
    <dt>邮箱：</dt>
    <dd><asp:TextBox ID="txtEmail" CssClass="validate[optional,custom[email]]"  runat="server"></asp:TextBox></dd>
</dl>                    

<dl>
    <dt>即时通讯：</dt>
    <dd><asp:TextBox ID="txtIM" CssClass="validate[optional,length[0,128]]"  runat="server"></asp:TextBox></dd>
</dl>       
<dl>
    <dt>是否启用：</dt>
    <dd><asp:RadioButtonList ID="radlIsEnable" RepeatDirection="Horizontal" runat="server">
                                            <asp:ListItem Value="1" Text="是"></asp:ListItem>
                                            <asp:ListItem Value="0" Text="否" Selected="True"></asp:ListItem>
                                        </asp:RadioButtonList></dd>
</dl>  
<dl>
    <dt> 排序：</dt>
    <dd><asp:TextBox ID="txtOrders"  runat="server" ReadOnly="true"></asp:TextBox></dd>
</dl>  

<dl>
    <dt>作者简介：</dt>
    <dd><asp:TextBox ID="txtBriefIntroduction" TextMode="MultiLine" Rows="6" Columns="60" runat="server"></asp:TextBox></dd>
</dl>  
        <div class="Submit">
            <asp:HiddenField ID="hdnID" runat="server" />
            <asp:Button ID="btnAuthor" runat="server" Text="<%$Resources:Common,Add %>" OnCommand="Author_Edit" Style="height: 26px" />
            <input type="button" onclick="location.href='AuthorList.aspx?<%=BackParam %>';" value='<%=Resources.Common.Back %>' />
        </div>
      </div>
      
    </form>
</body>
</html>
