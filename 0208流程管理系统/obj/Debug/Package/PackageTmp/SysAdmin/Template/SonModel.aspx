<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SonModel.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.SonModel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
    <script src="../JS/template.js" type="text/javascript"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      
        //验证
        function checkOk() {
            if ($.trim($("#index").val()) == "") {
                alert({ msg: "子模型列表模板不能为空！", title: '提示消息' });
                return false;
            }
            if ($.trim($("#content").val()) == "") {
                alert({ msg: "子模型内容模板！", title: '提示消息' });
                return false;
            }
            return true;

        }
        function fun_Ok() {
            if (checkOk()) {
                var fieldName = location.href.substr(location.href.indexOf('=') + 1);
                var str = "{$SubModel(" + fieldName + ",";
                str += $("#index").val() + ",";
                str += $("#content").val() + ")}";
                insertAtCursor(this.parent.$("#txtLableContent"), '' + str + '');
                parent.Closed();
            }
        }
        function selectTemplateFile(contrName) {
            openframe({ title: "选择模板文件", url: "../sysmanage/seltemplate.aspx?contrName=" + contrName, width: '300', height: '140' });
        }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
     <dl>
            <dt style="width: 110px;">子模型列表模板： </dt>
            <dd>
               <input id="index" type="text" style="width:200px" />  <input type="button" onclick="selectTemplateFile('index');" value="浏览..." name=btntemp"/>
            </dd>
        </dl>
        <dl>
            <dt style="width: 110px;">子模型内容模板： </dt>
            <dd>
                <input id="content" type="text"  style="width:200px"/>  <input type="button" onclick="selectTemplateFile('content');" value="浏览..." name=btntemp"/>
            </dd>
        </dl>
       
      
        <div class="Submit">
            <input type="button" value="确定" onclick="fun_Ok()" />
            <input type="button" value="取消" onclick="parent.Closed()" />
        </div>
    </div>
    </form>
</body>
</html>
