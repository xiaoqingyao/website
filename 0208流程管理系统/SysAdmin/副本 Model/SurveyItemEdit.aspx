<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyItemEdit.aspx.cs"
    Inherits="KingTop.Web.Admin.SurveyItemEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>����ʾ����ѡ��</title>
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

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/SurveyItem.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",  //�������¼�  validationEventTriggers:"keyup blur",
                inlineValidation: true, //�Ƿ�ʱ��֤��falseΪ�ύ��ʱ��֤,Ĭ��true
                success: false, //Ϊtrueʱ��ʹ�в����ϵ�Ҳ�ύ��,false��ʾֻ��ȫ��ͨ����֤�˲����ύ��,Ĭ��false
                promptPosition: "topRight"//��ʾ���ڵ�λ�ã�topLeft, topRight, bottomLeft,  centerRight, bottomRight

            })
        });
        window.onload = function() {
            if (type > -1) {
                showEditMessage("�ʾ����ѡ��", "SurveyItemList.aspx<%=StrPageParams %>", "SurveyItemEdit.aspx?NodeCode=<%=NodeCode %>&nid=<%=StrNid %>", "SurveyItemEdit.aspx?NodeCode=<%=NodeCode %>&nid=<%=StrNid %>&action=edit&id=<%=ID %>");
            }
        } 
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            λ�ã� <a href="#">��չӦ��</a> > <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>">�ʾ�������</a>
            > <a href="SurveyItemList.aspx?NodeCode=<%=NodeCode %>&nid=<%=StrNid %>">�ʾ����ѡ�����</a>
            > <span style="color: Blue">���/�޸��ʾ����ѡ��</span></h4>
        <dl>
            <dt>
                <%=Resources.Model.ModelFieldGroupName%></dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>�Ƿ���</dt>
            <dd>
                <asp:CheckBox ID="cbIsRequired" runat="server" Checked="true" />
                <%=Resources.Common.Yes %>
            </dd>
        </dl>
        <dl>
            <dt>��ʾ��ͶƱ�����б�</dt>
            <dd>
                <asp:CheckBox ID="cbIsShow" runat="server" Checked="false" />
                <%=Resources.Common.Yes %>&nbsp; ע:������Ϊ"��"����ͶƱ�����б�Ż���ʾ������ѡ�����ص�ͶƱ��Ϣ
            </dd>
        </dl>
        <dl>
            <dt>�������ͣ�</dt>
            <dd>
                <asp:RadioButtonList ID="rbtlType" runat="server" RepeatDirection="Horizontal" RepeatColumns="5"
                    onclick="SurveyItem.TypeChange();">
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl id="dl1" runat="server">
            <dt>�ش������ַ�����</dt>
            <dd>
                <asp:TextBox ID="txtFontSize" runat="server" CssClass="validate[required,custom[onlyNumber],length[1,255]]"
                    Text="255" Width="45px"></asp:TextBox>*
            </dd>
        </dl>
        <dl id="dl2" style="display: none">
            <dt>����ѡ��</dt>
            <dd>
                <asp:TextBox ID="txtDataItemd" runat="server" Height="141px" TextMode="MultiLine"
                    Width="273px"></asp:TextBox>
                ʾ�� ��|Ů|����
            </dd>
        </dl>
        <dl id="dl3" style="display: none">
            <dt>�б�����</dt>
            <dd>
                <asp:TextBox ID="txtRowCount" runat="server" CssClass="validate[required,custom[onlyNumber]]"
                    MaxLength="1" Text="0" Width="45px"></asp:TextBox>*
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />&nbsp;<input type="button" name="Submit422" value="<%= Resources.Common.Back %>"
                    class="subButton" onclick='location.href="SurveyItemList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
