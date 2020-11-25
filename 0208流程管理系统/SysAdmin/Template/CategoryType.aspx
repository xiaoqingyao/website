<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryType.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Template.CategoryType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script src="../JS/template.js" type="text/javascript"></script>

    <script src="../JS/win.js" type="text/javascript"></script>

    <script src="../JS/jquery.format.js" type="text/javascript"></script>
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
</style>
    <script type="text/javascript">
        function showLeyer() {
        }
        function showDailog(name, type) {
            var sender;
            switch (type) {
                case 1:
                    sender = "Level1";
                    break;
                case 2:
                    sender = "Level2";
                    break;
                default:
                    sender = "Level3";
                    break;
            }
            openframe({ url: 'LableContent.aspx?name=' + name + '&sender=' + sender, width: '340', height: '170' });
        }
        function showLeyer() {
            var count = $("#Level").val();
            for (var i = 1; i < parseInt(count) + 1; i++) {
                $("#trEdit" + i).show();
            }
            for (var j = parseInt(count) + 1; j < 5; j++) {
                $("#trEdit" + j).hide();
            }

        }
        //获得栏目代码
        var levstr = "";  // 子栏目代码
        var num = ""; //空白
        function getLayer(index) {
            if (index <= parseInt($("#Level").val())) {
                num += "    ";
                levstr += " \r\n" + num + "[HQB.Loop]\r\n" + num + "      [Item]";
                levstr += $("#Level" + index).val() + "[/Item]";
                getLayer(index + 1);

                num = num.substr(4, num.length);

                levstr += "\r\n" + num + "    [/HQB.Loop]";


            }
            return levstr;
        }
        function checkOk() {
            if ($.trim($("#CategoryID").val()) == '') {
                alert({ msg: "类型ID不允许为空！", title: '提示消息' });
                return false;
            }
            else {
                var level = parseInt($("#Level").val());
                for (var i = 1; i < level + 1; i++) {
                    if ($.trim($("#Level" + i).val()) == "") {
                        alert({ msg: "子栏目代码不允许为空！", title: '提示消息' });
                        return false;
                    }
                }
            }
            return true;
        }
        function fun_Ok() {

            if (checkOk()) {
                var str = "{HQB_L" + '<%=Request["identification"] %>' + '_' + '<%=Request["lableName"] %>' + " LableType=\"Category\" CategoryID=\"" + $("#CategoryID").val() + "\"";
                if ($.trim($("#CssFile").val()) != '') {
                    str += " CssFile=\"" + $("#CssFile").val() + "\"";
                }
                if ($.trim($("#JsFile").val()) != '') {
                    str += " JsFile=\"" + $("#JsFile").val() + "\"";
                }
                if ($("#IsSibling")[0].checked) {
                    str += " IsSibling=\"1\"";
                }
                str += " Level=\"" + $("#Level").val() + "\"}";
                str += getLayer(1) + "\r\n";  // 子栏目代码
                str += " {/HQB_L" + '<%=Request["identification"] %>' + "}";
                if ('<%=Request["id"] %>' == '') {
                    this.parent.document.getElementById('txtLableContent').value = str;
                }
                else {
                    var obj = this.parent.document.getElementById('txtLableContent');
                    insertAtCursorByStart(obj, str, this.parent.document.getElementById("hidStart").value);
                }
                parent.Closed();
            }
        }
        //页面初始化
        function SetAttribute(strContent) {

            var reg;
            var result;
            var isOnlysub = false;
            reg = /([\w-]+)\s*=\s*[\"]([^\"]+)[\"]/g;
            result = ""
            while (result = reg.exec(strContent)) {
                //document.write(result[1] + " = " + result[2] + "<br>");
                switch (result[1]) {
                    case "CategoryID":
                        $("#CategoryID").val(result[2]);

                        //
                        break;
                    case "CssFile":
                        $("#CssFile").val(result[2]);
                        break;
                    case "JsFile":
                        $("#JsFile").val(result[2]);
                        break;
                    case "Level":  //为代码模式                       
                        $("#Level").val(result[2]);
                        break;
                    case "IsSibling":
                        $("#IsSibling").attr("checked", true);
                        break;

                }
            }

            var regLabel;
            var matchLabel;

            regLabel = /\[Item\]((.|\n)*?)\[\/Item\]/gi;
            var i = 1;
            while (matchLabel = regLabel.exec(strContent)) {
                $("#Level" + i).val(matchLabel[1]);
                i++;
            }
            showLeyer();
        }
        $(document).ready(function() {
            var obj = parent.document.getElementById('txtLableContent') || parent.parent.document.getElementById('txtLableContent');
            if ('<%=Request["id"] %>' == "")  //不为模板配置标签时使用
            {
                if (obj.value.indexOf(" LableType=\"Category\"") != -1)  //为栏目标签类型
                {
                    SetAttribute(obj.value);
                }
            }
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table class="edit_tb">
        <tr>
            <td style="width:120px">
                类型ID
            </td>
            <td>
                <input id="CategoryID" type="text" />
            </td>
        </tr>
        <tr>
            <td>
                样式文件路径
            </td>
            <td>
                <input id="CssFile" type="text" />
            </td>
        </tr>
        <tr>
            <td>
                JS文件路径
            </td>
            <td>
                <input id="JsFile" type="text" />
            </td>
        </tr>
        <tr>
            <td>
                显示当前类型的平级类型
            </td>
            <td>
                <input id="IsSibling" type="checkbox" />
            </td>
        </tr>
        <tr>
            <td>
                级数
            </td>
            <td>
                <select name="Level" id="Level" onchange="showLeyer()">
                    <option value="1" selected="selected">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </td>
        </tr>
        <tr id="trEdit1">
            <td>
                一级栏目代码：
            </td>
            <td>
                <div>
                    <input type="button" class="abtn" value="ID" onclick="showDailog('ID',1)" />
                    <input type="button" class="abtn" value="类型名称" onclick="showDailog('Name',1)" />
                    <input type="button" class="abtn" value="父级ID" onclick="showDailog('ParentID',1)" />
                    <input type="button" class="abtn" value="颜色" onclick="showDailog('Color',1)" />
                    <input type="button" class="abtn" value="描述" onclick="showDailog('desc',1)" />
                </div>
                <br />
                <br />
                <textarea id="Level1" cols="60" rows="5"></textarea>
            </td>
        </tr>
        <tr style="display: none" id="trEdit2">
            <td>
                二级栏目代码：
            </td>
            <td>
                <div>
                    <input type="button" class="abtn" value="ID" onclick="showDailog('ID',2)" />
                    <input type="button" class="abtn" value="类型名称" onclick="showDailog('Name',2)" />
                    <input type="button" class="abtn" value="父级ID" onclick="showDailog('ParentID',2)" />
                    <input type="button" class="abtn" value="颜色" onclick="showDailog('Color',2)" />
                    <input type="button" class="abtn" value="描述" onclick="showDailog('desc',2)" /></div>
                <br />
                <br />
                <textarea id="Level2" cols="60" rows="5"></textarea>
            </td>
        </tr>
        <tr style="display: none" id="trEdit3">
            <td>
                三级栏目代码：
            </td>
            <td>
                <div>
                    <input type="button" class="abtn" value="ID" onclick="showDailog('ID',3)" />
                    <input type="button" class="abtn" value="类型名称" onclick="showDailog('Name',3)" />
                    <input type="button" class="abtn" value="父级ID" onclick="showDailog('ParentID',3)" />
                    <input type="button" class="abtn" value="颜色" onclick="showDailog('Color',3)" />
                    <input type="button" class="abtn" value="描述" onclick="showDailog('desc',3)" />
                </div>
                <br />
                <br />
                <textarea id="Level3" cols="60" rows="5"></textarea>
            </td>
        </tr>
    </table>
    </form>
    <div class="container">
        <div class="Submit" style="text-align: center">
            <input type="submit" value="确定" class="subButton" onclick="fun_Ok()" />
            <input type="submit" value="取消" class="subButton" onclick="parent.Closed()" />
        </div>
    </div>
    <asp:Literal ID="ltlJs" runat="server"></asp:Literal>
</body>
</html>
