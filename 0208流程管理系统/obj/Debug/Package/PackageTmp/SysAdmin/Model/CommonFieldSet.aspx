<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonFieldSet.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Model.CommonFieldSet" %>

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
        .config
        {
            margin-left: 40px;
        }
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
        $(function() {
            $("input[IsDefault='True']").each(function() {
                $(this).attr("checked", "checked");
            });
        });

        // 选中分组下的所有字段
        function SelectAllField(containerID, chk) {
            var isTrue;

            isTrue = $(chk).attr("checked");
            $("#" + containerID).find("input[type='checkbox']").each(function() {
                if (isTrue) { $(this).attr("checked", "checked"); }
                else { $(this).removeAttr("checked"); }
            });
        }


        function submitCheck() {
            var isTrue;
            
            isTrue = false;
            $("input[type='checkbox']").each(function() { if ($(this).attr("checked")) { isTrue = true; } });

            if (!isTrue) {
                alert({title:"操作提示",msg:"请选中要添加的字段"});
            }

            return isTrue;
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4 style="clear: both;">
            <input type="checkbox" onclick="SelectAllField('Group_000000000000000000000000000000000000',this)" />
            <a href="javascript:void(0)" onclick="$('#Group_000000000000000000000000000000000000').toggle()">
                默认</a></h4>
        <ul class="config" id="Group_000000000000000000000000000000000000">
            <asp:Repeater ID="rptDefaultField" runat="server">
                <ItemTemplate>
                    <li>
                        <input type="checkbox" isdefault="<%#Eval("IsDefault") %>" alias="<%#Eval("FieldAlias")%>"
                            id="Field_<%#Eval("ID") %>" name="Field" value="<%#Eval("ID") %>" /><%#Eval("FieldAlias")%>&nbsp;&nbsp;</li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <asp:Repeater ID="rptGroup" runat="server">
            <ItemTemplate>
                <h4 style="clear: both;">
                    <input type="checkbox" onclick="SelectAllField('Group_<%#Eval("ID") %>',this)" />
                    <a href="javascript:void(0)" onclick="$('#Group_<%#Eval("ID") %>').toggle()">
                        <%#Eval("Name") %></a></h4>
                <ul class="config" id="Group_<%#Eval("ID") %>">
                    <asp:Repeater ID="rptField" DataSource='<%#Eval("Group_Field") %>' runat="server">
                        <ItemTemplate>
                            <li>
                                <input type="checkbox" isdefault="<%#Eval("IsDefault") %>" alias="<%#Eval("FieldAlias")%>"
                                    id="Field_<%#Eval("ID") %>" name="Field" value="<%#Eval("ID") %>" /><%#Eval("FieldAlias")%>&nbsp;&nbsp;</li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <center>
        <div style="margin: 10px; clear: both;">
            <asp:Button ID="Button1" runat="server" Text="确定" OnCommand="Save" OnClientClick="return submitCheck()" />&nbsp;&nbsp;<input
                type="button" value="关闭" onclick="parent.Closed()" />
        </div>
    </center>
    </form>

    <script type="text/javascript">
    var msgJson =<%=jsMessageParam %>;
    var msgContent = <%=jsMessage %>;
    var temp;
    
    if(msgContent == "" && msgJson != null){
        for(var i=0;i<msgJson.length;i++){
            temp = msgJson[i];
            msgContent += $("#Field_" + temp.Field).attr("Alias") + "：" + temp.Msg + "<br/>";
        }
    }
    if(msgContent != ""){
      parent.ClosedWithMsg(msgContent);
    }
    </script>

</body>
</html>
