<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="houseIntermediaryMIS.Register" %>

<%@ Register TagPrefix="UCtrl" TagName="Head" Src="UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="UserControls/FootCtrl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
<!--
        function CheckInput() {
            with (document.Form1) {
                if (chkAgreement.checked == false) {
                    alert("如果您决定注册成为我们的会员，必须接受我们的服务条款！");
                    chkAgreement.focus();
                    return false;
                }
                if (txtUserName.value == '') {
                    alert("请输入用户名！");
                    txtUserName.focus();
                    return false;
                }
                if (txtUserName.value.length < 4) {
                    alert("用户名必须4位以上！");
                    txtUserName.focus();
                    return false;
                }
                if (txtPassword.value == '') {
                    alert("请输入密码！");
                    txtPassword.focus();
                    return false;
                }
                if (txtPassword.value.length < 4) {
                    alert("密码必须4位以上！");
                    txtPassword.focus();
                    return false;
                }
                if (txtPassword2.value == '') {
                    alert("请确认密码！");
                    txtPassword2.focus();
                    return false;
                }
                if (txtPassword2.value != txtPassword.value) {
                    alert("输入密码和确认密码不一致！");
                    txtPassword2.focus();
                    return false;
                }

                if (txtUserName.value == txtPassword.value) {
                    alert("为了安全起见，用户名和密码不能相同！");
                    txtUserName.focus();
                    return false;
                }

                if (txtName.value == '') {
                    alert("请输入您的姓名！");
                    txtName.focus();
                    return false;
                }

                if (radSex[0].checked == false && radSex[1].checked == false) {
                    alert("请选择性别！");
                    radSex[0].focus();
                    return false;
                }

                if (txtName.value == "") {
                    alert("请输入联系人！");
                    txtName.focus();
                    return false;
                }

                if (txtTel1.value == "") {
                    alert("请输入联系电话1！");
                    txtTel1.focus();
                    return false;
                }
            }  //end with
        }

        //只能为大于0的数字
        function Isvalidity(val, name) {
            if (val.value != '' && (isNaN(val.value) || val.value <= 0)) {
                alert(name + "应填有效数字！");
                val.value = "";
                val.focus();
            }
        }

        //只能为不等于0的数字
        function Isval(val, name) {
            if (val.value != '' && (isNaN(val.value) || val.value == 0)) {
                alert(name + "应填有效数字！");
                val.value = "";
                val.focus();
            }
        }
        function check_email(address) {
            if ((address.value != "") && ((address.value.indexOf('@') == -1)
    || (address.value.indexOf('.') == -1))) {
                alert("E-mail格式不对！");
                address.focus();
            }
        }


//-->
    </script>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>
</head>
<body leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" onsubmit="return CheckInput();">
    <UCtrl:Head ID="Head1" runat="server"></UCtrl:Head>
    <table cellspacing="0" cellpadding="0" width="900" align="center" 
        border="0">
        <tbody>
            <tr>
                <td valign="top" width="218" background="images/xx_bj1.gif">
                    <table cellspacing="0" cellpadding="0" width="223" align="center" border="0">
                        <tbody>
                            <tr>
                                <td class="title2" valign="bottom" align="center" width="223">
                                    </td>
                            </tr>
                            <tr>
                                <td class="title2" align="center" background="images/xx_bj2.gif" height="20">
                                    <div align="center">
                                        <font class="cont" color="#0f680f"><strong>注意事项</strong></font></div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table cellspacing="0" cellpadding="0" width="65%" align="center" border="0">
                                        <tbody>
                                            <tr>
                                                <td class="cont" style=" font-size:14px;">
                                                    <p align="left">
                                                        1、用户一经注册则表示您已经仔细阅读并完全理解和接受二手房中介的<font color="Red">服务条款</font> ！
                                                        <p align="left">
                                                            2、注册用户必须遵守国家相关的法律法规；对发布信息的内容及真实性承担独立责任；</p>
                                                        <p align="left">
                                                            3、对用户发布的信息，我们保留编辑及删除的权利；</p>
                                                        <p align="left">
                                                            4、发布虚假信息、不及时删除已成交信息的用户将被取消资格，并承担一些法律责任，我方将停止一切服务！</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td valign="top" align="center" width="560">
                    <table style="font-size: 14px" cellspacing="3" cellpadding="3"
                        width="100%" border="0">
                        <tbody>
                            <tr>
                                <td class="cont" colspan="2">
                                    <b>&lt;会员帐户&gt;</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">用户名：</td>
                                <td class="style1" width="85%">
                                    <asp:TextBox ID="txtUserName" runat="server" Width="180" CssClass="cont"></asp:TextBox>
                                    <font color="Red">*
                                        </font>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">
                                    密 码：
                                </td>
                                <td class="cont" width="85%">
                                     <asp:TextBox ID="txtPassword" runat="server"   Width="180" TextMode="Password" CssClass="cont"></asp:TextBox>

                                    <font color="Red">*</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">
                                    确认密码：
                                </td>
                                <td class="cont">
                                    <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" Width="180" CssClass="cont"></asp:TextBox>

                                    <font color="Red">*</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" colspan="2">
                                    <b>&lt;以下是用户资料&gt;</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">
                                    您的姓名：
                                </td>
                                <td class="cont">
                                    <asp:TextBox ID="txtName" runat="server"  Width="180"  CssClass="cont"></asp:TextBox>
                                    <font color="Red">*</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">
                                    性 别：
                                </td>
                                <td class="cont">
                                    <asp:RadioButtonList ID="radSex" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Selected="True">男</asp:ListItem>
                                    <asp:ListItem Value="0">女</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <font color="Red">*</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">联系电话1：</td>
                                <td class="cont">
                                    <asp:TextBox ID="txtTel1" runat="server"  Width="180"  CssClass="cont"></asp:TextBox>
                                    <font color="Red">*</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">联系电话2：</td>
                                <td class="cont">
                                    <asp:TextBox ID="txtTel2" runat="server" Width="180"  CssClass="cont"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="right">Email地址：</td>
                                <td class="cont">
                                  <asp:TextBox ID="txtEmail" runat="server" Width="180"  CssClass="cont"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <input type="checkbox" value="1" name="chkAgreement" id="chkAgreement" checked runat="server" />
                                    我同意接受该 房屋中介信息管理系统 的服务条款。
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <div align="center">
                                        <input class="cont" id="btnSubmit" type="submit" value="提 交" name="btnSubmit" runat="server"
                                            onserverclick="btnSubmit_ServerClick" onclick="return btnSubmit_onclick()" />
                                        <input class="cont" type="reset" value="重 填" name="reset" />
                                    </div><br />
                                </td>
                            </tr>
                            <tr><td align="left" colspan="2" style=" padding-left:50px; ">
                                               <asp:Label ID="lbErrorMsg" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
                     
                            </td></tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
    <UCtrl:Foot ID="Foot1" runat="server"></UCtrl:Foot>
</body>
</html>
