<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingpiaojiluadd.aspx.cs" Inherits="dingpiaojiluadd" %>

<%@ Register Src="tHead.ascx" TagName="head" TagPrefix="uc2" %>
<%@ Register Src="qtleft.ascx" TagName="qtleft" TagPrefix="uc3" %>
<%--<%@ Register src="ascx/foot.ascx" tagname="foot" tagprefix="uc3" %>
<%@ Register src="ascx/category.ascx" tagname="category" tagprefix="uc4" %>
<%@ Register src="ascx/product_click.ascx" tagname="product_click" tagprefix="uc5" %>
<%@ Register src="ascx/product_by_category.ascx" tagname="product_by_category" tagprefix="uc6" %>
<%@ Register src="ascx/category_2.ascx" tagname="category_2" tagprefix="uc7" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>影院在线订票系统</title>
    <link href="style/common.css" rel="stylesheet" type="text/css" />
    <link href="style/index.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.2.6.pack.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="js/indexhome.js"></script>
    <script language="javascript" type="text/javascript" src="js/flash.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $($("ul.navigation a")[0]).addClass('hover');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:head ID="head1" runat="server" />
        <%----%>
        <!-- /end banner -->
        <div class="defaultMain">
            <div class="defaultMainLeft">
                <uc3:qtleft ID="Qtleft1" runat="server" />

            </div>
            <!-- /end defaultMainLeft -->
            <div class="defaultMainRight">
                <table id="Table6" width="684" border="0" cellpadding="0" cellspacing="0" style="height: 566px">
                    <tr>
                        <td width="684" background="qtimages/index_04_02_01.gif" style="height: 37px">
                            <table width="100%" height="88%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="19%" align="center" valign="bottom" class="STYLE1">影片详细</td>
                                    <td width="81%">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="100%" valign="top">
                            <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                                cellpadding="4" cellspacing="0" width="100%">
                                <tr>
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体">订票人:</font></td>
                                    <td width="79%">
                                        <asp:TextBox ID="dingpiaoren" runat="server" ReadOnly="true"></asp:TextBox>*<asp:RequiredFieldValidator
                                            ID="RequiredFieldValidatordingpiaoren" runat="server" ControlToValidate="dingpiaoren"
                                            ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr style="color: #000000; font-family: 宋体">
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体"><span style="font-family: Times New Roman">影片编号</span>:</font></td>
                                    <td width="79%">
                                        <asp:TextBox ID="yingpianbianhao" runat="server" ReadOnly="true"></asp:TextBox>*<asp:RequiredFieldValidator
                                            ID="RequiredFieldValidatoryingpianbianhao" runat="server" ControlToValidate="yingpianbianhao"
                                            ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr style="color: #000000; font-family: 宋体">
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体"><span style="font-family: Times New Roman">影片名称:</span></font></td>
                                    <td style="font-family: Times New Roman" width="79%">
                                        <asp:TextBox ID="yingpianmingcheng" runat="server" ReadOnly="true"></asp:TextBox><span style="font-family: 宋体">*</span><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidatoryingpianmingcheng" runat="server" ControlToValidate="yingpianmingcheng"
                                            ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr style="color: #000000; font-family: 宋体">
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体"><span style="font-family: Times New Roman">影片排场:</span></font></td>
                                    <td style="font-family: Times New Roman" width="79%">
                                        <asp:HiddenField runat="server" ID="id" />
                                       <asp:DropDownList ID="paichang" runat="server" AutoPostBack="true" OnSelectedIndexChanged="paichang_SelectedIndexChanged">

                                       </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体">放映时间:</font></td>
                                    <td width="79%">
                                        <asp:TextBox ID="fangyingshijian" runat="server" ReadOnly="true"></asp:TextBox><span style="font-family: 宋体">*</span><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidatorfangyingshijian" runat="server" ControlToValidate="fangyingshijian"
                                            ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr style="color: #000000; font-family: Times New Roman">
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体">放映地点:</font></td>
                                    <td width="79%">
                                        <asp:TextBox ID="fangyingdidian" runat="server" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>*<asp:RequiredFieldValidator
                                            ID="RequiredFieldValidatorfangyingdidian" runat="server" ControlToValidate="fangyingdidian"
                                            ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr style="color: #000000; font-family: 宋体">
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体"><span style="font-family: Times New Roman">座位</span>:</font></td>
                                    <td width="79%">
                                        <asp:TextBox ID="zuowei" runat="server" ReadOnly="True"></asp:TextBox>
                                        <asp:DropDownList ID="pai" runat="server" AutoPostBack="True" OnSelectedIndexChanged="pai_SelectedIndexChanged">
                                        </asp:DropDownList>排<asp:DropDownList ID="lie" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lie_SelectedIndexChanged">
                                        </asp:DropDownList>列</td>
                                </tr>
                                <tr style="font-family: Times New Roman">
                                    <td nowrap="nowrap" style="width: 164px" width="30">
                                        <font face="宋体">票价:</font></td>
                                    <td width="79%">
                                        <asp:TextBox ID="piaojia" runat="server" ReadOnly="true"></asp:TextBox>*<asp:RequiredFieldValidator
                                            ID="RequiredFieldValidatorpiaojia" runat="server" ControlToValidate="piaojia"
                                            ErrorMessage="必填"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="25" nowrap="nowrap" style="width: 164px" width="164">
                                        <div align="right">
                                            <font face="宋体"></font>&nbsp;
                                        </div>
                                    </td>
                                    <td height="25" width="59%">&nbsp;
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" /><font
                                    face="宋体">&nbsp;</font>
                                        <input id="Reset1" type="reset" value="重置" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div align="center">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- /end defaultMainRight -->
        </div>
        <!-- /end defaultMain -->
        <div class="banner"></div>
        <!-- /end banner -->
        <%--<uc1:help ID="help1" runat="server" />--%>
        <!-- /end help -->
        <%--<uc3:foot ID="foot1" runat="server" />--%>
    </form>
</body>
</html>

