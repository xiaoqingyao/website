<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvertisementEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.AdvertisementEdit" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加广告</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/Advertising.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",       //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                             //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                     //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                          //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
            Advertising.AdvertisementTypeChange();                                  //初始化绑定
        });
        window.onload = function() {
            if (type > -1) {
                showEditMessage("广告", "AdvertisementList.aspx<%=StrPageParams %>", "AdvertisementEdit.aspx?NodeCode=<%=NodeCode %>&nid=<%=NID %>", "AdvertisementEdit.aspx?NodeCode=<%=NodeCode %>&action=edit&nid=<%=NID %>&id=<%=ID %>");
            }
        }        
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="#">广告管理</a> &gt;<span style="color: Blue">编辑广告</span>
        </h4>
        <dl>
            <dt>
                <%=Resources.Common.Name%></dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.lbAdvertisingId%></dt>
            <dd>
                <asp:ListBox ID="lbAdvertisingId" runat="server" SelectionMode="Multiple"></asp:ListBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.rbtlType%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlType" runat="server" RepeatDirection="Horizontal" onclick="Advertising.AdvertisementTypeChange()">
                </asp:RadioButtonList>
                <div id="TypeDiv1">
                    <table id="ctl00_CphContent_ADContent_1" width="100%" border="0" cellpadding="2"
                        cellspacing="1">
                        <tr align="left" class="tdbg">
                            <td colspan="2">
                                <strong>
                                    <%=Resources.Model.FileUploadDesc%></strong>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.FileUploadControl1%>
                            </td>
                            <td>
                                <input type="text" style="font-size: 9pt; height: 15px; width: 280px;" runat="server"
                                    id="FileUploadControl1" name="FileUploadControl1" value="" />&nbsp;&nbsp;
                                <input type='button' onclick="InputFile('theForm','FileUploadControl1','image',1,'',4096,'')"
                                    value='上传' />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.FileUploadSize%>
                            </td>
                            <td>
                                <%=Resources.Model.TxtImgWidth%>
                                <input name="TxtImgWidth" type="text" maxlength="5" id="TxtImgWidth" class="inputtext"
                                    runat="server" style="width: 40px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <%=Resources.Model.TxtImgHeight%>
                                <input name="" type="text" maxlength="5" id="TxtImgHeight" class="inputtext" runat="server"
                                    style="width: 40px" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.TxtLinkUrl%>
                            </td>
                            <td>
                                <input name="TxtLinkUrl" type="text" value="http://" id="TxtLinkUrl" class="inputtext"
                                    runat="server" style="width: 341px;" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.TxtLinkAlt%>
                            </td>
                            <td>
                                <input name="TxtLinkAlt" type="text" maxlength="255" id="TxtLinkAlt" class="inputtext"
                                    runat="server" style="width: 341px;" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.rbtlLinkTarget%>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtlLinkTarget" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Selected="True" Text="<%$Resources:Model,rbtlLinkTarget1 %>"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="<%$Resources:Model,rbtlLinkTarget2 %>"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.TxtADIntro%>
                            </td>
                            <td style="height: 95px">
                                <textarea name="TxtADIntro" rows="2" cols="20" id="TxtADIntro" class="inputtext"
                                    runat="server" style="height: 87px; width: 341px;"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv2" style="display: none">
                    <table id="ctl00_CphContent_ADContent_2" width="100%" border="0" cellpadding="2"
                        cellspacing="1">
                        <tr align="left" class="tdbg">
                            <td colspan="2">
                                <strong>
                                    <%=Resources.Model.ExtenFileUploadDesc%></strong>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.ExtenFileUpload%>
                            </td>
                            <td>
                                <input type="text" runat="server" style="font-size: 9pt; height: 15px; width: 280px;"
                                    id="ExtenFileUpload" name="ExtenFileUpload" value="" />&nbsp;&nbsp;
                                <input type='button' onclick="InputFile('theForm','ExtenFileUpload','file',1,'swf',4096,'')"
                                    value='上传' />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.ExtenFileUploadSize%>
                            </td>
                            <td>
                                <%=Resources.Model.TxtImgWidth%><input name="TxtFlashWidth" type="text" maxlength="5"
                                    id="TxtFlashWidth" class="inputtext" runat="server" style="width: 40px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;<%=Resources.Model.TxtImgHeight%><input name="TxtFlashHeight"
                                    type="text" maxlength="5" id="TxtFlashHeight" class="inputtext" runat="server"
                                    style="width: 40px" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td class="tdbgleft">
                                <%=Resources.Model.cbFlashMode%>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbFlashMode" runat="server" />
                                <%=Resources.Common.ON%>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv3" style="display: none">
                    <table id="ctl00_CphContent_ADContent_3" width="380px" border="0" cellpadding="2"
                        cellspacing="1">
                        <tr align="left" class="tdbg">
                            <td colspan="2">
                                <strong>
                                    <%=Resources.Model.TxtADTextDesc%></strong>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td colspan="2" align="left" style="height: 90px">
                                <textarea name="TxtADText" rows="2" cols="20" id="TxtADText" class="inputtext" runat="server"
                                    style="height: 90px; width: 380px;"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv4" style="display: none">
                    <table id="ctl00_CphContent_ADContent_4" width="380px" border="0" cellpadding="2"
                        cellspacing="1">
                        <tr align="left" class="tdbg">
                            <td>
                                <strong>
                                    <%=Resources.Model.TxtADCode%></strong>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td align="left" style="width: 380px">
                                <textarea name="TxtADCode" rows="2" cols="20" id="TxtADCode" class="inputtext" runat="server"
                                    style="height: 90px; width: 380px;"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv5" style="display: none">
                    <table id="ctl00_CphContent_ADContent_5" width="100%" border="0" cellpadding="2"
                        cellspacing="1">
                        <tr align="left" class="tdbg">
                            <td colspan="2">
                                <strong>
                                    <%=Resources.Model.TxtWebFileUrlDesc%></strong>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td colspan="2" align="left" style="height: 90px">
                                <textarea name="TxtWebFileUrl" style="height: 90px; width: 380px;" id="TxtWebFileUrl"
                                    class="inputtext" runat="server"></textarea><br />
                                <%=Resources.Model.TxtWebFileUrlTitle%>
                            </td>
                        </tr>
                    </table>
                </div>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.txtWeight%></dt>
            <dd>
                <asp:TextBox ID="txtWeight" runat="server" Width="30" MaxLength="4" CssClass="validate[required,custom[onlyNumber]]"></asp:TextBox>
                <%=Resources.Model.txtWeightTitle%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ADStatistics%></dt>
            <dd>
                <asp:CheckBox ID="cblIsView" runat="server" />
                <%=Resources.Model.cblIsView%>
                <%=Resources.Model.txtViewCount%><asp:TextBox ID="txtViewCount" Width="30" Text="0"
                    runat="server"></asp:TextBox>
                <br />
                <asp:CheckBox ID="cblIsClick" runat="server" />
                <%=Resources.Model.cblIsClick%>
                <%=Resources.Model.txtClickCount%>
                <asp:TextBox ID="txtClickCount" Width="30" Text="0" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl style="display: none">
            <dt>统计连接路径</dt>
            <dd>
                <asp:RadioButtonList ID="rbtlLinkType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True" Text="<%$Resources:Model,rbtlLinkType1 %>"></asp:ListItem>
                    <asp:ListItem Value="1" Text="<%$Resources:Model,rbtlLinkType2 %>"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.txtExpiredTime%></dt>
            <dd>
                <asp:TextBox ID="txtExpiredTime" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
                    CssClass="validate[required]" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />
            &nbsp;<input type="button" class="subButton" name="Submit422" value="<%= Resources.Common.Back %>"
                onclick='location.href="AdvertisementList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
