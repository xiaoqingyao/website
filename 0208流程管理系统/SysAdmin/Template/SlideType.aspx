<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SlideType.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.OtherType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
      <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script src="../JS/template.js" type="text/javascript"></script>

    <script src="../JS/win.js" type="text/javascript"></script>
    <script src="../JS/jquery.format.js" type="text/javascript"></script>
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
    <script type="text/javascript">
//        function showType() {
//            if ($("#Type").val() == "1") {
//                for (var i = 1; i < 6; i++) {
//                    $("#falsh" + i).show();
//                }
//            }
//            else {
//                for (var i = 1; i < 6; i++) {
//                    $("#falsh" + i).hide();
//                }
//            }
//        }
        function fun_Ok() {
            if (checkOk()) {
                var str = "{HQB_L" + '<%=Request["identification"] %>' + '_' + '<%=Request["lableName"] %>' + " LableType=\"LIST\" TableName=\"K_U_Commend\"";
                var widthHeight = "";
                //                str += " Type=\"" + $("#Type").val() + "\"";
                var showTitle = "";
                if ($("#PageSize").val() != "") {
                    str += " PageSize=\"" + $("#PageSize").val() + "\"";
                }
                str += " Menu=\"" + $("#Menu").val() + "\"";
                if ($("#IsShowTitle")[0].checked) {
                    showTitle = '{$Field(1,Title,0,0)}';
                    showTitle = showTitle.replace(",0,", "," + $("#TitleLength").val() + ",");
                }
                if ($("#FlashWidth").val() != "") {
                    widthHeight += " \r\nfocus_width='" + $("#FlashWidth").val() + "';";
                                      
                }
                if ($("#FlashHeight").val() != "") {
                    widthHeight += " \r\nfocus_height='" + $("#FlashHeight").val() + "';";
                }

                str += "}\r\n[HQB.Loop]\r\ni+=1;\r\n picarr[i]='<%=imgUrl%>{$Field(1,UploadPic,0,0)}';\r\n linkarr[i]='{$Field(1,Url,0,0)}';\r\n textarr[i] = '" + showTitle + "';" + widthHeight + "\r\n [/HQB.Loop]\r\n";
                str += " {/HQB_L" + '<%=Request["identification"] %>' + "}";
                this.parent.document.getElementById('txtLableContent').value = str;
                parent.Closed();
               
            }
           
        }
        function checkOk() {
            var flag = true;
          
          
            if ($("#LoopCount").val() == "") {
                flag = false;
                alert({ msg: "循环条数不能为空！", title: '提示消息' });
            }
            else if ($("#Menu").val() == null) {
                flag = false;
                alert({ msg: "所属栏目不能为空！", title: '提示消息' });
            }
            else if ($("#IsShowTitle")[0].check) {
            if ($("#TitleLength").val() == "") {
                    flag = false;
                    alert({ msg: "标题显示字数不能为空！", title: '提示消息' });
                }
                if ($("#TitleLength").val() == "0") {
                    flag = false;
                    alert({ msg: "标题显示字数不能为0！", title: '提示消息' });
                }
            }
            return flag;
        }

      
    </script>
</head>
<body>
    <form id="form1" runat="server">
     <table class="edit_tb" style=" ">
        <%--<tr>
            <td style="width: 160px">
                标签类型
            </td>
            <td>
                <select name="Type" id="Type" onchange="showType();">
                    <option value="1" selected="selected">Flash幻灯片</option>
                    <option value="2">头条新闻</option>                 
                </select>
                <font color="red">*</font>
            </td>
        </tr>--%>
        <tr id="falsh1">
            <td>
                循环条数
            </td>
            <td>
                   <input type="text" id="PageSize" value="10"  onkeyup="isNumeric(this)"  style="width: 45px"
                    maxlength="2" />
            </td>
        </tr>
        <tr id="falsh2">
            <td>
                所属栏目
            </td>
            <td>
                 <asp:DropDownList ID="Menu" Width="200px" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="falsh3">
            <td>
               是否显示标题
            </td>
            <td>
                <input type="checkbox" onclick="$('#ShowTitle').toggle()" id="IsShowTitle" />
                显示 <span id="ShowTitle" style="display: none">
                  
                    显示字数：  <input type="text" id="TitleLength" value="10"  onkeyup="isNumeric(this)"  style="width: 45px"
                    />
                </span>
            </td>
        </tr>
     
        <tr id="falsh4">
            <td>
               Flash宽度
            </td>
            <td >
                 <input type="text" id="FlashWidth" value=""  onkeyup="isNumeric(this)"  style="width: 86px"
                     />
            </td>
        </tr>
        <tr id="falsh5">
            <td >
                 Flash高度
            </td>
            <td>
                <input type="text" id="FlashHeight" value=""  onkeyup="isNumeric(this)"  style="width: 86px"
                     />
            </td>
        </tr>
        
    </table>
  
  

    </form>
       <div class="container">
        <div class="Submit" style="text-align: center">
            <input type="submit" value="确定" class="subButton" onclick="fun_Ok()" />
            <input type="submit" value="取消" class="subButton" onclick="parent.Closed()" />
        </div>
    </div>
</body>
</html>
