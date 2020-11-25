<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GetHouseByAreaCtrl.ascx.cs" Inherits="houseIntermediaryMIS.UserControls.GetHouseByAreaCtrl" %>
<asp:DataList id="DataList1" runat="server" RepeatColumns="6" EnableViewState="False" RepeatDirection="Horizontal">
    <ItemTemplate>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='AreaHouse<%=type%>a<%# DataBinder.Eval(Container.DataItem, "Area_ID") %>.aspx'><%# DataBinder.Eval(Container.DataItem, "Area_Name") %></a>
    </ItemTemplate>
</asp:DataList>