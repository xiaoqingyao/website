<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldEdit.aspx.cs"  ValidateRequest="false" EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Collection.FieldEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>采集字段</title>
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
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/Collection.js"></script>
   <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(pageInitFieldEdit);
    </script>
    <style type="text/css">.container dl dd{margin-right:8px;} .nodt dl{padding-left:50px;}</style>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>位置： <a href="#">信息采集</a> > <a href="#">采集任务</a> > 采集字段编辑</h4> 
        <ul id="tags">
            <li class="selectTag"><a href="javascript:;">基本信息</a> </li>
            <li><a href="javascript:;">文件下载选项</a> </li>
            <li><a href="javascript:;">HTML标签处理</a> </li>
            <li id="SpecialSet"><a href="javascript:;">特殊结果设置</a></li>
        </ul>
        <div id="panel">
         <!--基本信息--> 
        <fieldset>
        <dl>
            <dt>字段别名：</dt>
            <dd><asp:TextBox ID="txtAlias" Width="170" runat="server"></asp:TextBox></dd>
            <dd>所属规则：</dd>
            <dd><asp:DropDownList ID="ddlCollectionRuleID" Width="150" runat="server"></asp:DropDownList></dd>
            <dd></dd>
        </dl>
        <dl>
            <dt></dt>
            <dd>  
                <asp:CheckBox ID="chkIsCycle" Text="循环采集" runat="server" />
                <asp:CheckBox ID="chkIsKeyword" Text="关键字" runat="server" />
                <asp:CheckBox ID="chkIsJoin" Text="需合并" runat="server" />
                <asp:CheckBox ID="chkIsSpecialDeal" Text="特殊结果设置" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>字段名称：</dt>
            <dd><asp:TextBox ID="txtName"  Width="170" runat="server"></asp:TextBox></dd>
            <dd>字段类型：</dd>
            <dd>
                <asp:DropDownList ID="ddlFieldType" Width="150" runat="server">
                    <asp:ListItem Value="1" Text="文本"></asp:ListItem>
                    <asp:ListItem Value="2" Text="备注"></asp:ListItem>
                    <asp:ListItem Value="3" Text="日期"></asp:ListItem>
                    <asp:ListItem Value="4" Text="数字"></asp:ListItem>
                </asp:DropDownList>
            </dd>
            <dd>所属表名：</dd>
            <dd><asp:DropDownList ID="ddlTableName" runat="server"></asp:DropDownList></dd>
        </dl>
        <dl>
            <dt>信息前标志：</dt>
            <dd><asp:TextBox ID="txtStartTag" TextMode="MultiLine" Width="300" Height="80" runat="server"></asp:TextBox></dd>
            <dd>信息后标志：</dd>
            <dd><asp:TextBox ID="txtEndTag"  TextMode="MultiLine" Width="300" Height="80" runat="server"></asp:TextBox></dd>
        </dl>
        </fieldset>
         <!--文件下载选项--> 
        <fieldset style=" display:none;" class="nodt">
            <dl>
                <dd>
                <asp:CheckBox ID="chkIsDownImg" Text="下载图片"  runat="server" />
                <asp:CheckBox ID="chkIsDownFlash" Text="下载Flash" runat="server" />
                <asp:CheckBox ID="chkIsDownOther" Text="下载下载其它文件" runat="server" /> </dd>    
                <dd id="OtherFileType">             
                扩展名：<asp:TextBox ID="txtOtherType"  Width="180"  runat="server"></asp:TextBox> 注：多个扩展名用逗号(,)隔开 如：rar,zip</dd>
            </dl>
            <dl id="ImagePattern">
            <dd >图片抓取规则：</dd>
                <dd><asp:RadioButtonList ID="radlImagePattern" RepeatColumns="5" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem Text="图片标签" Value="1"></asp:ListItem>
                 <asp:ListItem Text="图片地址" Value="2"></asp:ListItem>
                 <asp:ListItem Text="两者" Value="3"></asp:ListItem>
               
            </asp:RadioButtonList>
            </dd>
            </dl>
            
            <div id="FileDownLoadParam">
                <dl>
                    <dd><asp:CheckBox ID="chkIsAlterToAbsolute" Text="链接转换为绝对地址" runat="server" />
                      下载地址必须包含内容： <asp:TextBox ID="txtLinkIncludeContent"   Width="180" runat="server"></asp:TextBox>
                    </dd>
                </dl>
                <dl>
                    <dd>
                        <asp:CheckBox ID="chkIsAlterFileName" Text="改文件名为随机名称" runat="server" />
                        <asp:CheckBox ID="chkIsAlterExt" Text="强制更改扩展名" runat="server" />
                        <asp:DropDownList ID="ddlFileExt" Width="120" runat="server">
                            <asp:ListItem Text="jpg" Value="jpg"></asp:ListItem>
                            <asp:ListItem Text="gif" Value="gif"></asp:ListItem>
                            <asp:ListItem Text="bmp" Value="bmp"></asp:ListItem>
                    </asp:DropDownList>
                    </dd>
                </dl>
            </div>
        </fieldset>  
       <!--Html标签处理-->
        <fieldset style="display:none" class="nodt">
            <dl>
                <dd><input type="radio"name="htmlTag" value="1" <%=tagDealTypeChecked[0] %> id="RemaindAllTag" /><label for="RemaindAllTag">保留所有标记</label> </dd>
                <dd><input type="radio"name="htmlTag" value="2"  <%=tagDealTypeChecked[1] %> id="RemaindPartTag"/><label for="RemaindPartTag">保留部分标记</label> </dd>
                <dd><input type="radio"name="htmlTag"  value="3" <%=tagDealTypeChecked[2] %> id="ClearPartTag" /><label for="ClearPartTag">清除部分标记</label> </dd>
                <dd><input type="radio"name="htmlTag" value="4"   <%=tagDealTypeChecked[3] %> id="ClearAllTag" /><label for="ClearAllTag">清除所有标记</label> </dd>
                <dd><input type="button" id="AddALLLabel" value="全选选中" /></dd>
                <dd><input type="button" id="DelAllLabel" value="全部取消" /></dd>
            </dl>
            <dl>
                <dd>
                 <asp:CheckBoxList ID="chklTags" runat="server" RepeatColumns="6" EnableViewState="false" RepeatDirection="Horizontal" CellSpacing="8"  >
                    <asp:ListItem Value="1" Text="链接< a"></asp:ListItem>
                    <asp:ListItem Value="2" Text="表格< table"></asp:ListItem>
                    <asp:ListItem Value="3" Text="单元行< tr"></asp:ListItem>
                    <asp:ListItem Value="4" Text="单元< td"></asp:ListItem>
                    <asp:ListItem Value="5" Text="段落< p"></asp:ListItem>
                    <asp:ListItem Value="6" Text="字体< font"></asp:ListItem>
                    <asp:ListItem Value="7" Text="层< div"></asp:ListItem>
                    <asp:ListItem Value="8" Text="Span< span"></asp:ListItem>
                    <asp:ListItem Value="9" Text="表格体< tbody"></asp:ListItem>
                    <asp:ListItem Value="10" Text="图像< img"></asp:ListItem>
                    <asp:ListItem Value="11" Text="脚本< script"></asp:ListItem>
                    <asp:ListItem Value="12" Text="加粗< b"></asp:ListItem>
                    <asp:ListItem Value="13" Text="Flash< embed"></asp:ListItem>
                    <asp:ListItem Value="14" Text="居中< center"></asp:ListItem>
                    <asp:ListItem Value="15" Text="换行< br"></asp:ListItem>
                    <asp:ListItem Value="16" Text="空格& nbsp;"></asp:ListItem>
                    <asp:ListItem Value="17" Text="表单< form"></asp:ListItem>
                    <asp:ListItem Value="18" Text="输入< input"></asp:ListItem>
                    <asp:ListItem Value="19" Text="多选< select"></asp:ListItem>
                    <asp:ListItem Value="20" Text="选项< option"></asp:ListItem>
                    <asp:ListItem Value="21" Text="样式< style"></asp:ListItem>
                    <asp:ListItem Value="22" Text="注释< !--"></asp:ListItem>
                     <asp:ListItem Value="23" Text="标题< h"></asp:ListItem>
                    <asp:ListItem Value="24" Text="层标签属性 < div 属性"></asp:ListItem>
                    <asp:ListItem Value="25" Text="段落标签属性 < p 属性"></asp:ListItem>
                    <asp:ListItem Value="26" Text="Span标签属性"></asp:ListItem>
                    <asp:ListItem Value="27" Text="ul标签属性"></asp:ListItem>
                    <asp:ListItem Value="28" Text="li标签属性"></asp:ListItem>
                     <asp:ListItem Value="29" Text="dl标签属性"></asp:ListItem>
                      <asp:ListItem Value="30" Text="dt标签属性"></asp:ListItem>
                       <asp:ListItem Value="31" Text="dd标签属性"></asp:ListItem>
                 
                 </asp:CheckBoxList>           
                </dd>
            </dl>
        </fieldset>    
        <!--特殊处理-->
        <fieldset  style="display:none" class="nodt">
        <dl>
        <dd>
            <asp:radiobuttonlist ID="radlSpecialType" runat="server" RepeatColumns="6" RepeatDirection="Horizontal" CellSpacing="8">
                <asp:ListItem Value="1" Text="记录当前网址"></asp:ListItem>
                <asp:ListItem Value="2" Text="系统时间"></asp:ListItem>
                <asp:ListItem Value="3" Text="GUID"></asp:ListItem>
                <asp:ListItem Value="4" Text="固定字符串"  tag="1"></asp:ListItem>
                <asp:ListItem Value="5" Text="随机字符串" ></asp:ListItem>
                <asp:ListItem Value="6" Text="来源唯一标识" tag="2"></asp:ListItem>
            </asp:radiobuttonlist>
        </dd>
        </dl>
        <dl id="Special_FixCharContent"><dd>字符串内容：<asp:TextBox ID="txtFixCharContent" runat="server"></asp:TextBox></dd></dl>
        <dl id="Special_RuleList"><dd><asp:DropDownList ID="ddlRuleList" Width="150" runat="server"></asp:DropDownList></dd><dd>注：只能设置本层或本层上以的规则。</dd></dl>
        </fieldset>
        </div>
        
        <div class="Submit">
            <asp:Button ID="btnSave" CssClass="subButton" OnClick="Save" runat="server" Text="添 加" />
	        <input class="subButton" type="button" onclick="location.href='FieldList.aspx?ID=<%=TaskID %>'" value="返回" />
            </div>
    </div>
    </form>
    <script type="text/javascript"> <%=jsMessage %></script>
</body>
</html>
