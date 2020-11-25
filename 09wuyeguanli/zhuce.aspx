<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhuce.aspx.cs" Inherits="zhuce" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>注册</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="住户代码" 
            DataSourceID="SqlDataSource1" DefaultMode="Insert" BackColor="White" 
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Horizontal" Width="524px" 
            onpageindexchanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                住户代码:
                <asp:Label ID="住户代码Label1" runat="server" Text='<%# Eval("住户代码") %>' />
                <br />
                户主:
                <asp:TextBox ID="户主TextBox" runat="server" Text='<%# Bind("户主") %>' />
                <br />
                楼栋代码:
                <asp:TextBox ID="楼栋代码TextBox" runat="server" Text='<%# Bind("楼栋代码") %>' />
                <br />
                房间号:
                <asp:TextBox ID="房间号TextBox" runat="server" Text='<%# Bind("房间号") %>' />
                <br />
                房屋面积:
                <asp:TextBox ID="房屋面积TextBox" runat="server" Text='<%# Bind("房屋面积") %>' />
                <br />
                联系方式:
                <asp:TextBox ID="联系方式TextBox" runat="server" Text='<%# Bind("联系方式") %>' />
                <br />
                房屋用途:
                <asp:TextBox ID="房屋用途TextBox" runat="server" Text='<%# Bind("房屋用途") %>' />
                <br />
                员工代码:
                <asp:TextBox ID="员工代码TextBox" runat="server" Text='<%# Bind("员工代码") %>' />
                <br />
                密码:
                <asp:TextBox ID="密码TextBox" runat="server" Text='<%# Bind("密码") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" BorderColor="#3333FF" BorderStyle="Double" 
                Font-Bold="True" ForeColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <InsertItemTemplate>
                户主:
                <asp:TextBox ID="户主TextBox" runat="server" Text='<%# Bind("户主") %>' />
                &nbsp; 楼栋代码:
                <asp:TextBox ID="楼栋代码TextBox" runat="server" Text='<%# Bind("楼栋代码") %>' />
                <br />
                房间号:
                <asp:TextBox ID="房间号TextBox" runat="server" Text='<%# Bind("房间号") %>' />
                &nbsp;房屋面积:
                <asp:TextBox ID="房屋面积TextBox" runat="server" Text='<%# Bind("房屋面积") %>' />
                <br />
                联系方式:
                <asp:TextBox ID="联系方式TextBox" runat="server" Text='<%# Bind("联系方式") %>' />
                房屋用途:
                <asp:TextBox ID="房屋用途TextBox" runat="server" Text='<%# Bind("房屋用途") %>' />
                <br />
                员工代码:
                <asp:TextBox ID="员工代码TextBox" runat="server" Text='<%# Bind("员工代码") %>' />
                <br />
                密码:
                <asp:TextBox ID="密码TextBox" runat="server" Text='<%# Bind("密码") %>' 
                    TextMode="Password" />
                <br />
                重复密码：<asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="密码TextBox" ControlToValidate="TextBox1" 
                    ErrorMessage="两次密码必须一致！"></asp:CompareValidator>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="注册" onclick="InsertButton_Click" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                住户代码:
                <asp:Label ID="住户代码Label" runat="server" Text='<%# Eval("住户代码") %>' />
                <br />
                户主:
                <asp:Label ID="户主Label" runat="server" Text='<%# Bind("户主") %>' />
                <br />
                楼栋代码:
                <asp:Label ID="楼栋代码Label" runat="server" Text='<%# Bind("楼栋代码") %>' />
                <br />
                房间号:
                <asp:Label ID="房间号Label" runat="server" Text='<%# Bind("房间号") %>' />
                <br />
                房屋面积:
                <asp:Label ID="房屋面积Label" runat="server" Text='<%# Bind("房屋面积") %>' />
                <br />
                联系方式:
                <asp:Label ID="联系方式Label" runat="server" Text='<%# Bind("联系方式") %>' />
                <br />
                房屋用途:
                <asp:Label ID="房屋用途Label" runat="server" Text='<%# Bind("房屋用途") %>' />
                <br />
                员工代码:
                <asp:Label ID="员工代码Label" runat="server" Text='<%# Bind("员工代码") %>' />
                <br />
                密码:
                <asp:Label ID="密码Label" runat="server" Text='<%# Bind("密码") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="编辑" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="删除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="新建" />
            </ItemTemplate>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:XQWYConnectionString %>" 
            DeleteCommand="DELETE FROM [住户] WHERE [住户代码] = @住户代码" 
            InsertCommand="INSERT INTO [住户] ([户主], [楼栋代码], [房间号], [房屋面积], [联系方式], [房屋用途], [员工代码], [密码]) VALUES (@户主, @楼栋代码, @房间号, @房屋面积, @联系方式, @房屋用途, @员工代码, @密码)" 
            SelectCommand="SELECT * FROM [住户]" 
            UpdateCommand="UPDATE [住户] SET [户主] = @户主, [楼栋代码] = @楼栋代码, [房间号] = @房间号, [房屋面积] = @房屋面积, [联系方式] = @联系方式, [房屋用途] = @房屋用途, [员工代码] = @员工代码, [密码] = @密码 WHERE [住户代码] = @住户代码">
            <DeleteParameters>
                <asp:Parameter Name="住户代码" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="户主" Type="String" />
                <asp:Parameter Name="楼栋代码" Type="Int32" />
                <asp:Parameter Name="房间号" Type="String" />
                <asp:Parameter Name="房屋面积" Type="String" />
                <asp:Parameter Name="联系方式" Type="String" />
                <asp:Parameter Name="房屋用途" Type="String" />
                <asp:Parameter Name="员工代码" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="户主" Type="String" />
                <asp:Parameter Name="楼栋代码" Type="Int32" />
                <asp:Parameter Name="房间号" Type="String" />
                <asp:Parameter Name="房屋面积" Type="String" />
                <asp:Parameter Name="联系方式" Type="String" />
                <asp:Parameter Name="房屋用途" Type="String" />
                <asp:Parameter Name="员工代码" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="住户代码" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
    <p style="text-align: center">
        &nbsp;</p>
</body>
</html>
