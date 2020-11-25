//构造导航的数组
var navArr = ['首页','管理','财务','行政','人力','销售','采购','生产','库存'];
var cardColors = ['#2F80D1','#6699FF','#CC3399','#FF9966','#FE8562','#C0654A','#6B923C','#BF9105','#3796A3','#6D7DC0'];
var nav = 0;

$(function(){

	var htmlString = "<ul>";

	for(var i = 0; i < navArr.length; i ++){
		if(i == 0){
			htmlString += "<li class='current'>";
		}
		else{
			htmlString += "<li>";
		}
		htmlString += "<a>";
		htmlString += navArr[i];
		htmlString += "</a>";
		htmlString +="</li>";
	}
	htmlString += "</ul>"
	$("#navMenu").html(htmlString);

	if ($(".cardContent").html() === '') {

		for(var i = nav % cardColors.length; i < cardColors.length; i ++) {

			//调用画卡片的函数
			createCard(
				{
					"bgColor": cardColors[i]
				}
			);
		}

	}
	
	//绑定点击事件
	$('.nav-header > ul > li').click(function() {
		if(!$(this).hasClass('current')) {
			$('li.current').removeClass('current');
			$(this).addClass('current');

			$(".cardContent .col-xs-4").remove();

			for(var i = nav % cardColors.length; i < cardColors.length; i ++) {

				//调用画卡片的函数
				createCard(
					{
						"bgColor": cardColors[i]
					}
				);
			}

			nav++;
		}
	});

	$('.brief-style').click(function() {
		$('.toggle-btns').removeClass('toggle-default');
		$('.toggle-btns').addClass('toggle-brief');
		$('.banner .logo, .nav-header, .cardContent').hide();
		$('.banner .menu, #fullpage').show();
	});

	$('.default-style').click(function() {
		$('.toggle-btns').removeClass('toggle-brief');
		$('.toggle-btns').addClass('toggle-default');
		$('.banner .menu, #fullpage').hide();
		$('.banner .logo, .nav-header, .cardContent').show();
	});

	$('.remove').click(function() {
		$(this).parents('.col-xs-4').remove();
	})

    $('#fullpage').fullpage({
        //Navigation
        menu: false,
        lockAnchors: false,
        anchors:['firstPage', 'secondPage'],
        navigation: false,
        navigationPosition: 'right',
        navigationTooltips: ['firstSlide', 'secondSlide'],
        showActiveTooltip: false,
        slidesNavigation: true,
        slidesNavPosition: 'bottom',

        //Scrolling
        css3: true,
        scrollingSpeed: 700,
        autoScrolling: true,
        fitToSection: true,
        scrollBar: false,
        easing: 'easeInOutCubic',
        easingcss3: 'ease',
        loopBottom: false,
        loopTop: false,
        loopHorizontal: true,
        continuousVertical: false,
        normalScrollElements: '#element1, .element2',
        scrollOverflow: false,
        touchSensitivity: 15,
        normalScrollElementTouchThreshold: 5,

        //Accessibility
        keyboardScrolling: true,
        animateAnchor: true,
        recordHistory: true,

        //Design
        controlArrows: true,
        verticalCentered: true,
        resize : false,
        sectionsColor : ['#ccc', '#fff'],
        paddingTop: '3em',
        paddingBottom: '10px',
        fixedElements: '#header, .footer',
        responsiveWidth: 0,
        responsiveHeight: 0,

        //Custom selectors
        sectionSelector: '.section',
        slideSelector: '.slide',

        //events
        onLeave: function(index, nextIndex, direction){},
        afterLoad: function(anchorLink, index){},
        afterRender: function(){},
        afterResize: function(){},
        afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
        onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
    });

});