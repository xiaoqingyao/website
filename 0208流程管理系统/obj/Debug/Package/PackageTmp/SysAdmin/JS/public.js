// JavaScript Document
jQuery(function($) {
    //		$("body").selectobj({
    //					selectBar:"selectBar",
    //					seled:"seled",
    //					unseled:"unseled",
    //					list:"list"
    //		});

    $("#tags li")
		.click(function(ev) {
		    var index = $("#tags li").index(this);
		    $("#tags li.selectTag").removeClass("selectTag");
		    $(this).addClass("selectTag");
		    $("#panel fieldset").hide();
		    $("#panel fieldset").eq(index).show();
		    $.validationEngine.closePrompt(".formError", true);
		});

})


