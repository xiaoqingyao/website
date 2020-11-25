// JavaScript Document
jQuery.Dialog = {
    isopen: false,
    draggable: true,
    defaultTitle: "",
    defaultMsg: "",
    defaultValue: "",
    defaultIcon: 'img/slogo.png',
    defaultMin: false,
    defaultMax: false,
    defaultClose: true,
    url: "",


    defaultWidth: 240,
    defaultHeight: 80,

    //msg,title,w,h
    showAlert: function(opt, callback) {
        if (opt.title == null) opt.title = "弹出窗口";
        opt.type = "alert";
        jQuery.Dialog.build(opt, function(result) {
            if (callback) callback(result);
        });
    },
    //msg,title,w,h,
    showConfirm: function(opt, callback) {

        if (opt.title == null) opt.title = "确认窗口";
        opt.type = "confirm";
        jQuery.Dialog.build(opt, function(result) {
            if (callback) callback(result);
        });
    },
    //msg,value,title,w,h,
    showPrompt: function(opt, callback) {
        if (opt.title == null) opt.title = "输入窗口";
        opt.type = "prompt";
        jQuery.Dialog.build(opt, function(result) {
            if (callback) callback(result);
        });
    },

    showAuto: function(opt, callback) {
        if (opt.title == null) opt.title = "网页预览";
        opt.type = "auto";
        jQuery.Dialog.build(opt, function(result) {
            if (callback) callback(result);
        });
    },
    close: function() {
        jQuery("body").find("#norDialog").remove().end();
        jQuery("#norDialogBackground").remove();
    },
    locahost: function() {
        if (jQuery.Dialog.url != "") {
            try {
                window.location.href = jQuery.Dialog.url;
            } catch (e) {
            }
        }
    },
    timeout: function(opt) {
        setTimeout(jQuery.Dialog.autoClose, opt.time);
    },
    autoClose: function() {
        if (jQuery.Dialog.url) {
            jQuery.Dialog.locahost();
        }
        jQuery.Dialog.close();
    },
    //title,msg,value,w,h,type
    build: function(opt, callback) {
        this.defaultTitle = opt.title = opt.title ? getStrRegExp(opt.title) : this.defaultTitle;
        //opt.msg=opt.msg?getStrRegExp(opt.msg):"";
        opt.value = opt.value ? getStrRegExp(opt.value) : "";


        var setwidth, setheight;
        if (opt.width && opt.width > this.defaultWidth) {

            setwidth = opt.width;
        }
        else {
            setwidth = this.defaultWidth;
        }
        if (opt.height && opt.height > this.defaultHeight) {
            setheight = opt.height;
        }
        else {
            setheight = this.defaultHeight;
        }

        jQuery.Dialog.close();



        var norDialog = jQuery('<div id="norDialog">')
		.css({ width: setwidth + 'px', marginLeft: -setwidth / 2 + "px" })
		.append('<div id="norDialogContainer"></div>')
		.find("#norDialogContainer")
		 .append('<h2 id="titleHandler"><a href="javascript:void(0)" title="Close" id="dialogClose">Close</a>' + this.defaultTitle + '</h2>')
		 .find("#dialogClose")
		 .click(function() {
		     jQuery.Dialog.close();
		     if (jQuery.Dialog.url) {
		         jQuery.Dialog.locahost();
		     }
		 })
		 .end()
		 .append('<div id="norDialogMain"></div>')
		 .find("#norDialogMain")
			 .append('<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td id="norDialogTBody"></td></tr></table>')
			 .find("#norDialogTBody")
					.css({ height: setheight + 'px', padding: "10px 10px 5px" })
			 .end()
		 .end()
		 .append('<div id="norDialogTFoot"></div>')
		.end()
		.appendTo('body');

        var dw = document.documentElement.clientWidth;
        var dh = document.documentElement.clientHeight;
        var jh = jQuery("body").height();

        var se = (document.documentElement.clientHeight - jQuery("#norDialog").height()) / 2 - 20;


        var topScroll = getScroll() + se; //view 
        jQuery("#norDialog").css("top", topScroll + "px");

        jQuery('<div id="norDialogBackground">')
		.css({ width: dw + "px", height: jh + "px" })
		.click(function() {
		    jQuery("body").find("#norDialog").remove();
		    jQuery("#norDialogBackground").remove();
		})
		.appendTo('body');

        if (opt.time) {
            jQuery.Dialog.url = opt.url;
            jQuery.Dialog.timeout(opt);
        }

        switch (opt.type) {
            case "alert":
                var iclass = "alert";
                if (opt.status) {
                    iclass = iclass + opt.status;
                }
                jQuery("#norDialogTBody")
				.append('<p class="tooltop">' + opt.msg + '</p>').find(".reclose").click(function() {
				    jQuery.Dialog.url = null;
				    jQuery.Dialog.close();
				    return false
				}).end();

                jQuery("#norDialogTBody")
				.addClass(iclass)
				.css({ padding: "0px 10px 5px 80px" })

                var ok = jQuery('<button id="btnOK"> 确 定 </button>')
				.appendTo("#norDialogTFoot")
				.click(function() {
				    jQuery("#norDialog").remove();
				    jQuery("#norDialogBackground").remove();
				    if (callback) callback(true);

				    if (jQuery.Dialog.url) {
				        jQuery.Dialog.locahost();
				    }
				})
				.focus().keypress(function(e) {
				    if (e.keyCode == 27) jQuery("#btnOK").trigger('click');
				});
                break;

            case "confirm":
                jQuery("#norDialogTBody")
				.addClass("confirm")
				.css({ padding: "0px 10px 5px 80px" })
				.append('<p class="tooltop">' + opt.msg + '</p>')

                var ok = jQuery('<button id="btnOK"> 确 定 </button>')
				.click(function() {
				    jQuery("#norDialog").remove();
				    jQuery("#norDialogBackground").remove();
				    if (callback) callback(true);
				});

                var cancel = jQuery('<button id="btnCancel"> 取 消 </button>')
				.click(function() {
				    jQuery("#norDialog").remove();
				    jQuery("#norDialogBackground").remove();
				    if (callback) callback(false);
				})
				.focus().keypress(function(e) {
				    if (e.keyCode == 27) jQuery(e.target).trigger('click');
				});

                jQuery("#norDialogTFoot")
				.append(ok)
				.append(cancel);
                break;
            case "prompt":
                var textarea;
                if (opt.inputtype == 'textarea') {
                    textarea = '<textarea id="promptText02" style=" height:' + setheight + 'px;">' + opt.value + '</textarea>';
                } else {
                    textarea = '<p><input type="text" size="30" style="width:' + (setwidth - 40) + 'px;" id="promptText01" value="' + opt.value + '" /></p>';
                }

                jQuery("#norDialogTBody")
				.append('<p class="tooltop">' + opt.msg + '</p>')
				.append(textarea)
				.find("#promptText01,#promptText02")
				.focus(function() {
				    //jQuery(this).val("");
				})
				.end();

                var ok = jQuery('<button id="btnOK"> 确 定 </button>')
				.click(function() {
				    var val;
				    if (opt.inputtype == 'textarea') {
				        val = jQuery("#promptText02").val();
				    }
				    else {
				        val = jQuery("#promptText01").val();
				    }
				    jQuery("#norDialogBackground").remove();
				    jQuery("#norDialog").remove();
				    if (callback) callback(val);
				});

                var cancel = jQuery('<button id="btnCancel"> 取 消 </button>')
				.click(function() {
				    jQuery("#norDialogBackground").remove();
				    jQuery("#norDialog").remove();
				    if (callback) callback("");
				})
				.focus().keypress(function(e) {
				    if (e.keyCode == 27) jQuery(e.target).trigger('click');
				});

                jQuery("#norDialogTFoot")
				.append(ok)
				.append(cancel);

                break;

            case "auto":
                jQuery('<iframe name="myopenframe" width="100%" height="100%"  id="myopenframe" src="' + opt.url + '"  frameborder="0"></iframe>')
			.appendTo("#norDialogTBody")

                break;
        }
        jQuery("#norDialogTFoot button")
		.mouseover(function() {
		    jQuery(this).addClass('hover')
		})
		.mouseout(function() {
		    jQuery(this).removeClass('hover')
		});



        if (jQuery.Dialog.draggable) {
            try {
                $("#norDialog").draggable({ handle: $("#titleHandler") });
                $("#titleHandler").css({ cursor: 'move' });
            } catch (e) { /* requires jQuery UI draggables */ }
        }
    }

}
var getScroll = function() {
    var top;
    if (document.documentElement && document.documentElement.scrollTop) {
        top = document.documentElement.scrollTop;
    }
    else if (document.body) {
        top = document.body.scrollTop;
    }
    return top;
}
window.attachEvent("onscroll", getScroll);

