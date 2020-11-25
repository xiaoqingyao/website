<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chart1.aspx.cs" Inherits="AllPower.WEB.SysAdmin.console.Chart1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../JS/jquery-3.2.min.js"></script>

    <script type="text/javascript">
        $(function () {
            var chart;
            $(document).ready(function () {

                // Radialize the colors
                Highcharts.getOptions().colors = $.map(Highcharts.getOptions().colors, function (color) {
                    return {
                        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
                        stops: [
		            [0, color],
		            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
		        ]
                    };
                });

                // Build the chart
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'container',
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: ''
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                formatter: function () {
                                    return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
                                }
                            }
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: 'Browser share',
                        data: [
                    ['正常出勤', 45.0],
                    ['外出', 26.8],
                    {
                        name: '迟到',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['早退', 8.5],
                    ['事假', 6.2],
                    ['休假', 0.7]
                ]
                    }]
                });
            });

        });
		</script>
        <script src="../JS/highcharts.js"></script>
</head>
<body>
<div id="container" style="min-width: 250px; height: 250px; margin: 0 auto"></div>
</body>
</html>
