/*
* 利用JS来处理页面上各种行为
* Copyright (c) 2010 胡志瑶
* $Date: 2010-09-6 
*/

jQuery(document).ready(function() {

    //******置页面所有Radio无边框******
    jQuery("input[type=radio]").css("border", "none");
    jQuery("input[type=checkbox]").css("border", "none");

    //******设置表格class为edit_tb的样式（列及行的样式）******
    var initWidth;
    jQuery(".edit_tb").each(function() {
        initWidth = jQuery(this).find("tr td[colspan=1]:first").css("width");
        initWidth = (initWidth == null || initWidth == 0) ? 80 : initWidth;
        
        var colspan = jQuery(this).attr("colspan");
        if (Number(colspan) > 1) {
            jQuery(this).css("text-align", "center");
        }
        else {
            if (!jQuery(this).hasClass("none")) {
                initWidth = jQuery(this).find("tr td:nth-child(odd)").width(initWidth).css("text-align", "right");
                initWidth = jQuery(this).find("tr td:nth-child(even)").css({ "text-align": "left", "padding-left": "5px" });
            }
        }

    });
   

    //    jQuery(".edit_tb tr").addClass("trdashed");
    jQuery(".edit_tb .edit_tr_center td").css("text-align", "center");


   

    jQuery(".edit_tb .edit_td_center").each(function(index) {
        jQuery("td", this).css("text-align", "center");
    })

    jQuery(".edit_tb .edit_td_left").each(function(index) {
        jQuery("td", this).css("text-align", "left");
    })
})