<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PeiXunRiJiModify.aspx.cs"
    Inherits="DocFile_PeiXunRiJiModify" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
    <link href="../Style/Style.css" type="text/css" rel="STYLESHEET">
    <script src="../UEditor/editor_config.js" type="text/javascript"></script>
    <script src="../UEditor/editor_all.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../UEditor/themes/default/ueditor.css" />
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
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    &nbsp;<img src="../images/BanKuaiJianTou.gif" />
                    <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;��ѵ����&nbsp;>>&nbsp;�޸���ѵ��־��Ϣ
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/Submit.jpg"
                        OnClick="ImageButton1_Click" />
                    <img src="../images/Button/JianGe.jpg" />&nbsp;
                    <img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;
                </td>
            </tr>
            <tr>
                <td height="3px" colspan="2" style="background-color: #ffffff">
                </td>
            </tr>
        </table>
        <table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ��ѵ���ƣ�
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtPeiXunName" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPPeiXun&LieName=PeiXunName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtPeiXunName').value=wName;}"
                        src="../images/Button/search.gif" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPeiXunName"
                        ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ��־���⣺
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtRiJiTitle" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPPeiXunRiJi&LieName=RiJiTitle&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtRiJiTitle').value=wName;}"
                        src="../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ��־���ڣ�
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtRiJiDate" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var dataString = showModalDialog('../JS/calendar.htm', 'yyyy-mm-dd' ,'dialogWidth:286px;dialogHeight:221px;status:no;help:no;');if(dataString==null){}else{document.getElementById('txtRiJiDate').value=dataString;}"
                        src="../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ��־���ݣ�
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtRiJiContent" runat="server" Width="100%" Rows="10" TextMode="MultiLine"></asp:TextBox>
                    <script type="text/javascript">
                        var editor = new baidu.editor.ui.Editor({ id: 'editor', minFrameHeight: 300 }); editor.render("txtRiJiContent");
                    </script>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ¼���ˣ�
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtUserName" runat="server" Width="350px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ¼��ʱ�䣺
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtTimeStr" runat="server" Width="350px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
