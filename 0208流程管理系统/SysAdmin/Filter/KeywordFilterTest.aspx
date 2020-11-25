<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeywordFilterTest.aspx.cs" Inherits="AllPower.Web.Admin.KeywordFilterTest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>添加分类</title>
  <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    
       <script src="../JS/Common.js" type="text/javascript"></script>
    
    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>    
    
     <script type="text/javascript" src="../js/public.js"></script> 

    <script type="text/javascript" src="/SysAdmin/Editor/ckeditor/ckeditor.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript">
            $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">关键字过滤</a><a> &gt;</a>
            <span class="breadcrumb_current">过滤效率测试</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>原字符串</dt>
                    <dd><asp:TextBox ID="txtOldStr" runat="server" TextMode="MultiLine" 
                            CssClass="validate[required,length[3,90000]]" Rows="10" Columns="50"></asp:TextBox>
                        *</dd>
                </dl>
                <dl>
                    <dt>处理后字符串</dt>
                    <dd><asp:TextBox ID="txtNewStr" runat="server" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox></dd>
                </dl>
  
                <dl>
                    <dt>处理时间</dt>
                    <dd> <asp:Label ID="lblMillisecond" runat="server" Text=""></asp:Label>毫秒 </dd>
                </dl>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnReplace" runat="server" Text="处理" OnClick="btnReplace_Click"
                CssClass="subButton" />
            <input id="Reset1" type="reset" value="重置"  class="subButton"/>
        </div>
    </div>
    </form>
</body>
</html> 