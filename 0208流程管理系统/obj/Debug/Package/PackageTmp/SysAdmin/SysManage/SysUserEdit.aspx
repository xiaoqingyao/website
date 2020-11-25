<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysUserEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SysUserEdit" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>�û�����</title>

    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link rel="stylesheet" href="../css/template.css" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script language="javascript" type="text/javascript">
        function CheckName() {
            PageMethods.CheckName(document.getElementById("txtAccountName").value, document.getElementById("hdSiteID").value, AlertA);
        }
        function AlertA(result) {
            if (result == "1") {
                alert({ msg: '���û��Ѿ��ǵ�ǰվ����û����޷���ӣ�', title: '��ʾ��Ϣ' });
                document.getElementById("txtAccountName").value = "";
            }
            if (result == "2") {
                alert({ msg: '���û��Ѿ����û����д��ڣ�������Ϊ��ǰվ����Ӹ��û���', title: '��ʾ��Ϣ' });
                document.getElementById("txtAccountPwd").value = "123456";
                document.getElementById("txtAccountPwd").disabled = true;
            }
        }
        
        var type=-1;
        var userName="";
        var errmsg="";
        var userid=-1;
        function showMessage() {
        var msgContent="";
        var jumpurl="";
        //��ӳɹ�
            if (type == 0) {
                msgContent="����û�<font color=red>"+userName+"</font>�ɹ�<br>";
                msgContent+="<a href='SysUserList.aspx?NodeCode=<%=NodeCode %>' style='color:blue'>�����б�</a> | ";
                msgContent+="<a href='SysUserEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>�������</a>";
                if(userid!=-1)
                {
                    msgContent+=" | <a href='SysUserEdit.aspx?action=Edit&NodeCode=<%=NodeCode %>&UserID="+userid+"' style='color:red'>�޸ı��û�</a>";
                }
                msgContent+="<br>ע��3���Ӻ��Զ�ת���б�ҳ��";
                jumpurl="SysUserList.aspx?NodeCode=<%=NodeCode %>";
                alert({ msg: msgContent, status: "1", title: "��ʾ��Ϣ", url:jumpurl,time: 3000,width:400 })
            }
            else if (type == 1) {  //�޸ĳɹ�
                msgContent="�޸��û�<font color=red>"+userName+"</font>�ɹ�<br>";
                msgContent+="<a href='SysUserList.aspx<%=StrPageParams %>' style='color:blue'>�����б�</a> | ";
                msgContent += "<a href='SysUserEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>'class='reclose' style='color:red'>�����޸�</a> | ";
                msgContent+="<a href='SysUserEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>������û�</a><br>";
                msgContent+="ע��3���Ӻ��Զ�ת���б�ҳ��";
                jumpurl="SysUserList.aspx<%=StrPageParams %>";
                alert({ msg: msgContent, status: "1", title: "��ʾ��Ϣ", url:jumpurl,time: 3000,width:400 })
            }
            else if (type == 2) {  //����ʧ��
                msgContent = "����ʧ��,ԭ�����£�<br>";
                msgContent += "<font style='color:green'>" + errmsg + "</font><br>";
                msgContent+="ע��10���Ӻ���ʾ���Զ��ر�";
                alert({ msg: msgContent, status: "2", title: "��ʾ��Ϣ", time: 10000, width: 400 })
            }
        }
        window.onload=function(){
            if(type>-1)
            {
                showMessage();
            }
        }
    </script>
</head>
<body>
    <form id="theForm" name="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div class="container">
        <h4>
            λ�ã� <%GetPageNav(NodeCode); %>
        </h4>
        
        <div id="panel">
         <fieldset>
         <dl>
        	<dt>��¼����</dt>
            <dd><input type="text" id="txtAccountName" runat="server" class="validate[required,length[3,12]]" onchange="CheckName()" />
                <input type=hidden id="hdSiteID" runat=server  /><input type=hidden id="hdUserGropOld" runat=server  /></dd>
         </dl>
         <span id="span1" runat=server>
         <dl>
        	<dt>���룺</dt>
        	<dd><asp:TextBox ID="txtAccountPwd" runat="server" TextMode="Password" CssClass="validate[required,length[6,15]] text-input"></asp:TextBox></dd>
         </dl>
         </span>
         <dl>
        	<dt>�����û��飺</dt>
        	<dd> <asp:DropDownList ID="ddlUserGroup" runat=server></asp:DropDownList>
        	</dd>
         </dl>
         <dl>
            <dt>�Ƿ���Ч��</dt>
            <dd><asp:RadioButtonList ID="RBL_IsValid" runat="server" Height="16px" RepeatDirection=Horizontal Width="124px">
                      <asp:ListItem Value="0">����</asp:ListItem>
                      <asp:ListItem Value="1" Selected=True>����</asp:ListItem>
                 </asp:RadioButtonList>
            </dd>
         </dl>
         <dl>
            <dt>����ID��</dt>
            <dd><asp:TextBox ID="txtAccountOrder" runat="server" CssClass="validate[required,custom[onlyNumber],length[0,3]] text-input" Width="40px">0</asp:TextBox></dd>
         </dl>
         <div style="clear: left"></div>
      </fieldset>            
        </div>
        <div class="Submit">
            <asp:Button ID="BtnSave" runat="server" CssClass="subButton" Text="<%$Resources:Common,Save %>"
                OnClick="BtnSave_Click" />
           <input type="button" name="Submit422" Class="subButton" value="<%= Resources.Common.Back %>" onclick='location.href="SysUserlist.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
