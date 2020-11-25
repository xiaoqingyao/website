<%@ Page Language="C#" MasterPageFile="~/Teacher/TeacherMasterPage.master" AutoEventWireup="true" CodeFile="StudentMessage.aspx.cs" Inherits="Teacher_StudentMessage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table border="1" bordercolor="#2e90b0" style="font-family: 楷体_GB2312; width: 685px;">
  <tr>
    <td colspan="5" bgcolor="#66ffcc"><div align="center">详细信息</div></td>
  </tr>
  <tr>
    <td rowspan="4" style="width: 106px"><div align="center">学生信息</div></td>
    <td align="right" style="width: 97px">
                学号:</td>
            <td align="left" style="width: 165px">
                &nbsp;<asp:Label ID="lbNum" runat="server" Height="22px" Width="157px"></asp:Label></td>
            <td align="right" style="width: 104px">
                姓名:</td>
            <td align="left" style="width: 193px">
                &nbsp;<asp:Label ID="lbName" runat="server"></asp:Label></td>
  </tr>
 <tr>
             <td align="right" style="width: 97px">
                班级:</td>
            <td align="left" style="width: 165px">
                &nbsp;<asp:Label ID="lbClass" runat="server" Width="153px"></asp:Label></td>
            <td align="right" style="width: 104px">
                地址:</td>
            <td align="left" style="width: 193px">
                &nbsp;<asp:Label ID="lbAddress" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 97px">
                邮箱:</td>
            <td align="left" style="width: 165px">
                &nbsp;<asp:Label ID="lbEmail" runat="server" Width="152px"></asp:Label></td>
            <td align="right" style="width: 104px">
                联系电话:</td>
            <td align="left" style="width: 193px">
                &nbsp;<asp:Label ID="lbPhone" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 97px">
                是否选题:</td>
            <td align="left" style="width: 165px">
                &nbsp;<asp:Label ID="lbIsChooseTitle" runat="server" Width="147px"></asp:Label></td>
            <td align="right" style="width: 104px">
                &nbsp;</td>
            <td align="left" style="width: 193px">
                &nbsp;</td>
        </tr>
  <tr>
    <td rowspan="2" style="width: 106px"><div align="center">论文信息</div></td>
<td align="right" style="width: 97px">
    论文标题:</td>
            <td align="left" style="width: 165px">
                &nbsp;<asp:Label ID="Label1" runat="server" Height="22px" Width="157px"></asp:Label></td>
            <td align="right" style="width: 104px">
                上传时间:</td>
            <td align="left" style="width: 193px">
                &nbsp;<asp:Label ID="Label2" runat="server"></asp:Label></td>
  </tr>
  <tr>
  <td align="right" style="width: 97px">
      下载论文:</td>
            <td align="left" style="width: 165px">
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">下载论文</asp:LinkButton></td>
            <td align="right" style="width: 104px">
                &nbsp;</td>
            <td align="left" style="width: 193px">
                &nbsp;</td>
  </tr>
</table>
</asp:Content>

