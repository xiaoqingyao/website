<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialType.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.SpecialType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        .btn
        {
            background-color: #25BAD9;
            color: White;
        }
    </style>

    <script type="text/javascript">

        function fun_Ok() {

            if (checkOk()) {
                var temptxt = "{HQB_L" + '<%=Request["identification"] %>' + '_' + '<%=Request["lableName"] %>' + " LableType=\"LIST\"";
                //
                $('select').each(function() {

                    var o = $(this).val();
                    if ($(this).parent().is(':visible') && o != "") {
                        if ($(this).attr("name") != "SqlOrder" && $(this).attr("name") != "Type") {
                            temptxt += " " + $(this).attr("id") + "=\"" + o + "\"";

                        }

                    }
                });
                $('input').each(function() {
                    switch ($(this).attr("type")) {
                        case "checkbox":
                            if ($(this).attr("id") != "orderSelf" && $(this)[0].checked) {
                                temptxt += " " + $(this).attr("id") + "=\"1\"";
                            }
                            break;
                        case "text":

                            if ($(this).parent().is(':visible') && $(this).attr("id").indexOf("MoreLinkIsWord") != 0) {

                                if ($.trim($(this).val()) != "") {
                                    temptxt += " " + $(this).attr("id") + "=\"" + $(this).val() + "\"";
                                }
                            }
                            break;
                    }

                });

                //自定义排序
                if (!$("#orderSelf")[0].checked) {
                    temptxt += " SqlOrder=\"" + $("#orderField").val() + " " + $("#orderSeq").val() + "\"";
                }
                //更多链接
                if ($("#IsShowMoreLink")[0].checked) {
                    var zhi = $("#MoreLinkIsWord").val();
                    temptxt += " MoreLinkWordOrImageUrl = \"" + $("#MoreLinkIsWord" + zhi).val() + "\"";
                }
                temptxt += " }{/HQB_L" + '<%=Request["identification"] %>' + "}";


                if ('<%=Request["id"] %>' == '') {
                    this.parent.document.getElementById('txtLableContent').value = temptxt;
                }
                else {
                    var obj = this.parent.document.getElementById('txtLableContent');
                    insertAtCursorByStart(obj, temptxt, this.parent.document.getElementById("hidStart").value);
                }

                parent.Closed();
            }

        }

        function showMoreLink() {
            if ($("#MoreLinkIsWord").val() == "0") {
                $("#spanTxt").show(); $("#spanTag").hide();
            }
            else {
                $("#spanTxt").hide(); $("#spanTag").show();
            }
        }
        //验证
        function checkOk() {

            if ($("#Type").val() == "2")  //专题栏目
            {

                if ($("#SpecialID").val() == null) {
                    alert({ msg: "所属专题不能为空！", title: '提示消息' });
                    return false;
                }
            }
            else {
                if ($("#IsShowMoreLink")[0].checked) {  //更多链接
                    var zhi = $("#MoreLinkIsWord").val();
                    if ($.trim($("#MoreLinkIsWord" + zhi).val()) == "") {
                        alert({ msg: "更多链接未填写完整！", title: '提示消息' });
                        return false;
                    }
                }
                if ($("#IsShowTitleImage")[0].checked)  //显示图片
                {
                    var i = 0;

                    if ($("#TitleImageWidth").val() == "") {
                        i += 1;
                    }
                    if ($("#TitleImageHeight").val() == "") {
                        i += 1;
                    }
                    if (i == 1) {
                        alert({ msg: "标题图片的宽高未填写完整！", title: '提示消息' });
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
            var strContent;

            reg = /([\w-]+)\s*=\s*[\"]([^\"]+)[\"]/g;

            result = ""

            while (result = reg.exec(strContent)) {


                switch (result[1]) {
                    case "Container":
                        $("#Container").val(result[2]);
                        break;
                    case "SqlOrder":
                        $("#orderSelf")[0].click();
                        $("#SqlOrder").val(result[2]);
                        break;
                    case "IsShowAddDate":
                        $("#IsShowAddDate")[0].click();
                        break;
                    case "IsShowBrief":
                        $("#IsShowBrief")[0].click();
                        break;
                    case "IsShowTitleImage":
                        $("#IsShowTitleImage")[0].click();
                        break;
                    case "IsShowMoreLink":
                        $("#IsShowMoreLink")[0].click();
                        break;
                    case "MoreLinkIsWord":
                        $("#MoreLinkIsWord").val(result[2]);
                        showMoreLink();
                        break;
                    case "MoreLinkWordOrImageUrl":
                        $("#MoreLinkIsWord" + $("#MoreLinkIsWord").val()).val(result[2]);
                        break;
                    default:
                        $("#" + result[1]).val(result[2]);
                        break;
                }
            }
        }

        $(document).ready(function() {
            var obj = parent.document.getElementById('txtLableContent') || parent.parent.document.getElementById('txtLableContent');
            if ('<%=Request["id"] %>' == "")  //不为模板配置标签时使用
            {
                if (obj.value.indexOf("{/HQB_SYS_LIST}") != -1 && obj.value.indexOf(" TableName=") == -1)  //为专题列表类型
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
        <tr id="list1">
            <td>
                所属栏目
            </td>
            <td>
                <asp:DropDownList ID="Menu" runat="server">
                </asp:DropDownList>
                (不选则为当前发布栏目)
            </td>
        </tr>
        <tr id="list2">
            <td>
                文章(或分页）数量
            </td>
            <td>
                <input type="text" id="PageSize" value="10" onkeyup="isNumeric(this)" style="width: 45px"
                    maxlength="2" />
            </td>
        </tr>
        <tr id="list3">
            <td>
                是否分页
            </td>
            <td>
                <select id="IsSplit">
                    <option value="0">否</option>
                    <option value="1">是</option>
                </select>
            </td>
        </tr>
        <tr id="list4">
            <td>
                排序方式
            </td>
            <td>
                <input type="checkbox" onclick="$('#selfOrder').toggle();$('#otherOrder').toggle()"
                    id="orderSelf" />
                自定义 <span id="selfOrder" style="display: none">
                    <input type="text" id="SqlOrder" /></span> <span id="otherOrder">
                        <select name="SqlOrder" id="orderField">
                            <option value="ID">ID(文章ID)</option>
                            <option value="Orders">Orders(排序值)</option>
                            <option value="AddDate">AddDate(录入时间)</option>
                        </select>
                        <select name="SqlOrder" id="orderSeq">
                            <option value="DESC">DESC（降序）</option>
                            <option value="ASC">ASC（升序） </option>
                        </select></span>
            </td>
        </tr>
        <tr id="list5">
            <td>
                查询条件
            </td>
            <td>
                <input type="text" id="SqlWhere" />
                不要输入where,例如:clickNum>20 AND DATEDIFF(d,AddDate,getdate())<10
            </td>
        </tr>
        <tr id="list6">
            <td>
                标题显示字数
            </td>
            <td>
                <input type="text" id="TitleLength" onkeyup="isNumeric(this)" style="width: 45px"
                    maxlength="2" />
            </td>
        </tr>
        <tr id="list7">
            <td>
                标题样式
            </td>
            <td>
                <input type="text" id="TitleCssClass" />
            </td>
        </tr>
        <tr id="list8">
            <td>
                输出类型
            </td>
            <td>
                <select id="Container">
                    <option value="div">div</option>
                    <option value="li">li</option>
                </select>
            </td>
        </tr>
        <tr id="list9">
            <td>
                是否显示日期
            </td>
            <td>
                <input type="checkbox" onclick="$('#ShowAddDate').toggle()" id="IsShowAddDate" />
                显示 <span id="ShowAddDate" style="display: none">日期格式：<select id="DateFormat">
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
                    日期样式：<input type="text" id="DataCssClass" />
                </span>
            </td>
        </tr>
        <tr id="list10">
            <td>
                是否显示导读（简介）<br />
                仅当模型中设置了导读（简介）字段有用
            </td>
            <td>
                <input type="checkbox" id="IsShowBrief" onclick="$('#ShowBrief').toggle()" />显示
                &nbsp;<span id="ShowBrief" style="display: none"> 样式：<input type="text" id="BriefCssClass" />
                    &nbsp; 显示字数：<input type="text" size="10" id="BriefLength" onkeyup="isNumeric(this)" /></span>
            </td>
        </tr>
        <tr id="list11">
            <td>
                是否显标题图片<br>
                仅当模型中设置了标题图片字段有用
            </td>
            <td>
                <input type="checkbox" onclick="$('#ShowTitleImage').toggle()" id="IsShowTitleImage" />显示
                <span id="ShowTitleImage" style="display: none">图片宽*高
                    <input type="text" id="TitleImageWidth" onkeyup="isNumeric(this)" style="width: 45px"
                        maxlength="2" />
                    *
                    <input type="text" id="TitleImageHeight" onkeyup="isNumeric(this)" style="width: 45px"
                        maxlength="2" />
                    <br>
                    图片显示个数
                    <input type="text" value="1" id="TitleImageCount" onkeyup="isNumeric(this)" style="width: 45px"
                        maxlength="2" />
                    为0则每篇文章都显示
                    <br>
                    样式
                    <input type="text" id="TitleImageCssClass" />
                </span>
            </td>
        </tr>
        <tr id="list12">
            <td>
                标题分隔图片
            </td>
            <td>
                &nbsp;
                <input type="text" style="width: 200px;" maxlength="0" name="TitleSplitImage" id="TitleSplitImage" />
                <input type='button' onclick="InputImages('theForm', 'TitleSplitImage', 1, 'jpg|gif|png', 4096, '',0,0)"
                    value='上传图片' />
            </td>
        </tr>
        <tr id="list13">
            <td>
                更多链接
            </td>
            <td>
                <input type="checkbox" onclick="$('#ShowMoreLink').toggle()" id="IsShowMoreLink" />显示
                <span id="ShowMoreLink" style="display: none">
                    <select id="MoreLinkIsWord" onchange='showMoreLink()'>
                        <option value="0">文字 </option>
                        <option value="1">图片 </option>
                    </select>
                    <span id="spanTxt">
                        <input type="text" id="MoreLinkIsWord0" /></span> <span id="spanTag" style="display: none">
                            <input id="MoreLinkIsWord1" type="text" readonly="readonly" />
                            <input type='button' onclick="InputImages('theForm', 'MoreLinkIsWord1', 1, 'jpg|gif|png', 4096, '',0,0)"
                                value='上传图片' />
                        </span></span>
            </td>
        </tr>
        <tr id="list14">
            <td>
                文章行距
            </td>
            <td>
                <input type="text" id="LineHeight" onkeyup="isNumeric(this)" style="width: 45px"
                    maxlength="2" />
                px
            </td>
        </tr>
        <tr id="list15">
            <td>
                链接目标
            </td>
            <td>
                <select id="Target">
                    <option value="1">新窗口 _blank</option>
                    <option value="0">本窗口 _self</option>
                </select>
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
