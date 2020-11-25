<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServerMachineEdit.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.ServerMachineEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript">$(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });</script>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script language="javascript">
        function TypeChange(selValue) {
            if (selValue == "Local") {
                $("#trLocal").css("display", "block");
                $("#trNetwork").css("display", "none");
                $("#trFTP").css("display", "none");
            }
            else if (selValue == "Network") {
                $("#trLocal").css("display", "none");
                $("#trNetwork").css("display", "block");
                $("#trFTP").css("display", "none");
            }
            else {
                $("#trLocal").css("display", "none");
                $("#trNetwork").css("display", "none");
                $("#trFTP").css("display", "block");
            }
        }
    </script>
</head>
<body>
    <form id="ServerMachineEdit" runat="server">
    <div align="left">
        <table>
            <tr>
                <td width="40%">
                    服务器名称:
                </td>
                <td width="60%">
                    <asp:TextBox ID="txtServerMachineName" runat="server" Width="200px"></asp:TextBox>
                    <input id="hiddSiteId" runat="server" type="hidden" />
                    <input id="hiddServiceType" runat="server" type="hidden" />
                    <input id="hiddIsEnabled" runat="server" type="hidden" />
                </td>
            </tr>
            <tr>
                <td width="40%">
                    连接方式:
                </td>
                <td width="60%">
                    <asp:DropDownList ID="ddlConnectionType" runat="server" onchange="TypeChange(this.value)">
                        <asp:ListItem Value="Local" Selected="True">本地</asp:ListItem>
                        <asp:ListItem Value="Network">采用网络邻居连接</asp:ListItem>
                        <asp:ListItem Value="Ftp">采用FTP连接</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="trLocal">
                <td width="40%">
                    本机文件夹路径:
                </td>
                <td width="60%">
                    <asp:TextBox ID="txtLocalDirectoryPath" runat="server" Width="200px"></asp:TextBox>
                    <br />示例：D:\Utils\Backup 
                </td>
            </tr>
            <tr id="trNetwork" style="display:none;">
                <td width="40%">
                    网上邻居文件夹路径:
                </td>
                <td width="60%">
                    <asp:TextBox ID="txtNetworkDirectoryPath" runat="server" Width="200px"></asp:TextBox>
                    <br />示例：\\machine\share 
                </td>
            </tr>
            <tr id="trFTP" style="display:none;">
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td width="40%">
                                FTP服务器地址:
                            </td>
                            <td width="60%">
                                <asp:TextBox ID="txtFtpServer" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                FTP服务器端口:
                            </td>
                            <td width="60%">
                                <asp:TextBox ID="txtFtpPort" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                FTP用户名:
                            </td>
                            <td width="60%">
                                <asp:TextBox ID="txtFtpUserName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                FTP密码:
                            </td>
                            <td width="60%">
                                <asp:TextBox ID="txtFtpPassword" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="40%">
                                FTP根目录:
                            </td>
                            <td width="60%">
                                <asp:TextBox ID="txtFtpHomeDirectory" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="Submit"><asp:Button ID="btnEdit" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnEdit_Click" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
