<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WrokPlanAdd.aspx.cs" Inherits="FTD.Web.UI.aspx.WorkPlanM.WrokPlanAdd" %>

<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
    <link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
    <script src="../../JS/My97DatePicker/WdatePicker.js" type="text/javascript"></script>


    <script src="../../UEditor/editor_config.js" type="text/javascript"></script>
    <script src="../../UEditor/editor_all.js" type="text/javascript"></script>


    <script language="javascript">
        function PrintTable() {
            document.getElementById("PrintHide").style.visibility = "hidden"
            print();
            document.getElementById("PrintHide").style.visibility = "visible"
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle" style="height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                        <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;工作计划管理&nbsp;>>&nbsp;制定工作计划
                        <label style="color:red">【操作提示】：工作计划可以合并生成工作日报、周报、月报、专项工作汇报，请尽量把工作计划细化、分多次添加。</label>
                    </td>
                    <td align="right" valign="middle" style="height: 30px;">

                        <asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="保存并新增" />

                        &nbsp;
                        <button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
                </tr>
                <tr>
                    <td height="3px" colspan="2" style="background-color: #ffffff"></td>
                </tr>
            </table>
            <!--******************************增加页面代码********************************-->

            <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">计划标题：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                  <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">填报人：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox6" runat="server" Width="350px">张国龙</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                  <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">填报日期：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox7" runat="server" Width="350px">2019-03-20</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">计划日期从：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtProjectSerils" runat="server" Width="350px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">到：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtProjectName" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
               <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">计划工作类型：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:DropDownList runat="server">
                            <asp:ListItem>专项工作</asp:ListItem>
                            <asp:ListItem>日常工作</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList runat="server">
                            <asp:ListItem>--请选择项目--</asp:ListItem>
                            <asp:ListItem>150万㎡/a燃料电池膜及配套化学品产业化项目</asp:ListItem>
                            <asp:ListItem>蓝科途新能源锂电池隔膜项目</asp:ListItem>
                            <asp:ListItem>年产4GWh动力锂电池（组）智能制造扩建项目</asp:ListItem>
                            <asp:ListItem>山东潍坊抽水蓄能电站</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">计划内容：
                    </td>

                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TxtContent" runat="server" Width="100%" Rows="10" TextMode="MultiLine"></asp:TextBox>
                        <script type="text/javascript">
                            var editor = new baidu.editor.ui.Editor({ id: 'editor', minFrameHeight: 300 }); editor.render("TxtContent");
                        </script>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">附件：</td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>&nbsp;
                        <asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" />
                        &nbsp; &nbsp;
            
                        <asp:ImageButton ID="iButton4" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/ReadFile.gif" />
                        &nbsp; &nbsp;
            
                        <asp:ImageButton ID="iButton5" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/EditFile.gif" /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">上传附件：</td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                        <asp:Button ID="iButton2" runat="server" CausesValidation="False" CssClass="btn btn-blue" Text="上传" /></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">备注说明：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtBackInfo" runat="server" Width="350px" Height="90px" TextMode="MultiLine"></asp:TextBox>&nbsp;
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
