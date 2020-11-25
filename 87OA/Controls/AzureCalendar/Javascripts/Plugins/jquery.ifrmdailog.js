/// <reference path="../intellisense/jquery-1.2.6-vsdoc-cn.js" />
(function($) {
    if ($.ShowIfrmDailog) {
        return;
    }
    $.escapeHTML = function(string) {
        var div = document.createElement('div');
        div.appendChild(document.createTextNode(string));
        return div.innerHTML;
    };
    $.documentCenter = function(el) {
        el = $(el);
        el.css({
            position: 'absolute',
            left: Math.max((document.documentElement.clientWidth - el.width()) / 2 + document.documentElement.scrollLeft, 0) + 'px',
            top: Math.max((document.documentElement.clientHeight - el.height()) / 2 + document.documentElement.scrollTop, 0) + 'px'
        });
    };
    $.getMargins = function(e, toInteger) {
        var el = jQuery(e);
        var t = el.css('marginTop') || '';
        var r = el.css('marginRight') || '';
        var b = el.css('marginBottom') || '';
        var l = el.css('marginLeft') || '';
        if (toInteger)
            return {
                t: parseInt(t) || 0,
                r: parseInt(r) || 0,
                b: parseInt(b) || 0,
                l: parseInt(l)
            };
        else
            return { t: t, r: r, b: b, l: l };
    };


    var opening = false;
    $.ShowIfrmDailog = function(url, options) {
        if (opening) {
            return;
        }
        opening = true;
        options = $.extend({
            width: 600,
            height: 400,
            caption: '',
            relax: false,
            onclose: null,
            dailogClass: "dailogbox",
            dailogbannerClass: "dailogbanner",
            closebtnClass: 'dailogclosebtn',
            closebtnOverClass: 'dailogclosebtnOver',
            closebtnDownClass: 'dailogclosebtnDown',
            titleClass: "dailogtitle",
            img_loading: '/Controls/AzureCalendar/Images/icons/circle_animation.gif'
        }, options);
        options.caption = $.escapeHTML(options.caption);
        var c = function(className) {
            return function() {
                this.className = className;
            };
        };
        function returnfalse() {
            return false;
        };
        $.closeIfrm = function(callback, d) {
            $.closeIfrm = returnfalse;
            //$(window).unbind('resize', setOverlaySize);
            $(iframe).remove();
            iframe.onreadystatechange = iframe.onload = null;
            iframe = null;
            button.unbind();
            //banner.fadeOut();
            box.slideUp("normal", function() {
                box.remove();
                box = null;
                overlay.fadeOut("normal", function() {
                    overlay.unbind();
                    overlay.remove();
                    overlay = null;
                    $.closeIfrm = returnfalse;
                    opening = false;
                    callback && callback();
                    if (d && options.onclose) {
                        options.onclose();
                        options.onclose = null;
                    }
                });
            });
        };

        var button = $('<div/>').css({
            width: '15px',
            height: '15px',
            'float': 'right'
        }).addClass(options.closebtnClass).hover(c(options.closebtnOverClass), c(options.closebtnClass))
        .bind(
          'mousedown', c(options.closebtnDownClass)
         ).bind(
          'mouseup', function() { $.closeIfrm(); }
        );
        var banner = $('<div/>').css({
            width: options.width
        }).append(
		'<div style="float: left;" class="' + options.titleClass + '"><span style="margin-left: 3px; cursor: default; font-size: 14px; ">' + options.caption + '</span></div>'
	    ).append(button).addClass(options.dailogbannerClass);



        var iframe = $('<iframe id="RIDlg" border="0" frameBorder="0"></iframe>').css({
            border: 0,
            width: options.width,
            height: options.height,
            visibility: 'hidden'
        }).get(0);

        var showIfrm = function() {
            box.slideDown('normal', function() {
                img.remove();
                iframe.style.visibility = 'visible';
                //                banner.fadeIn('slow', function() {
                //                    button.css('background', 'url(' + options.img_close + ') center center no-repeat');
                //                });
                overlay.bind('click', function() {
                    if (options.relax) {
                        $.closeIfrm();
                    }
                    return false;
                });
            });
        };

        if ($.browser.msie) {
            iframe.onreadystatechange = function() {
                if (iframe.readyState == "complete") {
                    showIfrm();
                    iframe.onreadystatechange = null;
                }
            };
        } else {
            iframe.onload = function() {
                showIfrm();
                iframe.onload = null;
            };
        }

        var box = $('<div></div>').css({
            display: 'none',
            position: 'absolute',
            width: options.width,
            height: options.height + 27,
            zIndex: '1000'
        }).addClass(options.dailogClass).append(banner).append(iframe).appendTo(document.body);

        var img = $('<img src="' + options.img_loading + '"/>').css({
            position: 'absolute',
            width: 100,
            height: 100,
            zIndex: '999'
        }).appendTo(document.body);

        var overlay = $('<div></div>').css({
            position: 'absolute',
            left: 0,
            top: 0,
            zIndex: '998',
            background: 'black',
            opacity: '0.5'
        }).bind('contextmenu', function() { return false; }).appendTo(document.body);

        var setOverlaySize = function() {
            var margins = $.getMargins(document.body, true);
            overlay.css({
                width: Math.max(document.documentElement.clientWidth, document.body.scrollWidth),
                height: Math.max(document.documentElement.clientHeight, document.body.scrollHeight + margins.t + margins.b)
            });
            $.documentCenter(box);
        };
        setOverlaySize();
        $.documentCenter(img);
        iframe.src = url + (url.indexOf('?') > -1 ? '&' : '?') + '_=' + (new Date()).valueOf();
    }
})(jQuery);