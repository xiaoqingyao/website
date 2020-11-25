<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.TaskEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>采集任务编辑</title>
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
        $(pageInitTaskEdit);
    </script>
    <style type="text/css">.container dl dd{margin-right:8px;} .CollectionAddress  input{margin-bottom:10px;}</style>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
    <h4>位置： <a href="#">信息采集</a> > <a href="#">采集任务编辑</a></h4> 
    <div id="panel">
        <dl>
            <dt>任务名称(：</dt>
            <dd><asp:TextBox ID="txtName" Width="150" CssClass="validate[required]" runat="server"></asp:TextBox>*</dd>
            <dt>英文名称：</dt>
            <dd>
                <asp:TextBox ID="txtEnName" Width="150" runat="server" CssClass="validate[required,regex[[0-9a-zA-Z_]+,只能为字线、下划线或数字]]"></asp:TextBox>
                <input type="button" value="检测是否重复"onclick="checkEnNameRepeat('CheckNameISRepeatMSG')" />
                <span style="color:#ff0000;" id="CheckNameISRepeatMSG"></span>* 
            </dd>
        </dl>
        <dl>
            <dt id="TableNameListHeader">表列：</dt>
            <dd><asp:TextBox ID="txtTableNameList" Width="600" TextMode="MultiLine" Height="36" runat="server"></asp:TextBox><br />注：保存采集信息的表名,只能为字母、下划线或数字,多个表名之间用逗号(,)隔开。</dd>
        </dl>
        <dl>
            <dt>任务简介：</dt>
            <dd><asp:TextBox ID="txtBrief" TextMode="MultiLine" Width="610" Height="80" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>内容编码：</dt>
            <dd>
                <asp:DropDownList ID="ddlEncodeType" runat="server">
                <asp:ListItem Value="UTF-8" Text="UTF-8"></asp:ListItem>
                <asp:ListItem Value="BIG5" Text="BIG5"></asp:ListItem>
                <asp:ListItem Value="GB2312" Text="GB2312"></asp:ListItem>
                <asp:ListItem Value="ISO-8859-1" Text="ISO-8859-1"></asp:ListItem>
                </asp:DropDownList>
            </dd>
            <dd>历史保存：<asp:TextBox ID="txtHistoryHoldDays" Text="30" runat="server"></asp:TextBox> 天</dd>
            <dd>最大下载数量：<asp:TextBox ID="txtMaxDownAmount" Text="0" runat="server"></asp:TextBox> 条 (0 表示不限)</dd>
        </dl>
        <dl>
            <dt><asp:CheckBox ID="chkIsEnabledThread" runat="server" Text="是否启用多线程" /></dt>
            <dd id="ResourceWaitInterval">线程资源等待间隔：<asp:TextBox ID="txtResourceWaitInterval" Text="500" runat="server"></asp:TextBox> 毫秒&nbsp;&nbsp;&nbsp;注：1秒等于1,000 毫秒 </dd>
        </dl>
        <dl>   
            <dd style=" margin-left:50px;">超时设置：<asp:TextBox ID="txtTimeOut" Text="3000" runat="server"></asp:TextBox> 毫秒</dd>
            <dd>超时等待间隔：<asp:TextBox ID="txtWaitInterval" Text="500" runat="server"></asp:TextBox> 毫秒</dd>
            <dd>超时等待次数：<asp:TextBox ID="txtWaitCount" Text="3" runat="server"></asp:TextBox> 次</dd>
        </dl>
        <dl>
            <dt><asp:CheckBox ID="chkIsLogin" onclick="isLoginCollection()"  Text="登录采集" runat="server" /></dt>
            <dd><asp:CheckBox ID="chkIsSaveSpiderFile" Text="是否保存抓取文件" Checked="true" runat="server" /></dd>
            <dd>HTTP请求头：</dd>
            <dd><asp:DropDownList ID="ddlCollectionHttpHeaderConfigID" runat="server"></asp:DropDownList></dd>
        </dl>
        <div id="LoginCollection">
            <dl>
                <dt>登录发送方式：</dt>
                <dd>
                    <asp:DropDownList ID="ddlMethod" runat="server" Width="80">
                        <asp:ListItem Text="Get" Value="Get"></asp:ListItem>
                        <asp:ListItem Text="Post" Value="Post"></asp:ListItem>
                    </asp:DropDownList>
                </dd>
                <dd>登录URL：<asp:TextBox ID="txtLoginUrl" Width="180" runat="server"></asp:TextBox></dd>
                 <dd>登录用户名控件名：<asp:TextBox ID="txtUsernameControl" runat="server"></asp:TextBox></dd>
          </dl>
           <dl>
                <dt>登录用户名：</dt>
                <dd><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></dd>
                <dd>登录密码控件名：<asp:TextBox ID="txtPasswordControl" runat="server"></asp:TextBox></dd>
                <dd>登录密码：<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></dd>
           </dl>
           <dl>
                <dt>登录验证码代码块：</dt>
                <dd><asp:TextBox ID="txtLoginValidate" TextMode="MultiLine" Width="610" Height="60" runat="server"></asp:TextBox></dd>
           </dl>
           <dl>
                <dt>登录所用Cookie：</dt>
                <dd><asp:TextBox ID="txtLoginCookie"  TextMode="MultiLine" Width="610" Height="60" runat="server"></asp:TextBox></dd>
           </dl>
       </div>
    <dl>
        <dt>链接前缀：</dt>
        <dd><asp:TextBox ID="txtUrlPrefix" Width="180" runat="server"></asp:TextBox></dd>
        <dt>图片文件夹：</dt>
        <dd><asp:TextBox ID="txtImgSavePath" Text="Images" CssClass="validate[required]" Width="180" runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>FLASH文件夹：</dt>
        <dd><asp:TextBox ID="txtFlashSavePath" Width="180"  Text="Flash" CssClass="validate[required]" runat="server"></asp:TextBox></dd>
        <dt>其它文件夹：</dt>
        <dd><asp:TextBox ID="txtOtherSavePath"   Width="180" Text="Others" CssClass="validate[required]" runat="server"></asp:TextBox></dd>
    </dl>
    </div>
        
   
    <div class="Submit">
        <asp:Button ID="btnSave" CssClass="subButton" runat="server" OnClick="Save" Text="添 加" />
	    <input class="subButton" type="button" onclick="location.href='TaskList.aspx'" value="返回" />
    </div>
    
    </div>
    <input type="hidden" value="<%=Request.QueryString["TableNameList"] %>"  id="SetTableNameList"/>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
