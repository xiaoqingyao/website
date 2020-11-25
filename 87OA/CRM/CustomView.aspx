<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomView.aspx.cs" Inherits="CRM_CustomView" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script language="javascript">
  function PrintTable()
    {
        document.getElementById("PrintHide") .style.visibility="hidden"    
        print();
        document.getElementById("PrintHide") .style.visibility="visible"    
    }
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;客户管理&nbsp;>>&nbsp;查看客户信息
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <img class="HerCss" onclick="PrintTable()" src="../images/Button/BtnPrint.jpg" />
                    &nbsp;<img src="../images/Button/JianGe.jpg" />&nbsp;
                    <img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    
    <table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户名称：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblCustomName" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户编号：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblCustomSerils" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        负责人：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblChargeMan" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户地址：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblAddress" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户单位网站：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblUrlLink" runat="server"></asp:Label>
	</td>
       <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        邮编：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblYouBian" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        联系电话：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblTelStr" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户性质：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblXingZhi" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户来源：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblLaiYuan" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        所在区域：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblQuYu" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户状态：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZhuangTai" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        人数：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblRenShu" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        办公面积：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblBanGongMianJi" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户类别：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblLeiBie" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        客户级别：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblJiBie" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        业务范围：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblYeWuFanWei" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        所属行业：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblHangYe" runat="server"></asp:Label>
	</td>
       <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        </td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		</td>
    </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
        目前主要问题：</td>
            <td colspan="3" style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblMuQianWenTi" runat="server"></asp:Label></td>
        </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        预计下达订单时间：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblYuJiDingDanDate" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        信息化管理：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblBackInfoA" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        设备情况：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblBackInfoB" runat="server"></asp:Label>
	</td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        原有供应商：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblBackInfoC" runat="server"></asp:Label></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        创建时间：</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblTimeStr" runat="server"></asp:Label></td>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        所属业务员：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
		<asp:Label id="lblUserName" runat="server"></asp:Label></td>
    </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                提醒时间：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label1" runat="server"></asp:Label></td>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                订单及利润情况：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label2" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                收款情况：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label7" runat="server"></asp:Label></td>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                综合评分：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label8" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                共享人员：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label3" runat="server"></asp:Label></td>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                客户自定义A：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label4" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                客户自定义B：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label5" runat="server"></asp:Label></td>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                客户自定义C：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label6" runat="server"></asp:Label></td>
        </tr>
        <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		公司名称英文：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblNameEng" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		法人代码：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblFaRenDaiMa" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		营业执照：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblYingYeZhiZhao" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		资本额：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZiBenE" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		组织性质：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZuZhiXingZhi" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		营业场所：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblYingYeChangSuo" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		经济状况：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblJingJi" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		社会关系：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblSheHuiGuanXi" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		与本公司关系：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblBenGongSiGuanXi" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		介绍人：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblJieShaoRen" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		保证人：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblBaoZhengRen" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		税票名称：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblShuiPiaoName" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		地址电话：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblDiZhiDianHua" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		纳税登记号：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblNaShuiDengJiHao" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		开户行账号：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblKaiHuHangZhangHao" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		交易方式：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblJiaoYiFangShi" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		帐期：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZhangQi" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		付款方式：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblFuKuanFangShi" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		运费承担方：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblYunFeiChengDan" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		促销费用：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblCuXiaoFei" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		广告费用：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblGuangGaoFei" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		优待折扣：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblYouDaiZheKou" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		付款态度：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblFuKuanTaiDu" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		要否对账：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblShiFouDuiZhang" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		对账时间：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblDuiZhangShiJian" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		最佳拜访时间：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZuiJiaPaiFangShiJian" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		最佳收款时间：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZuiJiaShouKuanShiJian" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		同类产品其他供应客户：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblQiTaGongYing" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		常用哪家产品及原因：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblChangYongNaJia" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		对本公司意见：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblGongSiYiJian" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		资信：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZiXin" runat="server"></asp:Label>
	</td>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		总结论：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblZongJieLun" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        备注说明：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" colspan="3" >
		<asp:Label id="lblBackInfoD" runat="server"></asp:Label></td>
    </tr>        
</table>

    <hr style="height:1px; color: #003333;">
    &nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MyCustomLinkMan.aspx?GetType=View&CustomName=<%=CustomNameStr %>">客户联系人</a>&nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MyCustomLinkLog.aspx?GetType=View&CustomName=<%=CustomNameStr %>">联系记录</a>&nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MyCustomNeed.aspx?GetType=View&CustomName=<%=CustomNameStr %>">需求记录</a>&nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MyCustomPrice.aspx?GetType=View&CustomName=<%=CustomNameStr %>">报价记录</a>&nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MyCustomService.aspx?GetType=View&CustomName=<%=CustomNameStr %>">服务记录</a>&nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MyCustomBack.aspx?GetType=View&CustomName=<%=CustomNameStr %>">回访记录</a>&nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MyCustomHate.aspx?GetType=View&CustomName=<%=CustomNameStr %>">投诉记录</a>&nbsp;&nbsp;
    <img src="../images/TreeImages/hrms.gif" /><a target="RMid" href="MySongYang.aspx?GetType=View&CustomName=<%=CustomNameStr %>">送样记录</a>&nbsp;&nbsp;
    
    <hr style="height:1px; color: #003333;">
    <IFRAME name="RMid" frameBorder="0" marginHeight="0" marginWidth="0" width="100%" height="500"
													BORDERCOLOR="#ffffFF"  src="MyCustomLinkMan.aspx?CustomName=<%=CustomNameStr %>" border="0"></IFRAME>
    
    </div>
    </form>
</body>
</html>