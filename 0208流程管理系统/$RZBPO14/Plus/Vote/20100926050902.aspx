<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VotePost.aspx.cs" Inherits="AllPower.Web.Admin.VotePost" %>

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
                        您对<font color="#ff9900">伟子哥如何</font> 的看法
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr><td><input checked='checked' type="checkbox" id="v42" name="v42" value="帅|42" />帅<input  type="checkbox" id="v42" name="v42" value="很帅|43" />很帅<input  type="checkbox" id="v42" name="v42" value="非常帅|44" />非常帅<input  type="checkbox" id="v42" name="v42" value="值得一看哦|45" />值得一看哦<input  type="checkbox" id="v42" name="v42" value="不要太迷恋哟|46" />不要太迷恋哟</td></tr>

                <tr>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="投票" OnClick="btnSave_Click" />&nbsp;&nbsp;
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <asp:HiddenField ID="hdnVoteID" runat="server" Value="100000000132380,v42" />
        
        <div>
        </div>
    </div>
    </form>
</body>
</html>
