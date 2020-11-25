<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LableSinglePage.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.LableSinglePage" %>

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
            var temptxt = "{SinglePage";  //获取标签的开头

            //截取的长度
            if ($("#txtLength").val() != "") {
                temptxt += " Length=\"" + $("#txtLength").val() + "\"";
            }

            //所属的栏目
            if ($("#ddlNodeCode").val() != "") {
                temptxt += " NodeCode=\"" + $("#ddlNodeCode").val() + "\"";
            }

            //是否加省略号"..."
            if ($("#txtIsDot").val() != "") {
                temptxt += " IsDot=\"" + $("#txtIsDot").val() + "\"";
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
    <table class="edit_tb" id="tb1">
        <tr>
            <td style="width: 100px">
                所属的栏目：
            </td>
            <td>
                <asp:DropDownList ID="ddlNodeCode" Width="200px" runat="server">
                </asp:DropDownList>
                &nbsp; (不选则所有栏目通用)
            </td>
        </tr>
        <tr>
            <td style="width: 100">
                截取长度：
            </td>
            <td>
                <input type="text" id="txtLength" value="0" onkeyup="isNumeric(this)" maxlength="2" />&nbsp;(可选，截取长度。默认为0不截取)
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                是否加省略号：
            </td>
            <td>
                <select id="txtIsDot">
                    <option value="0" selected="selected">不加</option>
                    <option value="1">加</option>
                </select>
                &nbsp;(可选,默认为0不加省略)
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
