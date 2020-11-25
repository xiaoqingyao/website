<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="OA.aspx.Index" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
        <link rel="stylesheet" href="css/main.css" type="text/css"/>
        <style type="text/css">
            body, td
            {
	            margin: 0px;
	            line-height: 20px;
	            font-size: 13px;
	            font-family:微软雅黑;
	            color: #eeeeee;
            }
        </style>
        <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
        <link href="../../css/main.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript">
            //模拟菜单对象
            var menuObj = <%=_MenuObj %>;

            window.onresize=function(){
                adjustSize();
            }

            function adjustSize(){
                try{
                    var iframeW = $("#center .selected").width();
                    var iframeH = $("#center .selected").height() - 70;

                    for(var i = 0;i < window.frames.length ;i++){
                        $("#"+window.frames[i].name).attr("width",iframeW);
                        $("#"+window.frames[i].name).attr("height",iframeH);
                    }
                }catch(e){ 
                }
            }
        </script></head>

    <body>

        <div id="body" class="">
            <!--头部-->
            <div class="header">
                <table>
                    <tr>
                        <td style="width:15px;">&nbsp;</td>
                        <td>
                            <a href="#" class="logo">
                                <img src="../../images/logo.png" style="width:140px; height:35px; margin-right:20px;" />
                            </a>
                        </td>
                        <td class="taskbar fl" style="padding-left:36px;">
                            <div class="tabs-scroll scroll-left undis" id="tabs_left_scroll"></div>
                            <div class="tabs-container" id="tabs-container">
                                <!--<div class="select">
                                    <a hidefocus="hidefocus" closable="true" index="portal_5" class="tab" id="tabs_link_portal_5" href="javascript:;">我的桌面</a>
                                    <a hidefocus="hidefocus" index="portal_5" class="close" href="javascript:;"></a>
                                </div>-->
                            </div>
                            <div class="tabs-scroll scroll-right undis" id="tabs_right_scroll"></div>
                        </td>
                        <td class="user_info_area">
                            <table>
                                <tr>
                                    <td class="user_info_menu" id="user_info_control">
                                        <i class="iconfont icon-1"></i>
                                    </td>
                                    <%--<td style="width:10px !important;">&nbsp;</td>
                                    <td class="user_info_menu" id="search">
                                        <i class="iconfont icon-2"></i>
                                    </td>
                                    <td style="width:10px;"></td>
                                    <td class="user_info_menu" id="taskCenter">
                                        <i class="iconfont icon-3"></i>
                                    </td>
                                    <td style="width:10px;">&nbsp;</td>
                                    <td class="user_info_menu" id="community">
                                        <i class="iconfont icon-qiyeshequ"></i>
                                    </td>
                                    <td style="width:10px;"></td>
                                    <td class="user_info_menu" id="infoCenter">
                                        <i class="iconfont icon-4"></i>
                                    </td>--%>
                                    <td style="width:50px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class='userInfoPanel'>
                    <div class="userInfoShow">
                        <div class="userPhoto" style="display:none;"><img src="../../images/test.png" title=""/></div>
                        <div class="userNameAndState">
                            <div class="userName">
                                <%=_UserName %>
                                <img src="../../images/online.png" class="userState"/>
                                <div class="chooseState">
                                    <div id="online">在线</div>
                                    <div id="busy">忙碌</div>
                                    <div id="offline">离开</div>
                                </div>
                            </div>
                            <div class="userDepartment"><%=_Department %></div>
                        </div>
                    </div>
                    <div class="functionArea">
                        <div class="contorlPanelEntery" onclick="createTab('1','个人桌面','Main/desktop.aspx')"><nobr>个人桌面</nobr></div>
                        <div class="logoutBtn" onclick="if(confirm('确定要退出系统吗？'))window.location.href='loginout.aspx'"><nobr>注销</nobr></div>
                    </div>
                </div>
            </div>

            <!--east 通知中心区域-->
            <div id="east" class="east" style="display:none;">
                <ul class="nav nav-tabs">
                    <li class="nav-pill active" paneltype="today">
                        <a class="pill-bg" href="javascript:void(0)" data-id="n-01" data-url="today">今日</a>
                    </li>
                    <li class="nav-pill" paneltype="msg">
                        <a class="pill-bg" href="javascript:void(0)" data-id="n-02" data-url="message">消息</a>
                    </li>
                    <li class="nav-pill" paneltype="org">
                        <a class="pill-bg" href="javascript:void(0)" data-id="n-03" daat-url="organization">组织</a>
                    </li>
                </ul>
                <div id="east-tab" class="tab-content">
                    <!--今日-->
                    <div class="tab-pane pane-today active">
                        <div id="datetime" class="dateArea">
                            <div title="2015年4月29日" class="weather-date" id="date">
                                <span>4月29日</span>
                                星期三
                            </div>
                            <div title="农历 三月十一" id="mdate">农历三月十一</div>
                        </div>
                        <div id="weatherarea" class="mod">
                            <div class="mod-hd">
                                <span class="mod-hd-title">天气</span>
                                <div class="city" style="display: none;"><i class="iconfont" id="changecity"></i></div>
                            </div>
                            <div class="mod-bd">
                                <div id="weather" class="clearfix">
                                    <span style="width: 100%;text-align: center;color: #999;display: block;">未开启天气预报</span>
                                </div>
                            </div>
                        </div>
                        <div class="mod">
                            <div class="mod-hd">
                                <div class="mod-hd-title">日程</div>
                            </div>
                            <div class="mod-bd">
                                <ul class="calendar-list" id="cal_list">
                                    <li>
                                        <a class="common-font" cal_type="calendar" cal_id="42" href="javascript:;">
                                            <span class="cal_content">3wqrqwrwqr</span>
                                            <span class="pull-right">01:00</span>
                                        </a>
                                    </li>
                                </ul>
                                <div id="caltip" class="notip" style="display: none;">今日暂无日程</div>
                            </div>
                        </div>
                        <div class="mod">
                            <div class="mod-hd">
                                <div class="mod-hd-title">提醒事项</div>
                            </div>
                            <div class="mod-bd">
                                <ul class="remind_list" id="remind_list">

                                </ul>
                                <div id="remindtip" class="notip" style="display: block;">今日暂无提醒</div>
                            </div>
                        </div>
                    </div>

                    <!--消息-->
                    <div class="tab-pane pane-msg">
                        <div id="msg-tool" class="btn-group msg-tool">
                            <button class="btn btn-mini btn-primary" msg-panel="nocbox" type="button">
                                <span>事务提醒</span>
                            </button>
                            <button class="btn btn-mini" msg-panel="weixun" type="button">
                                <span>微讯</span>
                            </button>
                        </div>
                        <div id="nocbox" class="msg-panel active">
                            <div id="new_noc_panel" class="noc on">
                                <div id="new_noc_list" class="new_noc_list">
                                    <div class="noc_item noc_item_1">
                                        <div class="noc_item_title">
                                            <a title="查看全部" type_id="1" class="noc_item_read pull-right" href="javascript:;">
                                                <i class="glyphicon glyphicon-arrow-left"></i>
                                            </a>
                                            <a title="全部已阅" type_id="1" class="noc_item_cancel pull-right" href="javascript:;">
                                                <i class="glyphicon glyphicon-arrow-right"></i>
                                            </a>
                                            <span>公告通知</span>
                                        </div>
                                        <div class="noc_item_data">
                                            <li class="" type_id="1" url="/general/notify/show/read_notify.php?NOTIFY_ID=15" sms_id="25762" id="noc_li_25762">
                                                <a class="noc-subitem" href="javascript:;">
                                                    <p class="noc_item_info">
                                                        <span class="noc_item_time pull-right ">1小时前</span>
                                                        <span class="name">王云</span>
                                                    </p>
                                                    <p class="noc_item_content">请查看公告通知！<br>标题：加快航空
                                                    </p>
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                </div>
                                <div class="noc-nav-bar" style="display: block;">
                                    <a class="viewbtn" id="ViewAllNoc" hidefocus="hidefocus" href="javascript:;">
                                        <i class="iconfont icon-yiyue"></i>
                                        全部已阅
                                    </a>
                                    <a class="viewbtn" id="ViewDetail" hidefocus="hidefocus" href="javascript:;">
                                        <i class="iconfont icon-quanbu"></i>
                                        查看全部
                                    </a>
                                    <a id="check_remind_histroy" class="noc-right" hidefocus="hidefocus" href="javascript:;">
                                        <i class="iconfont icon-lishixiaoxi"></i>
                                        历史消息
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="weixun" class="msg-panel">
                            <ul id="recentlist" class="recentlist">
                                <li>
                                    <a class="recentItem" fromid="126" href="javascript:;">
                                        <img class="rec_avatar" src="../../images/avatar/avatar.png">
                                        <div class="rec_info">
                                            <span class="rec_name">体验用户63</span>
                                            <span class="rec_time">18:13</span>
                                            <p class="rec_content"></p>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div id="rec_tips" class="rec_tips" style="display: none;">暂无最近联系人</div>
                            <div class="rec-ft">
                                <button class="btn btn-info pull-left" id="tosend" type="button">
                                    <i class="iconfont icon-iconfontquanbuxiaoxizhengchang"></i>群发
                                </button>
                                <i id="refresh-rec" title="刷新" class="glyphicon glyphicon-refresh refresh pull-right"></i>
                                <i id="clear-rec" title="清空" class="glyphicon glyphicon-align-left del pull-right"></i>
                            </div>
                        </div>
                    </div>

                    <!--组织-->
                    <div class="tab-pane pane-org">
                        <div id="org_tool" class="btn-group org_tool">
                            <button user-type="user_online" class="btn btn-mini online-btn btn-primary" type="button">
                                <span>在线</span>
                                <span class="user_online">6</span>
                            </button>
                            <button user-type="user_all" class="btn btn-mini online-btn" type="button">
                                <span>全部</span>
                            </button>
                        </div>
                        <div id="org_panel" class="org-panel">
                            <div id="user_online" class="online-panel" style="display: block;">
                                <div id="orgTree0">
                                    在线
                                </div>
                            </div>
                            <div id="user_all" class="online-panel" style="display: none;">
                                <div id="orgTree1">
                                    全部
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="east-handle" onclick="closeEastTab()" href="javascript:void(0)">
                    <i class="iconfont icon-fanhui"></i>
                </a>
            </div>

            <!--bar-->
            <div class="bar" id="bar">
                <div id="barSwitcher">
                    <span class="barTitle">导航菜单</span>
                    <span class="marginLeft5" onclick="adjustSize();" >
                    <input type="checkbox" data-toggle="switch"  data-size="mini" data-label-width="14" class="undis" name="menu_config" checked />                    
                </span>
                </div>
                <div id="bar_left"></div>
            </div>

            <!--sideBar-->
            <div class="sideBar" id="sideBar">
                <div id="sideBarMain">
                    <!--<div class="sideBarMain">-->
                    <!--<div class="menuScroll scrollUp" style="display: block;"></div>-->
                    <!--<ul id="firstMenu" class="firstMenu">-->
                    <!--<li subMenuId="secondMenu-01">-->
                    <!--<div class="firstMenuItem firstMenuItemHover">-->
                    <!--<i class="icon"></i>-->
                    <!--<span class="firstMenuTitle">个人事务</span>-->
                    <!--</div>-->
                    <!--<div id="secondMenu-01" class="secondPanel">-->
                    <!--<h4>个人事务</h4>-->
                    <!--<ul class="secondMenu clearfix">-->
                    <!--<li>-->
                    <!--<a href="javascript:void(0);" class="secondMenuItem" onclick="">消息管理</a>-->
                    <!--</li>-->
                    <!--<li class="expand">-->
                    <!--<a href="javascript:void(0);" class="secondMenuItem" onclick="">工作计划</a>-->
                    <!--<ul class="thirdMenu">-->
                    <!--<li>-->
                    <!--<a href="javascript:void(0);" class="thirdMenuItem" onclick="">工作计划查询</a>-->
                    <!--</li>-->
                    <!--</ul>-->
                    <!--</li>-->
                    <!--</ul>-->
                    <!--</div>-->
                    <!--</li>-->
                    <!--</ul>-->
                    <!--<div class="menuScroll scrollDown" style="display: block;"></div>-->
                    <!--</div>-->
                </div>

                <div class="sideBarFooter">
                    <ul class="footerLinks clearfix">
                        <li class="footerLink footerLinkIcon">
                            <a href="javascript:void(0);" class="icon glyphicon glyphicon-home" data-title="个人桌面" id="tfShowDesk"></a>
                        </li>
                        <li class="footerLink footerLinkIcon" style="visibility:hidden;">
                            <a href="javascript:void(0);" class="icon glyphicon glyphicon-question-sign" data-title="在线帮助" ></a>
                        </li>
                        <li class="footerLink">
                            <a href="javascript:adjustSize();" class="icon glyphicon glyphicon-chevron-left" data-title="图标模式" id="handMenuWord"></a>
                        </li>
                    </ul>
                </div>
            </div>

            <!--center-->
            <div class="center" id="center" style="overflow:hidden;">
                <div class="center-logo">
                    <img src="../../images/logo_tos.png"/>
                    <a href="javascript:void(0);" class="btn-desktop" data-title="个人桌面" id="centerShowDesk">个人桌面</a>
                </div>
            </div>
        </div>

    </body> 

        <!-- 暂时放到底部 -->
    <%--<script src="common-js/WdatePicker/WdatePicker.js" type="text/javascript"></script>--%>
    <script src="../../common-js/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="../../common-js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../common-js/bootstrap/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="../../common-js/publicFunction.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../common-js/tab.js"></script>
    <script src="../js/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/main.js"></script>
</html>
