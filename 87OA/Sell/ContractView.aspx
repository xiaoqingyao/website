<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContractView.aspx.cs" Inherits="Sell_ContractView" %>

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

        function DownloadFile(FileURL)   //���ظ���
        {
            document.getElementById("hdnFileURL").value = FileURL;
            document.getElementById("btnDownloadFile").click();
        } 
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="hdnFileURL" runat="server" type="hidden" />
    <div style="width: 0px; height: 0px; display: none;">
        <asp:Button ID="btnDownloadFile" Width="0px" Height="0px" runat="server" Text="Button"
            OnClick="btnDownloadFile_Click" />
    </div>
    <div>
        <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    &nbsp;<img src="../images/BanKuaiJianTou.gif" />
                    <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;���۶���&nbsp;>>&nbsp;�鿴���۶���
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
                    ��ͬ��ţ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongSerils" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ͬ���ͣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongLeiXing" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ǩԼ�ͻ���
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblQianYueKeHu" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��װ���䷽ʽ��
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongMiaoShu" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ͬ���
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongTiaoKuan" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ͬ���ݣ�
                </td>
                <td colspan="3" style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongContent" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��Ч���ڣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblShengXiaoDate" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ֹ���ڣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblZhongZhiDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    �������ڣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblTiXingDate" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ǰ״̬��
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblNowState" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                   �������ڣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblQianYueRenBuy" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    �տ����ڣ�
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblQianYueRenSell" runat="server"></asp:Label>
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
                    �����ļ���
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblFuJianList" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #D6E2F3" align="right">
                    ��ע��Ϣ��
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblBackInfo" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <hr style="height: 1px; color: #003333;">
        &nbsp;&nbsp;
        <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="SellLog.aspx?HeTongName=<%=HeTongName %>">��ͬ��Ʒ��¼</a>&nbsp;&nbsp;
        <hr style="height: 1px; color: #003333;">
        <iframe name="RMid" frameborder="0" marginheight="0" marginwidth="0" width="100%"
            height="500" bordercolor="#ffffFF" src="SellLog.aspx?HeTongName=<%=HeTongName %>"
            border="0"></iframe>
    </div>
    </form>
</body>
</html>
