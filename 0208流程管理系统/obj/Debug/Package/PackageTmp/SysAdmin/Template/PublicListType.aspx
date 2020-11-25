<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicListType.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.PublicListType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>通用列表类型</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script src="../JS/win.js" type="text/javascript"></script>

    <script src="../JS/template.js" type="text/javascript"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
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
        function changeEditMode() {
            if ($("#selEditMode").val() == 1) {
                $("#tb1").show();
                $("#tb2").hide();
            }
            else {
                $("#tb1").hide();
                $("#tb2").show();
                
            }
        }
        function getfields(menus) {
            $.ajax({
                type: "GET",
                url: "PublicListType.aspx",
                dataType: "text",
                data: { op: "getfields", modelID: $("#TableName").val() },
                success: function(msg) {
                    var args = msg.split("|");

                    $("#spanFields").html(args[0]);

                    $("#Menu").html("<option value=''> --请选择--</option>" + args[1]);
                    if (menus != "") {
                        initMultiSelect(menus);
                    }

                }
            });
        }

        function showDailog(name, type) {
            if (type == 14) {
                openframe({ url: 'SonModel.aspx?name=' + name, width: '500', height: '240' });
            }
            else {
                openframe({ url: 'LableContent.aspx?name=' + name, width: '340', height: '170' });
            }
        }
        function fun_Ok() {

            if (checkOk()) {

                var temptxt = "{HQB_L" + '<%=Request["identification"] %>' + '_' + '<%=Request["lableName"] %>' + " LableType=\"LIST\"";
                //
                $("select").each(function() {

                var o = $(this).attr("multiple") ? checkselect($(this).attr("id")) : $(this).val();
                    
                    if ($(this).parent().is(':visible') && o != "") {
                        if ($(this).attr("id") != "selEditMode" && $(this).attr("name") != "SqlOrder" && $(this).attr("id") != "staticLabel") {
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
                temptxt += "}" ;
                if ($("#selEditMode").val() != 1) {
                    temptxt += $("#txtLableContent").val();
                }
                temptxt += " {/HQB_L" + '<%=Request["identification"] %>' + "}";


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
        function checkselect(objID) {
            var o = document.getElementById(objID);
            var intvalue = "";
            for (i = 0; i < o.options.length; i++) {
                if (o.options[i].selected) {
                    intvalue += o.options[i].value + ",";
                }
            }
            return intvalue.substr(0, intvalue.length - 1);
        }

        function initMultiSelect(menus) {
            menus = menus.split(',');
            var o = document.getElementById("Menu");

            for (var j = 0; j < menus.length; j++) {
                for (i = 0; i < o.options.length; i++) {
                    if (o.options[i].value == menus[j]) {

                        o.options[i].selected = true;
                        break;
                    }

                }

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

            if ($("#selEditMode").val() == "2")  //编辑模式
            {
                if ($.trim($("#txtLableContent").val()) == "") {
                    alert({ msg: "编辑模式的内容不能为空！", title: '提示消息' });
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
            var menus = "";
            while (result = reg.exec(strContent)) {


                switch (result[1]) {

                    case "Container":
                        $("#selEditMode").val("1");  //为配置模式
                        $("#Container").val(result[2]);
                        break;
                    case "Menu":
                        menus = result[2];
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
                    case "IsSubModel":
                        $("#IsSubModel")[0].click();
                        break;
                    default:
                        $("#" + result[1]).val(result[2]);
                        break;
                }

            }
            //            reg = /\{HQB_SYS_LIST(\s*[\w-]+\s*=\s*[""'][^""']+[""']\s*)*\s*\}(.*?)\{\/HQB_SYS_LIST\}/g;
            reg = /\{HQB_L\d+_[^\s}]+(\s*[\w-]+\s*=\s*[""'][^""']+[""']\s*)*\s*\}(.*?)\{\/HQB_L\d+\}/gi;
            strContent = strContent.replace(/\r\n/gm, '::br::');

            var content = reg.exec(strContent)[2];
            if ($.trim(content) != "") {
                content = content.replace(/::br::/gm, '\r\n');
                $("#txtLableContent").val(content);
                $("#selEditMode").val(2);
            }
            changeEditMode();
            getfields(menus);
        }

        $(document).ready(function() {

            if ('<%=Request["id"] %>' == "")  //不为模板配置标签时使用
            {
                var obj = parent.document.getElementById('txtLableContent');
                if (obj.value.indexOf(" LableType=\"LIST\"") != -1 && obj.value.indexOf(" TableName=") != -1 && obj.value.indexOf(" TableName=\"K_U_Commend\"") == -1)  //为通用列表类型
                {
                    SetAttribute(obj.value);
                }
            }
        });
        function selectTemplateFile(contrName) {
            openframe({ title: "选择模板文件", url: "../sysmanage/seltemplate.aspx?contrName=" + contrName, width: '300', height: '300' });
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <table class="edit_tb">
        <tr>
            <td style="width: 120px">
                选择模型
            </td>
            <td>
                <asp:DropDownList ID="TableName" runat="server">
                </asp:DropDownList>
                <font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>
                所属栏目
            </td>
            <td>
                <select style="width: 200px; height: 90px" multiple="multiple" id="Menu">
                </select>
                (不选则为当前发布栏目)
            </td>
        </tr>
        <tr>
            <td>
                文章(或分页）数量
            </td>
            <td>
                <input type="text" id="PageSize" value="10" onkeyup="isNumeric(this)" style="width: 45px"
                    maxlength="2" />
            </td>
        </tr>
        <tr>
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
        <tr>
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
        <tr>
            <td>
                查询条件
            </td>
            <td>
                <input type="text" id="SqlWhere" />
                不要输入where,例如:clickNum>20 AND DATEDIFF(d,AddDate,getdate())<10
            </td>
        </tr>
        <tr>
            <td>
                是否子模型
            </td>
            <td>
                <input type="checkbox" onclick="$('#SubModel').toggle()" id="IsSubModel" />
               是 <span id="SubModel" style="display: none">&nbsp;&nbsp;子模型内容模板：<input type="text" style="width:200px"
                    id="SubModelCTemplate" /> <input type="button" onclick="selectTemplateFile('SubModelCTemplate');" value="浏览..." name=btntemp"/>
                </span>
            </td>
        </tr>
        <tr>
            <td>
                编辑模式
            </td>
            <td>
                <select name="selEditMode" id="selEditMode" onchange="changeEditMode()">
                    <option value="1">配置模式</option>
                    <option value="2">编辑模式</option>
                </select>
            </td>
        </tr>
    </table>
    <table class="edit_tb" id="tb1">
        <tr>
            <td style="width: 130px">
                标题显示字数
            </td>
            <td>
                <input type="text" id="TitleLength" onkeyup="isNumeric(this)" style="width: 45px"
                    maxlength="2" />
            </td>
        </tr>
        <tr>
            <td>
                标题样式
            </td>
            <td>
                <input type="text" id="TitleCssClass" />
            </td>
        </tr>
        <tr>
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
        <tr>
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
                </select>
                    日期样式：<input type="text" id="DataCssClass" />
                </span>
            </td>
        </tr>
        <tr>
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
        <tr>
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
        <tr>
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
        <tr>
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
        <tr>
            <td>
                文章行距
            </td>
            <td>
                <input type="text" id="LineHeight" onkeyup="isNumeric(this)" style="width: 45px"
                    maxlength="2" />
                px
            </td>
        </tr>
        <tr>
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
    <table class="edit_tb" id="tb2" style="display: none">
        <tr>
            <td style="width: 90px">
                模型字段
            </td>
            <td style="line-height: 50px;">
                <span id="spanFields"></span>                
            </td>
        </tr>
        <tr>
            <td colspan="2">
            
            <select style="height: 155px; float:left; width:150px" multiple="multiple" onclick="insertAtCursor($('#txtLableContent'), this.value);" id="staticLabel">
            <option selected="selected">--请选择静态标签--</option>
                    <option value='{$AbsoulteMenuUrl}'>栏目绝对URL</option>
                    <option value='{$RelativeMenuUrl}'>栏目相对URL</option>
                    <option value='{$LoopPageName}'>内容链接地址</option>
                    <option value='{$Target}'>链接打开方式</option>
                    <option value="{$MetaTitle}">页面标题</option>
                    <option value='{$MetaDescription}'>页面描述</option>
                    <option value='{$MetaKeyword}'>页面关键字</option>
                    <option value='{$SiteURL}'>站点URL</option>
                    <option value='{$UploadImg}'>上传图片URL</option>
                    <option value='{$MediasURL}'>上传视频URL</option>
                    <option value='{$FilesURL}'>上传文件URL</option>
                    <option value='{$MenuName NodeCode=""}'>栏目名称</option>
                    <option value='{$MenuURL NodeCode=""}'>栏目路径</option>
                    <option value='{$MenuIntro NodeCode=""}'>栏目描述</option>
                    <option value='{$MenuBanner NodeCode=""}' title='栏目banner图片（flash）'>栏目banner图片（flash）</option>
                    <option value='{$MenuIcon NodeCode=""}'>栏目图标</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;
                <textarea cols="70" rows="10" id="txtLableContent">[HQB.Loop]您要加的内容[/HQB.Loop]
</textarea>
            </td>
        </tr>
    </table>
    <div class="container">
        <div class="Submit" style="text-align: center">
            <input type="button" value="确定" class="subButton" onclick="fun_Ok()" />
            <input type="submit" value="取消" class="subButton" onclick="parent.Closed()" />
        </div>
    </div>
    <asp:Literal ID="ltlJs" runat="server"></asp:Literal>
    </form>
</body>
</html>
