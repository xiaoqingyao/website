<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetExcelFile.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.GetExcelFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="theForm" runat="server">
        <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="申请人姓名" />
            <asp:BoundField DataField="sqed" HeaderText="申请贷款额度(元)" />
            <asp:BoundField DataField="qs" HeaderText="贷款期数(月)" />
            <asp:BoundField DataField="xb" HeaderText="性别" />
            <asp:BoundField DataField="sfz" HeaderText="身份证号码" />
            <asp:BoundField DataField="dhhm" HeaderText="联系电话" />
            <asp:BoundField DataField="email" HeaderText="电邮地址" />
            <asp:BoundField DataField="gzdw" HeaderText="工作单位" />
            <asp:BoundField DataField="dwdh" HeaderText="单位电话" />
            <asp:BoundField DataField="myyx" HeaderText="每月基本月薪(元)" />
            <asp:BoundField DataField="qtsr" HeaderText="其他收入" />
            <asp:BoundField DataField="adddate" HeaderText="提交时间" />
            <asp:BoundField DataField="ip" HeaderText="操作主机" />
            <asp:BoundField DataField="flowstate" HeaderText="审核状态" />
        </Columns>
        <EmptyDataTemplate>
            没有数据
        </EmptyDataTemplate>
        </asp:GridView>
    </form>
</body>
</html>
