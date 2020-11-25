//模拟个人桌面数据
var dtNum = 1;  //页数


/**
 * 加载桌面数据
 */
function loadDesktopData(){
    //模拟数据成功
    createDesktopData();
}

/**
 * 创建个人桌面
 */
function createDesktopData(){
    var str = '<div id="swiperBox">';

    str += '<div class="swiper-container">';
    str += '<div class="swiper-wrapper">';

    for(var i=0;i<dtNum;i++){
        str += '<div class="swiper-slide">';
        str += '<ul class="ui-sortable">';

        for(var j=0,k=dtObj.length;j<k;j++){
            var obj = dtObj[j];
            if(obj.dtNum == i){
                str += '<li id="block_'+obj.index+'" title="'+obj.title+'" index="'+obj.index+'" data-url="'+obj.dataUrl+'" onclick="parent.createTab(\''+obj.index+'\',\''+obj.title+'\',\''+obj.dataUrl+'\')">';

                str += '<div class="img">';
                str += '<p>';
                str += '<img src="'+obj.img+'" />';
                str += '</p>';
				if(obj.msgNum != undefined && obj.msgNum != "" && obj.msgNum != 0){
					var tmpCount = (obj.msgNum>=10)?10:obj.msgNum;
                	str += '<div class="count count'+tmpCount+'" id="count_'+obj.msgNum+'" ></div>';
				}
                str += '</div>';

                str += '<a href="javascript: void(0)" class="text">';
                str += '<span>'+obj.title+'</span>';
                str += '</a>';

                str += '</li>';
            }
        }

        str += '</ul>';
        str += '</div>';
    }

    str += '</div>';
    str += '</div>';

    str += '</div>';

    $(str).replaceAll($("#swiperBox"));
    mySwiper = new Swiper('.swiper-container',{
        pagination : '.control-c',
        paginationClickable  : true,
        resizeReInit : true,
        speed:1000,
        loop : true //可选选项，开启循环
    });
    mySwiper.resizeFix();
}

$(function(){
    loadDesktopData();
    sortList();
});

$(window).resize(function() {
    sortList();
});

