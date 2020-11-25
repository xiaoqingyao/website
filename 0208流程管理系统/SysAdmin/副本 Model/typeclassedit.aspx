<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="typeclassedit.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.typeclassedit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>产品分类详细信息管理</title>
   <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>
    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>
    <script src="../ColorPicker/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="../ColorPicker/colorpicker.js" type="text/javascript"></script> 
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
   <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/ModelFieldAlbums.js" type="text/javascript"></script>

    
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <link href="../ColorPicker/colorpicker.css" rel="stylesheet" type="text/css" />
    <link href="../Editor/ckeditor/content.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <style>
        /*========列表&表单&提示 共用=========*/

.tblForm,
#errorTip
{width:97%;border:1px solid #B8CDEA;line-height:28px;border-collapse:collapse; /*=合并表格内外边框=*/background:#fff;}

.tblForm th,
.tblForm td{ padding:0 6px;border:1px solid #B8CDEA; }
.tblList th,
.tblForm th{ font-weight:normal; color:#0b4f9a;}



/*========表单=========*/
.tblForm{margin:0 auto 18px auto;}
 .tblForm caption{font-size:14px;font-weight:bold;margin-top:18px;}
.tblForm{margin-top:18px;}#Panel_Content a.help{color:#333;}
.tblForm th{ text-align:right; width:120px;}
    </style>
    <script type="text/javascript">
    function checkForm()
    {
     
        
      
        if(document.getElementById('txtName').value=="") {
            alert({ msg: '类别名称不能为空。', title: '操作提示' });

            document.getElementById('txtName').focus();
            return false;
        }
       
    }
	
    </script>

</head>
<body>
    <form id="form1" runat="server">
  <div class="container">
            <h4>
                当前位置：<%GetPageNav(MenuID);%> &rarr;添加/编辑栏目</h4>
            <input type="hidden" id="hidSubMenu" runat="server" />
            <input type="hidden" id="hidOldName" runat="server" />
            <div id="spanUpTitleMsg" runat="server" style="padding-top: 10px">
            </div>
            <div class="container" style="text-align:center">
            <table cellspacing="0" cellpadding="4" border="0" class="tblForm">
                
                <tr>
                    <th>
                        类别名称:</th>
                    <td align="left">
                        <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                        <font color="red">*</font> &nbsp;
                        <div class="helpTips">
                            <div id="tipName">
                            </div>
                        </div>
                    </td>
                </tr>                
                <tr>
                    <th>
                        排序:</th>
                    <td align="left">
                        <input type="text" id="txtOrd" runat="server" maxlength="10" value="100" onkeyup="value=value.replace(/[^\d]/g,'');"
                            onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                        &nbsp; 
                        <div class="helpTips">
                            <div id="tipOrd">
                            </div>
                        </div>
                    </td>
                </tr>
                   <tr>
                    <th>
                        上传分类图标:</th>
                    <td align="left">
                        <asp:TextBox ID="txtCurrentImg" runat="server" Width="252px"></asp:TextBox> <input type="button" id="Button1" value="上传" runat="server" Class="subButton" onclick="InputFile('theForm','txtCurrentImg','image',1,'jpg|gif|bmp|png');" /> 
                        <div class="helpTips">
                            <div id="Div3">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        分类简介:</th>
                    <td align="left">
                        <div style="float: left">
                            <asp:TextBox ID="txtDigest" runat="server" Height="50px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                        </div>
                        <div style="float: left">
                            &nbsp; 
                            <div class="helpTips">
                                <div id="tipDigest">
                                </div>
                            </div>
                            <span id="spanDigest" style="color: red"></span>
                        </div>
                    </td>
                </tr>
                 <tr>
                    <th>
                        是否包含子类:</th>
                    <td align="left">
                        <div style="float: left">
                            <asp:CheckBox ID="RadioButton1" runat="server" />是
                        </div>
                        <div style="float: left">
                            &nbsp; 
                            <div class="helpTips">
                                <div id="Div1">
                                </div>
                            </div>
                            <span id="span1" style="color: red"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        是否发布:</th>
                    <td align="left">
                        <div style="float: left">
                            <asp:CheckBox ID="RadioButton2" runat="server" />是
                        </div>
                        <div style="float: left">
                            &nbsp; 
                            <div class="helpTips">
                                <div id="Div2">
                                </div>
                            </div>
                            <span id="span2" style="color: red"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                    </th>
                    <td align="left">
                        <asp:Button ID="btnUpdate" runat="server" Text="修 改" CssClass="btn" OnClick="btnUpdate_Click"
                            OnClientClick="return checkForm();" />
                        <input class="btn" onclick="javascript:location.href='typeclasslist.aspx?NodeCode=<%=MenuID %>'"
                            type="button" value="返 回" />
                    </td>
                </tr>
            </table></div>
       </div>
        <br />
        <asp:Panel ID="Panel_Message" runat="server" Visible="false">
            <div id="errorTip">
                <p>
                    操作失败，具体原因如下</p>
                <p class="reason">
                    <span id="td_Message" runat="server"></span><span>五秒后自动转向……</span></p>
                <p>
                    <asp:LinkButton ID="lbClose" Text="返回上一页面" OnClick="lbClose_Click" runat="server"></asp:LinkButton></p>
            </div>

            <script language="javascript" type="text/javascript">
                setTimeout('document.getElementById ("lbClose").click()',5000);
            </script>

        </asp:Panel>
        <span id="spanD" runat="server"></span>
    </form>
</body>
</html>
