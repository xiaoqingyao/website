<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VotePost.aspx.cs" Inherits="KingTop.Web.Admin.VotePost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>投票</title>
</head>
<body>
    <form id="theForm" runat="server">
    <div>
        <table id="_ListInfoListTable" style="width: 100%;" border="0">
            <asp:Panel ID="plContent" runat="server">
                <tr>
                    <td colspan="2">
                        您对<font color="#ff9900"><!--$title$--></font> 的看法
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <!--$Content$-->
                <tr>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="投票" OnClick="btnSave_Click" />&nbsp;&nbsp;
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <!--$hidContorls$-->
        <asp:HiddenField ID="hdnVoteID" runat="server" />
        <div>
        </div>
    </div>
    </form>
</body>
</html>
