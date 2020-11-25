<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="AllPower.WEB.SysAdmin.upfiles.FileUpload" %>

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
        return true;
    }
</script>

<body>
    <form name="form1" id="form2" method="post" enctype="multipart/form-data" runat="server">
    <div class="container">
        <div id="span1" runat="server" style="padding: 0; margin: 0;">
            <dl id="Table2" style="display: none">
                <dt>
                    <img src="../image/loading.gif" alt="" /></dt>
                <dd>
                    <%=Resources.Common.UploadMsg8%></dd>
            </dl>
            <div id="Table1">
                <dl>
                    <dt style="width: 100px">文件：</dt>
                    <dd style="width: 350px">
                        <asp:FileUpload ID="txtFileUpload" runat="server" Style="width: 320px; height: 20px"
                            onkeydown="return false" oncontextmenu="return false" /></dd>
                </dl>
                <dl>
                    <dt style="width: 100px">注意：</dt>
                    <dd>
                        <font color="Coral">
                            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label></font><br />
                        2.单个的文件不能大于<span id="spanSize" runat="server" style="color: Red"></span>M。</dd>
                </dl>
                <div class="Submit">
                    <asp:Button ID="btnUpload" runat="server" Text="上传" CssClass="AddBtn" OnClick="btnUpload_Click"
                        OnClientClick="return checkData(this)" />
                    <input type="button" name="button1" value="关闭" class="AddBtn" onclick="parent.Closed();" />
                </div>
            </div>
        </div>
    </div>
    </form>
    <%=jsExe%>
</body>
</html>
