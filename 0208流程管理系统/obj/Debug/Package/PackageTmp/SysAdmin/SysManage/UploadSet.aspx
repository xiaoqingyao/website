<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadSet.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.UploadSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link rel="stylesheet" href="../css/template.css" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
        <fieldset>
                <dl>
                    <dt width="30%"><b>是否允许上传:</b></dt>
                    <dd width="70%"><asp:RadioButton ID="RadTrue" runat="server" GroupName="isEnableUpload" Text="是" /><asp:RadioButton ID="RadFalse" runat="server" GroupName="isEnableUpload" Text="否" /></dd>
                </dl> 
                <dl>
                    <dt width="30%"><b>上传使用控件:</b></dt>
                    <dd width="70%">
                    <asp:DropDownList ID="ddluploadControl" runat="server">
                    <asp:ListItem Value="upload.aspx">使用vs上传控件</asp:ListItem>
                    <asp:ListItem Value="neatupload.aspx">使用neatupload上传控件</asp:ListItem>
                    </asp:DropDownList>
                 </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>图片域名:</b><br>不填写则为默认域名<br /><font color=red>注：域名主目录需设置到图片保存路径下的Images文件夹</font></dt>
                    <dd width="70%"><asp:TextBox ID="txtimageUrl" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>图片保存路径：</b><br>默认保存在根目录下UploadFiles，图片会保存在你设置的目录/<%=SiteDir==""?"":SiteDir+"/" %>/images下</dt>
                    <dd width="70%"><asp:TextBox ID="txtimageSavePath" runat="server" width="300px"  CssClass="validate[required,length[1,20]]"></asp:TextBox><font color=red>*</font></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>文件域名：</b><br>不填写则为默认域名<br /><font color=red>注：域名主目录需设置到图片保存路径下的files文件夹</font> </dt>
                    <dd width="70%"><asp:TextBox ID="txtfileUrl" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>文件保存路径：</b><br>默认保存在根目录下UploadFiles，图片会保存在你设置的目录/<%=SiteDir==""?"":SiteDir+"/" %>/files下</dt>
                    <dd width="70%"><asp:TextBox ID="txtfileSavePath" runat="server" width="300px" CssClass="validate[required,length[1,20]]"></asp:TextBox><font color=red>*</font></dd>
                </dl>      
                <dl>
                    <dt width="30%"><b>视频文件域名:</b><br>不填写则为默认域名<br /><font color=red>注：域名主目录需设置到图片保存路径下的medias文件夹</font></dt>
                    <dd width="70%"><asp:TextBox ID="txtmediaUrl" runat="server" width="300px"></asp:TextBox></dd>
                </dl>   
                <dl>
                    <dt width="30%"><b>视频保存路径:</b><br>默认保存在根目录下UploadFiles，图片会保存在你设置的目录/<%=SiteDir==""?"":SiteDir+"/" %>/medias下</dt>
                    <dd width="70%"><asp:TextBox ID="txtmediaSavePath" runat="server" width="300px" CssClass="validate[required,length[1,20]]"></asp:TextBox><font color=red>*</font></dd>
                </dl>                   
                <dl>
                    <dt width="30%"><b>允许上传的最大图片大小:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtuploadImageSize" runat="server" width="80px"></asp:TextBox>KB</dd>
                </dl>  
                <dl>
                    <dt width="30%"><b>允许上传的图片类型:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtuploadImageType" runat="server" width="300px"></asp:TextBox></dd>
                </dl>   
                <dl>
                    <dt width="30%"><b>允许上传的最大文件大小:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtuploadFilesSize" runat="server" width="80px"></asp:TextBox>KB</dd>
                </dl> 
                <dl>
                    <dt width="30%"><b>允许上传的文件类型:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtuploadFilesType" runat="server" width="300px" TextMode="MultiLine" Height="100"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>允许上传的最大视频大小:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtuploadMediaSize" runat="server" width="80px"></asp:TextBox>KB</dd>
                </dl>
                 <dl>
                    <dt width="30%"><b>允许上传的视频类型:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtuploadMediaType" runat="server" width="300px" TextMode="MultiLine" Height="100"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>缩略图宽度:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtthumbnailWidth" runat="server" width="80px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>缩略图高度:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtthumbnailHeight" runat="server" width="80px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>是否启用水印功能:</b></dt>
                    <dd width="70%"><asp:RadioButton ID="RadWatermarkTrue" runat="server" GroupName="isEnableWatermark" Text="是" /><asp:RadioButton ID="RadWatermarkFalse" runat="server" GroupName="isEnableWatermark" Text="否" /></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印类型:</b></dt>
                    <dd width="70%">
                    <asp:DropDownList ID="ddlwatermarkType" runat="server">
                    <asp:ListItem Value="0">文字</asp:ListItem>
                    <asp:ListItem Value="1">图片</asp:ListItem>
                    </asp:DropDownList>
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印图片路径:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtwatermarkPic" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印文字:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtwatermarkText" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印文字大小:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtwatermarkFontSize" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印字体类型:</b><br>如“黑体”</dt>
                    <dd width="70%"><asp:TextBox ID="txtwatermarkFontType" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印字体样式:</b></dt>
                    <dd width="70%">
                    <asp:DropDownList ID="ddlwatermarkFontStyle" runat="server">
                    <asp:ListItem Value="0">正常</asp:ListItem>
                    <asp:ListItem Value="1">粗体</asp:ListItem>
                    <asp:ListItem Value="2">斜体</asp:ListItem>
                    <asp:ListItem Value="3">下划线</asp:ListItem>
                    </asp:DropDownList>
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印字体边框大小:</b><br>0表示没有边框</dt>
                    <dd width="70%"><asp:TextBox ID="txtwatermarkFontBorder" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印字体边框颜色:</b></dt>
                    <dd width="70%"><input type="text" readonly="readonly" style="width:100px;" imagepath="../ColorPicker/imgs/" id="ColorCode" name="ColorCode" runat="server"/></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印字体颜色:</b></dt>
                    <dd width="70%"><input type="text" readonly="readonly" style="width:100px;" imagepath="../ColorPicker/imgs/" id="ColorCode2" name="ColorCode2" runat="server"/></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印透明度:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtwatermarkTransparency" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>水印位置:</b></dt>
                    <dd width="70%">
                    <asp:DropDownList ID="ddlwatermarkLocation" runat="server">
                    <asp:ListItem Value="0">右上</asp:ListItem>
                    <asp:ListItem Value="1">左上</asp:ListItem>
                    <asp:ListItem Value="2">右下</asp:ListItem>
                    <asp:ListItem Value="3">左下</asp:ListItem>
                    <asp:ListItem Value="4">居中</asp:ListItem>
                    </asp:DropDownList>
                    </dd>
                </dl>
                </fieldset>
        </div>  
        <div class="Submit" style="padding-left:300px;">
        <asp:Button Text="保存设置" CssClass="subButton" ID="btnSave" runat="server" onclick="btnSave_Click" />
        </div>  
   
    </div>
    </form>
</body>
</html>
