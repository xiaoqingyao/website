<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendAreaSet.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Model.RecommendAreaSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
            <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery.dialog.js"></script>
        <script type="text/javascript" src="../js/win.js"></script>
        <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <style type="text/css">
        .config{ margin-left:40px;}
        .config li
        {
            color: #333;
            float: left;
            border: #e4e4e4 1px solid;
            margin: 1px;
            padding: 2px 4px;
            display: block;
            white-space: nowrap;
        }
    </style>
    <script type="text/javascript">
        // 初始加载
        $(function() {
            var originalValue;

            if ($("#hdnOriginalValue").val() != "") {
                originalValue = $("#hdnOriginalValue").val().split(",");

                for (var i = 0; i < originalValue.length; i++) {
                    if (originalValue[i] != "") {
                        $("#Area_" + originalValue[i]).attr("checked", "checked");
                    }
                }
            }
        });
        
        // 选中站点下的所有区域
        function SelectAllArea(containerID,chk) {
        var isTrue;

        isTrue = $(chk).attr("checked");
        $("#" + containerID).find("input[type='checkbox']").each(function() {
            if (isTrue) { $(this).attr("checked", "checked"); }
            else { $(this).removeAttr("checked"); }
        });
        }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <asp:Repeater ID="rptSite" runat="server">
            <ItemTemplate>
                <h4 style="clear: both;">
                     <input type="checkbox" onclick="SelectAllArea('Site_<%#Eval("SiteID") %>',this)"/> <a href="javascript:void(0)" onclick="$('#Site_<%#Eval("SiteID") %>').toggle()">
                      <%#Eval("SiteName") %></a></h4>
                <ul class="config" id="Site_<%#Eval("SiteID") %>">
                    <asp:Repeater ID="rptRecommandArea" DataSource='<%#Eval("SysWebSite_RecommendArea") %>' runat="server">
                        <ItemTemplate>
                            <li><input type="checkbox" id="Area_<%#Eval("ID") %>" name="Area" value="<%#Eval("ID") %>" /><%#Eval("Name") %>&nbsp;&nbsp;</li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <center>
        <div style="margin: 10px; clear: both;">
            <asp:Button ID="Button1" runat="server" Text="确定" OnCommand="Save" />&nbsp;&nbsp;<input
                type="button" value="关闭" onclick="parent.Closed()" />
        </div>
    </center>
    <asp:HiddenField ID="hdnOriginalValue" runat="server" />
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
