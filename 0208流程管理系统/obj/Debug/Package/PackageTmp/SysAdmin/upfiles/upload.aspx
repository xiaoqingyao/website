<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="AllPower.WEB.SysAdmin.upfiles.upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>文件上传</title>

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>
   <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>
       <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
            <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #lblMessage
        {
            color: #000000;
        }
    </style>
</head>

<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $("#form1").validationEngine({ promptPosition: "centerRight" });
        delCookie("HQB_UpFile_ThumbHW");
    });
    
    function checkData(frm) {
        if (document.getElementById('txtFileUpload').value == "") {
            alert("<%=Resources.Common.UploadMsg7%>");
            return false;
        }
        document.getElementById("Table2").style.display = "";
        document.getElementById("Table1").style.display = "none";
        if ($("#ResetThumbWidth").val() != "" && $("#ResetThumbHeight").val() != "") {
            setCookies("HQB_UpFile_ThumbHW", $("#ResetThumbWidth").val() + "$$" + $("#ResetThumbHeight").val());
        }
        return true;
    }

    function SetThumbHW(obj) {
        if ($(obj).attr("checked")) {
            $("#HQB_ThumbHW").css("display", "block");
        } else {
            $("#HQB_ThumbHW").css("display", "none");
        }
    }

    function ShowThumbSetting(isSetting) {
        if (isSetting) {// 重设
            $("#HQB_ThumbWHSetting").css("display", "block");
            $("#HQB_ShowThumbWH").css("display", "none");
            $("#btnThumbWHReset").css("display","none");
            $("#btnTumbWHCancel").css("display", "block");
        } else {  // 取消
            $("#HQB_ThumbWHSetting").css("display", "none");
            $("#HQB_ShowThumbWH").css("display", "block");
            $("#ResetThumbWidth").val("");
            $("#ResetThumbHeight").val("");
            $("#btnThumbWHReset").css("display", "block");
            $("#btnTumbWHCancel").css("display", "none");
        }
    }
</script>

<body>
    <form name="form1" id="form1" method="post" enctype="multipart/form-data" runat="server">
    <div class="container">
        <div id="span1" runat="server" style="padding: 0; margin: 0;">
            <dl id="Table2" style="display: none">
                <dt>
                    <img src="../images/loading.gif" /></dt>
                <dd>
                    <%=Resources.Common.UploadMsg8%></dd>
            </dl>
            <div id="Table1">
                <dl>
                    <dt style="width:100px">
                        <%=Resources.Common.UploadMsg2%>：</dt>
                    <dd style="width:350px">
                        <asp:FileUpload ID="txtFileUpload" runat="server" Style="width: 320px; height: 20px" onkeydown="return false" oncontextmenu="return false" /></dd>
                </dl>
                <dl id="tr3" runat="server">
                    <dt style="width:100px">
                        <%=Resources.Common.UploadMsg3%>
                        ：</dt>
                    <dd>
                        <input type="checkbox" id="chkIshumbnail" name="chkIshumbnail" onclick="SetThumbHW(this)" value="1" /></dd>
                    <dd id="HQB_ThumbHW">
                        <ul style="list-style: none;">
                            <li style="float: left; list-style: none; padding-left: 5px; padding-right: 5px;"
                                id="HQB_ShowThumbWH">
                                <%=thumbWidth%>
                                x
                                <%=thumbHeight%></li>
                            <li style="display: none; float:left; padding-left:5px; padding-right:5px;" id="HQB_ThumbWHSetting">
                               <input type="text" class="validate[optional,custom[onlyNumber]]" style=" width:60px;"  id="ResetThumbWidth" />
                                x
                               <input type="text" class="validate[optional,custom[onlyNumber]]" style="width:60px;" id="ResetThumbHeight" /></li>
                            <li style="float: left; list-style: none;">
                                <input type="button" value="重设" id="btnThumbWHReset" onclick="ShowThumbSetting(true)" />
                                <input type="button" value="取消" style="display:none;" id="btnTumbWHCancel" onclick="ShowThumbSetting(false)" /></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt style="width:100px">注意：</dt>
                    <dd>
                        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label><br />
                        2.<%=Resources.Common.UploadMsg5%><span id="spanSize" runat="server"></span>M。</dd>
                </dl>
                <div class="Submit">
                    <asp:Button ID="btnUpload" runat="server" Text='<%$Resources:Common,UploadSubmit%>'
                        CssClass="AddBtn" OnClick="btnUpload_Click" OnClientClick="return checkData(this)" />
                    <input type="button" name="button1" value="<%=Resources.Common.UploadClose%>" class="AddBtn"
                        onclick="parent.Closed();" />
                </div>
            </div>
        </div>
        <span id="span2" runat="server" visible="false">
            <div align="center">
                <%=Resources.Common.UploadMsg6%></div>
        </span>
    </div>
    </form>
    <%=jsExe%>
</body>
</html>
