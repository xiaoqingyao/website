<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeywordFilterEdit.aspx.cs" Inherits="AllPower.Web.Admin.KeywordFilterEdit" ValidateRequest="false" %>
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
  <script src="../JS/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        window.onload = function() {
            if (type > -1) {
                showEditMessage("关键字", "KeywordFilterList.aspx<%=StrPageParams %>", "KeywordFilterEdit.aspx?NodeCode=<%=NodeCode %>", "KeywordFilterEdit.aspx?NodeCode=<%=NodeCode %>&action=edit&id=<%=ID %>");
            }
        }     
    </script>

</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a><a> &gt;</a> <a href="#">关键字过滤</a><a> &gt;</a>
            <span class="breadcrumb_current">添加关键字</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt><%=Resources.KeywordFilter.Keywrod%></dt>
                    <dd><asp:TextBox ID="txtKeyword" runat="server" CssClass="validate[required,length[1,20]]"></asp:TextBox>
                        *</dd>
                </dl>
                <dl>
                    <dt><%=Resources.KeywordFilter.ReplaceStr%></dt>
                    <dd><asp:TextBox ID="txtReplace" runat="server" ></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.Member.IsDisable%></dt>
                    <dd>
                        <asp:CheckBox ID="chkDisable" runat="server" />
                         </dd>
                </dl>
                 
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click"
                CssClass="subButton" />
            <input type="button" name="btnBack" value="<%= Resources.Common.Back %>" onclick='location.href="KeywordFilterList.aspx<%=StrPageParams %>";'
                class="subButton" />
        </div>
    </div>
    </form>
</body>
</html> 