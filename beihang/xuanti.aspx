<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="xuanti.aspx.cs" Inherits="WebApplication2.xuanti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblMsg" ForeColor="Red">
        为方便大家共享选题信息、防止扎堆报课带来的调剂麻烦，大家通过该页面查看并提交选题信息。<br />
        操作方法：<br />
        1、先输入学号，点击“确定”按钮并查看已填报情况。<br />
        2、选择填报人数较少、自己熟悉的项目，点击行内“选择该题目”确认选择。<br />
        3、点击“我要打印”按钮进入打印页。（也可以自己填写Excel打印）。<br />
        【友情提示】：<br />
        1、选题操作可以多次执行，每一次操作将会覆盖上次操作。<br />
        2、每一次操作均有日志，请勿恶意操作。<br />
    </asp:Label><br />
     先输入学号：<asp:TextBox runat="server" ID="xh">618231</asp:TextBox>
    <asp:Button runat="server"  ID="btnSearch" OnClick="btnSearch_Click" Text="确定"/>
    <asp:Button runat="server"  ID="Button1" OnClick="Button1_Click" Text="我要打印"/>
    
    <asp:GridView runat="server" AutoGenerateColumns="false" ID="gv">
        <Columns>
            <asp:BoundField HeaderText="序号" DataField="id" />
            <asp:BoundField HeaderText="组号" DataField="zh" />
            <asp:BoundField HeaderText="组别" DataField="zb" />
            <asp:BoundField HeaderText="组内序号" DataField="xh" />
            <asp:BoundField HeaderText="题目" DataField="tm" />
            <asp:BoundField HeaderText="已选人数" DataField="rs" />
            <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                    <asp:Button Text="选择该题目" OnClick="Select_Click" ID="Select" runat="server" CommandArgument='<%#Eval("id") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
    </asp:GridView>
</asp:Content>
