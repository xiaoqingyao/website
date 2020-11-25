<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailPageType.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.DetailPageType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  
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
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
  <script src="../JS/template.js" type="text/javascript"></script>
    <title>详细内容类型</title>

    <script type="text/javascript">
        function getFields(obj) {
            $.ajax({
                type: "GET",
                url: "PublicListType.aspx",
                dataType: "text",
                data: { op: "getfields", modelID: obj },
                beforeSend: function(XMLHttpRequest) {

                    //Pause(this,100000);
                },
                success: function(msg) {

                    var args = msg.split("|");
                    $("#tdFields").html(args[0]);
                  

                },
                complete: function(XMLHttpRequest, textStatus) {
                    //隐藏正在查询图片
                },
                error: function() {
                    //错误处理
                    alert('错');
                }
            });

        }
        function fun_Ok() {
            var temptxt = "{HQB_L" + '<%=Request["identification"] %>' + '_' + '<%=Request["lableName"] %>' + " LableType=\"CONTENT\"}";

            if ($.trim($("#txtLableContent").val()) != "") {
                temptxt += $("#txtLableContent").val();
            }
            else {
                alert({ msg: '内容不能为空！', title: '提示信息' })
                return;
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

        function showDailog(name) {

            openframe({ url: 'LableContent.aspx?name=' + name, width: '340', height: '170' });
        }
        function SetAttribute(strContent) {
            //            reg = /\{HQB_SYS_CONTENT(\s*[\w-]+\s*=\s*[""'][^""']+[""']\s*)*\s*\}(.*?)\{\/HQB_SYS_CONTENT\}/g;
            reg = /\{HQB_L\d+_[^\s}]+(\s*[\w-]+\s*=\s*[""'][^""']+[""']\s*)*\s*\}(.*?)\{\/HQB_L\d+\}/gi;
            strContent = strContent.replace(/\r\n/gm, '::br::');
            var content = reg.exec(strContent)[2];
            if ($.trim(content) != "") {
                content = content.replace(/::br::/gm, '\r\n');
                $("#txtLableContent").val(content);
        
            }
        }
        $(document).ready(function() {
            var obj = parent.document.getElementById('txtLableContent');
            if ('<%=Request["id"] %>' == "")  //不为模板配置标签时使用
            {
                if (obj.value.indexOf(" LableType=\"CONTENT\"") != -1)  //为详细页面类型
                {
                    SetAttribute(obj.value);
                }
            }
        });
    </script>

</head>
<style>
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
</style>
<body>
    <form id="theForm" runat="server">
    <table class="edit_tb">
        <tr>
            <td style="width:80px">
                选择模型
            </td>
            <td>
                <asp:DropDownList ID="TableName" runat="server">
                </asp:DropDownList>
            </td>
        </tr>        
        <tr>
        <td>模型字段</td>
            <td style="white-space:normal; width:360px">
            <span id="tdFields"></span>            
              
            </td>
        </tr>
        <tr>
            <td colspan="2">
             <select style="height: 155px; float:left; width:140px" multiple="multiple" onclick="insertAtCursor($('#txtLableContent'), this.value);" id="staticLabel">
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
                <textarea cols="60" rows="10" id="txtLableContent"></textarea>
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
