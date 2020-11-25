<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberEdit.aspx.cs" validateRequest="false" Inherits="AllPower.Web.Admin.MemberEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>添加会员</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript" src="../js/Province.js"></script>
     <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
            $("#theForm").validationEngine({ promptPosition: "centerRight" });
              
            });            
    </script>     
</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="MemberList.aspx">会员管理</a><a> &gt;</a> <span class="breadcrumb_current">
                添加会员</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        <%=Resources.Member.UserName%></dt>
                    <dd>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="validate[required,custom[email]]" />请以邮件形式输入</dd>
                </dl>
                
               <dl runat="server" id="dlPwd">
                    <dt>
                        <%=Resources.Member.Password%></dt>
                    <dd>
                        <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="validate[required,length[6,16]]"
                            runat="server"></asp:TextBox>*</dd>
                </dl>
                  <dl runat="server" id="dlConPwd">
                    <dt>
                        <%=Resources.Member.ConfirmPassword%></dt>
                    <dd>
                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" CssClass="validate[required,confirm[txtPassword]] " />*</dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.Member.MemberGroup%></dt>
                    <dd>
                        <asp:DropDownList ID="ddlMemberGroup" runat="server">
                        </asp:DropDownList>
                    </dd>
                </dl>
                <%--<dl>
                    <dt>
                        <%=Resources.Member.MemberModel%></dt>
                    <dd>
                        <asp:DropDownList ID="ddlMemberModel" runat="server">
                        </asp:DropDownList>
                        <!--  更新模式 -->
                        <asp:LinkButton ID="lnkbEditModel" runat="server" OnClick="lnkbEditModel_Click" Visible="false"><%=Resources.Member.UpdateModel%></asp:LinkButton>
                    </dd>
                </dl>--%>
               <dl runat="server" id="dlEmail">
                    <dt>
                        <%=Resources.Member.Email%></dt>
                    <dd>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="validate[required,custom[email]]" />*</dd>
                </dl>              
                <!-- 会员详细信息 -->
                <asp:Panel ID="pnlMemberDetail" runat="server" Visible="false">
                    <dl>
                        <dt>
                            <%=Resources.Member.TrueName%></dt>
                        <dd>
                            <asp:TextBox ID="txtTrueName" runat="server" /></dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.Gender%></dt>
                        <dd>
                            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="男" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="女" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.Birthday%></dt>
                        <dd>
                            <asp:TextBox ID="txtBirthday" runat="server" 
                                    onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
                                    CssClass="Wdate" /></dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.Mobile%></dt>
                        <dd>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="validate[optional,custom[mobilephone]]" /></dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.Tel%></dt>
                        <dd>
                            <asp:TextBox ID="txtTel" runat="server" CssClass="validate[optional,custom[telephone]]" /></dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.QQ%></dt>
                        <dd>
                            <asp:TextBox ID="txtQQ" runat="server" CssClass="validate[optional,custom[qq]]" /></dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.MSN%></dt>
                        <dd>
                            <asp:TextBox ID="txtMSN" runat="server" CssClass="validate[optional,custom[email]]" /></dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.Address%></dt>
                        <dd>
                            <asp:TextBox ID="txtAddress" runat="server" /></dd>
                    </dl>
                    <dl>
                        <dt>
                            <%=Resources.Member.ZipCode%></dt>
                        <dd>
                            <asp:TextBox ID="txtZipCode" runat="server" CssClass="validate[optional,custom[zipcode]]" /></dd>
                    </dl>
                    <%-- <dl>
                    <dt>
                        <%=Resources.Member.Area%></dt>
                    <dd>
                            <asp:DropDownList ID="ddlCProvince"  runat="server">
                            </asp:DropDownList>
                            <select id="ddlCCity" onchange="Common.arae(this.value,'ddlCArea',this.id)">                                    
                            </select>
                            <asp:HiddenField runat="server" ID="hdnddlCCity" />
                             <select id="ddlCArea" onchange="Common.SelectValue('ddlCArea')">
                            </select>
                            <asp:HiddenField runat="server" ID="hdnddlCArea" />
                    </dd>
                </dl>--%>
                </asp:Panel>
                <!-- 自定义字段显示 -->
                <asp:Label ID="lblSelf" runat="server" Text=""></asp:Label>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" CssClass="subButton"  />
            <input type="button" name="Submit422" value="<%= Resources.Common.Back %>" onclick='location.href="MemberList.aspx<%=StrPageParams %>";' class="subButton"/>
        </div>
    </div>
    </form>
    <script type="text/javascript">
        
    </script>
</body>
</html>
