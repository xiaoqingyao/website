<%@ Page Language="C#" MasterPageFile="~/Student/StudentMasterPage.master" AutoEventWireup="true" CodeFile="ModifyThesis.aspx.cs" Inherits="Student_ModifyThesis" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="95px" Width="637px">
    <table border="1" bordercolor="#2e90b0" style=" font-family: 楷体_GB2312; width: 689px;">
  <tr>
    <td colspan="4" bgcolor="#33ffcc"><div align="center">论文信息</div></td>
  </tr>
  <tr>
    <td style="width: 464px"><div align="center">论文标题</div></td>
    <td style="width: 236px"><div align="center">指导老师</div></td>
    <td style="width: 265px"><div align="center">上传时间</div></td>
    <td style="width: 192px"><div align="center">论文内容</div></td>
  </tr>
  <tr>
    <td style="width: 464px"><div align="center">
        <asp:Label ID="Label1" runat="server" Text="Label" Font-Names="楷体_GB2312" Font-Size="Small"></asp:Label>&nbsp;</div></td>
    <td style="width: 236px"><div align="center">
        <asp:Label ID="Label2" runat="server" Text="Label" Font-Names="楷体_GB2312" Font-Size="Small"></asp:Label>&nbsp;</div></td>
    <td style="width: 265px"><div align="center">
        <asp:Label ID="Label3" runat="server" Text="Label" Font-Names="楷体_GB2312" Font-Size="Small"></asp:Label>&nbsp;</div></td>
    <td style="width: 192px"><div align="center" style="color: #00ffff">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-Size="Smaller">下载到本地</asp:LinkButton>&nbsp;</div></td>
  </tr>
</table>
    </asp:Panel>
    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>

