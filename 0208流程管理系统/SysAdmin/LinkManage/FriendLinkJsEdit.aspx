<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendLinkJsEdit.aspx.cs"
    Inherits="KingTop.Web.Admin.FriendLinkJsEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加友情链接静态文件</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../ColorPicker/colorpicker.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../JS/jquery-validationEngine-cn.js"></script>

    <script type="text/javascript" src="../JS/Advertising.js"></script>

    <script src="../ColorPicker/dhtmlxcommon.js" type="text/javascript"></script>

    <script src="../ColorPicker/colorpicker.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",           //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                                 //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                         //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                              //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            });
            Advertising.TypeChange();                                                   //初始化绑定

        });
        window.onload = function() {
            if (type > -1) {
                showEditMessage("广告位", "AdvertisingList.aspx<%=StrPageParams %>", "AdvertisingEdit.aspx?NodeCode=<%=NodeCode %>", "AdvertisingEdit.aspx?NodeCode=<%=NodeCode %>&action=edit&id=<%=ID %>");
            }
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="FriendLinkList.aspx?NodeCode=<%=NodeCode %>">>友情链接文件管理</a>
            ><span style="color: Blue"> 添加文件</span></h4>
        <dl>
            <dt>
                <%=Resources.Common.Name%></dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,60]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.jsName%></dt>
            <dd>
                <asp:TextBox ID="txtJsName" runat="server" CssClass="validate[required,length[1,60]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.Summary%></dt>
            <dd>
                <asp:TextBox ID="txtsummary" runat="server" TextMode="MultiLine" Height="110px" Width="283px"></asp:TextBox><br />
                插入 <a href="javascrip:aert(123);">
                    <%=Resources.FriendLink.WebUrl%></a> <a href="javascrip:aert(123);">
                        <%= Resources.FriendLink.WebName%></a>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.Type%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlType" runat="server" RepeatDirection="Horizontal" onclick="Advertising.TypeChange()">
                </asp:RadioButtonList>
                <asp:RadioButtonList ID="rbtlAdvertisingType" runat="server" RepeatDirection="Horizontal"
                    onclick="Advertising.AdvertisingTypeChange()">
                    <asp:ListItem Value="0" Selected="True" Text="<%$  Resources:Model,DefaultSetting %>"></asp:ListItem>
                    <asp:ListItem Value="1" Text="<%$  Resources:Model,CustomizeSetting %>"></asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <div id="TypeDiv1" style="display: none">
                    <%= Resources.Model.NullSetting%>
                </div>
                <div id="TypeDiv2" style="display: none">
                    <table border="0" cellpadding="2" cellspacing="1">
                        <tr class="tdbg">
                            <td>
                                <%= Resources.Model.PopType%>
                            </td>
                            <td>
                                <select name="ddlPopType" id="ddlPopType" runat="server">
                                    <option value="1" label="<%$ Resources:Model,ddlPopType1%>"></option>
                                    <option value="2" label="<%$ Resources:Model,ddlPopType2%>"></option>
                                    <option value="3" label="<%$ Resources:Model,ddlPopType3%>"></option>
                                    <option value="4" label="<%$ Resources:Model,ddlPopType4%>"></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%= Resources.Model.ddlPopPositionDesc%>
                            </td>
                            <td>
                                <select name="ddlPopPosition" id="ddlPopPosition" runat="server" onchange="Advertising.PopChanage('Pop',this.value)">
                                    <option selected="selected" value="1" label="<%$ Resources:Model,ddlPopPosition1%>">
                                    </option>
                                    <option value="2" label="<%$ Resources:Model,ddlPopPosition2 %>"></option>
                                    <option value="3" label="<%$ Resources:Model,ddlPopPosition3 %>"></option>
                                    <option value="4" label="<%$ Resources:Model,ddlPopPosition4%>"></option>
                                </select>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="PopLeft">
                                    <%=Resources.Model.left%></span>
                            </td>
                            <td>
                                <input name="TxtPopLeft" type="text" value="100" maxlength="4" id="TxtPopLeft" runat="server"
                                    style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="PopTop">
                                    <%=Resources.Model.Up%></span>
                            </td>
                            <td>
                                <input name="TxtPopTop" type="text" value="100" maxlength="4" id="TxtPopTop" runat="server"
                                    style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TimeSplit%>
                            </td>
                            <td>
                                <input name="TxtPopCookieHour" type="text" value="0" maxlength="2" id="TxtPopCookieHour"
                                    runat="server" style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                                <%=Resources.Model.TimeDesc%>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv3" style="display: none">
                    <table border="0" cellpadding="2" cellspacing="1">
                        <tr>
                            <td>
                                <%=Resources.Model.TimeDesc%>
                            </td>
                            <td>
                                <select name="ddlMovePosition" id="ddlMovePosition" runat="server" onchange="Advertising.PopChanage('Move',this.value);">
                                    <option selected="selected" value="1" label="<%$ Resources:Model,ddlPopPosition1%>">
                                    </option>
                                    <option value="2" label="<%$ Resources:Model,ddlPopPosition2%>"></option>
                                    <option value="3" label="<%$ Resources:Model,ddlPopPosition3%>"></option>
                                    <option value="4" label="<%$ Resources:Model,ddlPopPosition4%>"></option>
                                </select>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="MoveLeft">
                                    <%=Resources.Model.left%></span>
                            </td>
                            <td>
                                <input name="TxtMoveLeft" type="text" value="15" maxlength="4" id="TxtMoveLeft" runat="server"
                                    style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="MoveTop">
                                    <%=Resources.Model.Up%></span>
                            </td>
                            <td>
                                <input name="TxtMoveTop" type="text" value="200" maxlength="4" id="TxtMoveTop" runat="server"
                                    style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtMoveDelay%>
                            </td>
                            <td>
                                <input name="TxtMoveDelay" type="text" value="0.015" maxlength="7" id="TxtMoveDelay"
                                    runat="server" style="width: 36px;" class="validate[required]" />
                                <%=Resources.Model.TxtMoveDelayDesc%>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.cbMoveShowCloseAD%>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbMoveShowCloseAD" runat="server" />
                                <%=Resources.Common.ON%>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtMoveCloseFontColor%>
                            </td>
                            <td>
                                <input name="TxtMoveCloseFontColor" type="text" value="#FFFFFF" id="TxtMoveCloseFontColor"
                                    runat="server" style="font-size: 9pt; height: 15px;" />

                                <script type="text/javascript">                                    $(function initColorPicker() { var myCP1 = new dhtmlXColorPickerInput('TxtMoveCloseFontColor'); myCP1.setImagePath("../ColorPicker/imgs/"); myCP1.init(); }) </script>

                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv4" style="display: none">
                    <table border="0" cellpadding="2" cellspacing="1">
                        <tr>
                            <td>
                                <%=Resources.Model.ddlMovePositionDesc%>
                            </td>
                            <td>
                                <select name="ddlFixedPosition" id="ddlFixedPosition" runat="server" onchange="Advertising.PopChanage('Fixed',this.value);">
                                    <option selected="selected" value="1" label="<%$ Resources:Model,ddlPopPosition1%>">
                                    </option>
                                    <option value="2" label="<%$ Resources:Model,ddlPopPosition2%>"></option>
                                    <option value="3" label="<%$ Resources:Model,ddlPopPosition3%>"></option>
                                    <option value="4" label="<%$ Resources:Model,ddlPopPosition4%>"></option>
                                </select>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="FixedLeft">
                                    <%=Resources.Model.left%></span>
                            </td>
                            <td>
                                <input name="TxtFixedLeft" type="text" value="100" maxlength="4" id="TxtFixedLeft"
                                    runat="server" style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="FixedTop">
                                    <%=Resources.Model.Up%></span>
                            </td>
                            <td>
                                <input name="TxtFixedTop" type="text" value="100" maxlength="4" id="TxtFixedTop"
                                    runat="server" style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.cbMoveShowCloseAD%>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbFixedShowCloseAD" runat="server" />
                                <%=Resources.Common.ON%>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtMoveCloseFontColor%>
                            </td>
                            <td>
                                <input name="TxtFixedCloseFontColor" type="text" value="#FFFFFF" id="TxtFixedCloseFontColor"
                                    class="inputtext" runat="server" style="font-size: 9pt; height: 15px;" />

                                <script type="text/javascript">
                                    $(function initColorPicker() { var myCP1 = new dhtmlXColorPickerInput('TxtFixedCloseFontColor'); myCP1.setImagePath("../ColorPicker/imgs/"); myCP1.init(); }) 
                                </script>

                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv5" style="display: none">
                    <table border="0" cellpadding="2" cellspacing="1">
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.ddlFloatTypeDesc%>
                            </td>
                            <td>
                                <select name="ddlFloatType" id="ddlFloatType" runat="server">
                                    <option value="1" label="<%$ Resources:Model,ddlFloatType1%>"></option>
                                    <option value="2" label="<%$ Resources:Model,ddlFloatType2%>"></option>
                                    <option value="3" label="<%$ Resources:Model,ddlFloatType3%>"></option>
                                    <option value="4" label="<%$ Resources:Model,ddlFloatType4%>"></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=Resources.Model.ddlFloatPositionDesc%>
                            </td>
                            <td>
                                <select name="ddlFloatPosition" id="ddlFloatPosition" runat="server" onchange="Advertising.PopChanage('Float',this.value);">
                                    <option selected="selected" value="1" label="<%$ Resources:Model,ddlPopPosition1%>">
                                    </option>
                                    <option value="2" label="<%$ Resources:Model,ddlPopPosition1%>"></option>
                                    <option value="3" label="<%$ Resources:Model,ddlPopPosition1%>"></option>
                                    <option value="4" label="<%$ Resources:Model,ddlPopPosition1%>"></option>
                                </select>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="FloatLeft">
                                    <%=Resources.Model.left%></span>
                            </td>
                            <td>
                                <input name="TxtFloatLeft" type="text" value="100" maxlength="4" id="TxtFloatLeft"
                                    runat="server" style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <span id="FloatTop">
                                    <%=Resources.Model.Up%></span>
                            </td>
                            <td>
                                <input name="TxtFloatTop" type="text" value="100" maxlength="4" id="TxtFloatTop"
                                    runat="server" style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.cbMoveShowCloseAD%>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbFloatShowCloseAD" runat="server" />
                                <%=Resources.Common.ON%>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtMoveCloseFontColor%>
                            </td>
                            <td>
                                <input name="TxtFloatCloseFontColor" type="text" value="#FFFFFF" id="TxtFloatCloseFontColor"
                                    runat="server" style="font-size: 9pt; height: 15px;" />

                                <script type="text/javascript">                                    $(function initColorPicker() { var myCP1 = new dhtmlXColorPickerInput('TxtFloatCloseFontColor'); myCP1.setImagePath("../ColorPicker/imgs/"); myCP1.init(); }) </script>

                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TypeDiv6" style="display: none">
                    <%= Resources.Model.NullSetting%>
                </div>
                <div id="TypeDiv7" style="display: none">
                    <table border="0" cellpadding="2" cellspacing="1">
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtCoupletLeft%>
                            </td>
                            <td>
                                <input name="TxtCoupletLeft" type="text" value="15" maxlength="4" id="TxtCoupletLeft"
                                    runat="server" style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtCoupletTop%>
                            </td>
                            <td>
                                <input name="TxtCoupletTop" type="text" value="200" maxlength="4" id="TxtCoupletTop"
                                    runat="server" style="width: 36px;" class="validate[required,Custom[onlyNumber],length[1,4]" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtMoveDelay%>
                            </td>
                            <td>
                                <input name="TxtCoupletDelay" type="text" value="0.015" maxlength="7" id="TxtCoupletDelay"
                                    runat="server" style="width: 36px;" class="validate[required]" />
                                <%=Resources.Model.TxtMoveDelayDesc%>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.cbMoveShowCloseAD%>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbCoupletShowCloseAD" runat="server" />
                                <%=Resources.Common.ON%>
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td>
                                <%=Resources.Model.TxtMoveCloseFontColor%>
                            </td>
                            <td>
                                <input name="TxtCoupletCloseFontColor" type="text" value="#FFFFFF" id="TxtCoupletCloseFontColor"
                                    runat="server" style="font-size: 9pt; height: 15px;" />

                                <script type="text/javascript">
                                    $(function initColorPicker() {
                                        var myCP1 = new dhtmlXColorPickerInput('TxtCoupletCloseFontColor');
                                        myCP1.setImagePath("../ColorPicker/imgs/");
                                        myCP1.init();
                                    });
                                </script>

                            </td>
                        </tr>
                    </table>
                </div>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ddlSize%></dt>
            <dd>
                <asp:DropDownList ID="ddlSize" runat="server" onchange="Advertising.ddlSizeChange(this.value);">
                </asp:DropDownList>
                <br />
                <%=Resources.Model.txtWidth%>
                <asp:TextBox ID="txtWidth" runat="server" Width="30"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <%=Resources.Model.txtHeight%><asp:TextBox ID="txtHeight" runat="server" Width="30"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.rbtlWeight%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlWeight" runat="server">
                    <asp:ListItem Value="1" Text="<%$ Resources:Model,rbtlWeight1%>" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="2" Text="<%$ Resources:Model,rbtlWeight2%>"></asp:ListItem>
                    <asp:ListItem Value="3" Text="<%$ Resources:Model,rbtlWeight3%>"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsEnable %></dt>
            <dd>
                <asp:CheckBox ID="IsEnable" runat="server" />
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" CssClass="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />
            &nbsp;<input type="button" class="subButton" name="Submit422" value="<%= Resources.Common.Back %>"
                onclick='location.href="AdvertisingList.aspx<%=StrPageParams %>";'></input>
        </div>
    </div>
    </form>
</body>
</html>
