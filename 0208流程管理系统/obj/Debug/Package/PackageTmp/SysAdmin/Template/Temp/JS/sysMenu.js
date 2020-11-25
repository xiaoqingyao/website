// 子栏目
jQuery(function($){
				try
				{
			$("#HQB_SYS_MENU h4").toggle(function(){
				$(this).next().hide();
				return false;
			},function(){
				$(this).next().show();
				return false;
			})
				}catch(e){}
		})
/*总导航栏目下拉（纵向）*/
		jQuery(function($){
			function showHQB_SYS_NAV_VR(){
				$("#HQB_SYS_NAV_VR li").hover(function(){
					$(this).children("ul").show().children("li").removeClass("focus");
					$("#HQB_SYS_NAV_VR>li").addClass();
					$(this).not($("#HQB_SYS_NAV_VR>li")).addClass("focus").siblings().removeClass('focus');
					if($(this).parent().is("ul#HQB_SYS_NAV_VR")){
						$(this).addClass("hover").siblings().removeClass('hover');
					}
					
				},function(){
					$(this).children("ul").hide();
				})
			}
			showHQB_SYS_NAV_VR();
		})
/*总导航栏目下拉（模向）*/
jQuery(function($){
			function showHQB_SYS_NAV_HR(){
				$("#HQB_SYS_NAV_HR>li").hover(
				function(){
					$(this).addClass("hover");
					var w=$(this).children("ul").width(),
					size=$("#HQB_SYS_NAV_HR>li").size(),
					liw=$("#HQB_SYS_NAV_HR>li").width(),
					index=$("#HQB_SYS_NAV_HR>li").index(this)+1;
					if(index>1){
						var offset=size/index;
						if(offset>1){							
							var sli=$(this).children("ul").find("li").size();
							var sw=$(this).children("ul").find("li").width();
								//alert(sli)
							if(sli>2){
								var off=(w)/2;
								$(this).children("ul").css('marginLeft',-off+80);
							}
						}
						else{
							$(this).children("ul").css('marginLeft',-w+80);
						}
					}
					$(this).children("ul").show();
				},
				function(){
					$(this).removeClass("hover");
					$(this).children("ul").hide();
				})
			}
			showHQB_SYS_NAV_HR();
		})