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
                        ����<font color="#ff9900">ΰ�Ӹ����</font> �Ŀ���
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr><td><input checked='checked' type="checkbox" id="v42" name="v42" value="˧|42" />˧<input  type="checkbox" id="v42" name="v42" value="��˧|43" />��˧<input  type="checkbox" id="v42" name="v42" value="�ǳ�˧|44" />�ǳ�˧<input  type="checkbox" id="v42" name="v42" value="ֵ��һ��Ŷ|45" />ֵ��һ��Ŷ<input  type="checkbox" id="v42" name="v42" value="��Ҫ̫����Ӵ|46" />��Ҫ̫����Ӵ</td></tr>

                <tr>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="ͶƱ" OnClick="btnSave_Click" />&nbsp;&nbsp;
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
