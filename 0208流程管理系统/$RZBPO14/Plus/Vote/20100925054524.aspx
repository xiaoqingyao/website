<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VotePost.aspx.cs" Inherits="AllPower.Web.Admin.VotePost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ͶƱ</title>
</head>
<body>
    <form id="theForm" runat="server">
    <div>
        <table id="_ListInfoListTable" style="width: 100%;" border="0">
            <asp:Panel ID="plContent" runat="server">
                <tr>
                    <td colspan="2">
                        ����<font color="#ff9900">����ľ���</font> �Ŀ���
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        <tr>
                            <td>
                                <tr>
                                    <td>
                                        <input type="radio" checked='checked' id="v36" name="v36" value="��|38" />��<input
                                            type="radio" id="v37" name="v37" value="�ܺ�|38" />�ܺ�<input type="radio" id="v38" name="v38"
                                                value="�ǳ���|38" />�ǳ���
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Save %>" OnClick="btnSave_Click" />&nbsp;&nbsp;
                                        <asp:Button ID="btnCheck" runat="server" Text="�鿴" OnClick="btnCheck_Click" />
                                        <a href="../../../ResultTemplate/VoteResult.aspx?nid=100000000132380" value="���"
                                            target="_blank"></a>
                                    </td>
                                </tr>
            </asp:Panel>
        </table>
        <asp:HiddenField ID="hdnSurveyID" runat="server" Value="100000000132380" />
        <asp:HiddenField ID="hdnSurveyColumn" runat="server" Value="36|��37|�ܺ�38|�ǳ���" />
        <div>
        </div>
    </div>
    </form>
</body>
</html>
