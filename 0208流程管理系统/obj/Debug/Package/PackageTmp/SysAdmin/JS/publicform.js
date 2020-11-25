// JavaScript Document
jQuery(function(){
	$("input:button,input:submit").each(function(){
	if($(this).attr("class")==""){
	$(this).css({height:"22px",
				background:"#25bad9",
				color:"#fff",
				borderLeft:"#64d7ef 1px solid",
				borderTop:"#64d7ef 1px solid",
				borderRight:"#25bad9 1px solid",
				borderBottom:"#25bad9 1px solid"});
	}
	});
	
	$("input:text,textarea").each(function(){
		$(this).focus(function(){
			$(this).css({
						border:"#F90 1px solid",
						color:"#F90",
						background:"#fffef8"
						});		
		}).blur(function(){
			$(this).css({
						border:"#e4e4e4 1px solid",
						color:"#333",
						background:"#fff"
			});	
		})
	})
	
	/*$("input:checkbox,input:radio").each(function(){
		$(this).css({border:"none"});
	})*/
	//$("body").radio({checked:"img/radioChecked.png",unchecked:"img/unRadioChecked.png"});
	//$("body").checkbox({checked:"img/checkbox.png",unchecked:"img/unchecked.png"});
	
	
})
