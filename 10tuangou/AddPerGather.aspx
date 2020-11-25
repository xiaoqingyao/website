<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPerGather.aspx.cs" Inherits="AddPerGather" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>发布个人团购</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <table style="width: 100%">
            <tr>
                <td>
                </td>
                <td style="width: 908px">
                </td>
                <td style="width: 90px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 908px">
                                <table width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 15px;">
                                        </td>
                                        <td style="height: 21px; width: 256px;">
                                            </td>
                                        <td style="height: 21px; width: 128px;">
                                        </td>
                                         <td style="height: 21px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15px; height: 26px">
                                        </td>
                                        <td style="width: 256px; height: 26px">
                                            <asp:Label ID="Label2" runat="server" Text="标题"></asp:Label><asp:TextBox ID="txtTitle"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                                                ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                                        <td style="height: 26px; width: 128px;">
                                            <asp:Label ID="Label3" runat="server" Text="类别"></asp:Label><asp:DropDownList ID="ddlCategroy"
                                                runat="server" Width="125px" >
                                            </asp:DropDownList></td>
                                         <td style="height: 26px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 214px; width: 15px;">
                                        </td>
                                        <td colspan="2" style="height: 214px">
                                            <asp:TextBox ID="txtGatherInfo" runat="server" style="width: 415px; height: 221px" TextMode="MultiLine"></asp:TextBox>
                                            
                                         <td style="height: 21px">
                                        </td>
                                    </tr>
                                      <tr>
                                        <td style="width: 15px; height: 26px">
                                        </td>
                                        <td style="width: 256px; height: 26px">
                                            <asp:Button ID="btnOk" runat="server"  Text="发布" OnClick="btnOk_Click" /></td>
                                        <td style="height: 26px; width: 128px;">
                                            </td>
                                         <td style="height: 26px">
                                        </td>
                                    </tr>
                                    
                                </table>
                </td>
                <td style="width: 90px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 908px">
                </td>
                <td style="width: 90px">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>