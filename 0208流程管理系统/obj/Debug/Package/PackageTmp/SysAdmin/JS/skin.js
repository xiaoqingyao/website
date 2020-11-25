// JavaScript Document
jQuery(function($){
	//alert()
	if($.cookie("stylepath")){
		$("#myskin").attr("href",$.cookie("stylepath"))
	}else{
		
		}
	$("#skin a").click(function(){
		var newpath=$(this).attr("rel")
		//var s=$("#myskin").attr("href")
		$.cookie("stylepath",newpath)
		$("#myskin").attr("href",newpath)
	})			
})