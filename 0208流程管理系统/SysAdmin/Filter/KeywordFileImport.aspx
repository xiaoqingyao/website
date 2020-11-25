<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeywordFileImport.aspx.cs"
    Inherits="AllPower.Web.Admin.KeywordFileImport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>文件导入</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="../JS/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../JS/public.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
</head>
<body>
    <form id="theForm" runat="server" >
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">关键字过滤</a><a> &gt;</a> <span class="breadcrumb_current">
                文件导入</span>
        </h4>
        <div id="panel">
            <fieldset>
                   <dl>
                    <dt><%=Resources.KeywordFilter.TxtFile%></dt>
                    <dd><input type="text" style="font-size:9pt;height:15px;width:280px;" runat="server" id="keywordTxt" name="keywordTxt" value=""
                    class="validate[required]" />*
                     <input type='button' onclick="InputFile('theForm','keywordTxt','file',1,'txt',4096,'');" value = '上传' class="subButton" />
                        </dd>
                </dl>
                <dl>
                    <dt><%=Resources.KeywordFilter.Split%></dt>
                    <dd> 
                        <asp:TextBox ID="txtSplit" runat="server"  CssClass="validate[required,length[1,1]]"></asp:TextBox>*
                        </dd>
                </dl>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:KeywordFilter,FileImport %>" OnClick="btnSave_Click" CssClass="subButton" 
             />          
        </div>
       
    </div>
    </form>
</body>
</html>
