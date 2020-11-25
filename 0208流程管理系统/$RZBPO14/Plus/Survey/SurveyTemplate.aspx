<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyTemplate.aspx.cs"
    Inherits="AllPower.WEB.main.Plus.Survey.SurveyTemplate" %>     
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>问卷的模板</title>
    <link href="/SysAdmin/css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/SysAdmin/js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="/SysAdmin/js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="/SysAdmin/js/publicform.js"></script>

    <link href="/SysAdmin/CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script src="/SysAdmin/JS/Common.js" type="text/javascript"></script>

    <script src="/SysAdmin/JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="/SysAdmin/js/Advertising.js"></script>

    <script src="/SysAdmin/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript" src="/SysAdmin/JS/jquery-validationEngine-cn.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",  //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                        //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                     //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div>
        <table id="_ListInfoListTable" style="width: 100%;" border="0">
            <asp:Panel ID="plContent" runat="server">
                <tr>
                    <td colspan="2">
                        <!--$title$-->
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!--$desc$-->
                    </td>
                </tr>
                <!--$Content$-->
                <tr>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="提交" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="plPwd" runat="server" Visible="false">
                <tr>
                    <td colspan="2">
                        此问卷需要密码才能提交,请您输入密码
                    </td>
                </tr>
                <tr>
                    <td>
                        密码:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPwd" runat="server">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnPwd" runat="server" Text="提交" OnClick="btnPwd_Click" />
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <!--$hidContorls$-->
        <asp:HiddenField ID="hdnSurveyID" runat="server" />
        <asp:HiddenField ID="hdnSurveyColumn" runat="server" />
        <div>
        </div>
    </div>
    </form>
</body>
</html>
