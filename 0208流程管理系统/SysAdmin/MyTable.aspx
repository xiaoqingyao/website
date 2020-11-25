<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyTable.aspx.cs" Inherits="AllPower.WEB.SysAdmin.MyTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>我的桌面</title>
		<meta name="Keywords" content="网友小桥分享jquery-ui仿WebQQ整合苹果菜单界面,Jquery插件,Jquery原创,Jquery资源,Jquery特效,div+css,JquerySchool" />
		<meta name="description" content="JquerySchool是一个专门分享jquery资源、jquery插件、jquery特效的一个网站,完全开放源代码,把实际开发中应用最多、最实用的Jquery资源抽取出来再加以精心编排,让广大网友能以最短的时间、花最少的精力去真正掌握jQuery开发的知识。" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
        <link href="css/jquery-ui-1.8.24.custom.css" rel="stylesheet" type="text/css" />
		<link href="css/main1.css" rel="stylesheet" type="text/css" />
		<link href="css/themesetting.css" rel="stylesheet"  type="text/css" >
		<link href="css/skins/black.css" rel="stylesheet" />
		<link href="css/powerFloat.css" rel="stylesheet" type="text/css"/>	
		<link href="css/smartMenu.css" rel="stylesheet"  type="text/css" />
        <link href="css/style2.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-powerFloat-min.js"></script>
		<script type="text/javascript" src="js/jquery-smartMenu-min.js"></script>
		<script type="text/javascript" src="js/jquery-class.js"></script>
		<script type="text/javascript" src="js/artDialog.js"></script>
		<script type="text/javascript" src="js/iframeTools.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.24.custom.min.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>
		<script type="text/javascript" src="js/data.js"></script>
		<script type="text/javascript" src="js/bsv1.3-core.js"></script>

        <link href="images/all.css" rel="stylesheet" type="text/css"/>
    <link href="images/skin.css" rel="stylesheet" type="text/css"/>
    <link href="images/fontSize12.css" rel="stylesheet" type="text/css"/>
    <link href="images/calendar.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/calendar.js"></script>
    <style>
    .table{width:350px; margin-left:auto; margin-right:auto; height:310px; overflow:hidden;}
    * {
        	margin: 0;
        	padding: 0;
        }
        
        #clock {
        	position: relative;
        	width: 200px;
        	height: 200px;
        	margin: 20px auto 0 auto;
        	background: url(images/clockface.png);
        	list-style: none;
        	}
        
        #sec, #min, #hour {
        	position: absolute;
        	width: 10px;
        	height: 200px;
        	top: 0px;
        	left: 95px;
        	}
        
        #sec {
        	background: url(images/sechand.png);
        	z-index: 3;
           	}
           
        #min {
        	background: url(images/minhand.png);
        	z-index: 2;
           	}
           
        #hour {
        	background: url(images/hourhand.png);
        	z-index: 1;
           	}
           	
        p {
            text-align: center; 
            padding: 10px 0 0 0;
            }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {

            setInterval(function () {
                var seconds = new Date().getSeconds();
                var sdegree = seconds * 6;
                var srotate = "rotate(" + sdegree + "deg)";

                $("#sec").css({ "-moz-transform": srotate, "-webkit-transform": srotate });

            }, 1000);


            setInterval(function () {
                var hours = new Date().getHours();
                var mins = new Date().getMinutes();
                var hdegree = hours * 30 + (mins / 2);
                var hrotate = "rotate(" + hdegree + "deg)";

                $("#hour").css({ "-moz-transform": hrotate, "-webkit-transform": hrotate });

            }, 1000);


            setInterval(function () {
                var mins = new Date().getMinutes();
                var mdegree = mins * 6;
                var mrotate = "rotate(" + mdegree + "deg)";

                $("#min").css({ "-moz-transform": mrotate, "-webkit-transform": mrotate });

            }, 1000);

        }); 
    
    </script>
        <!--[if lt IE 7]>
 			<style type="text/css">
 				div, img { behavior: url(js/iepngfix.htc) }
 			</style>
		<![endif]-->
	</head>
	<body style="background:#133b65;">
		<div id="themeSetting_wrap" style="display:none;">
				<div id="themeSetting_head" class="themeSetting_head">		
					<div id="themeSetting_tabTheme" class="themeSetting_tab current" style="display: block;">系统主题</div>		
				</div>					
				<div id="themeSetting_body" class="themeSetting_body">	
					<div id="themeSetting_area"  class="themeSetting_area" style="display: block;">						 
					<a href="###" themeid="theme_blue" class="themeSetting_settingButton" id="themeSetting_theme_blue">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_blue.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">梦幻光影</div>
					</a>   
					<a href="###" themeid="theme_pinky_night" class="themeSetting_settingButton" id="themeSetting_theme_pinky_night">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_pinky_night.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">粉红之夜</div>
					</a>      
					<a href="###" themeid="theme_green" class="themeSetting_settingButton" id="themeSetting_theme_green">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_green.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">青青世界</div>
					</a>  
					<a href="###" themeid="theme_wood1" class="themeSetting_settingButton" id="themeSetting_theme_wood1">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_wood1.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">温馨木纹</div>
					</a>         
					<a href="###" themeid="theme_wood2" class="themeSetting_settingButton" id="themeSetting_theme_wood2">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_wood2.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">黑色木纹</div>
					</a>        
					<a href="###" themeid="theme_universe" class="themeSetting_settingButton" id="themeSetting_theme_universe">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_universe.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">神秘星际</div>
					</a>       
					<a href="###" themeid="theme_metal" class="themeSetting_settingButton" id="themeSetting_theme_metal">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_metal.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">酷炫金属</div>
					</a>       
					<a href="###" themeid="theme_pinky_light" class="themeSetting_settingButton" id="themeSetting_theme_pinky_light">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_pinky_light.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">幻彩荧光</div>
					</a>   
					<a href="###" themeid="theme_pinky_flower" class="themeSetting_settingButton" id="themeSetting_theme_pinky_flower">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_pinky_flower.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">绚烂繁花</div>
					</a>      
					<a href="###" themeid="theme_christmas" class="themeSetting_settingButton" id="themeSetting_theme_christmas">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_christmas.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">圣诞快乐</div>
					</a>      
					<a href="###" themeid="theme_2011" class="themeSetting_settingButton" id="themeSetting_theme_2011">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_2011.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">欢庆元旦</div>
					</a> 
					<a href="###" themeid="theme_blue1" class="themeSetting_settingButton" id="themeSetting_theme_blue1">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_blue1.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">幻彩蓝天</div>
					</a>         
					<a href="###" themeid="theme_spring_festival" class="themeSetting_settingButton" id="themeSetting_theme_spring_festival">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_spring_festival.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">喜迎新春</div>
					</a>         
					<a href="###" themeid="theme_blue_glow" class="themeSetting_settingButton themeSetting_selected" id="themeSetting_theme_blue_glow">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_blue_glow.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">深海仰望</div>
					</a>
					<a href="###" themeid="theme_green_glow" class="themeSetting_settingButton" id="themeSetting_theme_green_glow">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_green_glow.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">晨光微曦</div>
					</a>        
					<a href="###" themeid="theme_orange_glow" class="themeSetting_settingButton" id="themeSetting_theme_orange_glow">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_orange_glow.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">梦醒时分</div>
					</a>         
					<a href="###" themeid="theme_valentinesDay" class="themeSetting_settingButton" id="themeSetting_theme_valentinesDay">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_valentinesDay.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">甜蜜情人节</div>
					</a>         
					<a href="###" themeid="theme_cloud" class="themeSetting_settingButton" id="themeSetting_theme_cloud">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_cloud.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">晴空行云</div>
					</a>
					<a href="###" themeid="theme_gravity" class="themeSetting_settingButton" id="themeSetting_theme_gravity">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_gravity.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">蒲公英</div>
					</a>         
					<a href="###" themeid="theme_7_7" class="themeSetting_settingButton" id="themeSetting_theme_7_7">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_7_7.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">七夕</div>
					</a>
					<a href="###" themeid="theme_teachersDay" class="themeSetting_settingButton" id="themeSetting_theme_teachersDay">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_teachersDay.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">教师节</div>
					</a>
					<a href="###" themeid="theme_midAutumn" class="themeSetting_settingButton" id="themeSetting_theme_midAutumn">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_midAutumn.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">中秋节</div>
					</a>  
					<a href="###" themeid="theme_lookUpSky" class="themeSetting_settingButton" id="themeSetting_theme_lookUpSky">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_lookUpSky.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">仰望苍穹</div>
					</a>        
					<a href="###" themeid="theme_grass" class="themeSetting_settingButton" id="themeSetting_theme_grass">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_grass.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">茫茫野草</div>
					</a>    
					<a href="###" themeid="theme_childhood" class="themeSetting_settingButton" id="themeSetting_theme_childhood">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_childhood.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">童年记忆</div>
					</a>         
					<a href="###" themeid="theme_skyBlue" class="themeSetting_settingButton" id="themeSetting_theme_skyBlue">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_skyBlue.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">空灵蓝调</div>
					</a>      
					<a href="###" themeid="theme_dandelionDream" class="themeSetting_settingButton" id="themeSetting_theme_dandelionDream">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_dandelionDream.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">蒲英之梦</div>
					</a>          
					<a href="###" themeid="theme_paintingTime" class="themeSetting_settingButton" id="themeSetting_theme_paintingTime">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_paintingTime.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">水墨年华</div>
					</a>
					<a href="###" themeid="theme_dreamSky" class="themeSetting_settingButton" id="themeSetting_theme_dreamSky">
						<div style="background: url(http://www.jq-school.com/upload/bg/icon/theme_dreamSky.jpg) no-repeat;" class="themeSetting_settingButton_icon"></div>
						<div class="themeSetting_settingButton_text">梦翔天际</div>
					</a>              
					</div>						
					<div id="themeSetting_wallpaper" class="themeSetting_wallpaper" style="display: none;"></div>			
				</div>
		</div>
		
		<div id="zoomWallpaperGrid" class="zoomWallpaperGrid" style="position: absolute; z-index: -10; left: 0pt; top: 0pt; overflow: hidden; height: 381px; width: 1440px;">
			<img id="zoomWallpaper" class="zoomWallpaper" style="position: absolute; top: 0pt; left: 0pt; height: 381px; width: 1440px;" src="images/bg.jpg">
		</div>
		<div class="taskbar_start_menu_container" id="startMenuContainer" _olddisplay="block" style="display: none;">  
			<div class="startMenuImg taskbar_start_menu_body" id="taskbar_start_menu_body">          
			<div uin="0" class="taskbar_start_menu_selfinfo" id="startMenuSelfInfo">       
				<div class="taskbar_start_menu_nick" id="startMenuSelfNick">请&nbsp;<a href="#">登录</a></div>    
				<a title="反馈" href="###" class="startMenuImg startMenuTopControl_support" cmd="support">&nbsp;</a>    
				<a title="锁定" href="###" class="startMenuImg startMenuTopControl_lock" cmd="lock">&nbsp;</a>     
			</div>              
			<ul class="taskbar_start_menu">
				<li cmd="favorite">
					<a title="添加到收藏夹" href="###">添加到收藏夹</a>
				</li>
				<li cmd="shortcut">
				<a title="保存桌面快捷方式" target="_blank" href="###">保存桌面快捷方式</a></li>
				<li cmd="download">
					<a title="下载客户端" href="###">下载客户端</a></li>
					<li title="关于Q+ Web" cmd="about" id="taskbar_helpButton">
					<a href="###">关于Q+ Web</a>
				</li>
				<li cmd="helper">
					<a title="新手指导" href="###">新手指导</a>
				</li></ul>    
				<a class="startMenuImg logout_botton" title="注销当前用户" cmd="logout" href="###"></a>
				</div>
		</div>
        <div id="inform">
		<div class="main">
    <div id="myrl" class="table">
            <table class="biao" width="349px">
                <tbody>
                <tr>
                    <td class="calTit" colSpan=7 style="height:30px;padding-top:15px;text-align:center; vertical-align:bottom; padding-bottom:8px; border-bottom:0; border-left:0;">
                        <a href="#" title="上一年" id="nianjian" class="ymNaviBtn lsArrow"></a>
                        <a href="#" title="上一月" id="yuejian" class="ymNaviBtn lArrow"></a>

                        <div style="width:250px; float:left; padding-left:10px;">
                                            <span id="dateSelectionRili" class="dateSelectionRili"
                                                  style="cursor:hand;color: white; border-bottom: 1px solid white;"
                                                  onclick="dateSelection.show()">
											<span id="nian" class="topDateFont"></span><span
                                                    class="topDateFont">年</span><span id="yue"
                                                                                      class="topDateFont"></span><span
                                                    class="topDateFont">月</span>
											<span class="dateSelectionBtn cal_next"
                                                  onclick="dateSelection.show()">▼</span></span> &nbsp;&nbsp;<font id=GZ
                                                                                                                   class="topDateFont"></font>
                        </div>

                        <!--新加导航功能-->
                        <div style="left: 45px; display: none;" id="dateSelectionDiv">
                            <div id="dateSelectionHeader"></div>
                            <div id="dateSelectionBody">
                                <div id="yearList">
                                    <div id="yearListPrev" onclick="dateSelection.prevYearPage()">&lt;</div>
                                    <div id="yearListContent"></div>
                                    <div id="yearListNext" onclick="dateSelection.nextYearPage()">&gt;</div>
                                </div>
                                <div id="dateSeparator"></div>
                                <div id="monthList">
                                    <div id="monthListContent"><span id="SM0" class="month"
                                                                     onclick="dateSelection.setMonth(0)">1</span><span
                                            id="SM1" class="month" onclick="dateSelection.setMonth(1)">2</span><span
                                            id="SM2" class="month" onclick="dateSelection.setMonth(2)">3</span><span
                                            id="SM3" class="month" onclick="dateSelection.setMonth(3)">4</span><span
                                            id="SM4" class="month" onclick="dateSelection.setMonth(4)">5</span><span
                                            id="SM5" class="month" onclick="dateSelection.setMonth(5)">6</span><span
                                            id="SM6" class="month" onclick="dateSelection.setMonth(6)">7</span><span
                                            id="SM7" class="month" onclick="dateSelection.setMonth(7)">8</span><span
                                            id="SM8" class="month" onclick="dateSelection.setMonth(8)">9</span><span
                                            id="SM9" class="month" onclick="dateSelection.setMonth(9)">10</span><span
                                            id="SM10" class="month" onclick="dateSelection.setMonth(10)">11</span><span
                                            id="SM11" class="month curr" onclick="dateSelection.setMonth(11)">12</span>
                                    </div>
                                    <div style="clear: both;"></div>
                                </div>
                                <div id="dateSelectionBtn">
                                    <div id="dateSelectionTodayBtn" onclick="dateSelection.goToday()">今天</div>
                                    <div id="dateSelectionOkBtn" onclick="dateSelection.go()">确定</div>
                                    <div id="dateSelectionCancelBtn" onclick="dateSelection.hide()">取消</div>
                                </div>
                            </div>
                            <div id="dateSelectionFooter"></div>
                        </div>
                        <a href="#" id="nianjia" title="下一年" class="ymNaviBtn rsArrow" style="float:right;"></a>
                        <a href="#" id="yuejia" title="下一月" class="ymNaviBtn rArrow" style="float:right;"></a>
                        <!--	<a id="jintian" href="#" title="今天" class="btn" style="float:right; margin-top:-2px; font-size:12px; text-align:center;">今天</a>-->

                    </TD>
                </TR>
                <TR class="calWeekTit" style="font-size:12px; height:20px;text-align:center;">
                    <TD width="80" class="red" >星期日</TD>
                    <TD width="80" style="border-left:0">星期一</TD>
                    <TD width="80" style="border-left:0">星期二</TD>
                    <TD width="80" style="border-left:0">星期三</TD>
                    <TD width="80" style="border-left:0">星期四</TD>
                    <TD width="80" style="border-left:0">星期五</TD>
                    <TD width="80" class="red" style="border-left:0">星期六</TD>
                </TR>
                <SCRIPT language="JavaScript">

                    var gNum;
                    for (var i = 0; i < 6; i++) {
                        document.write('<tr align=center height="25" id="tt">');
                        for (var j = 0; j < 7; j++) {
                            gNum = i * 7 + j;
                            if (j == 6)
                                document.write('<td  id="GD' + gNum + '"  onMouseOver="mOvr(this,' + gNum + ');"  onMouseOut="mOut(this);" style="border-right:1px solid #d5d5d5;"><font  id="SD' + gNum + '" style="font-size:12px;"  face="Arial"');
                            else
                                document.write('<td  id="GD' + gNum + '"  onMouseOver="mOvr(this,' + gNum + ');"  onMouseOut="mOut(this);"><font  id="SD' + gNum + '" style="font-size:12px;"  face="Arial"');
                            if (j == 0) document.write('color=red');
                            if (j == 6)
                                if (i % 2 == 1) document.write('color=red');
                                else document.write('color=red');
                            document.write('  TITLE="">  </font><br><font  id="LD' + gNum + '"  size=2  style="white-space:nowrap;overflow:hidden;cursor:default;"></font></td>');
                        }
                        document.write('</tr>');
                    }
                </SCRIPT>
                </tbody>
            </table>
    </div>
</div>
</div>
<div id="details" style="margin-top:-1px; "></div>
<div id="mome">	<ul id="clock">	
	   	<li id="sec"></li>
	   	<li id="hour"></li>
		<li id="min"></li>
	</ul></div>
		<!--<iframe frameborder=0 width='350px' ></iframe>-->
	</body>
</html>
