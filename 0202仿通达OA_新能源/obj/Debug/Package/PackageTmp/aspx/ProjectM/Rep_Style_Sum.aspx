<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rep_Style_Sum.aspx.cs" Inherits="FTD.Web.UI.aspx.ProjectM.Rep_Style_Sum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
    <script src="echarts.common.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle" style="height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                        <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;统计查询&nbsp;>>&nbsp;各领域投资趋势
                    </td>
                    <td align="right" valign="middle" style="height: 30px;">查询：<asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="80px"></asp:TextBox>
                        <asp:Button ID="iButton4" runat="server" CssClass="btn btn-blue" Text="刷新" />&nbsp; &nbsp;
                        &nbsp;
                        <asp:Button ID="iButton2" runat="server" CssClass="btn btn-aqua" Text="导出" />&nbsp;</td>
                </tr>
            </table>

        </div>
        <div id="main" style="width: 1000px;height:800px;"></div>
         <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        option = {
            title: {
                text: '各领域投资趋势'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['新能源汽车', '可燃冰', '太阳能', '核能', '智能电网储能']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['2013', '2014', '2015', '2016', '2017', '2018', '2019']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '新能源汽车',
                    type: 'line',
                    stack: '总量',
                    data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name: '可燃冰',
                    type: 'line',
                    stack: '总量',
                    data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name: '太阳能',
                    type: 'line',
                    stack: '总量',
                    data: [150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name: '核能',
                    type: 'line',
                    stack: '总量',
                    data: [320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name: '智能电网储能',
                    type: 'line',
                    stack: '总量',
                    data: [820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    </form>
</body>
</html>