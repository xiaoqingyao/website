<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="statistic.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Questionnaire.statistic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/Common.js"></script>
    <style type="text/css">
        body{ font-size:12px;}
        table{ border-top:1px solid #000000;border-left:1px solid #000000;}
        td{border-right:1px solid #000000;border-bottom:1px solid #000000; padding:3px;}
        ul{ text-align:left; width:600px;}
        ul li{ list-style:none; float:left; margin-left:5px;}
    </style>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container" style=" margin-left:10px;">
        <div class="function">
            <input id="Button1" type="button" value="返回" runat="server" onclick="location.href='QuestionnaireList.aspx'" />
        </div>
        <table width="680" cellpadding="5" cellspacing="0">
            <tr>
                <td colspan="2" style=" text-align:center; font-size:16px; font-weight:bold;"> 分项调研人数统计</td>
            </tr>
            <tr><td style=" width:500px; text-align:center; font-size:14px;">调研问题</td><td style=" font-size:14px;text-align:center;">参与人数</td></tr>
             <asp:Repeater ID="rptItem" runat="server">
             <ItemTemplate>
                <tr>
                    <td><%#Eval("Title") %></td>
                    <td><%#Eval("Amount") %></td>
                </tr>
             </ItemTemplate>
            </asp:Repeater>
        </table>
        <br /><br />
        <table width="680" cellpadding="5" cellspacing="0">
            <tr>
                <td  colspan="2" style=" text-align:center; font-size:16px; font-weight:bold;">选项调研人数统计</td>
            </tr>
            <asp:Repeater ID="rptMain" runat="server">
                <ItemTemplate>
                    <tr>
                        <td colspan="2"><%#Eval("Title") %></td>
                    </tr>
                    <asp:Repeater ID="rptSub" runat="server" DataSource='<%#((System.Data.DataRowView)Container.DataItem).CreateChildView("Relation_item_list") %>'>
                        <ItemTemplate>
                            <tr>
                                <td style=" padding-left:80px; width:500px"><%#Eval("Title") %></td>
                                <td><%#Eval("Counter") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    </form>
</body>
</html>
