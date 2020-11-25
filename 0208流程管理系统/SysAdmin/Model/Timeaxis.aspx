<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timeaxis.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.Timeaxis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../js/artDialog4.1.6/skins/blue.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/latest.css?version=7.022" type="text/css" media="screen" />
	<link rel="stylesheet" href="../css/user-controls.css?version=7.022" type="text/css" media="screen" />
	<!--[if IE 6]><link type="text/css" rel="stylesheet" href="../css/screen.ie6.css?version=7.022" /><![endif]-->
	<!--[if IE 7]><link type="text/css" rel="stylesheet" href="../css/screen.ie7.css?version=7.022" /><![endif]-->
	<!--[if IE 8]><link type="text/css" rel="stylesheet" href="../css/screen.ie8.css?version=7.022" /><![endif]-->
	<!--[if IE 9]><link type="text/css" rel="stylesheet" href="../css/screen.ie9.css?version=7.022" /><![endif]-->
	<!--[if IE]><script type="text/javascript" src="../Js/excanvas.compiled.js"></script><![endif]-->

   <script src="../js/artDialog4.1.6/artDialog.js"></script>
   <script src="../js/artDialog4.1.6/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="../Js/user-controls.js?version=7.022"></script>
	<script type="text/javascript" src="../Js/support.js?version=7.022"></script>
	<script type="text/javascript" src="../Js/latest.js?version=7.022"></script>
    <script>

        $(document).ready(function () {
            $(".tl-more-button").each(function () {
                $(this).click(function () {art.dialog.open('Timeaxis_Detail.aspx?id=' + this.id, { height: 300, background: '#eee', opacity: 0.1, width: 500, lock: true, zIndex: 1, title: '合作详情' }); });
            });
        });
    </script>
</head>
<body>
<div id="tl-container">
		
			<div id="tl-header" style=" background:#184a6f">
			
			
			</div>
			
			<div class="tl-timeline-info">
				
				<p class="tl-ah-about-text">How would you like to create beautiful, interactive timelines that include videos and image galleries? Well, now you can thanks to Tiki-Toki. ;xNLx;  ;xNLx;TikiToki makes creating online timelines as easy as possible. Sign up for our free, basic account and within almost no time, you could be creating a timeline of your life, of a historical event that interests you or of the life of a great musician or artist... the possibilities are endless. ;xNLx;  ;xNLx;Already have loads of videos and images on Flickr, Youtube and Vimeo. You'll be pleased to hear that we have integrated TikiToki with these popular services, making adding videos and images to your timeline a cinch.;xNLx;;xNLx;You don't even have to pay a penny to start creating timelines. Our basic account is completely free.;xNLx;  ;xNLx;Click the 'continue' button below to see a demonstration of how our timeline software works. And when you are finished playing with it, sign up and start making a timeline of your own!</p>
			
                </div>
			
			<div id="tl-stage-holder" class="tl-font">
		
				<div class="tl-stage"></div>
				<div class="tl-stage-fixed-position-content"></div>
				<canvas id="tl-3d-view-canvas" width="100" height="100"></canvas>

				<div id="tl-stage-date-displayer"></div>
				<div class="tl-stage-border-top"></div>
				<div class="tl-stage-border-bottom"></div>
			</div>
			<div id="tl-slider-holder" class="tl-font">
				<div id="tl-slider-scale-holder">
					<div id="tl-slider-scale">
						<canvas class="tl-scale-canvas" width="5000" height="52"></canvas>
						<div id="tl-slider-scale-times-holder">
						</div>
						<div id="tl-slider-markers-holder">
						</div>
					</div>
				</div>
				<div id="tl-slider-dragger">
					<div class="tlsd-inner">
						<div class="tlsd-inner-inner">
							<div class="tlsd-corner tlsd-c-tl"></div>
							<div class="tlsd-corner tlsd-c-tr"></div>
							<div class="tlsd-corner tlsd-c-bl"></div>
							<div class="tlsd-corner tlsd-c-br"></div>
						</div>				
					</div>
				</div>
			</div>
		</div>
		
						
		
			<script type="text/javascript">
			    var TLTimelineData = {
			        host: "www.dyjing.com",
			        homePage: true,
			        showAdBlock: "false",
			        id: 43,
			        title: "Beautiful web-based timeline software",
			        urlFriendlyTitle: "Beautiful-web-based-timeline-software",
			        startDate: "2013-01-01 00:00:00",
			        endDate: "2013-12-30 00:00:00",
			        introText: "Welcome to TikiToki, a web app that makes it dead easy to make stunning, animated timelines that work in your browser. Our basic account is completely free.",
			        introImage: "",
			        authorName: "Alex Kearns",
			        "accountType": "Teacher",
			        backgroundImage: "",
			        introImageCredit: "",
			        backgroundImageCredit: "Photo credit: <a href=\"http://www.dyjing.com/\">G Schouten de Jel</a>",
			        feed: "",
			        mainColour: "c72066",
			        zoom: "month-small-day",
			        initialFocus: "39",
			        embedHash: "9085373548",
			        embed: "false",
			        secret: "false",
			        public: "yes",
			        dontDisplayIntroPanel: 1,
			        openReadMoreLinks: 0,
			        storyDateStatus: 0,
			        storySpacing: 0,
			        viewType: 0,
			        showTitleBlock: 0,
			        backgroundColour: "184a6f",
			        storyDateFormat: "auto",
			        topDateFormat: "auto",
			        sliderDateFormat: "auto",
			        language: "english",
			        displayStripes: 1,
			        htmlFormatting: 0,
			        sliderBackgroundColour: "123753",
			        sliderTextColour: "808080",
			        sliderDetailsColour: "aaaaaa",
			        sliderDraggerColour: "808080",
			        headerBackgroundColour: "184a6f",
			        headerTextColour: "808080",
			        showGroupAuthorNames: "1",
			        durHeadlineColour: "ffffff",
			        cssFile: "",
			        altFlickrImageUrl: "http://www.dyjing.com/timelines/43/",
			        fontBase: 'default',
			        fontHead: 'default',
			        fontBody: 'default',
			        lightboxStyle: '0',
			        showControls: '1',
			        lazyLoading: '0',
			        protection: "",
			        expander: "2",
			        copyable: "0",
			        settings3d: "1,FFFFFF,0.6432,1050,0.1125,1.25,1,3",
			        categories: [{
			            id: 11,
			            title: "OA历史",
			            colour: "386cd2",
			            "layout": "0",
			            "rows": "3",
			            "order": "10",
			            "size": "15"
			        }, {
			            id: 14,
			            title: "CRM历史",
			            colour: "1DA364",
			            "layout": "0",
			            "rows": "3",
			            "order": "10",
			            "size": "10"
			        }, {
			            id: 15,
			            title: "ERP历史",
			            colour: "fa18c2",
			            "layout": "0",
			            "rows": "3",
			            "order": "10",
			            "size": "10"
			        }],
			        feeds: [],
			        stories: [{
			            id: 1,
			            ownerId: "",
			            ownerName: "",
			            title: "华为技术有限公司",
			            startDate: "2013-11-15 00:00:00",
			            endDate: "2013-11-15 00:00:00",
			            text: "华为技术有限公司是一家生产销售通信设备的民营通信科技公司，总部位于中国广东省深圳市龙岗区坂田华为基地。华为的产品主要涉及通信网络中的交换网络、传输网络、无线及有线固定接入网络和数据通信网络及无线终端产品，为世界各地通信运营商及专业网络拥有者提供硬件设备、软件、服务和解决方案。",
			            fullText: "",
			            category: "11",
			            dateFormat: "auto",
			            externalLink: "",
			            media: [{
			                id: 732,
			                src: "../images/huawei.jpg",
			                caption: "Photo credit: <a href=\"http://www.flickr.com/people/32834977@N03/\">Al Jazeera English</a>",
			                type: "Image",
			                thumbPosition: "0,0",
			                externalMediaThumb: "",
			                externalMediaType: "",
			                externalMediaId: "",
			                orderIndex: 10
			            }]
			        },{
			            id: 2,
			            ownerId: "",
			            ownerName: "",
			            title: "日本蛟河有限公司",
			            startDate: "2013-11-08 19:10:30",
			            endDate: "2013-11-15 19:10:30",
			            text: "日本蛟河有限公司位于新站镇毓文路57号，该公司是集成材、家具加工制造业为一体的现代化企业。成立于2002年9月，总投资达2000多万元，其中固定投资1390万元，占地面积3万多平方米，管理人员20余人，技术人员6人，员工300余人...",
			            fullText: "",
			            category: "15",
			            dateFormat: "auto",
			            externalLink: "",
			            media: []
			        }, {
			            id: 3,
			            ownerId: "",
			            ownerName: "",
			            title: "美的科技有限公司",
			            startDate: "2013-11-06 12:20:18",
			            endDate: "2013-11-12 12:20:18",
			            text: "美的集团创业于1968年，是家电制造业为主的大型综合性企业集团，拥有美的电器、小天鹅、威灵控股三家上市公司。拥有完整的空调产业链、冰箱产业链、洗衣机产业链、微波炉产业链和洗碗机产业链；全球有60多个海外分支机构，产品远销200多个国家和地区。",
			            fullText: "",
			            category: "14",
			            dateFormat: "auto",
			            externalLink: "",
			            media: []
			        }, {
			            id: 4,
			            ownerId: "",
			            ownerName: "",
			            title: "万联实业有限公司",
			            startDate: "2013-11-02 19:03:07",
			            endDate: "2013-11-12 19:03:07",
			            text: "万联实业有限公司成立于1994年，历经十余年潜心发展，在重汽配件、汽车用品批发、汽车美容装潢、汽车美容、音响技术文化推广等方面取得了显著的成就，多次获得政府及行业协会颁发的..",
			            fullText: "",
			            category: "11",
			            dateFormat: "auto",
			            externalLink: "",
			            media: []
			        }, {
			            id: 5,
			            ownerId: "",
			            ownerName: "",
			            title: "科普集团有限公司",
			            startDate: "2013-11-20 23:36:44",
			            endDate: "2013-11-22 23:36:44",
			            text: "科普维国际集团有限公司是COB、贴片、喷油、丝印等产品专业生产加工的私营独资企业,公司总部设在深圳 宝安,科普维国际集团有限公司拥有完整、科学的质量管理体系。科普维国际集团有限公司的诚信、实力和产品质量获得业界的认可。欢迎各界朋友莅临科普维...",
			            fullText: "",
			            category: "14",
			            dateFormat: "auto",
			            externalLink: "",
			            media: [{
			                id: 814,
			                src: "../images/kepu.jpg",
			                caption: "Photo credit: <a href=\"http://www.flickr.com/people/57446193@N03/\">Byron Burke</a>",
			                type: "Image",
			                thumbPosition: "0,0",
			                externalMediaThumb: "",
			                externalMediaType: "",
			                externalMediaId: "",
			                orderIndex: 10
			            }]
			        }]
			    }
</script>
</body>
</html>
