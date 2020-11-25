<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberGroupEdit.aspx.cs"  ValidateRequest="false" Inherits="AllPower.Web.Admin.MemberGroupEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>添加会员组</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>

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
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">会员组管理</a><a> &gt;</a> <span class="breadcrumb_current">
                添加会员组</span>
        </h4>
         <div id="panel">
            <fieldset>
                <dl>
                  <dt><%=Resources.Common.Name%></dt>
                  <dd><asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[2,20]]"></asp:TextBox>*</dd>
                 </dl>
                <dl>
                    <dt>
                        <%=Resources.Member.ServerIntro%></dt>
                    <dd>
                        <asp:TextBox ID="txtServerIntro" TextMode="MultiLine" Rows="7" Columns="20" runat="server">  </asp:TextBox>
                 <script type="text/javascript">
                             products$$ckeditor$$obj = CKEDITOR.replace('txtServerIntro', {
                                    linkUploadAllowedExtensions: 'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png|flv|swf|rm|html|htm',
                                    nodeId: 1,
                                    language: 'zh-cn',
                                    watermark: false,
                                    height: '300px',
                                    toolbar: 'ContentFull',
                                    modelId: 1,
                                    flashUploadAllowedExtensions: '.rm|.mp3|.wav|.mid|.midi|.ra|.avi|.mpg|.mpeg|.asf|.asx|.wma|.mov|.flv|.swf',
                                    width: '600px',
                                    imageUploadAllowedExtensions: 'jpg|jpeg|gif|bmp|png',
                                    skin: 'blue',
                                    thumbnail: false,
                                    fileRecord: true,
                                    fieldName: 'Content',
                                    wordPic: false,
                                    flashUpload: true,
                                    imageUpload: true,
                                    linkUpload: true,
                                    foreground: false,
                                    moduleName: ''
                                }); 
                                    </script>
                      </dd>
                </dl>
                
                 <dl> 
                  <dt><%=Resources.Member.IsVisit%></dt>
                     <dd>
                         <asp:RadioButtonList ID="rblVisit" runat="server"  RepeatDirection="Horizontal">
                             <asp:ListItem Text="是" Value="1" Selected="True"></asp:ListItem>
                             <asp:ListItem Text="否" Value="0"></asp:ListItem>
                         </asp:RadioButtonList>
                     </dd>
                </dl>
                	
               <dl> 
                  <dt><%=Resources.Member.IsSearch%></dt>
                     <dd>
                         <asp:RadioButtonList ID="rblSearch" runat="server"   RepeatDirection="Horizontal">
                             <asp:ListItem Text="是" Value="1" Selected="True"></asp:ListItem>
                             <asp:ListItem Text="否" Value="0"></asp:ListItem>
                         </asp:RadioButtonList>
                     </dd>
                </dl>
                
                <dl> 
                  <dt><%=Resources.Member.IsPub %></dt>
                     <dd>
                         <asp:RadioButtonList ID="rblPub" runat="server"   RepeatDirection="Horizontal">
                             <asp:ListItem Text="是" Value="1" Selected="True"></asp:ListItem>
                             <asp:ListItem Text="否" Value="0"></asp:ListItem>
                         </asp:RadioButtonList>
                     </dd>
                </dl>
                
                <dl> 
                  <dt><%=Resources.Member.IsSelfUpgrade%></dt>
                     <dd>
                         <asp:RadioButtonList ID="rblUpgrade" runat="server"   RepeatDirection="Horizontal">
                             <asp:ListItem Text="是" Value="1" Selected="True"></asp:ListItem>
                             <asp:ListItem Text="否" Value="0"></asp:ListItem>
                         </asp:RadioButtonList>
                     </dd>
                </dl>
                
                <dl> 
                  <dt><%=Resources.Member.IsDisable%></dt>
                     <dd>
                         <asp:RadioButtonList ID="rblDisable" runat="server"   RepeatDirection="Horizontal">
                             <asp:ListItem Text="是" Value="1" Selected="True"></asp:ListItem>
                             <asp:ListItem Text="否" Value="0"></asp:ListItem>
                         </asp:RadioButtonList>
                     </dd>
                </dl>
                  
              </fieldset>
              </div>
              <div class="Submit">
                           <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" onclick="btnSave_Click" CssClass="subButton" />
                           <input type="button" name="Submit422" value="<%= Resources.Common.Back %>"  
                                onclick='location.href="MemberGroupList.aspx<%=StrPageParams %>";' class="subButton" />
            </div>
         </div>
    </form>
</body>
</html>
