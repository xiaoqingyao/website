<%@ Page Language="C#" MasterPageFile="~/Teacher/TeacherMasterPage.master" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Teacher_Message" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="消息列表"></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None"
        OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" Width="630px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="MID" HeaderText="MID" SortExpression="MID" Visible="False" />
            <asp:TemplateField HeaderText="发送人" SortExpression="Sender">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Sender") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# NameBind(Eval("Sender"),Eval("SenderRole")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发送人角色" SortExpression="SenderRole" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SenderRole") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("SenderRole") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="内容" SortExpression="Contents">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Contents") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# cutContents(Eval("Contents")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MPubDate" HeaderText="发送时间" SortExpression="MPubDate" />
            <asp:TemplateField HeaderText="阅读否" SortExpression="State">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# panduan(Eval("State")) %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# panduan(Eval("State")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="MID" DataNavigateUrlFormatString="MessageDetial.aspx?MId={0}"
                HeaderText="详细" Text="查看" />
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("MID") %>'
                        CommandName="de">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetTeacherMesList"
        TypeName="ThesisManage.BLL.MessageManage">
        <SelectParameters>
            <asp:Parameter Name="teacherId" Type="Int32" />
            <asp:Parameter Name="choose" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <table border="1" bordercolor="#2e90b0" style="width: 631px; font-family: 楷体_GB2312">
        <tr>
            <td style="width: 503px">
                <div align="left">
                    发送消息</div>
            </td>
        </tr>
        <tr>
            <td style="width: 503px" valign="top">
                角色:<asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" GroupName="btn"
                    OnCheckedChanged="RadioButton3_CheckedChanged" Text="管理员" />
                <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" GroupName="btn"
                    OnCheckedChanged="RadioButton1_CheckedChanged" Text="教师" />&nbsp;<asp:RadioButton
                        ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="btn" OnCheckedChanged="RadioButton2_CheckedChanged"
                        Text="学生" /><br />
                接受人:<asp:TextBox ID="TextBox5" runat="server" Width="177px"></asp:TextBox>(注：用户名)
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="查看联系人" /><br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="SID" OnItemCommand="DataList1_ItemCommand"
                    RepeatDirection="Horizontal" Visible="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl='<%# GetImageUrl(Eval("SID")) %>'
                            Width="40px" /><br />
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("StudentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="Red" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 503px">
                内 容:<br />
                <asp:TextBox ID="TextBox6" runat="server" Height="98px" Width="556px"></asp:TextBox>&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 503px">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="发送" />
                &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="重置" /></td>
        </tr>
    </table>
    <br />
</asp:Content>

