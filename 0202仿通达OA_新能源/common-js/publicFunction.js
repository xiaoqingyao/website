var mySwiper;
 


/**
 * 创建菜单
 */
function createMenu(){
    var str  = '<div class="sideBarMain">';
    str += '<div class="menuScroll scrollUp"></div>';
    str += '<ul id="firstMenu" class="firstMenu">';

    for(var i=0;i<menuObj.length;i++){
        str += '<li subMenuId="secondMenu-'+menuObj[i].firstMenuId+'">';

        str += '<div class="firstMenuItem">' ;
        str +=    '<i class="iconfont ' + menuObj[i].firstMenuIcon + '" style="color:' + menuObj[i].firstMenuIconColor + '"></i>' ;
        str +=    '<span class="firstMenuTitle">'+menuObj[i].firstMenuTitle+'</span>' ;
        str +=  '</div>';

        str += '<div class="secondPanel undis">';
        str += '<h3>'+menuObj[i].firstMenuTitle+'</h3>';
        str += '<ul class="secondMenu clearfix">';
        for(var j=0;j<menuObj[i].secondMenu.length;j++){
            var secondMenuObj = menuObj[i].secondMenu[j];
            if(secondMenuObj.thirdMenu == undefined || secondMenuObj.thirdMenu.length == 0 ){
                str += '<li>';
                str +=    '<a href="javascript:void(0);" class="secondMenuItem" onclick="createTab(\''+secondMenuObj.secondMenuId+'\',\''+secondMenuObj.secondMenuItem+'\',\''+secondMenuObj.secondMenuUrl+'\')">'+secondMenuObj.secondMenuItem+'</a>' ;
                str += '</li>';
            }else{
                str += '<li class="expand">';
                str += '<a href="javascript:void(0);" class="secondMenuItem" onclick="">'+secondMenuObj.secondMenuItem+'</a>';

                str += '<ul class="thirdMenu">';
                for(var k=0;k<secondMenuObj.thirdMenu.length;k++){
                    var thirdMenuObj = secondMenuObj.thirdMenu[k];
                    str += '<li>' ;
                    str +=    '<a href="javascript:void(0);" class="thirdMenuItem" onclick="createTab(\''+thirdMenuObj.thirdMenuId+'\',\''+thirdMenuObj.thirdMenuItem+'\',\''+thirdMenuObj.thirdMenuUrl+'\')">'+thirdMenuObj.thirdMenuItem+'</a>' ;
                    str += '</li>';
                }
                str += '</ul>';
                str += '</li>';
            }
        }
        str += '</ul>';
        str += '</div>';

        str += '</li>';
    }

    str += '</ul>';
    str += '<div class="menuScroll scrollDown"></div>';
    str += '</div>';
    $("#sideBarMain").html(str);

    //菜单列表高度
    var firstMenuH = $("#firstMenu").height();
    var maxHeight = $("#sideBar").height()-80;
    if(firstMenuH > maxHeight){
        $("#firstMenu").height(maxHeight);
        $(".menuScroll").show();
    }

    //菜单列表对应的隐藏区域
    $(".secondPanel").css({
        height : $(window).height()-70,
        overflow : "auto"
    });

    //菜单hover效果
    $("#firstMenu li").hover(
        function(){
            $(this).find(".firstMenuItem").addClass("firstMenuItemHover");
            $(this).find(".secondPanel").show();
        },
        function(){
            $(this).find(".firstMenuItem").removeClass("firstMenuItemHover");
            $(this).find(".secondPanel").hide();
        }
    );

    //菜单盒子上下滚动
    initMenuScroll();

    //开启关闭左侧菜单
    $("input[data-toggle='switch']").bootstrapSwitch();
    centerResize($('input[name="menu_config"]').bootstrapSwitch("state")?1:0,"default");
    $('input[name="menu_config"]').parent().find("span").on("click", function() {
        var val = $('input[name="menu_config"]').bootstrapSwitch("state")?1:0;
        if(val == 1){
            $("#sideBar").show();
        }else{
            $("#sideBar").hide();
        }
        centerResize(val);        
        sortList();
    });
}

/**
 * 菜单盒子上下滚动
 */
function initMenuScroll(){
    $(".scrollUp").click(
        function(){
            var ul = $("#sideBarMain ul:eq(0)");
            ul.animate({'scrollTop':(ul.scrollTop()-SCROLL_HEIGHT)}, 600);
        }
    );
    $(".scrollDown").click(
        function(){
            var ul = $("#sideBarMain ul:eq(0)");
            ul.animate({'scrollTop':(ul.scrollTop()+SCROLL_HEIGHT)}, 600);
        }
    );
    //左侧菜单鼠标滚动事件
    $("#firstMenu").mousewheel(function(){
        $("#firstMenu").stop().animate({'scrollTop':($("#firstMenu").scrollTop() - this.D)}, 50);
    });
}

/**
 * 开启关闭左侧菜单时，调整右侧内容位置
 * @param transNum
 */
function centerResize(transNum){
    if(transNum == 1){
        if($("#handMenuWord").hasClass("glyphicon-chevron-right")){
            if($("body").hasClass("right-mini")){
                $("body").removeClass().addClass("TOS1 right-mini");
            }else{
                $("body").removeClass().addClass("TOS1");
            }
        }else{
            if($("body").hasClass("right-mini")){
                $("body").removeClass().addClass("TOS right-mini");
            }else{
                $("body").removeClass().addClass("TOS");
            }
        }
    }else{
        /*if($("body").hasClass("right-mini")){
            $("body").removeClass().addClass("open-menu right-mini");
        }else{
            $("body").removeClass().addClass("open-menu");
        }*/
        $("#sideBar").hide();
        $("body").removeClass().addClass("open-menu");
    }

    $("#center .swiper-slide").css({
        width : $("#center").width()
    });
    if(mySwiper != undefined){
        mySwiper.resizeFix();  //当你改变swiper的尺寸而没有改变窗口大小时调用这个方法。
    }
}

/**
 * 关闭通知中心
 */
function closeEastTab(){
    $("body").removeClass("right-mini");
    $("#eastbar").removeClass("active");
}

/**
 * 绑定通知中心小菜单切换事件
 */
function bindEastNavPill(){
    $(".nav-pill").click(function(){
        if(!$(this).hasClass("active")){
            $(".nav-pill").removeClass("active");
            $(this).addClass("active");
            $(".tab-pane").removeClass("active");
            $(".pane-"+$(this).attr("paneltype")).addClass("active");
        }
    });
    $("#msg-tool button").click(function(){
        if(!$(this).hasClass("btn-primary")){
            $("#msg-tool button").removeClass("btn-primary");
            $(this).addClass("btn-primary");
            $(".msg-panel").removeClass("active");
            $("#"+$(this).attr("msg-panel")).addClass("active");
        }
    });
    $("#org_tool button").click(function(){
        if(!$(this).hasClass("btn-primary")){
            $("#org_tool button").removeClass("btn-primary");
            $(this).addClass("btn-primary");
            $(".online-panel").hide();
            $("#"+$(this).attr("user-type")).show();
        }
    });
}


/**
 * 创建导航tab
 * @param transId
 * @param transItem
 * @param transUrl
 */
function createTab(transId,transItem,transUrl){
    $("#tabs-container").tabs(
        "add",{
            id : transId,
            closable : true,
            title : transItem,
            style : "",
            selected : "true",
            content : "",
            url : transUrl
        }
    );
}

function sortList() {
    var listWidth = $('.ui-sortable').width();
    var margin;

    if (listWidth / 8 > 140) {
        margin = Math.round((listWidth / 8 - 120) / 2) - 1;
    } else if (listWidth / 7 > 140) {
        margin = Math.round((listWidth / 7 - 120) / 2) - 1;
    } else if (listWidth / 6 > 140) {
        margin = Math.round((listWidth / 6 - 120) / 2) - 1;
    } else if (listWidth / 5 > 140) {
        margin = Math.round((listWidth / 5 - 120) / 2) - 1;
    } else if (listWidth / 4 > 140) {
        margin = Math.round((listWidth / 4 - 120) / 2) - 1;
    } else if (listWidth / 3 > 140) {
        margin = Math.round((listWidth / 3 - 120) / 2) - 1;
    } else if (listWidth / 2 > 140) {
        margin = Math.round((listWidth / 2 - 120) / 2) - 1;
    }

    $('.ui-sortable li').css('margin-left', margin);
    $('.ui-sortable li').css('margin-right', margin);

}
