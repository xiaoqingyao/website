<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.Calendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../css/powerFloat.css" type="text/css" charset="gb2312" />
<link href='../css/fullcalendar.css' rel='stylesheet' />
<link href='../css/fullcalendar.print.css' rel='stylesheet' media='print' charset="gb2312" />
<script src='../js/jquery-1.7.2.min.js' charset="gb2312"></script>
<script src='../js/jquery-ui.custom.min.js' ></script>
<script type="text/javascript" src="../js/jquery-powerFloat.js" charset="gb2312"></script>
<script src='../js/fullcalendar.js' charset="gb2312"></script>
<script src="../js/artDialog4.1.6/artDialog.js" type="text/javascript"></script>
<script src="../js/Schedule.js" type="text/javascript"></script>
<link href="../js/artDialog4.1.6/skins/blue.css" rel="stylesheet" type="text/css" />

<style>
	body {
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		background:#f1f7f8;
	    margin:0px;
		}

	#calendar {
		width: 100%;
		margin: 0;
		}
		#tb1{ height:100px; width:280px;
		      }
				#tb1 td{ padding:10px;
		      }
.tip_list
{
    background:#3a87ad;
    border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
    border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	min-width:300px;
	max-width:400px;
}
.tip_title
{
  padding:5px;
  color:White;
  padding-left:5px;
  border-left:1px  #eee solid;
  font-size:12px;
}
.tip_content
{
    word-break:break-all;text-overflow:ellipsis;overflow:hidden; background:#b4e1e7;
    border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
    border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	border: 1px solid #057ffc;
	font-size:12px;
	text-align:left;
	padding:5px;
	max-height:60px;
	min-height:40px;
}
.tip_head
{
  text-align:left;
}
</style>
</head>
<body>
<div id='calendar'></div>
<div id="ScheduleNewDIV" style=" display:none">
        <div><label>时间:</label><label id="dateFrom" style=" font-size:14px; color:Green"></label></div>
        <table id="tb1"  cellpadding="0" cellspacing="0" >
        <tr >
            <td class="schs"><label> 标题:</label></td>
            <td><div><input type="text" id="txtTitle" maxlength="20" class="textin" /><input type="hidden" id="txtRY" class="textin" /> </div></td>
        </tr>
        <tr>
            <td class="schs"><label> 日程类型:</label></td>
            <td><select id="selType" style="width:150px">
            <option value="">请选择</option>
            <option value="1">会议</option>
            <option value="2">参加活动</option>
            <option value="3">拜访客户</option>            
            <option value="4">公司安排</option>
            <option value="5">外出任务</option>
            <option value="6">请假</option>
            <option value="7">乘车外出</option>
            <option value="8">工作外出</option>
            <option value="9">其他</option>      
            </select></td>
        </tr>
        <tr>
            <td class="schs" ><label> 内容:</label></td>
            <td><div><textarea  id="txtContent" class="tarin" style="width:150px" maxlength="200"></textarea></div></td>
        </tr>
         </table>
     </div>
     <div id="tips" style="display:none; width:300px;">
            <div class="tip_list">
            <div class="tip_head">
            <table cellpadding="0" cellspacing="0"><tr><td rowspan="2"><div style="width:30px;padding:5px;">
                <img alt="#" src="../Images/1_hard.gif"  width="30"/></div></td><td><div style="font-size:12px; color:#ed2207; padding-top:5px;">系统管理员</div></td><td rowspan="2" style="vertical-align:middle; padding-left:10px;" ><div class="tip_title">
            dfgfdgdg
            </div></td></tr><tr><td><div id="tip_time" style="color:#fdf494; font-size:12px;">2013-10-10</div></td></tr></table>
            </div>
            <div class="tip_content"></div>
            </div>
            </div>
</body>
</html>
