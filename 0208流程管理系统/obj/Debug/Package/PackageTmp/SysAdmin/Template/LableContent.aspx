<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LableContent.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.LableContent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-dlansitional.dtd">
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

    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/template.js" type="text/javascript"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery.format.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        function innit() {
            var url = location.href;

            document.getElementById('tdName').innerHTML = '<%=Request["name"] %>';
        }
        function showFloat() {
            document.getElementById('dl22').style.display = document.getElementById("radioFloat").checked ? "block" : "none";
        }
        function showByType(obj) {
            var dl;
            for (var i = 1; i < 5; i++) {
                for (j = 1; j < 3; j++) {
                    dl = document.getElementById("dl" + i + j);
                    if (dl != null) {
                        dl.style.display = "none";
                    }
                }
            }
            for (j = 1; j < 3; j++) {
                dl = document.getElementById("dl" + obj.value + j);
                if (dl != null) {
                    dl.style.display = "block";
                }
            }

        }
        function checkSure() {
            //            alert(Page_ClientValidate());
            var type = document.getElementById('outType').value;
            var name = '<%=Request["name"] %>';
            var sdl = "{$Field(";
            switch (type) {
                case "1":
                    var len = document.getElementById("txtLen").value;
                    sdl += "1," + name + ",";

                    if (Common.trim(len) != "") {
                        sdl += len + ",";
                    }
                    sdl += GetRadioValue("omit");
                    break;
                case "2":
                    var digit = document.getElementById("txtdigit").value;
                    sdl += "2," + name + "," + GetRadioValue("float");
                    if (Common.trim(digit) != "") {
                        sdl += "," + document.getElementById("txtdigit").value;
                    }
                    break;
                case "3":
                    var formart = document.getElementById("format").value;
                    sdl += "3," + name;
                    if (Common.trim(formart) != "") {
                        sdl += "," + formart;
                    }
                    break;
                default:
                    var tTrue = document.getElementById("txtTrue").value;
                    var tFalse = document.getElementById("txtFalse").value;
                    sdl += "4," + name;
                    if (Common.trim(tTrue) != "") {
                        sdl += "," + tTrue;
                    }
                    if (Common.trim(tFalse) != "") {
                        sdl += "," + tFalse;
                    }
                    break;

            }
            sdl += ")}";
            var sender = '<%=Request["sender"] %>';  //父页面控件ID
            
            if (sender == '') {
                sender = 'txtLableContent';
            }
            insertAtCursor(this.parent.$('#' + sender), '' + sdl + '');
            parent.Closed();
        }
       
    </script>

</head>
<body onload="innit()">
    <form id="theForm" runat="server">
    <div class="container">
        <dl>
            <dt style="width: 80px;">字段名称： </dt>
            <dd id="tdName">
            </dd>
        </dl>
        <dl>
            <dt style="width: 80px;">输出类型： </dt>
            <dd>
                <select id="outType" onchange="showByType(this)">
                    <option value="1">文本类型</option>
                    <option value="2">数字类型</option>
                    <option value="3">日期类型</option>
                    <option value="4">布尔型</option>
                </select>
            </dd>
        </dl>
        <dl id="dl11">
            <dt style="width: 80px;">截断长度： </dt>
            <dd>
                <input type="text" id="txtLen" style="width: 50px" value="0" maxlength="4" class="validate[optional,custom[onlyNumber]]" />
                <span style="color: Red; padding-left: 20px;">为0则不截断</span>
            </dd>
        </dl>
        <dl id="dl12">
            <dt style="width: 80px;">截断处理： </dt>
            <dd>
                <input id="Radio1" type="radio" name="omit" value="1" />显示...
                &nbsp; &nbsp; &nbsp;<input id="Radio2" type="radio" name="omit" value="0" checked="checked" />不显示...
            </dd>
        </dl>
        <dl id="dl21" style="display: none">
            <dt style="width: 80px;">数字类型： </dt>
            <dd>
                <input id="radioInt" type="radio" onclick="showFloat()" name="float" value="0" />整数
                <input id="radioFloat" type="radio" onclick="showFloat()" name="float" value="1"
                    checked="checked" />小数
                <input id="radioPer" type="radio" onclick="showFloat()" name="float" value="2" />百分数
            </dd>
        </dl>
        <dl id="dl22" style="display: none">
            <dt style="width: 80px;">小数位数： </dt>
            <dd>
                <input type="text" maxlength="2" id="txtdigit" value="2" style="width: 50" class="validate[optional,custom[onlyNumber]]" />
            </dd>
        </dl>
        <dl style="display: none" id="dl31">
            <dt style="width: 80px;">输出格式： </dt>
            <dd>
                <select id="format">
                  <option value="yyyy-MM-dd">2005-10-1</option>
                    <option value="yyyy.MM.dd">2005.10.1</option>
                    <option value="yyyy/MM/dd">2005/10/1</option>
                    <option value="MM/dd/yyyy">10/1/2005</option>
                    <option value="yyyy年MM月">2005年10月</option>
                    <option value="yyyy年MM月dd日">2005年10月1日</option>
                    <option value="MM.dd.yyyy">10.1.2005</option>
                    <option value="MM-dd-yyyy">10-1-2005</option>
                    <option value="MM/dd">10/1</option>
                    <option value="MM.dd">10.1</option>
                    <option value="MM月dd日">10月1日</option>
                    <option value="dd日hh时">1日12时</option>
                    <option value="dd日hh点">1日12点</option>
                    <option value="hh时mm分">12时12分</option>
                    <option value="hh:mm">12:12</option>
                    <option value="MM-dd">10-1</option>
                    <option value="MM/dd hh:mm">10/1 12:00</option>
                    <optgroup label="-----加括号格式-----">
                    </optgroup>
                    <option value="(yyyy-MM-dd)">(2005-10-1)</option>
                    <option value="(yyyy.MM.dd)">(2005.10.1)</option>
                    <option value="(yyyy/MM/dd)">(2005/10/1)</option>
                    <option value="(MM/dd/yyyy)">(10/1/2005)</option>
                    <option value="(yyyy年MM月)">(2005年10月)</option>
                    <option value="(yyyy年MM月dd日)">(2005年10月1日)</option>
                    <option value="(MM.dd.yyyy)">(10.1.2005)</option>
                    <option value="(MM-dd-yyyy)">(10-1-2005)</option>
                    <option value="(MM/dd)">(10/1)</option>
                    <option value="(MM.dd)">(10.1)</option>
                    <option value="(MM月dd日)">(10月1日)</option>
                    <option value="(dd日hh时)">(1日12时)</option>
                    <option value="(dd日hh点)">(1日12点)</option>
                    <option value="(hh时mm分)">(12时12分)</option>
                    <option value="(hh:mm)">(12:12)</option>
                    <option value="(MM-dd)">(10-1)</option>
                    <option value="(MM/dd hh:mm)">(10/1 12:00)</option>
                    <optgroup label="-----加中括号格式-----">
                    </optgroup>
                    <option value="[yyyy-MM-dd]">[2005-10-1]</option>
                    <option value="[yyyy.MM.dd]">[2005.10.1]</option>
                    <option value="[yyyy/MM/dd]">[2005/10/1]</option>
                    <option value="[MM/dd/yyyy]">[10/1/2005]</option>
                    <option value="[yyyy年MM月]">[2005年10月]</option>
                    <option value="[yyyy年MM月dd日]">[2005年10月1日]</option>
                    <option value="[MM.dd.yyyy]">[10.1.2005]</option>
                    <option value="[MM-dd-yyyy]">[10-1-2005]</option>
                    <option value="[MM/dd]">[10/1]</option>
                    <option value="[MM.dd]">[10.1]</option>
                    <option value="[MM月dd日]">[10月1日]</option>
                    <option value="[dd日hh时]">[1日12时]</option>
                    <option value="[dd日hh点]">[1日12点]</option>
                    <option value="[hh时mm分]">[12时12分]</option>
                    <option value="[hh:mm]">[12:12]</option>
                    <option value="[MM-dd]">[10-1]</option>
                    <option value="[MM/dd hh:mm]">[10/1 12:00]</option>
                </select>
            </dd>
        </dl>
        <dl style="display: none" id="dl41">
            <dt style="width: 80px;">为真输出： </dt>
            <dd>
                <input type="text" id="txtTrue" value='' />
            </dd>
        </dl>
        <dl style="display: none" id="dl42">
            <dt style="width: 80px;">为假输出： </dt>
            <dd>
                <input type="text" id="txtFalse" value='' />
            </dd>
        </dl>
        <div class="Submit">
            <input type="submit" value="确定" onclick="checkSure()" />
            <input type="submit" value="取消" onclick="parent.Closed()" />
        </div>
    </div>
    </form>
</body>
</html>
