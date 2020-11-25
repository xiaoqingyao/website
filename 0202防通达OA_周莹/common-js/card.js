function createCard(option){
	var htmlString ='<div class="col-xs-4">' +
						'<div class="box">' +
		                    '<div class="box-header" style="background-color:' + option.bgColor + '">' +
		                        '<p class="box-title">标题</p>' +
		                        '<div class="box-tools pull-right">' +
		                            '<a class="remove">关闭</a>' +
		                        '</div>' +
		                    '</div>' +
		                    '<div class="box-body" style="border-color:' + option.bgColor + '">' +
		                        '使用类: <code>.box</code>' +
		                    '</div>' +
		                '</div>' +
		            '</div>';

	$(".cardContent").append(htmlString);
}