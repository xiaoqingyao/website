<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsManager.aspx.cs" ValidateRequest="false"
    Inherits="Admin_NewsManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="border-top-width: 1px; border-left-width: 1px;
            border-left-color: #ff00ff; border-bottom-width: 1px; border-bottom-color: #ff00ff;
            border-top-color: #ff00ff; border-right-width: 1px; border-right-color: #ff00ff"
            width="100%">
            <tr>
                <td style="width: 8px" valign="top">
                    <img height="7" src="../../Image/JiSu_Admin_22.gif" width="8" />
                </td>
                <td style="background-image: url(../../Image/JiSu_Admin_23.gif); width: 100%; height: 7px">
                </td>
                <td style="width: 9px">
                    <img height="7" src="../../Image/JiSu_Admin_25.gif" width="8" />
                </td>
            </tr>
            <tr>
                <td style="background-image: url(../../Image/JiSu_Admin_30.gif); width: 8px">
                </td>
                <td style="width: 100%">
                    <table border="1" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td>
                                <h3>
                                    发布站内新闻</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                    <tr>
                                        <td style="height: 24px">
                                            标题:
                                        </td>
                                        <td style="height: 24px">
                                           &nbsp;<asp:TextBox ID="txtNewsTitle" runat="server" Width="340px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewsTitle"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 24px">
                                            内容：
                                        </td>
                                        <td style="height: 24px">
                                            &nbsp;<asp:TextBox ID="txtNewsContent" runat="server" Height="366px" TextMode="MultiLine"
                                                Width="730px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ibtnOk" runat="server" ImageUrl="~/Image/ok.jpg" OnClick="ibtnOk_Click" />
                                            <asp:ImageButton ID="ibtnCancel" runat="server" CausesValidation="False" ImageUrl="~/Image/cancel.jpg" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>
            <tr>
                <td style="width: 9px">
                    <img height="8" src="../../Image/JiSu_Admin_48.gif" width="8" />
                </td>
                <td style="background-image: url(../../Image/JiSu_Admin_49.gif); width: 100%; height: 8px">
                </td>
                <td style="width: 9px">
                    <img height="8" src="../../Image/JiSu_Admin_51.gif" width="8" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
