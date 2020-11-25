/// <reference path="intellisense/jquery-1.2.6-vsdoc.js" />
try { document.execCommand("BackgroundImageCache", false, true); } catch (e) { }
var popUpWin;
function PopUpCenterWindow(URLStr, width, height, newWin, scrollbars) {
    var popUpWin = 0;
    if (typeof (newWin) == "undefined") {
        newWin = false;
    }
    if (typeof (scrollbars) == "undefined") {
        scrollbars = 0;
    }
    if (typeof (width) == "undefined") {
        width = 800;
    }
    if (typeof (height) == "undefined") {
        height = 600;
    }
    var left = 0;
    var top = 0;
    if (screen.width >= width) {
        left = Math.floor((screen.width - width) / 2);
    }
    if (screen.height >= height) {
        top = Math.floor((screen.height - height) / 2);
    }
    if (newWin) {
        open(URLStr, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=' + scrollbars + ',resizable=yes,copyhistory=yes,width=' + width + ',height=' + height + ',left=' + left + ', top=' + top + ',screenX=' + left + ',screenY=' + top + '');
        return;
    }

    if (popUpWin) {
        if (!popUpWin.closed) popUpWin.close();
    }
    popUpWin = open(URLStr, 'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=' + scrollbars + ',resizable=yes,copyhistory=yes,width=' + width + ',height=' + height + ',left=' + left + ', top=' + top + ',screenX=' + left + ',screenY=' + top + '');
    popUpWin.focus();
}

function OpenModelWindow(url, option) {
    var fun;
    try {
        if (parent != null && parent.$ != null && parent.$.ShowIfrmDailog != undefined) {
            fun = parent.$.ShowIfrmDailog
        }
        else {
            fun = $.ShowIfrmDailog;
        }
    }
    catch (e) {
        fun = $.ShowIfrmDailog;
    }
    fun(url, option);
}
function CloseModelWindow(callback, dooptioncallback) {
    parent.$.closeIfrm(callback, dooptioncallback);
}
//复制对象
function Clone(obj) {
    var objClone = new Object();
    if (obj.constructor == Object) {
        objClone = new obj.constructor();
    } else {
        objClone = new obj.constructor(obj.valueOf());
    }
    for (var key in obj) {
        if (objClone[key] != obj[key]) {
            if (typeof (obj[key]) == 'object') {
                objClone[key] = Clone(obj[key]);
            } else {
                objClone[key] = obj[key];
            }
        }
    }
    objClone.toString = obj.toString;
    objClone.valueOf = obj.valueOf;
    return objClone;
}
//格式化日期返回String
Date.prototype.Format = function(format) {   
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "H+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "w": "0123456".indexOf(this.getDay()),
        "W": ["日", "一", "二", "三", "四", "五", "六"][this.getDay()],
        "S": this.getMilliseconds()
    };
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1,
  RegExp.$1.length == 1 ? o[k] :
    ("00" + o[k]).substr(("" + o[k]).length));
    }
    return format;
};

//仿照VBScript的DateAdd函数
function DateAdd(interval, number, idate) {
    number = parseInt(number);
    var date;
    if (typeof (idate) == "string") {
        date = idate.split(/\D/);
        eval("var date = new Date(" + date.join(",") + ")");
    }

    if (typeof (idate) == "object") {
        date = new Date(idate.toString());
    }    
    switch (interval) {
        case "y": date.setFullYear(date.getFullYear() + number); break;
        case "m": date.setMonth(date.getMonth() + number); break;
        case "d": date.setDate(date.getDate() + number); break;
        case "w": date.setDate(date.getDate() + 7 * number); break;
        case "h": date.setHours(date.getHours() + number); break;
        case "n": date.setMinutes(date.getMinutes() + number); break;
        case "s": date.setSeconds(date.getSeconds() + number); break;
        case "l": date.setMilliseconds(date.getMilliseconds() + number); break;
    }
    return date;
}
//获取两个日程的时间间隔,仿照VbScript的Datediff函数
function DateDiff(interval, d1, d2) {
    switch (interval) {
        case "d": //天
        case "w":
            d1 = new Date(d1.getFullYear(), d1.getMonth(), d1.getDate());
            d2 = new Date(d2.getFullYear(), d2.getMonth(), d2.getDate());
            break;  //w
        case "h":
            d1 = new Date(d1.getFullYear(), d1.getMonth(), d1.getDate(), d1.getHours());
            d2 = new Date(d2.getFullYear(), d2.getMonth(), d2.getDate(), d2.getHours());
            break; //h
        case "n":
            d1 = new Date(d1.getFullYear(), d1.getMonth(), d1.getDate(), d1.getHours(), d1.getMinutes());
            d2 = new Date(d2.getFullYear(), d2.getMonth(), d2.getDate(), d2.getHours(), d2.getMinutes());
            break;
        case "s":
            d1 = new Date(d1.getFullYear(), d1.getMonth(), d1.getDate(), d1.getHours(), d1.getMinutes(), d1.getSeconds());
            d2 = new Date(d2.getFullYear(), d2.getMonth(), d2.getDate(), d2.getHours(), d2.getMinutes(), d2.getSeconds());
            break;
    }
    var t1 = d1.getTime(), t2 = d2.getTime();
    var diff = NaN;
    switch (interval) {
        case "y": diff = d2.getFullYear() - d1.getFullYear(); break; //y
        case "m": diff = (d2.getFullYear() - d1.getFullYear()) * 12 + d2.getMonth() - d1.getMonth(); break;    //m
        case "d": diff = Math.floor(t2 / 86400000) - Math.floor(t1 / 86400000); break;
        case "w": diff = Math.floor((t2 + 345600000) / (604800000)) - Math.floor((t1 + 345600000) / (604800000)); break; //w
        case "h": diff = Math.floor(t2 / 3600000) - Math.floor(t1 / 3600000); break; //h
        case "n": diff = Math.floor(t2 / 60000) - Math.floor(t1 / 60000); break; //
        case "s": diff = Math.floor(t2 / 1000) - Math.floor(t1 / 1000); break; //s
        case "l": diff = t2 - t1; break;
    }
    return diff;
    
}
function StrFormat(temp, dataarry) {
    return temp.replace(/\{([\d])\}/g, function(s1, s2) { var s = dataarry[s2]; if (typeof (s) != "undefined") { if (s instanceof (Date)) { return encodeURIComponent(s.Format("yyyy-MM-dd HH:mm:ss S")); } else { return encodeURIComponent(s); } } else { return ""; } });
}
function StrFormatNoEncode(temp, dataarry) {
    return temp.replace(/\{([\d])\}/g, function(s1, s2) { var s = dataarry[s2]; if (typeof (s) != "undefined") { if (s instanceof (Date)) { return (s.Format("yyyy-MM-dd HH:mm:ss S")); } else { return (s); } } else { return ""; } });
}
function getiev() {
    var userAgent = window.navigator.userAgent.toLowerCase();
    $.browser.msie8 = $.browser.msie && /msie 8\.0/i.test(userAgent);
    $.browser.msie7 = $.browser.msie && /msie 7\.0/i.test(userAgent);
    $.browser.msie6 = !$.browser.msie8 && !$.browser.msie7 && $.browser.msie && /msie 6\.0/i.test(userAgent);
    var v;
    if ($.browser.msie8) {
        v = 8;
    }
    else if ($.browser.msie7) {
        v = 7;
    }
    else if ($.browser.msie6) {
        v = 6;
    }
    else { v = -1; }
    return v;
}
$(document).ready(function() {
    var v = getiev()
    if (v > 0) {
        $(document.body).addClass("ie ie" + v);
    }

});
function emk_createXMLHttpRequest() {
    var xmlHttp;
    if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlHttp;
}
(function($) {
if ($.fn.noSelect == undefined) {
    $.fn.noSelect = function(p) { //no select plugin by me :-)
        if (p == null)
            prevent = true;
        else
            prevent = p;

        if (prevent) {

            return this.each(function() {
                if ($.browser.msie || $.browser.safari) $(this).bind('selectstart', function() { return false; });
                else if ($.browser.mozilla) {
                    $(this).css('MozUserSelect', 'none');
                    $('body').trigger('focus');
                }
                else if ($.browser.opera) $(this).bind('mousedown', function() { return false; });
                else $(this).attr('unselectable', 'on');
            });

        } else {

            return this.each(function() {
                if ($.browser.msie || $.browser.safari) $(this).unbind('selectstart');
                else if ($.browser.mozilla) $(this).css('MozUserSelect', 'inherit');
                else if ($.browser.opera) $(this).unbind('mousedown');
                else $(this).removeAttr('unselectable', 'on');
            });

        }

    }; //end noSelect
}
})(jQuery)