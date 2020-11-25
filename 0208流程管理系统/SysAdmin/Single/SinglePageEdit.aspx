<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SinglePageEdit.aspx.cs" Inherits="AllPower.Web.Admin.SinglePageEdit" ValidateRequest="false" %>
<%@ Register src="../Controls/Editor.ascx" tagname="Editor" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>编辑页面</title>
  <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    
       <script src="../JS/Common.js" type="text/javascript"></script>
    
    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>    
    
     <script type="text/javascript" src="../js/public.js"></script> 


    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript">
            $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt><%=Resources.Common.Content%></dt>
                    <dd><uc1:Editor ID="Editor1" runat="server" width=700 height="350" EditorType=0/>
                       </dd>
                </dl>
               
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Save %>" OnClick="btnSave_Click"
                CssClass="subButton" />
            
        </div>
    </div>
    </form>
</body>
</html> 