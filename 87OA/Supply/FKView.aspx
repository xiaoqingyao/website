<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FKView.aspx.cs" Inherits="Supply_FKView" %>

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
                    <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;�ɹ�����&nbsp;>>&nbsp;�鿴����ƻ�
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <img class="HerCss" onclick="PrintTable()" src="../images/Button/BtnPrint.jpg" />
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
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ͬ���ƣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongName" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��Ӧ�̣�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblQianYueKeHu" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongMiaoShu" runat="server"></asp:Label>
                </td>
                 <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    �Ƿ��ˣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    �������ѣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblTiXingDate" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                   �������ڣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblShengXiaoDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    �������ڣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblCreateTime" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    �����ˣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblCreateUser" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ע��Ϣ��
                </td>
                <td  colspan="3" style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblBackInfo" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
