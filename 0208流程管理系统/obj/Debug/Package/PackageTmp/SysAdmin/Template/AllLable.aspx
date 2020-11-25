<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllLable.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.AllLable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>所有的标签</title>
    <style type="text/css">
        body
        {
            font-size: 12px;
        }
        .tag ul, .tag li
        {
            margin: 0;
            padding: 0;
            height: 29px;
        }
        .tag ul
        {
            border-bottom: 1px solid #36711B;
            padding-left: 20px;
        }
        .tag li
        {
            float: left;
            width: 100px;
            list-style-type: none;
            text-align: center;
            line-height: 31px;
            height: 31px;
            display: inline;
        }
        .tag li.open
        {
            border: 1px solid #36711B;
            border-bottom: solid 1px #FCFCFC;
            line-height: 28px;
            height: 28px;
            width: 98px;
        }
        #list ul li
        {
            margin: 0;
            padding: 0;
        }
        #list li
        {
            width: 130px;
            float: left;
            line-height: 25px;
            height: 25px;
        }
    </style>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

</head>
<body>
    <form id="frmLables" runat="server">
    <div class="tag">
        <ul>
            <li class="open">标签</li></ul>
    </div>
    <div id="list">
        <ul>
            <asp:Repeater ID="rptLableList" runat="server" OnItemDataBound="rptLableList_ItemDataBound">
                <ItemTemplate>
                    <li>
                        <asp:LinkButton ID="lbtnLable" runat="server" CommandArgument='<%#Eval("LableID").ToString()%>'>
                         <%#Eval("Title")%>
                        </asp:LinkButton></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    </form>
</body>
</html>
