// JavaScript Document
jQuery(function() {
    $(".ulbody").each(function(i) {
        $(this).hover(
			function() {
			    $(this).addClass("ullist")
			},
			function() {
			    $(this).removeClass("ullist")
			}
		 );

        $(this).click(function() {
            var chkArray = $(this).children("li").children(":checkbox");
            if (chkArray.length > 0) {
                var b = chkArray[0].checked;
                var src = arguments[0].target || window.event.srcElement;
                if (b) {
                    if (src.type != 'checkbox' && src.tagName != "A") {                 //避免重复2次修改       

                        $(this).removeClass("ulclick");
                        chkArray[0].checked = false;
                    }

                } else {

                    if (src.type != 'checkbox') {                      //避免重复2次修改                       
                        $(this).addClass("ulclick");
                        chkArray[0].checked = true;
                    }
                }
            }
        })

    })



    $("input:checkbox").each(function() {
        $(this).click(function() {
            if (ischekBoxAll($(this).attr("name"))) {
                if ($(this)[0].checked) {
                    $(".ulbody :checkbox").each(function(i) {
                        $(this)[0].checked = true;
                        $(this).parent().parent().addClass("ulclick");
                    });
                } else {
                    $(".ulbody :checkbox").each(function(i) {
                        $(this)[0].checked = false;
                        $(this).parent().parent().removeClass("ulclick");
                    });
                }

            } else {

                if ($(this).attr("type") == "checkbox") {
                    if ($(this)[0].checked) {
                        $(this).parent().parent().addClass("ulclick");
                    }
                    else {
                        $(this).parent().parent().removeClass("ulclick");
                    }
                }
            }

        })
    });

    function ischekBoxAll(str) {
        var len = str.length;
        if (str.substr(len - 3, len) == "All") {
            return true;
        } else {
            return false;
        }
    }
})