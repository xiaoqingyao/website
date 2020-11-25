<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="SingleColumn.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SingleColumn" %>
<%@ Register src="../Controls/Editor.ascx" tagname="Editor" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>单页栏目</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link rel="stylesheet" href="../css/template.css" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script> 
    <script type="text/javascript">
        function SelectChange() {
            var count = document.getElementById("ddlCustomContentCount").value;
            for (var i = 2; i <= count; i++) {
                document.getElementById("dlCustom" + i).style.display = "";
            }
            for (var j = parseInt(count) + 1; j < 21; j++) {

                document.getElementById("dlCustom" + j).style.display = "none";
            }
        }
        function replaceEditor(a, b, c) {
            while (a.indexOf(b) != -1) {
                a = a.replace(b, c);
            }
            return a
        }
        function ChangeEditor(i, isChecked) {
            var editorHtml = $("#ddMenuDesc").html();
            var startIndex = editorHtml.toLowerCase().lastIndexOf("<script");
            if (startIndex == -1) {
                startIndex = editorHtml.toLowerCase().indexOf("<iframe");
            }
            else {
                var instance = CKEDITOR.instances["txtCustomContent" + i];
                if (instance) {
                    CKEDITOR.remove(instance);
                }
            }
            editorHtml = editorHtml.substring(startIndex, editorHtml.length);

            if (editorHtml.toLowerCase().indexOf("<iframe") > -1) {
                $("#txtCustomContent" + i).css("display", "none");
            }
            editorHtml = replaceEditor(editorHtml, "Editor1$txtEditorContent", "txtCustomContent" + i);
            editorHtml = replaceEditor(editorHtml, "Editor1", i);

            if (isChecked) {
                $("#dd" + i).html($("#dd" + i).html() + editorHtml);
            }
            else {
                $("#txtCustomContent" + i)[0].style.display = "";
                $("#txtCustomContent" + i)[0].style.visibility = "visible"; ;
                var ddHtml = $("#dd" + i).html();
                startIndex = ddHtml.toLowerCase().lastIndexOf("</textarea") + 11;
                $("#dd" + i).html(ddHtml.substring(0, startIndex));
            }
        }

        var showTotal = 1;
        var type = -1;
        var title = "";
        var errmsg = "";
        var editSelfMenuUrl = "";
        function showMessage() {
            var msgContent = "";
            var jumpurl = "";
            //添加成功
            if (type == 0) {
                msgContent = "添加栏目<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='ColumnManage.aspx?NodeCode=<%=NodeCode%>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='SingleColumn.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续添加</a> | ";
                msgContent += "<a href='" + editSelfMenuUrl + "' style='color:red'>修改本栏目</a>";
                msgContent += "<br>注：3秒钟后自动转到列表页面";
                jumpurl = "ColumnManage.aspx?NodeCode=<%=NodeCode %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 1) {  //修改成功
                msgContent = "修改栏目<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='ColumnManage.aspx<%=StrPageParams %>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='SingleColumn.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续修改</a>";
                if (editSelfMenuUrl != "") {
                    msgContent += " | <a href='" + editSelfMenuUrl + "' style='color:red'>添加新栏目（同级）</a>";
                }
                msgContent += "<br>注：3秒钟后自动转到列表页面";
                jumpurl = "ColumnManage.aspx?NodeCode=<%=NodeCode%>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 2) {  //操作失败
                msgContent = "操作失败,原因如下：<br>";
                msgContent += "<font style='color:green'>" + errmsg + "</font><br>";
                msgContent += "注：10秒钟后提示框自动关闭";
                alert({ msg: msgContent, status: "2", title: "提示信息", time: 10000, width: 400 })
            }
            else if (type == 3) {  //修改成功
                msgContent = "删除栏目<font color=red>" + title + "</font>成功<br>";
                msgContent += "注：3秒钟后自动转到列表页面";
                jumpurl = "ColumnManage.aspx?NodeCode=<%=NodeCode%>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
        }
        window.onload = function() {
            if (type > -1) {
                showMessage();
            }
            for (var i = 1; i < 21; i++) {
                var chk = document.getElementById("chkIsHtmlEditor" + i);
                if (chk.checked) {
                    ChangeEditor(i, true);
                }
                if (showTotal > 1 && i <= showTotal && i > 1) {
                    $("#dlCustom" + i).css("display", "");
                }
            }
        }
        function setAction1(data) {
            if (data == "true") {
                document.getElementById("btnHidAction").click();
            }
        }
        function selectTemplateFile(contrName) {
            openframe({ title: "选择模板文件", url: "seltemplate.aspx?contrName=" + contrName, width: '400', height: '400' });
        }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %> &gt; <span class="breadcrumb_current"> 添加/修改单页栏目</span>
        </h4>
        <div id="con">
            <ul id="tags">
                <li class="selectTag"><a href="javascript:;">基本信息</a> </li>  
                <li><a href="javascript:;">栏目选项</a></li>              
                <li><a href="javascript:;">自设内容</a></li>
            </ul>
            <div id="panel">
            
                <fieldset>
                    <dl>
                        <dt>栏目名称：</dt>
                        <dd>
                           <asp:TextBox ID="txtNodeName" runat="server" CssClass="validate[required,length[1,64]]"></asp:TextBox> <font color=red>*</font>
                           <asp:TextBox ID="txtNodeID" runat="server"  ReadOnly="true" Visible=false BackColor="Gainsboro"></asp:TextBox>
                           <asp:TextBox ID="txtNodeCode" runat="server" Visible=false></asp:TextBox>
                        </dd>
                    </dl>
                    <dl>
                        <dt>英文名称：</dt>
                        <dd><asp:TextBox ID="txtNodelEngDesc" class="validate[required,custom[onlyLetter],length[0,64]] text-input" runat="server"></asp:TextBox> <font color=red>*</font></dd>
                    </dl> 
                    <dl>
                        <dt>是否父节点(只有父节点下才能包含子节点，父节点不能属于某个模块)：</dt>
                        <dd> 
                            <asp:CheckBox ID="chkIsFolder" runat="server" Text="是" />
                        </dd>
                    </dl>
                    <dl style="display:none">
                        <dt>所属模块：</dt>
                        <dd><%--<asp:DropDownList ID="ddlModel" runat="server" AutoPostBack="true"></asp:DropDownList>--%>
                        <select name="ddlModel"><option value="9a132b3b-c0f6-4951-892c-0cd87ad2ff39">单页内容管理</option></select>
                        </dd>
                    </dl>
                    <dl>
                        <dt>是否生成HTML：</dt>
                        <dd>
                        <asp:RadioButton ID="radCreateContentPageFalse" runat="server" Checked=true Text="生成HTML" GroupName="IsCreateContentPage" /><br>
                        <asp:RadioButton ID="radCreateContentPageTrue" runat="server" Text="不生成HTML，使用动态页方式" GroupName="IsCreateContentPage" />
                        </dd>          
                    </dl>  
                    <dl>
                        <dt>单页模板：</dt>
                        <dd><asp:TextBox Width=280 ID="txtDefaultTemplate" runat="server"></asp:TextBox> <input type="button" class="subButton" onclick="selectTemplateFile('txtDefaultTemplate')" value="选择模板..." /> (例如：/内容页模板/默认文章内容页模板.html)</dd>          
                    </dl>
                    <dl>
                        <dt>栏目Meta关键字(针对搜索引擎设置的关键词。多个关键词请用,号分隔)：</dt>
                        <dd><asp:TextBox ID="txtKeyWords" Width=500 Height=60 TextMode=MultiLine runat="server"></asp:TextBox></dd>
                    </dl>
                    <dl>
                        <dt>栏目Meta说明(针对搜索引擎设置的网页描述。多个描述请用,号分隔)：</dt>
                        <dd><asp:TextBox ID="txtMetaDesc" Width=500 Height=60 TextMode=MultiLine runat="server"></asp:TextBox> </dd>                                                            
                    </dl>
                    
                    <dl>
                        <dt> 排序号：</dt>
                        <dd><asp:TextBox ID="txtNodelOrder" runat="server"  CssClass="validate[required,custom[onlyNumber],length[0,3]] text-input" Text="0" Width="50px"></asp:TextBox></dd>
                    </dl>
                    <div style="clear:left"></div>
                 </fieldset>                    
                <fieldset style="display: none;">
                <dl>
                        <dt>单页提示：</dt>
                        <dd><asp:TextBox ID="txtTips" Width=200 runat="server"></asp:TextBox>(鼠标移至栏目名称上时将显示设定的提示文字（不支持HTML）)</dd>
                    </dl>
                <dl>
                        <dt>自定义链接：</dt>
                        <dd><asp:TextBox ID="txtLinkURL" runat="server" Width="231px"></asp:TextBox>&nbsp;默认为空</dd>
                    </dl>
                    <dl>
                        <dt>栏目Banner：</dt>
                        <dd><asp:TextBox ID="txtBanner" runat="server" Width="252px"></asp:TextBox> <input type="button" id="Button4" value="上传" runat="server" Class="subButton" onclick="InputFile('theForm','txtBanner','image',1,'jpg|gif|bmp|png|swf|flv');" /></dd>
                    </dl>
                    <dl>
                        <dt>栏目图标(如果前台栏目导航选择图片方式，则需上传，下同)：</dt>
                        <dd><asp:TextBox ID="txtNodelIcon" runat="server" Width="252px"></asp:TextBox> <input type="button" id="Button3" value="上传" runat="server" Class="subButton" onclick="InputFile('theForm','txtNodelIcon','image',1,'jpg|gif|bmp|png');" /></dd>
                    </dl>
                    <dl>
                        <dt>当前栏目图标：</dt>
                        <dd><asp:TextBox ID="txtCurrentImg" runat="server" Width="252px"></asp:TextBox> <input type="button" id="Button1" value="上传" runat="server" Class="subButton" onclick="InputFile('theForm','txtCurrentImg','image',1,'jpg|gif|bmp|png');" /></dd>
                    </dl>
                    <dl>
                        <dt>鼠标移上去图标（鼠标移上去图标与当前栏目图标一样，则不必上传）：</dt>
                        <dd><asp:TextBox ID="txtMouseOverImg" runat="server" Width="252px"></asp:TextBox> <input type="button" id="Button2" value="上传" runat="server" Class="subButton" onclick="InputFile('theForm','txtMouseOverImg','image',1,'jpg|gif|bmp|png');" /></dd>
                    </dl>
                    <dl>
                        <dt>打开方式：</dt>
                        <dd><asp:RadioButton ID="radSelf" runat="server" Text="在原窗口打开" GroupName="OpenType" Checked="true" /><asp:RadioButton ID="radNew" runat="server" Text="在新窗口打开" GroupName="OpenType" /></dd>          
                    </dl>
                    
                    <dl style="display:none">
                        <dt>列表页后缀：</dt>
                        <dd>
                        <asp:DropDownList ID="ddlListPagePostFix" runat="server">
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem Value="html">html</asp:ListItem>
                            <asp:ListItem Value="htm">htm</asp:ListItem>
                            <asp:ListItem Value="shtml">shtml</asp:ListItem>
                            <asp:ListItem Value="shtm">shtm</asp:ListItem>
                        </asp:DropDownList>
                        </dd>          
                    </dl>
                    
                    <dl>
                        <dt>左边菜单栏显示：</dt>
                        <dd>    
                            <asp:CheckBox ID="chkIsLeftDisplay" runat="server" Checked=true Text="是" />（默认为是）
                        </dd>
                    </dl>  
                    <dl>
                        <dt>前台头部栏目显示：</dt>
                        <dd>    
                            <asp:CheckBox ID="chkIsTopMenuShow" runat="server" Checked=true Text="是" />（默认为是）
                        </dd>
                    </dl>
                    <dl>
                        <dt>前台左边栏目显示：</dt>
                        <dd>    
                            <asp:CheckBox ID="chkIsLeftMenuShow" runat="server" Checked=true Text="是" />（默认为是）
                        </dd>
                    </dl>        
                    <dl>
                        <dt>是否有效：</dt>
                        <dd><asp:RadioButtonList ID="RBL_IsValid" runat="server" Height="16px" RepeatDirection=Horizontal
                                          Width="124px">
                                          <asp:ListItem Value="0">禁用</asp:ListItem>
                                          <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                      </asp:RadioButtonList></dd>
                    </dl>
                    <dl>
                        <dt>栏目说明：</dt>
                        <dd id="ddMenuDesc">
                        <uc1:Editor ID="Editor1" runat="server" width=700 height="150" EditorType=1/>
                        </dd>
                    </dl>
                </fieldset>            
                 
                 
                <fieldset style="display: none;">
                    <dl>
                        <dt>自设内容项目数：</dt>
                        <dd><asp:DropDownList ID="ddlCustomContentCount" runat="server" onChange="SelectChange();"></asp:DropDownList></dd>
                     </dl>
                     <dl>
                        <dt>自设内容1：<br /><input type="checkbox" id="chkIsHtmlEditor1" value="1" name="chkIsHtmlEditor1" onclick="ChangeEditor(1,this.checked)" runat="server"/><label for="chkIsHtmlEditor1">支持HTML</label></dt>
                        <dd id="dd1"><asp:TextBox Width="600" Height="150" ID="txtCustomContent1" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom2" style="display:none">
                        <dt>自设内容2：<br /><input type="checkbox" id="chkIsHtmlEditor2" value="1" name="chkIsHtmlEditor2" onclick="ChangeEditor(2,this.checked)" runat="server"/><label for="chkIsHtmlEditor2">支持HTML</label></dt>
                        <dd id="dd2"><asp:TextBox Width="600" Height="150" ID="txtCustomContent2" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom3" style="display:none">
                        <dt>自设内容3：<br /><input type="checkbox" id="chkIsHtmlEditor3" value="1" name="chkIsHtmlEditor3" onclick="ChangeEditor(3,this.checked)" runat="server"/><label for="chkIsHtmlEditor3">支持HTML</label></dt>
                        <dd id="dd3"><asp:TextBox Width="600" Height="150" ID="txtCustomContent3" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom4" style="display:none">
                        <dt>自设内容4：<br /><input type="checkbox" id="chkIsHtmlEditor4" value="1" name="chkIsHtmlEditor4" onclick="ChangeEditor(4,this.checked)" runat="server"/><label for="chkIsHtmlEditor4">支持HTML</label></dt>
                        <dd id="dd4"><asp:TextBox Width="600" Height="150" ID="txtCustomContent4" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom5" style="display:none">
                        <dt>自设内容5：<br /><input type="checkbox" id="chkIsHtmlEditor5" value="1" name="chkIsHtmlEditor5" onclick="ChangeEditor(5,this.checked)" runat="server"/><label for="chkIsHtmlEditor5">支持HTML</label></dt>
                        <dd id="dd5"><asp:TextBox Width="600" Height="150" ID="txtCustomContent5" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom6" style="display:none">
                        <dt>自设内容6：<br /><input type="checkbox" id="chkIsHtmlEditor6" value="1" name="chkIsHtmlEditor6" onclick="ChangeEditor(6,this.checked)" runat="server"/><label for="chkIsHtmlEditor6">支持HTML</label></dt>
                        <dd id="dd6"><asp:TextBox Width="600" Height="150" ID="txtCustomContent6" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom7" style="display:none">
                        <dt>自设内容7：<br /><input type="checkbox" id="chkIsHtmlEditor7" value="1" name="chkIsHtmlEditor7" onclick="ChangeEditor(7,this.checked)" runat="server"/><label for="chkIsHtmlEditor7">支持HTML</label></dt>
                        <dd id="dd7"><asp:TextBox Width="600" Height="150" ID="txtCustomContent7" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom8" style="display:none">
                        <dt>自设内容8：<br /><input type="checkbox" id="chkIsHtmlEditor8" value="1" name="chkIsHtmlEditor8" onclick="ChangeEditor(8,this.checked)" runat="server"/><label for="chkIsHtmlEditor8">支持HTML</label></dt>
                        <dd id="dd8"><asp:TextBox Width="600" Height="150" ID="txtCustomContent8" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom9" style="display:none">
                        <dt>自设内容9：<br /><input type="checkbox" id="chkIsHtmlEditor9" value="1" name="chkIsHtmlEditor9" onclick="ChangeEditor(9,this.checked)" runat="server"/><label for="chkIsHtmlEditor9">支持HTML</label></dt>
                        <dd id="dd9"><asp:TextBox Width="600" Height="150" ID="txtCustomContent9" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom10" style="display:none">
                        <dt>自设内容10：<br /><input type="checkbox" id="chkIsHtmlEditor10" value="1" name="chkIsHtmlEditor10" onclick="ChangeEditor(10,this.checked)" runat="server"/><label for="chkIsHtmlEditor10">支持HTML</label></dt>
                        <dd id="dd10"><asp:TextBox Width="600" Height="150" ID="txtCustomContent10" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom11" style="display:none">
                        <dt>自设内容11：<br /><input type="checkbox" id="chkIsHtmlEditor11" value="1" name="chkIsHtmlEditor11" onclick="ChangeEditor(11,this.checked)" runat="server"/><label for="chkIsHtmlEditor11">支持HTML</label></dt>
                        <dd id="dd11"><asp:TextBox Width="600" Height="150" ID="txtCustomContent11" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom12" style="display:none">
                        <dt>自设内容12：<br /><input type="checkbox" id="chkIsHtmlEditor12" value="1" name="chkIsHtmlEditor12" onclick="ChangeEditor(12,this.checked)" runat="server"/><label for="chkIsHtmlEditor12">支持HTML</label></dt>
                        <dd id="dd12"><asp:TextBox Width="600" Height="150" ID="txtCustomContent12" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom13" style="display:none">
                        <dt>自设内容13：<br /><input type="checkbox" id="chkIsHtmlEditor13" value="1" name="chkIsHtmlEditor13" onclick="ChangeEditor(13,this.checked)" runat="server"/><label for="chkIsHtmlEditor13">支持HTML</label></dt>
                        <dd id="dd13"><asp:TextBox Width="600" Height="150" ID="txtCustomContent13" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom14" style="display:none">
                        <dt>自设内容14：<br /><input type="checkbox" id="chkIsHtmlEditor14" value="1" name="chkIsHtmlEditor14" onclick="ChangeEditor(14,this.checked)" runat="server"/><label for="chkIsHtmlEditor14">支持HTML</label></dt>
                        <dd id="dd14"><asp:TextBox Width="600" Height="150" ID="txtCustomContent14" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom15" style="display:none">
                        <dt>自设内容15：<br /><input type="checkbox" id="chkIsHtmlEditor15" value="1" name="chkIsHtmlEditor15" onclick="ChangeEditor(15,this.checked)" runat="server"/><label for="chkIsHtmlEditor15">支持HTML</label></dt>
                        <dd id="dd15"><asp:TextBox Width="600" Height="150" ID="txtCustomContent15" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom16" style="display:none">
                        <dt>自设内容16：<br /><input type="checkbox" id="chkIsHtmlEditor16" value="1" name="chkIsHtmlEditor16" onclick="ChangeEditor(16,this.checked)" runat="server"/><label for="chkIsHtmlEditor16">支持HTML</label></dt>
                        <dd id="dd16"><asp:TextBox Width="600" Height="150" ID="txtCustomContent16" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom17" style="display:none">
                        <dt>自设内容17：<br /><input type="checkbox" id="chkIsHtmlEditor17" value="1" name="chkIsHtmlEditor17" onclick="ChangeEditor(17,this.checked)" runat="server"/><label for="chkIsHtmlEditor17">支持HTML</label></dt>
                        <dd id="dd17"><asp:TextBox Width="600" Height="150" ID="txtCustomContent17" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom18" style="display:none">
                        <dt>自设内容18：<br /><input type="checkbox" id="chkIsHtmlEditor18" value="1" name="chkIsHtmlEditor18" onclick="ChangeEditor(18,this.checked)" runat="server"/><label for="chkIsHtmlEditor18">支持HTML</label></dt>
                        <dd id="dd18"><asp:TextBox Width="600" Height="150" ID="txtCustomContent18" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom19" style="display:none">
                        <dt>自设内容19：<br /><input type="checkbox" id="chkIsHtmlEditor19" value="1" name="chkIsHtmlEditor19" onclick="ChangeEditor(19,this.checked)" runat="server"/><label for="chkIsHtmlEditor19">支持HTML</label></dt>
                        <dd id="dd19"><asp:TextBox Width="600" Height="150" ID="txtCustomContent19" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                    <dl id="dlCustom20" style="display:none">
                        <dt>自设内容20：<br /><input type="checkbox" id="chkIsHtmlEditor20" value="1" name="chkIsHtmlEditor20" onclick="ChangeEditor(20,this.checked)" runat="server"/><label for="chkIsHtmlEditor20">支持HTML</label></dt>
                        <dd id="dd20"><asp:TextBox Width="600" Height="150" ID="txtCustomContent20" runat="server" TextMode="MultiLine"></asp:TextBox></dd>          
                    </dl>
                     
                    <div style="clear:left"></div>
                 </fieldset>
            </div>
            <div class="Submit">
                <asp:Button ID="btnHidAction" runat="server" OnClick="btnDel_Click" style="display:none" />
                <asp:Button ID="btnEdit" runat="server" CssClass="subButton" Text="<%$Resources:Common,Add %>" OnClick="btnEdit_Click" />
                <asp:Button ID="btnDel" runat="server" CssClass="subButton" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction1(data)}});return false;"/>
                <input type="button" name="Submit422" Class="subButton" value="<%= Resources.Common.Back %>" onclick='location.href="ColumnManage.aspx?NodeCode=<%=NodeCode%>";'>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
