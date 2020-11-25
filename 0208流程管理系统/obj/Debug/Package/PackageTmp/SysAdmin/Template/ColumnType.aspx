<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ColumnType.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.ColumnType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>栏目标签</title>
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

</head>
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


    function showimg() {
        var src = "";
        switch ($('#Type').val()) {
            case "1":
                if ($("#IsBothMenu")[0].checked) {
                    src = ($("#ShowType").val() == "1" ? '3.jpg' : '2.jpg');

                }
                else {
                    src = "1.jpg";
                }
                break;
            case "2":
                if ($("#IsBothMenu")[0].checked && $("#ShowType").val() == "1") {
                    src = '5.jpg';
                }
                else {
                    src = "4.jpg";
                }
                break;
            default:
                $("#img1").css("display", "none");
                break;
        }
        if (src != "") {
            $("#img1").css("display", "");
            $("#img1").attr("src", "../img/menu/" + src);
        }
    }

    function fun_Ok() {

        if (checkOk()) {

            var str = "{HQB_L" + '<%=Request["identification"] %>' + '_' + '<%=Request["lableName"] %>';

            if ($('#Type').val() == "3") {  //网站位置导航

                str += " LableType=\"NAV\"";
                str += " Type=\"" + $("#Type").val() + "\"";
                if ($.trim($("#CssClass").val()) != "") {
                    str += " CssClass=\"" + $("#CssClass").val() + "\"";
                }
                str += " Target=\"" + $("#Target").val() + "\"";
                var isNavTagWord = $("input[name='NavTagWord']:checked").val();
                str += " IsNavTagWord=\"" + isNavTagWord + "\"";

                str += " NavTagContent=\"" + (isNavTagWord == "1" ? $("#NavTagContentTxt").val() : $("#NavTagContentFile").val()) + "\"";

                str += " HtmlCode=\"" + $("#htmlCode").val() + "\"";

                str += " }{/HQB_L" + '<%=Request["identification"] %>' + "}";

            }
            else {
                var levstr = "";
                str += " LableType=\"MENU\" Type=\"" + $("#Type").val() + "\"";
                if ($('#Type').val() == "2") {  //栏目子菜单
                    if ($("#NodeCode").val() != "") {
                        str += " NodeCode=\"" + $("#NodeCode").val() + "\"";
                    }

//                    if ($("#IsOnlySubMenu")[0].checked) {
//                        str += " IsOnlySubMenu=\"1\"";
                    //                    }
                    str += " SubMenuType=\"" + $("#SubMenuType").val() + "\"";
               }
                if ($("#selEditMod").val() == "1") {
                    if ($("#IsBothMenu")[0].checked) {
                        str += " IsBothMenu=\"1\"";
                        str += " ShowType=\"" + $("#ShowType").val() + "\"";
                    }
                    str += " IsWordMenu=\"" + $("input[name='IsWordMenu']:checked").val() + "\"";
                    if ($.trim($("#CurrentCssType").val()) != "") {
                        str += " CurrentCssType=\"" + $("#CurrentCssType").val() + "\"";
                    }
                }
                else {
                    str += " Level=\"" + $("#Level").val() + "\"";
                    levstr = getLayer(1) + "\r\n";  // 子栏目代码
                }
                str += "}" + levstr + " {/HQB_L" + '<%=Request["identification"] %>' + "}";

            }


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
    function encodeContent(str) {
        str = str.replace(/&/g, "&amp;").replace(/&amp;amp;/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        return str;
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




    function showOrHide() {
        switch ($("#Type").val()) {
            case "1":
                if ($("#selEditMod").val() == "1") {
                    showTrSet("");
                    $("#trEdit1").hide();
                }
                else {
                    showTrSet("none");
                    $("#trEdit1").show();
                }
                $("#tr2").show();
                $("#table1").show();
                $("#table3").hide();
                $("#trMenu").hide();
                $("#trOnly").hide();
                break;
            case "2":  //栏目子菜单
                if ($("#selEditMod").val() == "1") {
                    showTrSet("");
                    $("#trEdit1").hide();
                }
                else {
                    showTrSet("none");
                    $("#trEdit1").show();
                }
                $("#tr2").show();
                $("#table1").show();
                $("#table3").hide();
                $("#trMenu").show();
                $("#trOnly").show();
                break;
            default:  //网站位置导航
                $("#tr2").hide();
                $("#table1").hide();
                $("#table3").show();
                $("#trMenu").hide();
                $("#trOnly").hide();
                break;
        }
        showLeyer();
        showimg();
    }
    function showTrSet(flag) {
        for (var i = 1; i < 4; i++) {
            $("#trSet" + i).css("display", flag);
        }
    }

    function showLeyer() {
        var count = $("#Level").val();
        if ($("#selEditMod").val() == "2") {  //为代码模式
            for (var i = 1; i < parseInt(count) + 2; i++) {
                $("#trEdit" + i).show();
            }
        }
        else {
            count = -1;
        }

        for (var j = parseInt(count) + 2; j < 5; j++) {
            $("#trEdit" + j).hide();
        }

    }
    function setContent(str, index) {
        //IE
        if (document.selection) {
            $("#Level" + index).focus();
            var tarobj = document.selection.createRange();
            tarobj.text = str;
        }
        else {
            var tclen = $("#Level" + index).val().length;
            var value = $("#Level" + index).val();
            $("#Level" + index).val(value.substr(0, $("#Level" + index)[0].selectionStart) + str + value.substring($("#Level" + index)[0].selectionStart, tclen));
        }
    }
    function checkOk() {
        var le = true;  //级数是否填写完全
        if ($("#Type").val() == "3")  //网站栏目
        {

            var content = $("input[name='NavTagWord']:checked").val() == "1" ? $("#NavTagContentTxt").val() : $("#NavTagContentFile").val();
            if (content == "") {
                alert({ msg: "导航方式未填写完整！", title: '提示消息' });
                return false;
            }

        }
        else if ($("#selEditMod").val() == "2") //代码模式
        {
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
                case "IsWordMenu":  //编辑模式为配置
                    $("#selEditMod").val("1");
                    $("input[name='IsWordMenu'][value='" + result[2] + "'").attr("checked", true);
                    break;
                case "IsBothMenu":
                    $("#IsBothMenu")[0].click();
                    break;
                case "IsNavTagWord":
                    $("input[name='NavTagWord'][value='" + result[2] + "'").click();
                    break;
                case "Level":  //为代码模式
                    $("#selEditMod").val("2");
                    $("#Level").val(result[2]);
                    break;
                case "NavTagContent":
                    $("input[name='NavTagWord']:checked").val() == "1" ? $("#NavTagContentTxt").val(result[2]) : $("#NavTagContentFile").val(result[2]);
                    break;
                case "SubMenuType":
                    //isOnlysub = true;
                    $("#SubMenuType").get(0).selectedIndex = result[2]-1
                    break;
                case "HtmlCode":
                    change("htmlCode", result[2]);
                    break;
                default:
                    $("#" + result[1]).val(result[2]);
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

        showOrHide();
    }

    $(document).ready(function() {
        var obj = parent.document.getElementById('txtLableContent') || parent.parent.document.getElementById('txtLableContent');
        if ('<%=Request["id"] %>' == "")  //不为模板配置标签时使用
        {
            if (obj.value.indexOf(" LableType=\"NAV\"") != -1 || obj.value.indexOf(" LableType=\"MENU\"") != -1)  //为栏目标签类型
            {
                SetAttribute(obj.value);
            }
        }
    });
    function change(objID, newValue) {
        var obj = $("#" + objID);
        if (!obj) {
            alert("对象为空，执行返回！");
            return;
        }

        var options = obj.find("option");
        options.each(function(i) {
            if ($(this).text() === newValue) {
                $(this).attr("selected", true); // 也可用 obj.get(0).selectedIndex = i; 替代   
            }
        });
    }
    function setAction(data, i) {
        if (data != "null")
            setContent('CurrentStyle="' + data + '"', i);
    }
</script>

<body>
    <form id="theForm" runat="server">
    <!--<table width="100%"  class='tb'>-->
    <table width="100%" class='edit_tb'>
        <tr height="30" id="tr1">
            <td width="110">
                标签类型：
            </td>
            <td>
                <select name="Type" id="Type" onchange="showOrHide();">
                    <option value="1" selected="selected">网站总栏目导航</option>
                    <option value="2">栏目页子菜单</option>
                    <option value="3">网站位置导航</option>
                </select>
            </td>
            <td rowspan="2" align="center">
                <img src="../img/menu/1.jpg" id="img1" />
            </td>
        </tr>
        <tr id="trMenu" style="display: none">
            <td>
                所属栏目
            </td>
            <td>
                <asp:DropDownList ID="NodeCode" Width="200px" runat="server">
                </asp:DropDownList>
                (不选则所有栏目通用)
            </td>
        </tr>
        <tr id="trOnly" style="display:none">
        <td>仅显示当前栏目子栏目</td>
        <td>
        <select id="SubMenuType">
            <option value="1">显示当前栏目子栏目</option>
            <option value="2">显示当前栏目及兄弟栏目（子栏目）</option>
            <option value="3">显示当前栏目顶级栏目下的所有子栏目</option>
        </select>
        </td>
            </tr>
        <tr id="tr2">
            <td>
                编辑模式：
            </td>
            <td>
                <select name="selEditMod" id="selEditMod" onchange="showOrHide();">
                    <option value="1">配置模式</option>
                    <option value="2">代码模式</option>
                </select>
            </td>
        </tr>
    </table>
    </form>
    <!--以下是总栏目导航代码模式-->
    <table width="100%" class="edit_tb" id="table1">
        <tr id="trEdit1" style="display: none">
            <td width="110">
                子栏目：
            </td>
            <td>
                显示级数<select name="Level" id="Level" onchange="showLeyer()">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
                <br />
                注：根据栏目管理中得到级数，一般为一级
            </td>
        </tr>
        <tr id="trEdit2" style="display: none">
            <td>
                一级栏目代码：
            </td>
            <td>
                 <div style="float :left;padding-right:8px">
                <br />
                <textarea id="Level1" cols="60" rows="8"></textarea></div>
                <div style="float:left">
                    插入变量:<br />
                    <select name="selInsertLabel1" id="selInsertLabel1" onclick="if(this.value!='style'){setContent(this.value,1);}else{prompt({msg:'当前栏目样式',value:'',fn:function(data){setAction(data,1)}})};" size="8">
                    <option value="{$Name}">栏目名称</option>
                    <option value="{$Url}">栏目路径</option>
                    <option value="{$NodeCode}">栏目编码</option>
                    <option value="{$Image}">栏目图片</option>
                    <option value="{$OverImage}">鼠标经过图片</option>
                    <option value="{$ToolTip}">栏目提示</option>
                    <option value="{$HQB.Num}">序号</option>
                    <option value="style">当前栏目样式</option>
                    </select>
                    </div>
            </td>
        </tr>
        <tr style="display: none" id="trEdit3">
            <td>
                二级栏目代码：
            </td>
            <td>
                <div style="float :left;padding-right:8px">
                <br />
                <textarea id="Level2" cols="60" rows="8"></textarea></div>
                <div style="float:left">
                    插入变量:<br />
                    <select name="selInsertLabel1" id="Select1" onclick="if(this.value!='style'){setContent(this.value,2);}else{prompt({msg:'当前栏目样式',value:'',fn:function(data){setAction(data,2)}})};" size="8">
                    <option value="{$Name}">栏目名称</option>
                    <option value="{$Url}">栏目路径</option>
                    <option value="{$NodeCode}">栏目编码</option>
                    <option value="{$Image}">栏目图片</option>
                    <option value="{$OverImage}">鼠标经过图片</option>
                    <option value="{$ToolTip}">栏目提示</option>
                    <option value="{$HQB.Num}">序号</option>
                    <option value="style">当前栏目样式</option>
                    </select>
                    </div>
            </td>
        </tr>
        <tr style="display: none" id="trEdit4">
            <td>
                三级栏目代码：
            </td>
            <td>
                <div style="float :left;padding-right:8px">
                <br />
                <textarea id="Level3" cols="60" rows="8"></textarea></div>
                <div style="float:left">
                    插入变量:<br />
                    <select name="selInsertLabel1" id="Select2" onclick="if(this.value!='style'){setContent(this.value,3);}else{prompt({msg:'当前栏目样式',value:'',fn:function(data){setAction(data,3)}})};" size="8">
                    <option value="{$Name}">栏目名称</option>
                    <option value="{$Url}">栏目路径</option>
                    <option value="{$NodeCode}">栏目编码</option>
                    <option value="{$Image}">栏目图片</option>
                    <option value="{$OverImage}">鼠标经过图片</option>
                    <option value="{$ToolTip}">栏目提示</option>
                    <option value="{$HQB.Num}">序号</option>
                    <option value="style">当前栏目样式</option>
                    </select>
                    </div>
            </td>
        </tr>
        <!--代码模式end-->
        <tr id="trSet1">
            <td>
                是否显示二级栏目：
            </td>
            <td>
                <input type="checkbox" name="IsBothMenu" id="IsBothMenu" onclick="$('#spanSecond').toggle();showimg();">
                显示<span id="spanSecond" style="display: none"> 显示方式<select name="ShowType" id="ShowType"
                    onchange="showimg();">
                    <option value="1">横向</option>
                    <option value="2">纵向</option>
                </select>
                </span>
            </td>
        </tr>
        <tr height="30" id="trSet2">
            <td width="110">
                导航类型：
            </td>
            <td>
                <input type="radio" name="IsWordMenu" value="1" checked="checked">
                文字
                <input type="radio" name="IsWordMenu" value="0">
                图片
                <br>
                注：选择图片导航类型，需在栏目管理中的一级栏目上传栏目图片
            </td>
        </tr>
        <tr height="30" id="trSet3">
            <td>
                当前栏目样式：
            </td>
            <td>
                <input type="text" name="CurrentCssType" id="CurrentCssType">
                选择文字导航类型时填写有效
            </td>
        </tr>
        <!--以下是总栏目导航配置模式End-->
    </table>
    <!--End栏目导航代码模式-->
    <!--以下是网站位置导航-->
    <table width="100%" class="edit_tb" id="table3" style="display: none">
        <tr id="trSet31">
            <td style="width: 110px">
                文字样式：
            </td>
            <td>
                <input type="text" size="8" id="CssClass">
                &nbsp; 图列：
                <img src="../img/menu/7.jpg">
            </td>
        </tr>
        <tr id="trSet32">
            <td>
                打开方式：
            </td>
            <td>
                <select id="Target">
                    <option value="1">在本窗口中打开</option>
                    <option value="2">在新窗口中打开</option>
                </select>
            </td>
        </tr>
        <tr id="trSet33">
            <td>
                导航方式：
            </td>
            <td>
                <input type="radio" checked="checked" name="NavTagWord" id="radioText" value="1"
                    onclick="$('#spanText').show();$('#spanTag').hide();">
                文字
                <input type="radio" name="NavTagWord" id="radioPic" value="0" onclick="$('#spanText').hide();$('#spanTag').show();">
                图片 <span id="spanText">
                    <input type="text" id="NavTagContentTxt"></span> <span id="spanTag" style="display: none">
                        <input id="NavTagContentFile" type="text" readonly="readonly" />
                        <input type='button' onclick="InputImages('theForm', 'NavTagContentFile', 1, 'jpg|gif|png', 4096, '',0,0)"
                            value='上传图片' />
                    </span>&nbsp; 图列：
                <img src="../img/menu/8.jpg">
            </td>
        </tr>
        <tr id="tr3">
            <td>
                导航的HTML：
            </td>
            <td>
                <select name="htmlCode" id="htmlCode">
                    <option value="">无</option>
                    <option value="li">li</option>
                    <option value="p">p</option>
                    <option value="div">div</option>
                    <option value="span">span</option>
                </select>
            </td>
        </tr>
    </table>
    <div class="container">
        <div class="Submit" style="text-align: center">
            <input type="submit" value="确定" class="subButton" onclick="fun_Ok()" />
            <input type="submit" value="取消" class="subButton" onclick="parent.Closed()" />
        </div>
    </div>
    <asp:Literal ID="ltlJs" runat="server"></asp:Literal>
</body>
</html>
