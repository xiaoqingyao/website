<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeListAdd.aspx.cs" Inherits="SystemManage_TreeListAdd" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
    <link href="../Style/Style.css" type="text/css" rel="STYLESHEET">
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
                    <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;�˵�����&nbsp;>>&nbsp;�����Ϣ
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
                    ��ʾ���֣�
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtTextStr" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=TextStr&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtTextStr').value=wName;}"
                        src="../images/Button/search.gif" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTextStr"
                        ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ����ͼƬ��
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtImageUrlStr" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=ImageUrlStr&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtImageUrlStr').value=wName;}"
                        src="../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ���˵���ʽ��
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:DropDownList runat="server" ID="SelClass" Width="150px">
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                        <asp:ListItem Value="system_icon" Text="system_icon"></asp:ListItem>
                        <asp:ListItem Value="workflow_icon" Text="workflow_icon"></asp:ListItem>
                        <asp:ListItem Value="kaoqing_icon" Text="kaoqing_icon"></asp:ListItem>
                        <asp:ListItem Value="jianzheng_icon" Text="jianzheng_icon"></asp:ListItem>
                        <asp:ListItem Value="renshi_icon" Text="renshi_icon"></asp:ListItem>
                        <asp:ListItem Value="peixun_icon" Text="peixun_icon"></asp:ListItem>
                        <asp:ListItem Value="tongji_icon" Text="tongji_icon"></asp:ListItem>
                        <asp:ListItem Value="gongcheng_icon" Text="gongcheng_icon"></asp:ListItem>
                        <asp:ListItem Value="gongzuo_icon" Text="gongzuo_icon"></asp:ListItem>
                        <asp:ListItem Value="bangong_icon" Text="bangong_icon"></asp:ListItem>
                        <asp:ListItem Value="jingyin_icon" Text="jingyin_icon"></asp:ListItem>
                        <asp:ListItem Value="kaohe_icon" Text="kaohe_icon"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ��̨��ֵ��
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtValueStr" runat="server" Width="350px"></asp:TextBox>
                    ��ǰ���һ��Ϊ��<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>&nbsp;
                    �ӽڵ�Ϊ��ֵ�����ڵ������Ϊ����ʾ������ͬ��
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ���ӵ�ַ��
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtNavigateUrlStr" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=NavigateUrlStr&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtNavigateUrlStr').value=wName;}"
                        src="../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    Ŀ���ܣ�
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtTarget" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=Target&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtTarget').value=wName;}"
                        src="../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ���ڵ㣺
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtParentID" runat="server" Width="350px"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtParentID"
                        Display="Dynamic" ErrorMessage="*���������������" MaximumValue="10000" MinimumValue="0"
                        Type="Integer"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="txtParentID" ErrorMessage="*�����Ϊ��"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    Ȩ�ޣ�
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtQuanXianList" runat="server" Width="350px">A_���|M_�޸�|D_ɾ��|E_����</asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=QuanXianList&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtQuanXianList').value=wName;}"
                        src="../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
                    ����
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtPaiXuStr" runat="server" Width="350px"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPaiXuStr"
                        Display="Dynamic" ErrorMessage="*���������������" MaximumValue="10000" MinimumValue="0"
                        Type="Integer"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="txtPaiXuStr" ErrorMessage="*�����Ϊ��"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
