<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendAreaPositionEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.RecommendAreaPositionEdit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
   <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script src="../ColorPicker/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="../ColorPicker/colorpicker.js" type="text/javascript"></script> 
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
     <link href="../ColorPicker/colorpicker.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
</script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
<h4>位置： <a href="#">模型管理</a><a> ></a> <a href="#">推荐区域位置编辑</a></h4> 
<dl>
    <dt>区域位置名称：</dt>
    <dd>
    <asp:TextBox ID="txtName" runat="server" CssClass="validate[required]"></asp:TextBox></dd>
</dl>
<dl>
    
    <dt>位置标识：</dt>
    <dd><asp:TextBox ID="txtTags" CssClass="validate[required,length[1,30]]" runat="server"></asp:TextBox></dd>
</dl>
<dl>
    <dt>所属区域：</dt>
    <dd><asp:DropDownList ID="ddlRecommendAreaID" runat="server">
    </asp:DropDownList></dd>
</dl>
<dl>
    <dt>标识显示颜色：</dt>
    <dd>    <input type="text" readonly="readonly" style="width:100px;background-color:<%=fontColor%>;" imagepath="../ColorPicker/imgs/" id="FontColor" name="FontColor" value="<%=fontColor%>" />
            <script type="text/javascript">                $(function initColorPicker() { var myCP1 = new dhtmlXColorPickerInput('FontColor'); myCP1.setImagePath("../ColorPicker/imgs/"); myCP1.init(); }) </script>
</dd>
</dl>
<dl>
    <dt>标识显示样式：</dt>
    <dd>
    <asp:DropDownList ID="ddlFontSylte" runat="server">
    <asp:ListItem Value="" Text="常规"></asp:ListItem>
    <asp:ListItem Text="粗体" Value="font-weight:bold;"></asp:ListItem>
    <asp:ListItem Text="斜体" Value="font-style:italic;"></asp:ListItem>
    </asp:DropDownList></dd>
</dl>
<div class="Submit">
    <asp:Button ID="btnEdit" OnClick="RecommendAreaPosition_Edit" runat="server" Text="添加" />
        <input type="button" onclick="location.href='RecommendAreaPositionList.aspx?ID=<%=areaID %>&SpecialID=<%=SpecialID %>'" value="返回" />
</div>
</div>
    </form>
    <script type="text/javascript"><%=jsMessage%></script>
</body>
</html>
