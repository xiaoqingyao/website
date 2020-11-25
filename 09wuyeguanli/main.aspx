<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta http-equiv="pragma" content="no-cache" />
	    <meta http-equiv="cache-control" content="no-cache" />
		<title>新闻</title>
    <script type="text/javascript" src="aui-artDialog/jquery.js"></script>
		<script type="text/javascript" src="aui-artDialog/effect_commonv1.1.js"></script>
        <link href="aui-artDialog/css.css" rel="stylesheet" />
        <style>
            #flash{width:738px; height:300px}

        </style>
	</head>
	<body style="background-color:#fff">
		<center>	
		<!--中间flash或图片切换-->
		<div id="flash">
			 <ul id="pub_slideplay">
				<li>
					<img alt="" src="images/a.jpg"  />
				</li>
				<li>
						<img alt="" src="images/i.jpg" />
				</li>
				<li>
						<img alt="" src="images/k.jpg" />
				</li>
				<li>
						<img alt="" src="images/h.jpg" />
				</li>
			</ul>
		</div>
		<div style=" line-height:46px; font-size:14px; font-weight:bold; color:#0066CC">公司介绍</div>
		<div style=" line-height:32px; font-size:12px; color:#0066CC; width:650px; height:200px;  text-align:left">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Session["info"].ToString() %></div>
		</center>
	   <script type="text/javascript">new dk_slideplayer("#pub_slideplay",{width:"738px",height:"300px",fontsize:"12px",time:"3000"});</script>
	 </body>
</html>