// JavaScript Document
var APP_ITEM_HEIGHT = 38;
var SCROLL_HEIGHT = 4 * APP_ITEM_HEIGHT;

function changeHeaderUI(){
	$(".taskbar").css("width",$(window).width() - $(".logo").width() - $(".user_info_area").width());
}

function showUserInfo(){
	//获取个人信息图标的位置
	var userInfoOffsetLeft = $("#user_info_control").offset().left;
	var userInfoOffsetTop = $("#user_info_control").offset().top;
	//需要展示的html元素
	//var showHTML = "<div class='userInfoPanel'>123</div>";
	//调整panel的位置
	$(".userInfoPanel").css("left",userInfoOffsetLeft + $("#user_info_control").width()/2 - $(".userInfoPanel").width()/2 - 72);
	$(".userInfoPanel").css("top",$("#user_info_control").height());
	$(".userInfoPanel").css("display","");
	//绑定点击状态图标事件
	$(".userState").bind("click",function(){
		$(".chooseState").css("display","");
	});
	//绑定选择状态的div
	$(".chooseState div").bind("click",function(){
		$(".userState").attr("src","images/"+$(this).attr("id")+".png");
		$(".chooseState").css("display","none");
	})
}
/**
 * 菜单底部a标签提示和事件
 */
function bindSideBarFooterTips(){
    var tips ;
    $(".footerLink a").bind("mouseover",function(event){
        var event = event ? event : window.event;
        var target = event.srcElement ? event.srcElement : event.target;
        tips = layer.tips($(target).attr("data-title"),this,{
            tips:[1,'#000']
        });
    });
    $(".footerLink a").bind("mouseout",function(){
        layer.close(tips);
    });

    $("#handMenuWord").click(function(){
        if($("#handMenuWord").hasClass("glyphicon-chevron-left")){
            $("#handMenuWord").attr("data-title","图标+文字模式").removeClass("glyphicon-chevron-left").addClass("glyphicon-chevron-right");
            $("#sideBar").width("50px").find('#firstMenu');
            $(".secondPanel").css({
                left : "50px"
            });
            $(".footerLinkIcon").hide();
            if($("body").hasClass("right-mini")){
                $("body").removeClass().addClass("TOS1 right-mini");
            }else{
                $("body").removeClass().addClass("TOS1");
            }
        }else{
            $("#handMenuWord").attr("data-title","图标模式").removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-left");
            $("#sideBar").width("200px");
            $(".secondPanel").css({
                left : "200px"
            });
            $(".footerLinkIcon").show();
            if($("body").hasClass("right-mini")){
                $("body").removeClass().addClass("TOS right-mini");
            }else{
                $("body").removeClass().addClass("TOS");
            }
        }

        $("#center .swiper-slide").css({
            width : $("#center").width()-50
        });
        if(mySwiper != undefined){
            mySwiper.resizeFix();  //当你改变swiper 的尺寸而没有改变窗口大小时调用这个方法。
        }
    });
}

$(function(){
    var tips ;
	$(".userInfoPanel").css("display","none");
	$(".chooseState").css("display","none");
	changeHeaderUI();
	//绑定右上角个人中心图片的鼠标滑过效果
	$(".user_info_menu").bind("mouseover",function(){
		//图片更换
	//	$(this).find("img").attr("src",$(this).find("img").attr("src").substring(0,$(this).find("img").attr("src").length-4)+"-s.png");
	});
	$("#user_info_control").bind("mouseover", function () {
			tips = layer.tips("我的OA账号",this,{
				tips:[4,'#000']
			});	
			//显示个人信息
			showUserInfo();
		});
	//绑定右上角个人中心图片的鼠标离开效果
	$(".user_info_menu").bind("mouseout",function(){
		//图片更换
		//$(this).find("img").attr("src",$(this).find("img").attr("src").substring(0,$(this).find("img").attr("src").length-6)+".png");
		layer.close(tips);
		$(".userInfoPanel").bind("mouseover",function(){
			$(".userInfoPanel").css("display","");										 
		});
		$(".userInfoPanel").bind("mouseout",function(){
			$(".userInfoPanel").css("display","none");										 
		});
		$(".userInfoPanel").css("display","none");	
		
	});

	//绑定系统菜单鼠标滑过的效果
	$("#system_menu").bind("mouseover",function(){
		tips = layer.tips("菜单",this,{
			tips:[3,'#000']
		});											
	});
	//绑定系统菜单鼠标离开的效果
	$("#system_menu").bind("mouseout",function(){
		layer.close(tips);									
	});

    //绑定搜索鼠标滑过的效果
    $("#search").bind("mouseover",function(){
        tips = layer.tips("搜索",this,{
            tips:[3,'#000']
        });
    });
    //绑定搜索鼠标离开的效果
    $("#search").bind("mouseout",function(){
        layer.close(tips);                                  
    });

    //绑定任务中心鼠标滑过的效果
    $("#taskCenter").bind("mouseover",function(){
        tips = layer.tips("任务中心",this,{
            tips:[3,'#000']
        });
    });
    //绑定任务中心鼠标离开的效果
    $("#taskCenter").bind("mouseout",function(){
        layer.close(tips);                                  
    });

    //绑定企业社区鼠标滑过的效果
    $("#community").bind("mouseover",function(){
        tips = layer.tips("企业社区",this,{
            tips:[3,'#000']
        });
    });
    //绑定企业社区鼠标离开的效果
    $("#community").bind("mouseout",function(){
        layer.close(tips);
    });
    
    //绑定通知中心鼠标滑过的效果
    $("#infoCenter").bind("mouseover",function(){
        tips = layer.tips("通知中心",this,{
            tips:[3,'#000']
        });
    });
    //绑定通知中心鼠标离开的效果
    $("#infoCenter").bind("mouseout",function(){
        layer.close(tips);
    });
    //绑定通知中心点击效果
    $("#infoCenter").bind("click",function(){
        if(!$(this).hasClass("active")){
            $(this).addClass("active");

            //显示通知中心
            $("body").addClass("right-mini");
        }else{
            $(this).removeClass("active");

            //关闭通知中心
            $("body").removeClass("right-mini");
        }
    });

    //绑定通知中心小菜单切换事件
    bindEastNavPill();

    //创建左侧菜单
    createMenu();

    //菜单底部a标签提示和事件
    bindSideBarFooterTips();

    //显示默认的二级菜单
    $("#tabs-container").tabs(
        "add",{
            id : 1,
            closable : true,
            title : "个人桌面",
            style : "",
            selected : "true",
            colse: 'false',
            content : "",
            url: "MyDesk.aspx"
        }
    );
    $("#tabs-container").css({
        maxWidth : $("#tabs-container").parent().width()-200
    });
});

$('#tfShowDesk, #centerShowDesk').on('click',function(){
    if($(this).attr('data-close')){
        $("#tabs-container").tabs(
            "add",{
                id : 1,
                closable : true,
                title : "个人桌面",
                style : "",
                selected : "true",
                colse: 'false',
                content : "",
                url: "MyDesk.aspx"
            }
        );
    }
});

$('#east ul li > a').on('click',function(){
    var _this = this;
    $("#tabs-container").tabs(
        "add",{
            id: $(_this).attr('data-id'),
            closable : true,
            title : $(_this).text(),
            style : "",
            selected : "true",
            colse: 'false',
            content : "",
            url :"page/notice/"+$(_this).attr('data-url') +'.html'
        }
    );
});

//窗口变化事件
$(window).resize(function(){
	//process here
	//绑定通知中心小菜单切换事件
    bindEastNavPill();

    //创建左侧菜单
    createMenu();

    //菜单底部a标签提示和事件
    bindSideBarFooterTips();
});