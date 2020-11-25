<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberModelFieldEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.MemberModelFieldEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
      <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../js/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../js/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../js/Common.js" type="text/javascript"></script>

    <script src="../js/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/BusinessField.js"></script>

    <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>

     <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript">
     $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>    
</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">会员模型</a><a> &gt;</a> <span class="breadcrumb_current">
                添加/修改自定义字段</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>选择类别： </dt>
                    <dd>
                        <asp:DropDownList ID="ddlMemberModel" runat="server" Enabled="false">
                        </asp:DropDownList>
                    </dd>
                </dl>
                <dl>
                    <dt>字段中文名称： </dt>
                    <dd>
                        <asp:TextBox ID="txtCName" runat="server" MaxLength="50"></asp:TextBox>
                        &nbsp;
                        <%--<asp:RequiredFieldValidator ID="f_menuName" runat="server" ControlToValidate="txtCName" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)请填

写字段中文名称,长度不能超过50个字符!</span>"></asp:RequiredFieldValidator>&nbsp;<span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help

('Def_Table_001',this)">帮助</span><dd>
   --%>
                    </dd>
                </dl>
                <dl>
                    <dt>字段名(英文名)： </dt>
                    <dd>
                        <asp:TextBox ID="txtEName" MaxLength="50" runat="server"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ErrorMessage="英文名称必须是英文或数字及下划线!" ControlToValidate="txtEName" Display="Dynamic"
                            SetFocusOnError="True" ValidationExpression="^[a-zA-Z_0-9__]+$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEName"
                            Display="Dynamic" ErrorMessage="<span class='reshow'>(*)请填写字段英文名称,长度不能超过50个字符!</span>"></asp:RequiredFieldValidator>
                    </dd>
                </dl>
                <dl id="ctype">
                    <dt>控件类型：</dt>
                    <dd>
                        <asp:DropDownList ID="ddlFieldType"  runat="server" onclick="BusinessField.shows(this.id,1)" >
                        </asp:DropDownList></dd>
                </dl>
                <dl id="hDate" >
                    <dt>日期格式：</dt>
                    <dd>
                        <asp:RadioButtonList ID="rblDateFormat" runat="server" RepeatDirection="Horizontal"
                            ToolTip="长日期带小时分秒；短日期不带；中文日期格式为2010年5月10日形式">
                            <asp:ListItem Value="0" Selected="True">长日期</asp:ListItem>
                            <asp:ListItem Value="1">短日期</asp:ListItem>
                            <asp:ListItem Value="2">中文格式</asp:ListItem>
                        </asp:RadioButtonList>
                        &nbsp<font color="red">*长日期带”小时分秒“，短日期不带；中文日期格式为2010年5月10日形式</font></dd>
                </dl>
                <dl id="hImage">
                    <dt>图片扩展名：</dt>
                    <dd>
                        <asp:TextBox ID="txtImage" runat="server"></asp:TextBox>
                        &nbsp<font color="red">*允许多个类型请用“|”号分割，如：jpg|gif</font></dd>
                </dl>
                <dl id="hFile">
                    <dt>文件扩展名：</dt>
                    <dd>
                        <asp:TextBox ID="txtFile" runat="server"></asp:TextBox>
                        &nbsp;<font color="red">*允许多个类型请用“|”号分割，如：txt|rar</font></dd>
                </dl>
                <dl id="hVol">
                    <dt>允许大小：</dt>
                    <dd>
                        <asp:TextBox ID="txtMaxSize" runat="server"></asp:TextBox>
                        <b>KB</b></dd>
                </dl>
                <dl id="hLink">
                    <dt>链接目标：</dt>
                    <dd>
                        <asp:TextBox ID="txtTagret" runat="server" Width="749px"></asp:TextBox>
                        <font color="red">*href的值</font></dd>
                </dl>
                <dl id="hLinkText">
                    <dt>链接文字：</dt>
                    <dd>
                        <asp:TextBox ID="txtLink" runat="server" Width="424px"></asp:TextBox>
                        &nbsp;<font color="red">*链接静态文本</font></dd>
                </dl>
                <dl id="citems">
                    <dt>字段选项：</dt>
                    <dd>
                        <asp:TextBox ID="txtOptionValue" runat="server" TextMode="MultiLine" Height="134px"
                            Width="470px"></asp:TextBox>
                        &nbsp;<font color="red">*输入格式须为键值对(值|文本)逗号分隔 ，如：0|星期一,1|星期五...</font></dd>
                </dl>
                <dl id="cdefault">
                    <dt>字段默认值：</dt>
                    <dd>
                        <asp:TextBox ID="txtDefaultValue" runat="server" Width="551px"></asp:TextBox>
                        &nbsp;<font color="red">*如是单选、多选、下拉列表的“键值对”格式为键列表逗号分隔</font></dd>
                </dl>
                <dl id="xheight">
                    <dt>控件高：</dt>
                    <dd>
                        <asp:TextBox ID="txtHeight" runat="server"></asp:TextBox>
                    </dd>
                </dl>
                <dl id="xwdith">
                    <dt>控件宽：</dt>
                    <dd>
                        <asp:TextBox ID="txtWidth" runat="server"></asp:TextBox>
                    </dd>
                </dl>
                <dl id="xrows">
                    <dt>控件行数：</dt>
                    <dd>
                        <asp:TextBox ID="txtSize" runat="server"></asp:TextBox>
                    </dd>
                </dl>
                <dl id="xlength">
                    <dt>允许内容长度：</dt>
                    <dd>
                        <asp:TextBox ID="txtLength" runat="server"></asp:TextBox>
                        <font color="red">*限制文本内容的长度字符数</font></dd>
                </dl>
                <dl id="cjs">
                    <dt>JS代码：</dt>
                    <dd>
                        <asp:TextBox ID="txtJS" runat="server" Height="42px" Width="551px"></asp:TextBox>
                        <font color="red">*javascript代码如：onclick=function(...)</font></dd>
                </dl>
                <dl id="ccss">
                    <dt>CSS代码：</dt>
                    <dd>
                        <asp:TextBox ID="txtCSS" runat="server" Height="26px" Width="158px"></asp:TextBox>
                        <font color="red">*css类名，不含逗号；亦可输jquery验证代码如css=validate[required,length[1,20]]</font></dd>
                </dl>
                <dl id="cstyle">
                    <dt>Style代码：</dt>
                    <dd>
                        <asp:TextBox ID="txtStyle" runat="server" Width="681px" Height="23px"></asp:TextBox>
                        <font color="red">*优先级大于css，格式为键值对如 font:red</font></dd>
                </dl>
                <dl>
                    <dt>字段名说明：</dt>
                    <dd>
                        <asp:TextBox ID="txtTip" runat="server" TextMode="MultiLine" Width="400px" Height="55px"></asp:TextBox>
                        &nbsp;<font color="red">*显示在字段之后</font></dd>
                </dl>
                <dl>
                    <dt>是否启用：</dt>
                    <dd>
                        <asp:CheckBox ID="chkEnable" Checked="true" runat="server" Text="是否启用" /><asp:HiddenField
                            ID="hiOrders" runat="server" />
                    </dd>
                </dl>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="<%$Resources:Common,Add %>"  CssClass="subButton"  />
            <input type="button" name="Submit422" value="<%= Resources.Common.Back %>"
                onclick='location.href="MemberModelFieldList.aspx<%=StrPageParams %>";' class="subButton"/>
        </div>
    </div>
    </form>
</body>
</html>
