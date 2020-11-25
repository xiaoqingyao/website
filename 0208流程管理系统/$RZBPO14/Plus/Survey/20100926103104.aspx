<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyTemplate.aspx.cs"
    Inherits="AllPower.Web.Admin.SurveyTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>�ʾ��ģ��</title>
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
            $("#theForm").validationEngine({ validationEventTriggers: "blur",  //�������¼�  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                        //�Ƿ�ʱ��֤��falseΪ�ύ��ʱ��֤,Ĭ��true
                success: false,                                                //Ϊtrueʱ��ʹ�в����ϵ�Ҳ�ύ��,false��ʾֻ��ȫ��ͨ����֤�˲����ύ��,Ĭ��false
                promptPosition: "topRight"                                     //��ʾ���ڵ�λ�ã�topLeft, topRight, bottomLeft,  centerRight, bottomRight
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
                        ���ڵ��ֻ�
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        How
                    </td>
                </tr>
                <tr><td>1. ���õĿ���</td></tr>

<tr><td><input  type="radio" checked='checked' id="q47" name="q47" value="��|61" />��<input  type="radio"  id="q47" name="q47" value="�ܺ�|62" />�ܺ�<input  type="radio"  id="q47" name="q47" value="�ǳ���|63" />�ǳ���</td></tr>

<tr><td>2. �Ա�</td></tr>

<tr><td><input class="validate[minCheckbox[1],maxCheckbox[1000]]" checked='checked' type="checkbox" id="q48" name="q48" value="��|64" />��<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q48" name="q48" value="Ů|65" />Ů<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q48" name="q48" value="����|66" />����</td></tr>


                <tr>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="�ύ" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="plPwd" runat="server" Visible="false">
                <tr>
                    <td colspan="2">
                        ���ʾ���Ҫ��������ύ,������������
                    </td>
                </tr>
                <tr>
                    <td>
                        ����:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPwd" runat="server">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnPwd" runat="server" Text="�ύ" OnClick="btnPwd_Click" />
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
