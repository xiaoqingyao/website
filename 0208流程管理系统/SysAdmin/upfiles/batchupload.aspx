<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="batchupload.aspx.cs" Inherits="AllPower.WEB.SysAdmin.upfiles.batchupload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>文件管理 - 编辑文本类文件</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <style type="text/css">
    .cRed,.cRed:visited,.cRed a,a.cRed:hover{color:#0000FF;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h4>
            位置： 文件批量上传
        </h4>
        <div id="searchContainer" style="height:25px;">
            <span style="float:left; line-height:25px;">
                <asp:Label runat="server" ID="lblPathTips"></asp:Label>
            </span>
        </div>
        <div class="function" style="height:10px;">        
        </div>
        <ul class="ulheader">
            <li style="width: 100%">说　明：<asp:Label runat="server" ID="lblObjectPath"></asp:Label> <br />
            缩略图： <input type="checkbox" id="isslt" name="isslt" value="1"/></li> 宽：
            <input type="text" id="txtThumbWidth" name="txtThumbWidth" runat="server" size="4" maxlength="4"/>
            高：<input type="text" id="txtTumbHeight" name="txtTumbHeight" runat="server" size="4" maxlength="4"/>
            <input type="hidden" id="hidNum" name="hidNum" value="10" />
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件1：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title1" id="title1" size="12" />
            说明：<input type="text" name="intro1" id="intro1" size="40" />
            <input type="file" name="file1" id="file1" size="20" runat="server"/>
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件2：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title2" id="title2" size="12" />
            说明：<input type="text" name="intro2" id="intro2" size="40" />
            <input type="file" name="file2" id="file2" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件3：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title3" id="title3" size="12" />
            说明：<input type="text" name="intro3" id="intro3" size="40" />
            <input type="file" name="file3" id="file3" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件4：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title4" id="title4" size="12" />
            说明：<input type="text" name="intro4" id="intro4" size="40" />
            <input type="file" name="file4" id="file4" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件5：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title5" id="title5" size="12" />
            说明：<input type="text" name="intro5" id="intro5" size="40" />
            <input type="file" name="file5" id="file5" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件6：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title6" id="title6" size="12" />
            说明：<input type="text" name="intro6" id="intro6" size="40" />
            <input type="file" name="file6" id="file6" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件7：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title7" id="title7" size="12" />
            说明：<input type="text" name="intro7" id="intro7" size="40" />
            <input type="file" name="file7" id="file7" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件8：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title8" id="title8" size="12" />
            说明：<input type="text" name="intro8" id="intro8" size="40" />
            <input type="file" name="file8" id="file8" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件9：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title9" id="title9" size="12" />
            说明：<input type="text" name="intro9" id="intro9" size="40" />
            <input type="file" name="file9" id="file9" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:22px;">文件10：</li><li style="width:88%;height:22px;">
            标题：<input type="text" name="title10" id="title10" size="12" />
            说明：<input type="text" name="intro10" id="intro10" size="40" />
            <input type="file" name="file10" id="file10" size="20" runat="server" />
            </li>
        </ul>
        <ul class="ulheader ulbody" style="height:30px;">
            <li style="width: 10%;"></li>
            <li style="width:80%; height:30px;"><asp:Button runat="server" ID="btnSubmit" Text="<%$Resources:Common,Update %>" onclick="btnSubmit_Click" />   
                <asp:Button runat="server" ID="btnBack" Text="返回" onclick="btnBack_Click"/></li>
        </ul>
        <span class="function fr">
        </span>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
