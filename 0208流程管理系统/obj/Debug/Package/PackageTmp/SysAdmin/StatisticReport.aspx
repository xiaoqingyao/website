<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticReport.aspx.cs" Inherits="Test.reptest" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        body{ font-size:12px;}
        table{ border-top:1px solid #000000;border-left:1px solid #000000;}
        td{border-right:1px solid #000000;border-bottom:1px solid #000000;}
        ul{ text-align:left; width:600px;}
        ul li{ list-style:none; float:left; margin-left:5px;}
    </style>
</head>
<body>
    <center>
    <form id="form1" runat="server">
    <ul>
        <li>产品系列：</li>
        <li>
        <asp:DropDownList ID="ddlProduct" runat="server">
        <asp:ListItem Value="001" Text="test"></asp:ListItem>
         </asp:DropDownList>
        </li>
        <li>
        <asp:DropDownList ID="ddlYear" runat="server">
             <asp:ListItem Value="2011" Text="2011年"></asp:ListItem>
             <asp:ListItem Value="2012" Text="2012年"></asp:ListItem>
             <asp:ListItem Value="2013" Text="2013年"></asp:ListItem>
             <asp:ListItem Value="2014" Text="2014年"></asp:ListItem>
             <asp:ListItem Value="2015" Text="2015年"></asp:ListItem>
             <asp:ListItem Value="2016" Text="2016年"></asp:ListItem>
             <asp:ListItem Value="2017" Text="2017年"></asp:ListItem>
             <asp:ListItem Value="2018" Text="2018年"></asp:ListItem>
             <asp:ListItem Value="2019" Text="2019年"></asp:ListItem>
         </asp:DropDownList>
         </li>
        <li><asp:DropDownList ID="ddJD" runat="server">
            <asp:ListItem Value="" Text="---请选择---"></asp:ListItem>
            <asp:ListItem Value="1" Text="一季度"></asp:ListItem>
            <asp:ListItem Value="2" Text="二季度"></asp:ListItem>
            <asp:ListItem Value="3" Text="三季度"></asp:ListItem>
            <asp:ListItem Value="4" Text="四季度"></asp:ListItem>
         </asp:DropDownList></li>
        <li>或</li>
        <li>
        <asp:DropDownList ID="ddMonth" runat="server">
            <asp:ListItem Value="" Text="---请选择---"></asp:ListItem>
            <asp:ListItem Value="1" Text="1月"></asp:ListItem>
            <asp:ListItem Value="2" Text="2月"></asp:ListItem>
            <asp:ListItem Value="3" Text="3月"></asp:ListItem>
            <asp:ListItem Value="4" Text="4月"></asp:ListItem>
            <asp:ListItem Value="5" Text="5月"></asp:ListItem>
            <asp:ListItem Value="6" Text="6月"></asp:ListItem>
            <asp:ListItem Value="7" Text="7月"></asp:ListItem>
            <asp:ListItem Value="8" Text="8月"></asp:ListItem>
            <asp:ListItem Value="9" Text="9月"></asp:ListItem>
            <asp:ListItem Value="10" Text="10月"></asp:ListItem>
            <asp:ListItem Value="11" Text="11月"></asp:ListItem>
            <asp:ListItem Value="12" Text="12月"></asp:ListItem>
         </asp:DropDownList>
        </li>
        <li><asp:Button ID="Button1" runat="server" Text="查 看" onclick="Button1_Click" /></li>
        
    </ul>
    <div style=" clear:both;"></div>
    <asp:label runat="server" style="color:#ff0000; margin:8px;" id="labMessage"></asp:label>
    <br />
        <%=repTitle %>
    <br />
    <div runat="server" id="rptGraphic">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" ShowToolBar="False" Height="430px" Width="760px">
        </rsweb:ReportViewer>
    </div>
        <br /><br />
        <table width="600" cellpadding="2" cellspacing="0" >
            <asp:Repeater ID="rptStatic" runat="server" EnableViewState="false">
            <HeaderTemplate>
            <tr>
                <td>产品型号</td>
                <td>访问量</td>
            </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                <td style=" text-align:left;"><%#Eval("XinHao")%></td>
                <td style=" text-align:left;"><%#Eval("VistCount")%></td>
            </tr>            </ItemTemplate>
            </asp:Repeater>
        </table>
    </form>
    </center>
</body>
</html>
