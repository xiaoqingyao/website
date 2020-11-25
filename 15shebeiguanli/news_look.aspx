<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_look.aspx.cs" Inherits="news_look" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>集约化水产养殖设备管理系统的设计与实现</title>
     <link href="css/css.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="font-size: large">
    
        <br />
        <br />
        资讯一览查看<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Horizontal" Width="560px" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            HorizontalAlign="Center">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="news_title" HeaderText="资讯标题" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="news_type" HeaderText="资讯类别" >
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="news_content" HeaderText="资讯内容" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="news_shijian" HeaderText="发布时间" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="center" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Center" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
