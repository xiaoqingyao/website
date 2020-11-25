<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchUpload.aspx.cs" Inherits="PowerEasy.SiteFactory.WebSite.Editor.BatchUpload"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>批量上传</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <script type="text/javascript" src="<%= ResolveClientUrl("~/JS/Silverlight.js")%>"></script>

        <table style="width: 100%">
            <tr>
                <td class='tdbg' align='left'>
                    <div id='errorLocation' style="font-size: small; color: Gray;">
                    </div>
                    <div id="silverlightControlHost">
                        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                            width="100%" height="292">
                            <param name="source" value="<%= ResolveClientUrl("~/ClientBin/SilverlightMultiFileUpload.zip") %>" />
                            <param name="onerror" value="onSilverlightError" />
                            <param name="background" value="white" />
                            <param name="windowless" value="false" />
                            <param name="minRuntimeVersion" value="2.0.31005.0" />
                            <param name="autoUpgrade" value="true" />
                            <param name="initParams" value="UploadHandlerName=<%= Page.Request.Url.Scheme + "://" + Page.Request.Url.Authority + BasePath + (!Foreground?"Admin":"User") %>/Accessories/HttpUploadHandler.ashx,JSPrefix=,MaxFileSizeKB=<%=MaxUploadSize%>,EnableUploadFiles=<%=EnableUpload%>,CustomParam=ModelId=<%=ModelId %>&FieldName=<%=FieldName %>&NodeId=<%=NodeId %>&ModuleName=<%=ModuleName %>&AddFileRecord=<%=FileRecord %>&DepartmentUploader=<%=DepartmentUploader %>,FileFilter=文件(<%=FileExtArr%>)|<%=FileExtArr%>" />
                            <a href="http://go.microsoft.com/fwlink/?LinkID=124807" style="text-decoration: none;">
                                <img src="http://go.microsoft.com/fwlink/?LinkId=108181" alt="Get Microsoft Silverlight"
                                    style="border-style: none" /><br />
                                你可以点此安装SilverLight以获得更好的上传体验 </a>
                        </object>
                    </div>
                </td>
            </tr>
        </table>

        <script type="text/javascript">

          function onSilverlightError(sender, args) {
            document.getElementById('errorLocation').innerHTML = '很抱歉，使用Silverlight上传的时候出错！';
          }

          function ErrMessage(message) {
            alert(message);
          }

          var photoUrls = '';
          var thumbUrl = '';

          function DealwithUpload(path, size, id, thumbpath) {
            if (photoUrls != '') {
              photoUrls += '$$$' + '<%= UploadPath %>' + path;
            }
            else {
              photoUrls += '<%= UploadPath %>' + path;
            }
            if(thumbUrl !=''){
            photoUrls += '$$$' + '<%= UploadPath %>' + thumbUrl;
            }
            window.parent.CKEDITOR.tools.callFunction(<%=CKEditorFuncNum %>,photoUrls,'');
          }

          function ChangeThumbField(path, thumbpath) {
            thumbUrl = thumbpath;
            
            if (photoUrls != '') {
              photoUrls += '$$$' + '<%= UploadPath %>' + path;
            }
            else {
              photoUrls += '$$$' + '<%= UploadPath %>' + path;
            }
            photoUrls += '$$$' + '<%= UploadPath %>' + thumbUrl;
            
           window.parent.CKEDITOR.tools.callFunction(<%=CKEditorFuncNum %>,photoUrls,'');
          }

        </script>

    </div>
    </form>
</body>
</html>
