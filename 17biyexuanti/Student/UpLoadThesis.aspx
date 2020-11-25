<%@ Page Language="C#" MasterPageFile="~/Student/StudentMasterPage.master" AutoEventWireup="true" CodeFile="UpLoadThesis.aspx.cs" Inherits="Student_UpLoadThesis" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" height="70" style="font-family: 楷体_GB2312; width: 633px;">
        <tr>
            <td bgcolor="#33ffcc" colspan="2" height="20">
                <div align="center">
                    论文上传</div>
            </td>
        </tr>
        <tr>
            <td height="20" width="130">
                <div align="right">
                    选择上传文件:</div>
            </td>
            <td style="width: 480px">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1"
                    ErrorMessage="*" Style="position: absolute" Width="17px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1"
                    ErrorMessage="请上传.doc文件" Style="position: absolute" ValidationExpression='^([a-zA-Z]\:|\\)\\([^\\]+\\)*[^\/:*?"<>|]+\.doc(l)?$'></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 30px">
                &nbsp;</td>
            <td style="width: 480px; height: 30px;">
                <asp:Button ID="btnUpLoad" runat="server" OnClick="btnUpLoad_Click" Text="上传" /></td>
        </tr>
    </table>
</asp:Content>

