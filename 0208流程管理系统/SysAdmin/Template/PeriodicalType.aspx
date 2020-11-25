<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PeriodicalType.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.PeriodicalType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  <title>期刊标签参数</title>
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
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

   <script type="text/javascript" src="../js/win.js"></script>
 <script src="../JS/template.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function setContent(str, index) {
            //IE
            if (document.selection) {
                $("#txtname").focus();
                var tarobj = document.selection.createRange();
                tarobj.text = str;
            }
            else {
                var tclen = $("#txtname").val().length;
                var value = $("#txtname").val();
                $("#txtname").val(value.substr(0, $("#txtname")[0].selectionStart) + str + value.substring($("#txtname")[0].selectionStart, tclen));
            }
        }
        function fun_Ok() {

            if (checkOk()) {
                var str = "{HQB_L" + '<%=Request["identification"] %>' + '_' + '<%=Request["lableName"] %>' + " LableType=\"Periodical\" ContentTemplate=\"" + $("#ContentTemplate").val() + "\"}" + getLayer() + " {/HQB_L" + '<%=Request["identification"] %>' + "}";
     
                if ('<%=Request["id"] %>' == '') {
                    this.parent.document.getElementById('txtLableContent').value = str;
                }
                else {
                    var obj=this.parent.document.getElementById('txtLableContent');
                    insertAtCursorByStart(obj, str, this.parent.document.getElementById("hidStart").value);
                }
                parent.Closed();
            }

        }
        function getLayer() {

            num = "    ";
            var levstr = " \r\n" + num + "[HQB.Loop]\r\n" + num + "      [Item]";
            levstr += $("#txtname").val() + "[/Item]";

            num += "    ";
            levstr += " \r\n" + num + "[HQB.Loop]\r\n" + num + "      [Item]";
            levstr += $("#txtLableContent").val() + "[/Item]";
            
            num = num.substr(4, num.length);

            levstr += "\r\n" + num + "    [/HQB.Loop]"

            num = num.substr(4, num.length);

            levstr += "\r\n" + num + "    [/HQB.Loop]\r\n";



            return levstr;
        }
        function checkOk() {
            if ($.trim($("#ContentTemplate").val()) == "") {
                alert({ msg: "期刊内容模板不允许为空！", title: '提示消息' });
                return false;
            }
            if ($.trim($("#txtname").val()) == "") {
                alert({ msg: "分类代码不允许为空！", title: '提示消息' });
                return false;
            }
            if ($.trim($("#txtLableContent").val()) == "") {
                alert({ msg: "列表代码不允许为空！", title: '提示消息' });
                return false;
            }
           
            return true;
        }
        function showDailog(name) {

            openframe({ url: 'LableContent.aspx?name=' + name, width: '340', height: '170' });
        }
        $(document).ready(function() {
            var obj = parent.document.getElementById('txtLableContent') || parent.parent.document.getElementById('txtLableContent');
            if ('<%=Request["id"] %>' == "")  //不为模板配置标签时使用
            {
                if (obj.value.indexOf(" LableType=\"Periodical\"") != -1)  //为期刊列表类型
                {
                    SetAttribute(obj.value);
                }
            }
        });
        //页面初始化
        function SetAttribute(strContent) {        
         
            
            var reg;
            var result;

            reg = /([\w-]+)\s*=\s*[\"]([^\"]+)[\"]/g;
            result = ""
            while (result = reg.exec(strContent)) {  
                $("#" + result[1]).val(result[2]);
            }
            
            
            var regLabel;
            var matchLabel;

            regLabel = /\[Item\]((.|\n)*?)\[\/Item\]/gi;
            var i = 0; 
            
            while (matchLabel = regLabel.exec(strContent)) {

                matchLabel[1] = matchLabel[1].replace(/::br::/gm, '\r\n');
             
                if (i == 0) {
                    $("#txtname").val(matchLabel[1]);
                }
                else {
                    $("#txtLableContent").val(matchLabel[1]);
                }
                i++;
              
            }
      
        }
    </script>

</head>
<body>
    <form id="frmParamSpecial" runat="server">
    <table width="100%" class="edit_tb">
        <tr><td style="width:120px">期刊内容模板：</td><td>
            <input id="ContentTemplate" type="text" style="width:200px"/> (例如：期刊内容模板.html)</td></tr>
        <tr>
            <td style="width:120px">
               分类：
            </td>
            <td>
                <div>
                    <input type="button" class="abtn" value="分类名称" onclick="setContent('{$CatalogName}')" />                  
                </div>
                <br />
                <br />
                <textarea id="txtname" cols="60" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                列表代码：
            </td>
            <td>
                <div>
                    <asp:Literal ID="literFields" runat="server"></asp:Literal>
                </div>
                <br />
                <br />
                <textarea id="txtLableContent" cols="60" rows="5"></textarea>
            </td>
        </tr>
    </table>   </form>
        <div class="container">
        <div class="Submit" style="text-align: center">
            <input type="submit" value="确定" class="subButton" onclick="fun_Ok()" />
            <input type="submit" value="取消" class="subButton" onclick="parent.Closed()" />
        </div>
    </div>

     <asp:Literal ID="ltlJs" runat="server"></asp:Literal>
</body>
</html>
