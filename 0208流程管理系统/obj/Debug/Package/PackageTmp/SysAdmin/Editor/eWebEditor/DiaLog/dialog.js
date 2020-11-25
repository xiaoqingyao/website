/*
*######################################
* eWebEditor v6.2 - Advanced online web based WYSIWYG HTML editor.
* Copyright (c) 2003-2009 eWebSoft.com
*
* For further information go to http://www.ewebsoft.com/
* This copyright notice MUST stay intact for use.
*######################################
*/

var av = new Object();
var gx = document.location.search.substr(1).split('&');
for (i = 0; i < gx.length; i++) {
    var gy = gx[i].split('=');
    av[gy[0]] = gy[1];
}
var config;
try {
    config = dialogArguments.config;
} catch (e) {
    try {
        config = opener.config;
    } catch (e) { }
}
var lang;
try {
    lang = dialogArguments.lang;
} catch (e) {
    try {
        lang = opener.lang;
    } catch (e) { }
}
var aq;
try {
    aq = dialogArguments.aq;
} catch (e) {
    try {
        aq = opener.aq;
    } catch (e) { }
}
function fv(cy, fN) {
    return (av[cy]) ? av[cy] : fN;
};
function fR(url) {
    document.write('<scr' + 'ipt type="text/javascript" src="' + url + '" onerror="alert(\'Error loading \' + this.src);"><\/scr' + 'ipt>');
};
function bF(M) {
    gR = 0;
    gS = M.length;
    if (bF.arguments.length == 2) {
        gD = bF.arguments[1].toLowerCase();
    } else {
        gD = "all";
    }
    for (var i = 0; i < M.length; i++) {
        mZ = M.substring(gR, gR + 1);
        nc = M.substring(gS, gS - 1);
        if ((gD == "all" || gD == "left") && mZ == " ") {
            gR++;
        }
        if ((gD == "all" || gD == "right") && nc == " ") {
            gS--;
        }
    }
    M = M.slice(gR, gS);
    return M;
};
function aQ(ji, oP) {
    alert(oP);
    ji.focus();
    ji.select();
    return false;
};
function cw(color) {
    var iZ = color;
    if (iZ == "") return true;
    if (iZ.length != 7) return false;
    return (iZ.search(/\#[a-fA-F0-9]{6}/) != -1);
};
function aP() {
    return ((event.keyCode >= 48) && (event.keyCode <= 57));
};
function cC(al) {
    var lb = document.all("d_" + al);
    var pa = document.all("s_" + al);
    var url = "selcolor.htm?color=" + encodeURIComponent(lb.value);
    var Q = showModalDialog(url, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
    if (Q) {
        lb.value = Q;
        pa.style.backgroundColor = Q;
    }
};
function ll() {
    showModalDialog("backimage.htm?action=other", window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
};
function fA(type, al) {
    var nF = document.all("d_" + al);
    var Q = showModalDialog('browse.htm?return=input&type=' + type, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
    if (Q) {
        nF.value = Q;
    }
};
function ay(ia, fN) {
    for (var i = 0; i < ia.length; i++) {
        if (ia.options[i].value == fN) {
            ia.selectedIndex = i;
            return true;
        }
    }
    return false;
};
function bz(M) {
    M = bF(M);
    if (M != "") {
        var bP = parseFloat(M);
        if (isNaN(bP)) {
            M = "";
        } else {
            M = bP;
        }
    }
    return M;
};
function pd(url) {
    var bP;
    var b = true;
    bP = url.substring(0, 7);
    bP = bP.toUpperCase();
    if ((bP != "HTTP://") || (url.length < 10)) {
        b = false;
    }
    return b;
};
function dU(url, cu) {
    var bP;
    var b = false;
    var s = cu.toUpperCase().split("|");
    for (var i = 0; i < s.length; i++) {
        bP = url.substr(url.length - s[i].length - 1);
        bP = bP.toUpperCase();
        s[i] = "." + s[i];
        if (s[i] == bP) {
            b = true;
            break;
        }
    }
    return b;
};
function ig(url) {
    if (url.substring(0, 1) == "/") {
        return url;
    }
    if (url.indexOf("://") >= 0) {
        return url;
    }
    var hf = oL();
    while (url.substr(0, 3) == "../") {
        url = url.substr(3);
        hf = hf.substring(0, hf.lastIndexOf("/"));
    }
    return hf + "/" + url;
};
function cZ(url) {
    switch (config.BaseUrl) {
        case "0":
            url = ig(url);
            return nV(url);
            break;
        case "1":
            return ig(url);
            break;
        case "2":
        case "3":
            return gu() + ig(url);
            break;
    }
};
function nV(url) {
    var eU = config.BaseHref;
    var b = true;
    while (b) {
        var bd = url.indexOf("/");
        var dH = eU.indexOf("/");
        if ((bd >= 0) && (dH >= 0)) {
            var na = url.substring(0, bd + 1);
            var mR = eU.substring(0, dH + 1);
            if (na == mR) {
                url = url.substr(bd + 1);
                eU = eU.substr(dH + 1);
            } else {
                b = false;
            }
        } else {
            b = false;
        }
    }
    if (eU != "") {
        var a = eU.split("/");
        for (var i = 1; i < a.length; i++) {
            url = "../" + url;
        }
    }
    return url;
};
function oL() {
    var url = "/" + document.location.pathname;
    return url.substring(0, url.lastIndexOf("/dialog/"));
};
function gu() {
    var fJ = document.location.protocol + "//" + document.location.host;
    if (fJ.substr(fJ.length - 3) == ":80") {
        fJ = fJ.substring(0, fJ.length - 3);
    }
    return fJ;
};
function aE() {
    var w = ar.offsetWidth + 6;
    var h = ar.offsetHeight + 25;
    if (aq.ks) {
        h += 20;
    }
    window.dialogWidth = w + "px";
    window.dialogHeight = h + "px";
    window.dialogLeft = (screen.availWidth - w) / 2;
    window.dialogTop = (screen.availHeight - h) / 2;
};
function nR(nF) {
    if (!nF["imageinitliazed"]) {
        nF["oncontextmenu"] = new Function("event.returnValue=false");
        nF["onmouseout"] = new Function("ku(this)");
        nF["onmousedown"] = new Function("kt(this)");
        nF["unselectable"] = "on";
        nF["imageinitliazed"] = true;
    }
    nF.className = "nR";
};
function ku(nF) {
    nF.className = "ku";
};
function kt(nF) {
    nF.className = "kt";
};
function fG(hA) {
    var gc;
    switch (hA) {
        case "image":
            gc = config.AllowImageSize;
            break;
        case "flash":
            gc = config.AllowFlashSize;
            break;
        case "media":
            gc = config.AllowMediaSize;
            break;
        case "file":
            gc = config.AllowFileSize;
            break;
        default:
            return "";
    }
    var oH = parseFloat(gc) * 1024;
    var html = "<iframe name='myuploadformtarget' style='display:none;position:absolute;width:0px;height:0px' src='blank.htm'></iframe>" + "<form action='../" + config.ServerExt + "/upload." + config.ServerExt + "?action=save&type=" + hA + "&style=" + config.StyleName + "&cusdir=" + config.CusDir + "' method=post name=myuploadform enctype='multipart/form-data' style='margin:0px;padding:0px;width:100%;border:0px' target='myuploadformtarget'>" + "<input type=hidden name='MAX_FILE_SIZE' value='" + oH + "'>" + "<input type=file name='uploadfile' size=1 style='width:100%' onchange=\"this.form.originalfile.value=this.value;try{ct();} catch(e){}\">" + "<input type=hidden name='originalfile' value=''>" + "</form>";
    return html;
};
function fo(aT, bj, pU) {
    var eR = "";
    switch (aT) {
        case "ext":
            eR = lang["ErrUploadInvalidExt"] + ":" + bj;
            break;
        case "size":
            eR = lang["ErrUploadSizeLimit"] + ":" + pU + "KB";
            break;
        case "file":
            eR = lang["ErrUploadInvalidFile"];
            break;
        case "style":
            eR = lang["ErrInvalidStyle"];
            break;
        default:
            eR = aT;
            break;
    }
    return eR;
};
function hj(name) {
    var kv = "";
    var search = name + "=";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = document.cookie.indexOf(";", offset);
            if (end == -1) {
                end = document.cookie.length;
            }
            kv = unescape(document.cookie.substring(offset, end));
        }
    }
    return kv;
};
function he(name, value) {
    var gZ = "";
    gZ = new Date((new Date()).getTime() + 24 * 365 * 3600000);
    gZ = ";expires=" + gZ.toGMTString();
    document.cookie = name + "=" + escape(value) + gZ;
};
var O;
function cr(hJ) {
    if (O) {
        O = null;
    }
    var b = false;
    try {
        O = new ActiveXObject("eWebSoft.eWebEditorActiveX");
        var hL = O.Version;
        if (parseFloat(hL.replace(/[^0123456789]+/gi, "")) >= config.kx) {
            O.Lang = lang.ad;
            O.SendUrl = config.SendUrl;
            O.LocalSize = config.AllowLocalSize;
            O.LocalExt = config.AllowLocalExt;
            b = true;
        }
    } catch (e) { }
    if (!b && hJ) {
        var Q = showModalDialog("installactivex.htm", dialogArguments, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
    }
    return b;
};
function dc() {
    var ci = O.Error;
    if (ci != "") {
        var eH, dX;
        if (ci.indexOf(":") >= 0) {
            var a = ci.split(":");
            eH = a[0];
            dX = a[1];
        } else {
            eH = ci;
            dX = "";
        }
        switch (eH) {
            case "L":
                alert(lang["ErrLicense"]);
                break;
            case "InvalidFile":
                alert(lang["ErrInvalidFile"] + ":" + dX);
                break;
            default:
                alert(ci);
        }
        return true;
    }
    return false;
}