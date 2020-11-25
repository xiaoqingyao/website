<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chart.aspx.cs" Inherits="AllPower.WEB.SysAdmin.console.Chart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    		<script type="text/javascript" src="../JS/jquery-3.2.min.js"></script>
		<script type="text/javascript">
		    $(function () {
		        var chart;
		        $(document).ready(function () {

		            var colors = Highcharts.getOptions().colors,
            categories = ['张三', '李四', '王五', '李六', '王七'],
            name = '部门员工',
            data = [{
                y: 55.11,
                color: colors[0],
                drilldown: {
                    name: '张三 完成率',
                    categories: ['第一季', '第二季', '第三季', '第四季'],
                    data: [10.85, 7.35, 33.06, 2.81],
                    color: colors[0]
                }
            }, {
                y: 21.63,
                color: colors[1],
                drilldown: {
                    name: '李四 完成率',
                    categories: ['第一季', '第二季', '第三季', '第四季'],
                    data: [0.20, 0.83, 1.58, 13.12, 5.43],
                    color: colors[1]
                }
            }, {
                y: 11.94,
                color: colors[2],
                drilldown: {
                    name: '王五 完成率',
                    categories: ['第一季', '第二季', '第三季', '第四季'],
                    data: [0.12, 0.19, 0.12, 0.36, 0.32, 9.91, 0.50, 0.22],
                    color: colors[2]
                }
            }, {
                y: 7.15,
                color: colors[3],
                drilldown: {
                    name: '李六 完成率',
                    categories: ['第一季', '第二季', '第三季', '第四季'],
                    data: [4.55, 1.42, 0.23, 0.21, 0.20, 0.19, 0.14],
                    color: colors[3]
                }
            }, {
                y: 2.14,
                color: colors[4],
                drilldown: {
                    name: '王七 完成率',
                    categories: ['第一季', '第二季', '第三季', '第四季'],
                    data: [0.12, 0.37, 1.65],
                    color: colors[4]
                }
            }];

		            function setChart(name, categories, data, color) {
		                chart.xAxis[0].setCategories(categories, false);
		                chart.series[0].remove(false);
		                chart.addSeries({
		                    name: name,
		                    data: data,
		                    color: color || 'white'
		                }, false);
		                chart.redraw();
		            }

		            chart = new Highcharts.Chart({
		                chart: {
		                    renderTo: 'container',
		                    type: 'column'
		                },
		                title: {
		                    text: '2013全体员工任务完成情况'
		                },
		                subtitle: {
		                    text: ''
		                },
		                xAxis: {
		                    categories: categories
		                },
		                yAxis: {
		                    title: {
		                        text: '完成率'
		                    }
		                },
		                plotOptions: {
		                    column: {
		                        cursor: 'pointer',
		                        point: {
		                            events: {
		                                click: function () {
		                                    var drilldown = this.drilldown;
		                                    if (drilldown) { // drill down
		                                        setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
		                                    } else { // restore
		                                        setChart(name, categories, data);
		                                    }
		                                }
		                            }
		                        },
		                        dataLabels: {
		                            enabled: true,
		                            color: colors[0],
		                            style: {
		                                fontWeight: 'bold'
		                            },
		                            formatter: function () {
		                                return this.y + '%';
		                            }
		                        }
		                    }
		                },
		                tooltip: {
		                    formatter: function () {
		                        var point = this.point,
                        s = this.x + ':<b>' + this.y + '% </b><br/>';
		                        if (point.drilldown) {
		                            s += '点击进入' + point.category + ' 四季工作详情';
		                        } else {
		                            s += '点击返回';
		                        }
		                        return s;
		                    }
		                },
		                series: [{
		                    name: name,
		                    data: data,
		                    color: 'white'
		                }],
		                exporting: {
		                    enabled: false
		                }
		            });
		        });

		    });
		</script>
    <script src="../JS/highcharts.js"></script>

</head>
<body>
<div id="container" style="min-width: 200px; height: 200px; margin: 0 auto"></div>
</body>
</html>
