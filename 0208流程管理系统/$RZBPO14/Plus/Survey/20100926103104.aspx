<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyTemplate.aspx.cs"
    Inherits="AllPower.Web.Admin.SurveyTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>问卷的模板</title>
    <link href="../../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../../js/publicform.js"></script>

    <link href="../../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script src="../../JS/Common.js" type="text/javascript"></script>

    <script src="../../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../js/Advertising.js"></script>

    <script src="../../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript" src="../JS/jquery-validationEngine-cn.js"></script>

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
                        深圳的手机
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        How
                    </td>
                </tr>
                <tr><td>1. 您好的看法</td></tr>

<tr><td><input  type="radio" checked='checked' id="q47" name="q47" value="好|61" />好<input  type="radio"  id="q47" name="q47" value="很好|62" />很好<input  type="radio"  id="q47" name="q47" value="非常好|63" />非常好</td></tr>

<tr><td>2. 性别</td></tr>

<tr><td><input class="validate[minCheckbox[1],maxCheckbox[1000]]" checked='checked' type="checkbox" id="q48" name="q48" value="男|64" />男<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q48" name="q48" value="女|65" />女<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q48" name="q48" value="保密|66" />保密</td></tr>


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
        <asp:HiddenField ID="hdnSurveyID" runat="server" Value="31" /><asp:HiddenField ID="hdnSurveyColumn" runat="server" Value="47|6,48|9" />
        
        
        <div>
        </div>
    </div>
    </form>
</body>
</html>
