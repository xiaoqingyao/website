<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="AllPower.Web.Admin.console.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>华强北在线MIS系统</title>
    <link type="text/css" href="../css/ustyle.css" rel="stylesheet" />
    <style type="text/css">
        *
        {
            margin: 0px;
            padding: 0px;
        }
        html
        {
            height: 100%;
            overflow-x: hidden;
        }
        body
        {
            font: 12px Arial, Helvetica, sans-serif;
            height: 100%;
        }
        #sortablemain
        {
            height: 100%;
        }
        #sortablemain td
        {
            height: 100%;
            cursor: default;
            padding: 0px 2px;
        }
        .portlet
        {
            border: #d0e6ec 1px solid;
            background: #fff;
            margin: 0 0 10px 0;
            filter:alpha(opacity=100); 
-moz-opacity:1; 
opacity:1;
        }
        .ui-sortable-placeholder
        {
            border: #d0e6ec 1px solid;
            visibility: visible;
            background: #fff;
        }
        .portlet h4
        {
            background: url(../img/title.png) repeat-x #ccc;
            height: 26px;
            line-height: 26px;
            font-size: 12px;
            color: #077ac7;
            padding-left: 10px;
            cursor:move;
        }
        .portlet h4 a
        {
            width: 14px;
            height: 14px;
            float: right;
            display: block;
            margin: 6px 6px 0 0;
        }
        .portlet h4 a.min
        {
            background: url(../img/min.png) no-repeat;
        }
        .portlet h4 a.max
        {
            background: url(../img/max.png) no-repeat;
        }
        .portlet h4 a.close
        {
            background: url(../img/close.png) no-repeat;
        }
        .sortContainer
        {
            padding: 10px;
        }
      
    </style>
    <link type="text/css" href="../css/ustyle.css" rel="stylesheet" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/public.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JS/jquery-3.2.min.js"></script>

    <script type="text/javascript" src="../JS/ui.core.js"></script>

    <script type="text/javascript" src="../JS/ui.sortable.js"></script>

    <script type="text/javascript" src="../JS/jquery.cookie.js"></script>

    <link href="../Calendar/skin/DeskCanlendar.css" rel="stylesheet" type="text/css" />
    <script src="../JS/win.js" type="text/javascript"></script>

    <script src="../JS/jquery.dialog.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function() {
            var position;
            $.ajax({
                type: "GET",
                url: "Main.aspx",
                dataType: "text",
                data: { op: 'get' },
                beforeSend: function(XMLHttpRequest) {
                    //Pause(this,100000);
                },
                success: function(msg) {
                    $(function() {
                        var list = msg; //获取位置的信息
                        var arrColumn = list.split('|');

                        $.each(arrColumn, function(m, n) {
                            var elemId = n.split(':')[0]; //容器ID
                            //debugger;
                            var arrRow = n.split(':')[1] ? n.split(':')[1].split('@') : ""; //单个序列ID
                            //debugger;
                            $.each(arrRow, function(m, n) {
                                if (n) {//排除空值

                                    $("#" + elemId).append($("#temp" + n)); //把序列填加进容器                              
                                }
                            });
                        });
                        $(".column").sortable({
                            connectWith: '.column',
                            revert: true,
                            stop: saveLayout
                        });

                        $(".portlet")
	                    .find('h4')
	                    .append('<a href="javascript:;" class="close"></a><a href="javascript:;" class="min"></a>')
	                    .find(".close")
	                    .click(function() {
	                        $(this).parent().parent().hide();
	                        saveLayout();
	                    })
	                    .end()
	                    .find(".min").toggle(
	                     function() {
	                    $(this).addClass("max").parent().next().hide();
	                     }, function() {
	                         $(this).removeClass("max").parent().next().show();
	                     })

                        $(".column").disableSelection();

                        function saveLayout() {
                            var list = "";
                            $.each($(".column"), function(m) {
                                list += $(this).attr('id') + ":";
                                $.each($(this).children(".portlet:visible"), function(d) {
                                    list += $(this).attr('name') + "@";
                                })
                                list += "|";
                            })

                            //存入数据库
                            $.ajax({
                                type: "GET",
                                url: "Main.aspx",
                                dataType: "text",
                                data: { op: 'update', position: list },
                                beforeSend: function(XMLHttpRequest) {
                                    //Pause(this,100000);
                                },
                                success: function(msg) {
                                    //alert(msg);
                                },
                                complete: function(XMLHttpRequest, textStatus) {
                                    //隐藏正在查询图片
                                },
                                error: function() {
                                    //错误处理
                                    alert({ msg: msg, title: '提示消息' });
                                }
                            });
                        }
                        $("#addLayer").click(function() {
                            if (document.getElementById("leftRadio").checked) {
                                $('#c1').append($('#temp' + $('#sortTitle').val()));

                            } else {
                                $('#c2').append($('#temp' + $('#sortTitle').val()));
                            }

                            $('#temp' + $('#sortTitle').val()).show();
                            saveLayout();
                        })

                    })
                },
                complete: function(XMLHttpRequest, textStatus) {

                },
                error: function() {
                    //错误处理
                    alert('错');
                }
            });
        });

        $(document).ready(function() {
            $("#txtMemorandum").change(function() {
                $.ajax({
                    type: "GET",
                    url: "Main.aspx",
                    dataType: "text",
                    data: { op: "memorandum", content: this.value },
                    beforeSend: function(XMLHttpRequest) {

                        //Pause(this,100000);
                    },
                    success: function(msg) {
                        alert({ msg: msg, title: '提示消息' });
                        // alert(msg);

                    },
                    complete: function(XMLHttpRequest, textStatus) {
                        //隐藏正在查询图片
                    },
                    error: function() {
                        //错误处理
                        alert('错');
                    }
                });
            });
        });

        var minute = 1000 * 60;
        var hour = minute * 60;
        var day = hour * 24;

        function getDateDiff() {
            var now = new Date();
            var og = $('#sysStart').html().split(' ');
            var og1 = og[0].split('-'); var og2 = og[1].split(':');
            var a = new Date(og1[0], og1[1], og1[2], og2[0], og2[1], og2[2]);

            var b = new Date(now.getFullYear(), now.getMonth() + 1, now.getDate(), now.getHours(), now.getMinutes(), now.getSeconds());
            var tian = ((b - a) / 1000 / 60 / 60 / 24).toFixed(1);
            var shi = ((b - a) / 1000 / 60 / 60).toFixed(1);
            var fen = ((b - a) / 1000 / 60).toFixed(1);
            var miao = ((b - a) / 1000);            
            $('#sysRun').html(tian + "天 " + shi + " 时 " + fen + "分 " + miao + "毫秒");
                    

            $.ajax({
                type: "GET",
                url: "Main.aspx",
                dataType: "text",
                data: { op: "memo", content: this.value },
                beforeSend: function(XMLHttpRequest) {

                    //Pause(this,100000);
                },
                success: function(msg) {
                    $('#memo').html(msg);

                },
                complete: function(XMLHttpRequest, textStatus) {
                 
                },
                error: function() {
                    //错误处理
                }
            });


            $.ajax({
                type: "GET",
                url: "Main.aspx",
                dataType: "text",
                data: { op: "cpu", content: this.value },
                beforeSend: function(XMLHttpRequest) {

                    //Pause(this,100000);
                },
                success: function(msg) {
                    $('#cpu').html(msg);

                },
                complete: function(XMLHttpRequest, textStatus) {

                },
                error: function() {
                    //错误处理
                }
            });
        }
        setInterval(getDateDiff, 1000);
       
    </script>

</head>
<body style="background:#22f url(../image/bg.jpg) repeat;">
    <form id="formMain" runat="server">
    <%--    <div>
        <b>
            <%=GetLoginAccountName()%></b>: 您上次访问是在:<%=strLastLoginDate%>
        上次访问ip:<%=strLastLoginIP%>
        登陆总数:<%=strLoginCount%>
        <br />
        系统运行环境 .Net版本：<%=NetVersion %>IIS版本：
        <%=IISVersion %>操作系统：<%=OSVersion %>数据库版本：<%=DataBaseVersion %>数据库版本号：<%=DataBaseVersionCode %>数据库大小：数据库:<%=DataBaseSize %>
        M / 日志:<%=LogSize %>
        M
        <br />
        系统运行信息 系统版本号：<%=SysVersion %>系统启动时间：<%=SysStartTime %>系统已运行时间：<%=SysRunTime %>系统CPU使用率：
        <%=SysCpuUserd %>系统分配的物理内存量：
        <%=SysMemoUserd %>缓存对象数：<%=SysCacheNum %>
    </div>--%>
    <div style="display: none">
        <div class="portlet" id="temp6" name="6">
            <h4>
                系统运行信息</h4>
            <div class="sortContainer">
                <table class="list" width="100%">
                    <tr>
                        <td style="width: 140px">
                            系统版本：
                        </td>
                        <td align="left">
                            <%=SysVersion %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            系统启动时间：
                        </td>
                        <td align="left">
                            <span id="sysStart"><%=SysStartTime%></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            系统已运行时间：
                        </td>
                        <td align="left">
                            <span id="sysRun"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            系统CPU使用率：
                        </td>
                        <td align="left" id="cpu">
                    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            系统分配的物理内存量：
                        </td>
                        <td align="left" id="memo">
                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            缓存对象数：
                        </td>
                        <td align="left">
                            <%=SysCacheNum%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="portlet" id="temp5" name='5'>
            <h4>
                系统运行环境</h4>
            <div class="sortContainer">
                <table class="list" width="100%">
                    <tr>
                        <td style="width: 80px">
                            Net版本：
                        </td>
                        <td align="left">
                            <%=NetVersion %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            IIS版本：
                        </td>
                        <td align="left">
                            <%=IISVersion %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            操作系统：
                        </td>
                        <td align="left">
                            <%=OSVersion %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            数据库版本：
                        </td>
                        <td align="left">
                            <%=DataBaseVersion %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            数据库大小：
                        </td>
                        <td align="left">
                            数据库:<%=DataBaseSize %>
                             &nbsp;&nbsp;&nbsp;/ 日志:<%=LogSize %> MB
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="portlet" id="temp3" name="3">
            <h4>
                日历</h4>
            <div class="sortContainer">
                <table cellpadding="0" cellspacing="0" width="99%" >
                    <tr>
                        <td>
                            <div id="cal" style="text-align:center">
                                <div id="top">
                                    公元&nbsp;<select></select>&nbsp;年&nbsp;<select></select>&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;农历<span></span>年&nbsp;[&nbsp;<span></span>年&nbsp;]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                                        type="button" value="回到今天" title="点击后跳转回今天" style="padding: 0px"></div>
                                <ul id="wk">
                                    <li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li><b>六</b></li><li><b>日</b></li></ul>
                                <div id="cm">
                                </div>
                                <div id="bm">
                                </div>
                            </div>

                            <script src="../Calendar/DeskCalendar.js" type="text/javascript"></script>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="portlet" id="temp7" name="7">
            <h4>
                我的短消息</h4>
            <div class="sortContainer">
                <table class="list" width="100%">
                    <asp:Repeater ID="rptMessage" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <a href='#' id="Title<%# Eval("ID")%>">
                                        <%#AllPower.Common.Utils.DropHtmlTag(Eval("Content").ToString())%></a>
                                </td>
                                <td style="width: 95px">
                                    <%#GetUserName(Eval("SendUID").ToString(),Eval("UserName").ToString ())%>
                                </td>
                                <td style="width: 125px">
                                    <%#Eval("AddDate","{0:yyyy-MM-dd hh:mm}")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
        <div class="portlet" id="temp4" name="4">
            <h4>
                当月考勤统计</h4>
            <div class="sortContainer">
                <iframe width="100%" height="250px" frameborder="0" scrolling="no" src="Chart1.aspx"></iframe>
            </div>
        </div>
        <div class="portlet" id="temp8" name="8">
            <h4>
                公告</h4>
            <div class="sortContainer">
                <table class="list" width="100%">
                    <asp:Repeater ID="rptNote" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <a target="frameRight" href="../Model/Messageview.aspx?ID=<%#Eval("ID") %>">
                                        <%#AllPower.Common.Utils.GetSubString(Eval("Title").ToString (),50,"...")%></a>
                                </td>
                                <td style="width: 75px">
                                    <%#String.Format("{0:yyyy-MM-dd}",Eval("publishdate")) %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
            <%--<div class="portlet" id="temp2" name='2'>
            <h4>
                我发表的信息</h4>
                <div class="sortContainer">
                    <table class="list" width="100%">
                        <tr style="background-color: #E7EEF8">
                            <td style="width: 150px">
                                项目
                            </td>
                            <td>
                                统计(条)
                            </td>
                              <td style="width: 150px">
                                项目
                            </td>
                            <td>
                                统计(条)
                            </td>
                        </tr>
                        <asp:Repeater ID="reptMeInfo" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("ModuleName")%>
                                    </td>
                                    <td align="left">
                                        <%#Eval("Count") %>
                                    </td>
                                        <td>
                                        <%#Eval("ModuleName2")%>
                                    </td>
                                    <td align="left">
                                        <%#Eval("Count2") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                 
                </div>
        </div>--%>
           <div class="portlet" id="temp1" name='1'>
            <h4>
                待审核的信息</h4>
                <div class="sortContainer">
                    <table class="list" width="100%">
                        <tr style="background-color: #E7EEF8">
                            <td style="width: 150px">
                                项目
                            </td>
                            <td>
                                统计(条)
                            </td>
                              <td style="width: 150px">
                                项目
                            </td>
                            <td>
                                统计(条)
                            </td>
                        </tr>
                        <asp:Repeater ID="reptAudit" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("ModelName")%>
                                    </td>
                                    <td align="left">
                                        <%#Eval("Counter")%>
                                    </td>
                                        <td>
                                        <%#Eval("ModelName2")%>
                                    </td>
                                    <td align="left">
                                        <%#Eval("Counter2")%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                 
                </div>
        </div>

        <div class="portlet" id="temp2" name='2'>
            <h4>
                人员工作完成情况</h4>
                <div class="sortContainer">
                    <iframe width="100%" height="200px" frameborder="0" scrolling="no" src="Chart.aspx"></iframe>
                </div>
        </div>
    </div>
    <table border="0" cellspacing="0" cellpadding="0" style="padding-left: 10px; padding-top:5px; " align="left">
        <tr>
            <td>
                <select id="sortTitle">
                <option value="1">待审核信息</option> 
                    <option value="6">系统运行信息</option>
                    <option value="5">系统运行环境</option>
                    <option value="3">日历</option>
                    <option value="7">我的短消息</option>
                    <option value="4">备忘录</option>
                    <option value="8">公告</option>
                    <option value="2">我发表的信息</option> 
                </select>
            </td>
            <td>
                <asp:RadioButton ID="leftRadio" runat="server" GroupName="waybt"  BorderStyle="None" style="border:0px; color:White;" Checked="true"  Text="左边"/>
                <asp:RadioButton ID="rightRadio" runat="server" GroupName="waybt" BorderStyle="None" style="border:0px; color:White;" Text="右边"/>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;<input type="button" value="添加模块" id="addLayer" class="AddBtn" />
            </td>
        </tr>
    </table>
    
    <br clear="right" />
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="sortablemain" style=" margin:0px;">
        <tr valign="top">
            <td id="c1" class="column" width="50%">
                &nbsp;
            </td>
            <td id="c2" class="column" width="">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
