<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NFormDesign.aspx.cs" Inherits="OA.aspx.NWorkFlow.NFormDesign" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET"/>
    
    <script type="text/javascript" language="javascript" src="../../JS/calendar.js"></script>
    <script src="../../UEditor/editor_config.js" type="text/javascript"></script>
    <script src="../../UEditor/editor_all.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../UEditor/themes/default/ueditor.css" />
    <script language="javascript" type="text/javascript">
        //selectUser   selectBuMen
        function selectUser(imgidstr) {
            var wName;
            var RadNum = Math.random();
            wName = window.showModalDialog('../Main/SelectUser.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if (wName == null || wName == "")
            { }
            else
            {
                imgidstr.value = wName;
            }
        }

        function selectBuMen(imgidstr) {
            var wName;
            var RadNum = Math.random();
            wName = window.showModalDialog('../Main/SelectDanWei.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if (wName == null || wName == "")
            { }
            else
            {
                imgidstr.value = wName;
            }
        }


        function selectyinzhang(imgidstr) {
            var wName;
            var RadNum = Math.random();
            wName = window.showModalDialog('../Main/SelectYinZhang.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if (wName == null || wName == "")
            { }
            else
            {
                imgidstr.src = "http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + wName;
            }
        }
        function selectShouXie(imgidstr) {
            var wName;
            var RadNum = Math.random();
            wName = window.showModalDialog('../Main/InsertQianMing.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if (wName == null || wName == "")
            { }
            else
            {
                imgidstr.src = "http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + wName;
            }
        }
        function PrintTable() {
            document.getElementById("PrintHide").style.visibility = "hidden"
            print();
            document.getElementById("PrintHide").style.visibility = "visible"
        }

        // 去左右空格
        function Trim(sssss) {
            return sssss.replace(/\s+$|^\s+/g, "");
        }

        function formset(str) {
            var cValue = parseInt(2000000000 * Math.random());

            //常规控件
            if (str == "20") {
                var num = parseInt(100000 * Math.random());
                var tempStrDefault = Trim(document.getElementById("Text6").value);
                if (tempStrDefault.length > 0 && document.getElementById("TextBox11").value.length > 0) {
                    var OptionStr = new Array();
                    OptionStr = tempStrDefault.split('|');
                    var TempOptionStr = "";
                    for (i = 0; i < OptionStr.length ; i++) {
                        TempOptionStr = TempOptionStr + "<OPTION value=" + OptionStr[i] + " >" + OptionStr[i] + "</OPTION>";
                    }
                    editor.execCommand("insertHtml", '<SELECT id="Drop' + cValue + '"  name="Drop' + cValue + '" alt="' + document.getElementById("TextBox11").value + '" >   ' + TempOptionStr + '  </SELECT>');

                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Drop" + cValue + "_" + document.getElementById("TextBox11").value;//系统控件自动计数
                }
                else { alert('中文字段名称、下拉字段默认值不可为空！'); }
            }
            else if (str == "1") {
                if (document.getElementById("TextBox5").value.length > 0) {

                    editor.execCommand("insertHtml", '<input id=Text' + cValue + '  name="Text' + cValue + '" alt="' + document.getElementById("TextBox5").value + '"  type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox5").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }

            }

            else if (str == "2") {
                if (document.getElementById("TextBox7").value.length > 0) {
                    editor.execCommand("insertHtml", '<input type="hidden" style="display:none;width:0px;"/><textarea id=TextArea' + cValue + ' name="TextArea' + cValue + '"  alt="' + document.getElementById("TextBox7").value + '"></textarea>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "TextArea" + cValue + "_" + document.getElementById("TextBox7").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "3") {
                if (document.getElementById("TextBox9").value.length > 0) {
                    editor.execCommand("insertHtml", '<input id=CHK' + cValue + '  name="CHK' + cValue + '" alt="' + document.getElementById("TextBox9").value + '"  type="checkbox"  />');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "CHK" + cValue + "_" + document.getElementById("TextBox9").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "12") {
                if (document.getElementById("TextBox6").value.length > 0) {
                    editor.execCommand("insertHtml", '<input id=Num' + cValue + '  name="Num' + cValue + '" alt="' + document.getElementById("TextBox6").value + '"    type="text"  style="IME-MODE: disabled;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"  onkeypress="var k=event.keyCode; return (k>=48&&k<=57)||k==46" onpaste="return !/\D/.test(clipboardData.getData(\'text\'))"  ondragenter="return false"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Num" + cValue + "_" + document.getElementById("TextBox6").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "13") {
                var num = Math.random();
                if (document.getElementById("TextBox8").value.length > 0) {
                    editor.execCommand("insertHtml", '<input id=Date' + cValue + ' name="Date' + cValue + '" alt="' + document.getElementById("TextBox8").value + '"    type="text"  onclick="setday(this)"   value=""  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Date" + cValue + "_" + document.getElementById("TextBox8").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "14") {
                var num = Math.random();
                if (document.getElementById("TextBox2").value.length > 0) {
                    editor.execCommand("insertHtml", '<img class="HerCss" name="img' + cValue + '" alt="' + document.getElementById("TextBox2").value + '" id="img' + cValue + '" onclick="selectyinzhang(img' + cValue + ');"  src="../../images/Button/InsertYinZhang.gif" />');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "img" + cValue + "_" + document.getElementById("TextBox2").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }
            else if (str == "104") {
                var num = Math.random();
                if (document.getElementById("TextBox16").value.length > 0) {
                    editor.execCommand("insertHtml", '<img class="HerCss" name="img' + cValue + '" alt="' + document.getElementById("TextBox16").value + '" id="img' + cValue + '" onclick="selectShouXie(img' + cValue + ');"  src="../../images/Button/InsertQianMing.gif" />');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "img" + cValue + "_" + document.getElementById("TextBox16").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

                //宏控件
            else if (str == "4") {
                if (document.getElementById("TextBox1").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id=Text' + cValue + ' name="Text' + cValue + '" alt="' + document.getElementById("TextBox1").value + '" type="text" value="宏控件-用户姓名" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox1").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "5") {
                if (document.getElementById("TextBox3").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id=Text' + cValue + ' name="Text' + cValue + '" alt="' + document.getElementById("TextBox3").value + '" type="text" value="宏控件-用户部门" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox3").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "6") {
                if (document.getElementById("TextBox4").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id=Text' + cValue + '  name="Text' + cValue + '" alt="' + document.getElementById("TextBox4").value + '"  type="text" value="宏控件-用户角色" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox4").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "7") {
                if (document.getElementById("TextBox10").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id=Text' + cValue + '  name="Text' + cValue + '" alt="' + document.getElementById("TextBox10").value + '" type="text" value="宏控件-用户职位" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox10").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }


            else if (str == "8") {
                if (document.getElementById("TextBox12").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id=Text' + cValue + '  name="Text' + cValue + '" alt="' + document.getElementById("TextBox12").value + '" type="text" value="宏控件-当前日期" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox12").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }


            else if (str == "101") {
                if (document.getElementById("TextBox13").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id=Text' + cValue + '  name="Text' + cValue + '" alt="' + document.getElementById("TextBox13").value + '" onclick="selectUser(Text' + cValue + ');"  type="text" value="点击选择用户" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox13").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "102") {
                if (document.getElementById("TextBox14").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id="Text' + cValue + '"  name="Text' + cValue + '" alt="' + document.getElementById("TextBox14").value + '" onclick="selectBuMen(Text' + cValue + ');"  type="text" value="点击选择部门" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox14").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "103") {
                if (document.getElementById("TextBox15").value.length > 0) {
                    editor.execCommand("insertHtml", '<input readonly id=Text' + cValue + '  name="Text' + cValue + '"  alt="' + document.getElementById("TextBox15").value + '" type="text" value="宏控件-部门主管" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee"/>');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox15").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

            else if (str == "19") {
                if (document.getElementById("TextBox19").value.length > 0) {
                    eWebEditor1.insertHTML('<input id="Text' + cValue + '"  name="Text' + cValue + '" alt="' + document.getElementById("TextBox19").value + '"  type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #eeeeee;display: none"/><iframe id="eWebEditor1" frameborder="0"  height="720" scrolling="no" src="../../eWebEditor/ewebeditor.htm?id=Text' + cValue + '&style=mini" width="100%"></iframe> ');
                    document.getElementById("TextBox17").value = document.getElementById("TextBox17").value + "|" + "Text" + cValue + "_" + document.getElementById("TextBox19").value;//系统控件自动计数
                } else { alert('中文字段名称不可为空！'); }
            }

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle" style=" height: 30px;">
                    &nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                    <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;流程表单&nbsp;>>&nbsp;表单设计器
                </td>
                <td style=" height: 30px; text-align: right" valign="middle">
                    表单名称：<asp:Label ID="Label1" runat="server"></asp:Label>
                    <span style="color: #999999">*注：所有的控件必须从左侧功能区中插入，不可进行复制、粘贴等，否则无法读取！</span> &nbsp;
                    
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton1_Click" />
                    &nbsp;
                    
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="3px" colspan="1" style="background-color: #ffffff">
                </td>
                <td colspan="1" height="3" style="background-color: #ffffff">
                </td>
            </tr>
        </table>
        <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">
            <tr>
                <td style="width: 208px; height: 25px; background-color: #f9f9f7; text-align: center;
                    vertical-align: top;" align="right">
                    <strong>标准控件</strong>
                    <asp:TextBox ID="TextBox17" runat="server" Style="display: none" Width="49px"></asp:TextBox>
                    <hr />
                    <input id="Button4" onclick="formset(1)" style="width: 60px" type="button" value="输入框" />
                    中文名：<asp:TextBox ID="TextBox5" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button14" onclick="formset(12)" style="width: 60px" type="button" value="数字框" />
                    中文名：<asp:TextBox ID="TextBox6" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button5" onclick="formset(2)" style="width: 60px" type="button" value="文本框" />
                    中文名：<asp:TextBox ID="TextBox7" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button15" onclick="formset(13)" style="width: 60px" type="button" value="日期选择" />
                    中文名：<asp:TextBox ID="TextBox8" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button6" onclick="formset(3)" style="width: 60px" type="button" value="复选框" />
                    中文名：<asp:TextBox ID="TextBox9" runat="server" Width="90px"></asp:TextBox><br />
                    <%--<input id="Button19" onclick="formset(19)" style="width: 60px" type="button" value="文本编辑" />
                    中文名：<input name="TextBox19" type="text" id="TextBox19" style="width:90px;" /><br />--%>
                    <hr />
                    <input id="Button13" onclick="formset(20)" style="width: 60px" type="button" value="下拉框" />
                    中文名：<asp:TextBox ID="TextBox11" runat="server" Width="90px"></asp:TextBox><br />
                    &nbsp;默认：<input id="Text6" style="width: 162px" type="text" /><br />
                    <span style="color: #000033">*默认值用" | "分隔，例如：好|不好</span><br />
                    <hr />
                    <strong>宏控件</strong>
                    <br />
                    <hr />
                    <input id="Button7" onclick="formset(4)" style="width: 60px" type="button" value="用户姓名" />
                    中文名：<asp:TextBox ID="TextBox1" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button8" onclick="formset(5)" style="width: 60px" type="button" value="用户部门" />
                    中文名：<asp:TextBox ID="TextBox3" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button9" onclick="formset(6)" style="width: 60px" type="button" value="用户角色" />
                    中文名：<asp:TextBox ID="TextBox4" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button10" onclick="formset(7)" style="width: 60px" type="button" value="用户职位" />
                    中文名：<asp:TextBox ID="TextBox10" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button11" onclick="formset(8)" style="width: 60px" type="button" value="当前日期" />
                    中文名：<asp:TextBox ID="TextBox12" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button1" onclick="formset(101)" style="width: 60px" type="button" value="用户选择" />
                    中文名：<asp:TextBox ID="TextBox13" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button2" onclick="formset(102)" style="width: 60px" type="button" value="部门选择" />
                    中文名：<asp:TextBox ID="TextBox14" runat="server" Width="90px"></asp:TextBox>
                    <input id="Button3" onclick="formset(103)" style="width: 60px" type="button" value="部门主管" />
                    中文名：<asp:TextBox ID="TextBox15" runat="server" Width="90px"></asp:TextBox><br />
                    <hr />
                    <strong>&nbsp;印章控件
                        <br />
                    </strong>
                    <hr />
                    <input id="Button12" onclick="formset(14)" style="width: 60px" type="button" value="电子印章" />
                    中文名：<asp:TextBox ID="TextBox2" runat="server" Width="90px"></asp:TextBox><br />
                    <input id="Button16" onclick="formset(104)" style="width: 60px" type="button" value="手写签名" />
                    中文名：<asp:TextBox ID="TextBox16" runat="server" Width="90px"></asp:TextBox>
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; vertical-align: top;">
                    <asp:TextBox ID="TxtContent" runat="server" Width="100%" Rows="10" TextMode="MultiLine"></asp:TextBox>
                    <script type="text/javascript">
                        var editor = new baidu.editor.ui.Editor({ id: 'editor', minFrameHeight: 520 }); editor.render("TxtContent");
                    </script>
                    <br />
                    <span style="color: #ff0000">1.点击左边控件按钮将会把内容插入到编辑器中鼠标的光标所在处，如果鼠标的光标没有在编辑器中将不会插入内容。<br />
                    </span><span style="color: #ff0000">2.如果页面中存在重复的字段，系统在运行中将取页面上最后一个控件的值。如果最后一个控件没有值，系统默认为未取到值。</span>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
