<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false"  CodeBehind="OutLinkColumn.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.OutLinkColumn" %>
<%@ Register src="../Controls/Editor.ascx" tagname="Editor" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>外部链接栏目</title>
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
    <script language="javascript" type="text/javascript">
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
                msgContent += "<a href='OutLinkColumn.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续添加</a> | ";
                msgContent += "<a href='" + editSelfMenuUrl + "' style='color:red'>修改本栏目</a>";
                msgContent += "<br>注：3秒钟后自动转到列表页面";
                jumpurl = "ColumnManage.aspx?NodeCode=<%=NodeCode %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 1) {  //修改成功
                msgContent = "修改栏目<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='ColumnManage.aspx<%=StrPageParams %>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='OutLinkColumn.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续修改</a>";
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

        }
        function setAction1(data) {
            if (data == "true") {
                document.getElementById("btnHidAction").click();
            }
        }
    </script> 
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a> &gt; <a href="#">栏目管理</a> &gt; <span class="breadcrumb_current"> 添加/修改外部链接栏目</span>
        </h4>
        <div id="con">
            <ul id="tags">
                <li class="selectTag"><a href="javascript:;">基本信息</a> </li>  
                <li><a href="javascript:;">栏目选项</a></li>              
            </ul>
            <div id="panel">
                <fieldset>
                    <dl>
                        <dt>栏目名称：</dt>
                        <dd>
                           <asp:TextBox ID="txtNodeName" runat="server" CssClass="validate[required,length[1,30]]"></asp:TextBox> <font color=red>*</font>
                           <asp:TextBox ID="txtNodeID" runat="server"  ReadOnly="true" Visible=false BackColor="Gainsboro"></asp:TextBox>
                           <asp:TextBox ID="txtNodeCode" runat="server" Visible=false></asp:TextBox>
                        </dd>
                    </dl>
                    <dl>
                        <dt>英文名称：</dt>
                        <dd><asp:TextBox ID="txtNodelEngDesc" class="validate[required,custom[onlyLetter],length[0,20]] text-input" runat="server"></asp:TextBox> <font color=red>*</font></dd>
                    </dl>
                    <dl>
                        <dt>自定义链接：</dt>
                        <dd><asp:TextBox ID="txtLinkURL" runat="server" Width="300px" CssClass="validate[required,regex[\s*https?://([^.]+\.)+[^/]+/?.*, 请输入有效的网址]]"></asp:TextBox> <font color=red>*</font></dd>
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
                <fieldset style="display:none">
                    <dl>
                        <dt>外部链接提示：</dt>
                        <dd><asp:TextBox ID="txtTips" Width=200 runat="server"></asp:TextBox>(鼠标移至栏目名称上时将显示设定的提示文字（不支持HTML）)</dd>
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
