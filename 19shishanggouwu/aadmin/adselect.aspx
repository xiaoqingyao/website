<%@ Page Language="C#" MasterPageFile="~/aadmin/mu.master" AutoEventWireup="true" CodeFile="adselect.aspx.cs" Inherits="admin_flashselect" Title="flash列表" %>

<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
   
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <div style="height:10px;"></div>

<div  style=" font-size:16px; font-weight:bold; text-align:center; "> 广告管理列表</div>
<div style="height:15px;"></div>

<div  style="float:right; padding-right:50px;"></div>


<div style="height:10px;"></div>
<div style="text-align:center;">

    <asp:GridView ID="GridView1" runat="server" 
        Width="100%" onrowdatabound="GridView1_RowDataBound" 
        onrowcommand="GridView1_RowCommand" onrowdeleting="GridView1_RowDeleting" 
        CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" EnableModelValidation="True">
        <RowStyle BorderStyle="None" Height="30px" 
            ForeColor="#000066" />
        <Columns>
            <asp:BoundField HeaderText="编号" />
            <asp:TemplateField HeaderText="删除" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="删除" CommandArgument='<%#Eval("index")%>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="更新" ShowHeader="False">
                <ItemTemplate>
                    <a href='adupdate.aspx?index=<%#Eval("index")%>'>更新</a>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="添加" ShowHeader="False">
                <ItemTemplate>
                    <a href='adadd.aspx?index=<%#Eval("index")%>'>添加</a>
                </ItemTemplate>
               
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle Height="30px" BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>

</div>


</asp:Content>

