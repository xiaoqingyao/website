<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rep_Style_Count.aspx.cs" Inherits="FTD.Web.UI.aspx.ProjectM.Rep_Style_Count" %>

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
                        <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;统计查询&nbsp;>>&nbsp;按照项目数量
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
            xAxis: {
                type: 'category',
                data: ['新能源汽车', '核电', '氢能', '可燃冰', '太阳能', '生物质能', '热泵']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [16, 8, 2, 14, 8, 2, 12],
                type: 'bar'
            }]
        };

        option = {
            legend: {},
            tooltip: {},
            dataset: {
                dimensions: ['product', '数量', '投资额'],
                source: [
                    { product: '新能源汽车', '数量': 24, '投资额': 185},
                     { product: '核电', '数量': 15, '投资额': 180.},
                      { product: '氢能', '数量': 7, '投资额': 90},
                       { product: '可燃冰', '数量': 21, '投资额': 66.},
                        { product: '太阳能', '数量': 28, '投资额': 35 },
                         { product: '生物质能', '数量':7, '投资额': 28 },
                          { product: '热泵', '数量': 9, '投资额': 170 },
                
                ]
            },
            xAxis: { type: 'category' },
            yAxis: {},
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: [
                { type: 'bar' },
                { type: 'bar' }
            ]
        };



        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    </form>
</body>
</html>
