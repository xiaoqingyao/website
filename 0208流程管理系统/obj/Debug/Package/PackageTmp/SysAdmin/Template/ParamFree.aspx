<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamFree.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.ParamFree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>自由标签参数</title>
    <style type="text/css">
        .edit_tb
        {
            width: 100%;
            border: solid 1px #C9DEEC;
            border-collapse: collapse;
            float: left;
            background-color: #F8FDFF;
        }
        .edit_tb th
        {
            padding: 2px 5px;
            text-align: left;
            border-bottom: solid 1px #C9DEEC;
            background-color: #ECF3F9;
            border-collapse: collapse;
        }
        .edit_tb td
        {
            padding: 2px 5px;
            text-align: left;
            border-bottom: 1px #E4F3FC solid;
            border-collapse: collapse;
        }
        .btn
        {
            background-color: #25BAD9;
            color: White;
        }
    </style>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" language="javascript">
        function InsertValue() {

            var temptxt = document.URL.split('=')[1];  //获取标签的开头
            temptxt += " LableType=\"FREE\"";
            //分页标签ID
            if ($("#txtSplitId").val() != "") {
                temptxt += " SplitID=\"" + $("#txtSplitId").val() + "\"";
            }

            //所属的栏目
            if ($("#ddlNodeCode").val() != "") {
                temptxt += " NodeCode=\"" + $("#ddlNodeCode").val() + "\"";
            }
            temptxt += "}";
            var obj = this.parent.document.getElementById('txtLableContent');
            window.parent.insertAtCursorByStart(obj, temptxt, this.parent.document.getElementById("hidStart").value);
            window.parent.Closed();
        }
    </script>

</head>
<body>
    <form id="frmLable" runat="server">
    <table class="edit_tb">
        <tr>
            <td style="width: 160px">
                所属的栏目：
            </td>
            <td>
                <asp:DropDownList ID="ddlNodeCode" Width="200px" runat="server">
                </asp:DropDownList>
                (不选则所有栏目通用)
            </td>
        </tr>
        <tr>
            <td>
                分页标签编号：
            </td>
            <td>
                <input type="text" id="txtSplitId" />
            </td>
        </tr>
    </table>
    <div class="container">
        <div class="Submit" style="text-align: center">
            <input type="button" value="插入" class="subButton" onclick="InsertValue()" />
            <input type="submit" value="取消" class="subButton" onclick="parent.Closed()" />
        </div>
    </div>
    </form>
</body>
</html>
