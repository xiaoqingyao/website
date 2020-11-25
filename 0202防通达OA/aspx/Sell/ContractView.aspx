<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractView.aspx.cs" Inherits="OA.aspx.Sell.ContractView" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
    <script language="javascript">
        function PrintTable() {
            document.getElementById("PrintHide").style.visibility = "hidden"
            print();
            document.getElementById("PrintHide").style.visibility = "visible"
        }

        function DownloadFile(FileURL)   //下载附件
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
                <td valign="middle" style=" height: 30px;">
                    &nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                    <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;销售订单&nbsp;>>&nbsp;查看销售订单
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    <button type="button" class="btn btn-blue" onclick="javascript:PrintTable()">打印</button>
                    
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button>
                </td>
            </tr>
            <tr>
                <td height="3px" colspan="2" style="background-color: #ffffff">
                </td>
            </tr>
        </table>
        <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    合同名称：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongName" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    合同编号：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongSerils" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    合同类型：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongLeiXing" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    签约客户：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblQianYueKeHu" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    包装运输方式：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongMiaoShu" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    合同条款：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongTiaoKuan" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    合同内容：
                </td>
                <td colspan="3" style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblHeTongContent" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    生效日期：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblShengXiaoDate" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    终止日期：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblZhongZhiDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    提醒日期：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblTiXingDate" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    当前状态：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblNowState" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                   出货日期：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblQianYueRenBuy" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    收款日期：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblQianYueRenSell" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    创建日期：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblCreateTime" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    创建人：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblCreateUser" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    附件文件：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblFuJianList" runat="server"></asp:Label>
                </td>
                <td style="width: 15%; height: 25px; background-color: #f9f9f7" align="right">
                    备注信息：
                </td>
                <td style="padding-left: 5px; width: 35%; height: 25px; background-color: #ffffff">
                    <asp:Label ID="lblBackInfo" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <hr style="height: 1px; color: #003333;">
        &nbsp;
        <img src="../../images/TreeImages/hrms.gif" /><a target="RMid" href="SellLog.aspx?HeTongName=<%=HeTongName %>">合同产品记录</a>&nbsp;
        <hr style="height: 1px; color: #003333;">
        <iframe name="RMid" frameborder="0" marginheight="0" marginwidth="0" width="100%"
            height="500" bordercolor="#ffffFF" src="SellLog.aspx?HeTongName=<%=HeTongName %>"
            border="0"></iframe>
    </div>
    </form>
</body>
</html>
