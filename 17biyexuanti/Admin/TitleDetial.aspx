<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TitleDetial.aspx.cs" Inherits="Admin_TitleDetial" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style="width: 495px; font-family: 楷体_GB2312">
        <tr>
            <td bgcolor="#66ffcc" colspan="2" style="height: 22px">
                <div align="center">
                    标题信息</div>
            </td>
        </tr>
        <tr>
            <td style="width: 6780px">
                <div align="right">
                    标题名:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 6780px">
                <div align="right">
                    上传者:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 6780px" valign="top">
                <div align="right">
                    描述:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label8" runat="server" BorderStyle="Groove" Height="80px" Width="320px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 6780px" valign="top">
                <div align="right">
                    可选数量:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 6780px; height: 22px" valign="top">
                状态:</td>
            <td style="width: 746px; height: 22px">
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 6780px" valign="top">
                &nbsp;<asp:Label ID="Label5" runat="server" Text="指导老师:"></asp:Label></td>
            <td style="width: 746px">
                <asp:Label ID="Label6" runat="server" BorderStyle="None"></asp:Label><br />
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="查看老师" />&nbsp;<br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="TEID" DataSourceID="odsteacher"
                    OnItemCommand="DataList1_ItemCommand" RepeatColumns="7" RepeatDirection="Horizontal"
                    Width="175px" TabIndex="10" Visible="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# GetImageUrl( Eval("TEID")) %>' Height="50px" Width="43px" /><br />
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("TeacherName") %>' Font-Size="XX-Small" Width="44px"></asp:Label>
                    </ItemTemplate>
                </asp:DataList><asp:ObjectDataSource ID="odsteacher" runat="server" SelectMethod="GetTeacherList"
                    TypeName="ThesisManage.BLL.TeacherManage"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 6780px; height: 28px" valign="top">
                审核:</td>
            <td style="width: 746px; height: 28px">
                <asp:Button ID="Button1" runat="server" Text="通过" OnClick="Button1_Click" />&nbsp;
                <asp:Button ID="Button2" runat="server" Text="不通过" OnClick="Button2_Click" />&nbsp;
                <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px" Visible="False">
                    <table style="width: 206px">
                        <tr>
                            <td align="center" colspan="3">
                                请写明原因</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width: 21px" valign="top">
                                <asp:Label ID="Label9" runat="server" Font-Size="Small" Height="19px" Text="原因:"
                                    Width="47px"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Height="62px" TextMode="MultiLine" Width="301px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width: 21px">
                            </td>
                            <td>
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="提交" />&nbsp;<asp:Button
                                    ID="Button5" runat="server" OnClick="Button5_Click" Text="取消" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 6780px; height: 28px" valign="top">
            </td>
            <td style="width: 746px; height: 28px">
            </td>
        </tr>
    </table>
</asp:Content>

