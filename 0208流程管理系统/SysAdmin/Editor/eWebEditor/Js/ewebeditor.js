/*
*######################################
* eWebEditor v6.2 - Advanced online web based WYSIWYG HTML editor.
* Copyright (c) 2003-2009 eWebSoft.com
*
* For further information go to http://www.ewebsoft.com/
* This copyright notice MUST stay intact for use.
*######################################
*/

String.prototype.by = function(s) {
    return (this.indexOf(s) > -1);
};
String.prototype.qf = function(s) {
    return (this.substr(0, s.length) == s);
};
String.prototype.qe = function(s, ignoreCase) {
    var L1 = this.length;
    var L2 = s.length;
    if (L2 > L1) {
        return false;
    }
    if (ignoreCase) {
        var oA = new RegExp(s + '$', 'i');
        return oA.test(this);
    } else {
        return (L2 == 0 || this.substr(L1 - L2, L2) == s);
    }
};
Array.prototype.qg = function(s) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == s) {
            return i;
        }
    }
    return -1;
};
var an = new Object();
lZ();
function lZ() {
    var av = new Object();
    var gx = document.location.search.substr(1).split("&");
    for (i = 0; i < gx.length; i++) {
        var gy = gx[i].split("=");
        av[gy[0]] = gy[1];
    }
    an.aZ = av["id"];
    an.nZ = av["originalfilename"];
    an.ob = av["savefilename"];
    an.nY = av["savepathfilename"];
    an.gb = av["extcss"];
    an.FullScreen = av["fullscreen"];
    an.StyleName = (av["style"]) ? av["style"] : "coolblue";
    an.CusDir = (av["cusdir"]) ? av["cusdir"] : "";
    an.Skin = (av["skin"]) ? av["skin"] : "";
    an.FixWidth = (av["fixwidth"]) ? av["fixwidth"] : "";
    an.Lang = (av["lang"]) ? av["lang"] : "";
    an.AreaCssMode = (av["areacssmode"] == "1") ? "1" : "";
    an.ka = (av["readonly"]) ? av["readonly"] : "";
};
var config = new Object();
config.StyleName = an.StyleName;
config.CusDir = an.CusDir;
var aq = new Object();
im();
function im() {
    var s = navigator.userAgent.toLowerCase();
    aq.iQ = s.by('msie');
    aq.kq = s.by('msie 7');
    aq.IsIE8 = s.by('msie 8');
    aq.ks = s.by("sv1");
    aq.nT = s.by('gecko/');
    aq.nN = s.by('safari');
    aq.iM = s.by('opera');
    aq.iP = s.by('macintosh');
    aq.dA = hG();
    if (!aq.dA) {
        var a = parent.document.getElementsByTagName("IFRAME");
        for (var i = 0; i < a.length; i++) {
            if (a[i].contentWindow == window) {
                a[i].style.display = "none";
                parent.document.getElementsByName(an.aZ)[0].style.display = "";
            }
        }
    }
};
function hG() {
    if (aq.iQ && !aq.iP && !aq.iM) {
        var hQ = navigator.appVersion.match(/MSIE (.\..)/)[1];
        return (hQ >= 5.5);
    }
    return false;
};
var lang = new Object();
lang.eI = {
    "da": true,
    "de": true,
    "en": true,
    "fr": true,
    "it": true,
    "es": true,
    "ja": true,
    "nl": true,
    "no": true,
    "pt": true,
    "ru": true,
    "sv": true,
    "zh-cn": true,
    "zh-tw": true
};
lang.iy = function() {
    if (an.Lang) {
        return an.Lang;
    }
    if (config.AutoDetectLanguage == "1") {
        var bf;
        if (navigator.userLanguage) {
            bf = navigator.userLanguage.toLowerCase();
        } else if (navigator.language) {
            bf = navigator.language.toLowerCase();
        } else {
            return this.DefaultLanguage;
        }
        if (this.eI[bf]) {
            return bf;
        } else if (bf.length > 2) {
            bf = bf.substr(0, 2);
            if (this.eI[bf]) {
                return bf;
            }
        }
    }
    return this.DefaultLanguage;
};
lang.aD = function(eu) {
    var de = eu.getElementsByTagName("INPUT");
    for (i = 0; i < de.length; i++) {
        if (de[i].getAttribute("lang")) {
            de[i].value = lang[de[i].getAttribute("lang")];
        }
    }
    var cU = eu.getElementsByTagName("SPAN");
    for (i = 0; i < cU.length; i++) {
        if (cU[i].getAttribute("lang")) {
            cU[i].innerHTML = lang[cU[i].getAttribute("lang")];
        }
    }
    var cV = eu.getElementsByTagName("OPTION");
    for (i = 0; i < cV.length; i++) {
        if (cV[i].getAttribute("lang")) {
            cV[i].innerHTML = lang[cV[i].getAttribute("lang")];
        }
    }
};
lang.Init = function() {
    if (this.eI[config.DefaultLanguage]) {
        this.DefaultLanguage = config.DefaultLanguage;
    } else {
        this.DefaultLanguage = "en";
    }
    this.ad = this.iy();
};
var H = new Object();
function ml() {
    if (!config.L) {
        return;
    }
    H.aK = null;
    H.dn = null;
    H.aZ = null;
    if (!aq.dA) {
        return;
    }
    var s = document.location.pathname;
    H.bV = s.substr(0, s.length - 15);
    H.BaseHref = "";
    if (config.BaseHref != "") {
        H.BaseHref = "<base href='" + gu() + config.BaseHref + "'>";
    }
    if (an.gb) {
        H.gb = "<link href='" + nG(an.gb) + "' type='text/css' rel='stylesheet'>";
    } else {
        H.gb = "";
    }
    if (an.Skin) {
        config.Skin = an.Skin;
    }
    if (an.FixWidth) {
        config.FixWidth = an.FixWidth;
    }
    if (an.AreaCssMode) {
        config.AreaCssMode = an.AreaCssMode;
    }
    if (an.ka) {
        config.InitMode = "VIEW";
        if (an.ka == "2") {
            config.StateFlag = "";
        } else {
            config.SBCode = "";
            config.SBEdit = "";
            config.SBText = "";
            config.SBView = "";
        }
    }
    config.HttpBlankUrl = (config.HttpFlag == "0") ? "" : "dialog/blank.htm";
    config.SendUrl = gu() + H.bV + "/" + config.ServerExt + "/upload." + config.ServerExt + "?action=local&type=local&style=" + config.StyleName + "&cusdir=" + config.CusDir;
    document.oncontextmenu = eJ;
    document.ondragstart = eJ;
    document.onselectstart = eJ;
    document.onselect = eJ;
    pH();
};
function D() {
    return kC().document;
};
function kC() {
    return document.getElementById("eWebEditor").contentWindow;
};
var lE = false;
window.onload = function() {
    if (!config.L) {
        return;
    }
    if (lE) {
        return;
    }
    lE = true;
    if (!aq.dA) {
        return;
    }
    H.aZ = parent.document.getElementsByName(an.aZ)[0];
    os();
    oh();
    for (var i = 0; i < document.all.length; i++) {
        document.all[i].unselectable = "on";
    }
    document.getElementById("eWebEditor").unselectable = "off";
    if (!aq.dA) {
        config.InitMode = "TEXT";
    }
    if (ContentFlag.value == "0") {
        ContentEdit.value = H.aZ.value;
        ContentLoad.value = H.aZ.value;
        ModeEdit.value = config.InitMode;
        ContentFlag.value = "1";
    }
    setMode(ModeEdit.value);
    mW();
};
function iK(html) {
    if (config.FixWidth) {
        var ab = new RegExp("<div (.*?)id=eWebEditor_FixWidth_DIV(.*?)>", "gi");
        if (!ab.test(html)) {
            return "<div id=eWebEditor_FixWidth_DIV style='width:" + config.FixWidth + ";height:100%' unselectable>" + html + "</div>";
        }
    }
    return html;
};
function oj(dJ) {
    dJ.onmouseover = pq;
    dJ.onmouseout = pr;
    dJ.onmousedown = pi;
    dJ.onmouseup = pp;
    dJ.ondragstart = eJ;
    dJ.onselectstart = eJ;
    dJ.onselect = eJ;
    dJ.mT = true;
    return true;
};
function eJ() {
    event.returnValue = false;
    event.cancelBubble = true;
    return false;
};
function hx() {
    var nF = event.srcElement;
    if (nF.tagName == "IMG") {
        nF = nF.parentNode;
    }
    if (nF.className == "TB_Btn_Image") {
        nF = nF.parentNode;
    }
    return nF;
};
pq = function() {
    var nF = hx();
    nF.className = "TB_Btn_Over";
};
pr = function() {
    var nF = hx();
    if (nF.jh) {
        nF.className = "TB_Btn_Down";
    } else {
        nF.className = "TB_Btn";
    }
};
pi = function() {
    var nF = hx();
    nF.className = "TB_Btn_Down";
};
pp = function() {
    var nF = hx();
    if (nF.className = "TB_Btn_Down") {
        nF.className = "TB_Btn_Over";
    } else {
        if (nF.jh) {
            nF.className = "TB_Btn_Down";
        } else {
            nF.className = "TB_Btn";
        }
    }
};
function oh(y) {
    var i, pJ, nF, p;
    p = document.getElementById("eWebEditor_Toolbar");
    pJ = p.getElementsByTagName("div");
    for (i = 0; i < pJ.length; i++) {
        nF = pJ[i];
        if (nF.className == "TB_Btn") {
            if (nF.mT == null) {
                if (!oj(nF)) {
                    alert("Problem initializing:" + nF.id);
                    return false;
                }
            }
        }
    }
    return true;
};
function cD() {
    if (H.aK != "EDIT") {
        return;
    }
    var b = (D().selection.type == "Control") ? true : false;
    nx(b);
    nK(b);
};
var eV = new Object;
eV.nU = false;
function nx(hw) {
    var hp = ["Bold", "Italic", "UnderLine", "StrikeThrough", "SuperScript", "SubScript", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyFull"];
    if (!eV.nU) {
        var pJ = document.getElementById("eWebEditor_Toolbar").getElementsByTagName("DIV");
        for (var i = 0; i < hp.length; i++) {
            var cl = hp[i];
            eV[cl] = new Array();
            for (var j = 0; j < pJ.length; j++) {
                var nF = pJ[j];
                if (nF.getAttribute("name") == "TB_Name_" + cl) {
                    eV[cl][eV[cl].length] = nF;
                }
            }
        }
    }
    var aa = D().selection.createRange();
    for (var i = 0; i < hp.length; i++) {
        var cl = hp[i];
        var v = aa.queryCommandValue(cl);
        var pJ = eV[cl];
        for (var j = 0; j < pJ.length; j++) {
            var nF = pJ[j];
            nF.jh = v;
            if (hw) {
                nF.className = "TB_Btn";
            } else {
                if (v) {
                    nF.className = "TB_Btn_Down";
                } else {
                    nF.className = "TB_Btn";
                }
            }
        }
    }
};
function nK(hw) {
    var dE, v;
    var aa = D().selection.createRange();
    dE = "FontName";
    if (hw) {
        v = "";
    } else {
        v = aa.queryCommandValue(dE);
    }
    kl(dE, v);
    dE = "FontSize";
    if (hw) {
        v = "";
    } else {
        v = aa.queryCommandValue(dE);
        if (v) {
            v = kn(v);
        } else {
            v = oR(aa);
        }
    }
    kl(dE, v);
};
function kl(dE, v) {
    var pJ = document.getElementsByName("TB_Name_" + dE);
    for (var i = 0; i < pJ.length; i++) {
        var nF = pJ[i];
        if (v) {
            v = v.toLowerCase();
            var b = false;
            for (var j = 0; j < nF.options.length; j++) {
                if (nF.options[j].value.toLowerCase() == v) {
                    nF.selectedIndex = j;
                    b = true;
                    break;
                }
            }
            if (!b) {
                nF.options[nF.options.length] = new Option(v, v);
                nF.selectedIndex = nF.options.length - 1;
            }
        } else {
            nF.selectedIndex = 0;
        }
    }
};
function oR(aa) {
    if (aa.text.length <= 1) {
        return aa.parentElement().currentStyle.fontSize;
    }
    var html = aa.htmlText;
    html = html.replace(/<[^>]+>/gi, " ");
    html = html.replace(/(&nbsp\;|\s)+/gi, " ");
    html = html.replace(/(^\s*)|(\s*$)/gi, "");
    var ir = html.split(" ");
    var r = "";
    var oK = aa.getBookmark();
    aa.collapse();
    for (var i = 0; i < ir.length; i++) {
        if (!ir[i]) {
            continue;
        }
        var b = aa.findText(ir[i]);
        if (b) {
            var v = aa.parentElement().currentStyle.fontSize;
            if ((r != "") && (r != v)) {
                r = "";
                break;
            }
            r = v;
            aa.collapse(false);
        } else {
            break;
        }
    }
    aa.moveToBookmark(oK);
    return r;
};
function mW() {
    if (!H.aZ) {
        return;
    }
    var aR = H.aZ.form;
    if (!aR) {
        return;
    }
    aR.attachEvent("onsubmit", jp);
    if (!aR.fx) {
        aR.fx = new Array();
    }
    aR.fx[aR.fx.length] = jp;
    if (!aR.kp) {
        aR.kp = aR.submit;
        aR.submit = function() {
            if (this.fx) {
                for (var i = 0; i < this.fx.length; i++) {
                    this.fx[i]();
                }
            }
            this.kp();
        };
    }
    aR.attachEvent("onreset", jk);
    if (!aR.fs) aR.fs = new Array();
    aR.fs[aR.fs.length] = jk;
    if (!aR.lA) {
        aR.lA = aR.reset;
        aR.reset = function() {
            if (this.fs) {
                for (var i = 0; i < this.fs.length; i++) {
                    this.fs[i]();
                }
            }
            this.lA();
        };
    }
};
function jp() {
    var aR = H.aZ.form;
    if (!aR) {
        return;
    }
    var html = getHTML();
    ContentEdit.value = html;
    if (H.aK == "TEXT") {
        html = ez(html);
    }
    kG(H.aZ, html);
};
function nS() {
    var aR = H.aZ.form;
    if (!aR) {
        return;
    }
    aR.submit();
};
function jk() {
    if (H.dn) {
        D().body.innerHTML = ContentLoad.value;
    } else {
        D().body.innerText = ContentLoad.value;
    }
};
function me() {
    ao('about.htm');
    return false;
};
var dM;
function mg() {
    if (H.aK == "VIEW" || H.aK == "EDIT") {
        return false;
    }
    if (!I.aF) {
        saveHistory();
    }
    D().selection.createRange().pasteHTML(ez(clipboardData.getData("Text")));
    saveHistory();
    return false;
};
function jC() {
    if (H.aK != "EDIT") {
        return false;
    }
    if (config.AutoDetectPaste == "1") {
        if (!cr(true)) {
            return false;
        }
        var aT = O.GetClipboardFlag();
        O = null;
        var ng = aT.split("|");
        if (ng[5] == "1") {
            dM = D().selection.createRange().getBookmark();
            window.setTimeout("hS()", 10);
            try {
                kC().event.returnValue = false;
            } catch (e) { }
            return false;
        } else if (ng[0] == "1" || ng[3] == "1") {
            dM = D().selection.createRange().getBookmark();
            window.setTimeout("mr('" + aT + "')", 10);
            try {
                kC().event.returnValue = false;
            } catch (e) { }
            return false;
        }
    }
    var as = jn();
    D().selection.createRange().pasteHTML(as);
    hT();
    return false;
};
function mr(aT) {
    if (dM) {
        var aa = D().selection.createRange();
        aa.moveToBookmark(dM);
        aa.select();
    }
    var Q = showModalDialog("dialog/paste.htm?flag=" + aT, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
    if (Q) {
        switch (Q) {
            case "html":
                var bN = jn();
                D().selection.createRange().pasteHTML(bN);
                hT();
                break;
            case "text":
                kR();
                break;
        }
    }
    dM = "";
};
function hS() {
    if (dM) {
        var aa = D().selection.createRange();
        aa.moveToBookmark(dM);
        aa.select();
    }
    ao("importword.htm?action=paste", true);
    dM = "";
};
function pasteExcel() {
    if (dM) {
        var aa = D().selection.createRange();
        aa.moveToBookmark(dM);
        aa.select();
    }
    ao("importexcel.htm?action=paste", true);
    dM = "";
};
function mq() {
    if (!cr(true)) {
        return;
    }
    O.Capture("");
    window.setTimeout("jw()", 100);
};
function jw() {
    try {
        if (O.Status != "ok") {
            window.setTimeout("jw()", 100);
            return;
        }
    } catch (e) {
        return
    }
    if (O.Error == "cancel") {
        return;
    }
    if (dc()) {
        return;
    }
    var bN = O.Body;
    insertHTML(bN);
    hT();
    O = null;
};
function onKeyUp(event) {
    cD();
};
function mi(event) {
    var cP = event.keyCode;
    var aV = String.fromCharCode(cP).toUpperCase();
    if (cP == 113) {
        hN();
        return false;
    }
    if (event.ctrlKey) {
        if (cP == 10) {
            nS();
            return false;
        }
        if (aV == "+") {
            fu(300);
            return false;
        }
        if (aV == "-") {
            fu(-300);
            return false;
        }
        if (aV == "1") {
            setMode("CODE");
            return false;
        }
        if (aV == "2") {
            setMode("EDIT");
            return false;
        }
        if (aV == "3") {
            setMode("TEXT");
            return false;
        }
        if (aV == "4") {
            setMode("VIEW");
            return false;
        }
        if (aV == "A") {
            if ((H.aK != "CODE") && (config.FixWidth)) {
                lw();
            } else {
                bp();
                if (!history.aF) {
                    saveHistory();
                }
                D().execCommand("SelectAll");
                saveHistory();
                bp();
            }
            return false;
        }
    }
    switch (H.aK) {
        case "VIEW":
            return true;
            break;
        case "EDIT":
            if (event.ctrlKey) {
                if (aV == "D") {
                    hS();
                    return false;
                }
                if (aV == "R") {
                    kf();
                    return false;
                }
                if (aV == "Z") {
                    fE(-1);
                    return false;
                }
                if (aV == "Y") {
                    fE(1);
                    return false;
                }
                if (aV == "V") {
                    jC();
                    return false;
                }
            } else if ((config.EnterMode == "2") && (cP == 13)) {
                if (!I.aF) {
                    saveHistory();
                }
                I.aF = false;
                var aa = D().selection.createRange();
                if (event.shiftKey) {
                    var p = aa.parentElement();
                    if (p.tagName != "P" || p.innerHTML == "") {
                        aa.pasteHTML("&nbsp;");
                        aa.select();
                        aa.collapse(false);
                    }
                    try {
                        aa.pasteHTML("</P><P id=eWebEditor_Temp_P>");
                    } catch (e) {
                        return false;
                    }
                    event.cancelBubble = true;
                    event.returnValue = false;
                    var nF = D().getElementById("eWebEditor_Temp_P");
                    if (nF.innerHTML == "") {
                        nF.innerHTML = "&nbsp;";
                    }
                    aa.moveToElementText(nF);
                    aa.select();
                    aa.collapse(false);
                    aa.select();
                    nF.removeAttribute("id");
                } else {
                    try {
                        aa.pasteHTML("<br>");
                    } catch (e) {
                        return false;
                    }
                    event.cancelBubble = true;
                    event.returnValue = false;
                    aa.select();
                    aa.moveEnd("character", 1);
                    aa.moveStart("character", 1);
                    aa.collapse(false);
                }
                return false;
            }
            break;
        default:
            if (cP == 13) {
                if (!I.aF) {
                    saveHistory();
                }
                I.aF = false;
                var G = D().selection.createRange();
                G.pasteHTML("<BR>");
                event.cancelBubble = true;
                event.returnValue = false;
                G.select();
                G.moveEnd("character", 1);
                G.moveStart("character", 1);
                G.collapse(false);
                return false;
            }
            if (event.ctrlKey) {
                if ((aV == "B") || (aV == "I") || (aV == "U")) {
                    return false;
                }
                if (aV == "Z") {
                    fE(-1);
                    return false;
                }
                if (aV == "Y") {
                    fE(1);
                    return false;
                }
            }
            break;
    }
    if ((cP == 13) || (cP == 8) || (cP == 46)) {
        if (!I.aF) {
            saveHistory();
        }
        I.aF = false;
    } else if ((cP >= 33) && (cP <= 40)) {
        if (!I.aF) {
            saveHistory();
        }
    } else if (!((event.ctrlKey && aV == "A") || (event.ctrlKey && aV == "F"))) {
        I.aF = false;
    }
    return true;
};
var cs = new Object;
function mk() {
    if (H.aK != "EDIT") {
        return;
    }
    cs.El = null;
    if (D().selection.type == "Control") {
        var es = D().selection.createRange();
        cs.El = es(0);
        cs.w = cs.El.style.width;
        cs.h = cs.El.style.height;
    }
    if (!I.aF) {
        saveHistory();
    }
};
function mj() {
    if (H.aK != "EDIT") {
        return;
    }
    if (cs.El) {
        if ((cs.El.style.width != cs.w) || (cs.El.style.height != cs.h)) {
            saveHistory();
        }
    }
    cD();
};
function pe() {
    if (H.aK != "EDIT") {
        return true;
    }
    if (!I.aF) {
        saveHistory();
    }
    var R = D().selection.createRange();
    var aN = D().selection.type;
    if (aN == "Control") {
        var A = R.item(0);
        if (A.tagName == "IMG") {
            A.src = hV(A.getAttribute("src", 2));
        }
    }
    if (aN == "Text") {
        var pJ = D().body.getElementsByTagName("IMG");
        var aU = D().body.createTextRange();
        for (var i = 0; i < pJ.length; i++) {
            aU.moveToElementText(pJ[i]);
            if (R.inRange(aU)) {
                pJ[i].src = hV(pJ[i].getAttribute("src", 2));
            }
        }
    }
    saveHistory();
    return true;
};
function hT() {
    var pJ = D().body.getElementsByTagName("IMG");
    for (var i = 0; i < pJ.length; i++) {
        pJ(i).src = hV(pJ(i).getAttribute("src", 2));
    }
};
function hV(url) {
    if (url.indexOf("://") < 0) {
        return url;
    }
    var hv = gu();
    if (url.indexOf(hv) < 0) {
        return url;
    }
    switch (config.BaseUrl) {
        case "0":
            var fm;
            fm = hv + config.BaseHref;
            if (url.toLowerCase().indexOf(fm.toLowerCase()) == 0) {
                return url.substr(fm.length);
            }
            fm = hv + H.bV + "/";
            if (url.toLowerCase().indexOf(fm.toLowerCase()) == 0) {
                return url.substr(fm.length);
            }
            return url;
            break;
        case "1":
            return url.substr(hv.length);
            break;
        case "2":
        case "3":
            return url;
            break;
    }
};
function gu() {
    return document.location.protocol + "//" + document.location.host;
};
function jn() {
    var gT = document.getElementById("eWebEditor_Temp_HTML");
    gT.innerHTML = "";
    var jj = document.body.createTextRange();
    jj.moveToElementText(gT);
    jj.execCommand("Paste");
    var oV = gT.innerHTML;
    gT.innerHTML = "";
    return oV;
};
function insertHTML(html) {
    if (la()) {
        return false;
    }
    bp();
    if (D().selection.type.toLowerCase() != "none") {
        D().selection.clear();
    }
    if (H.aK != "EDIT") {
        html = ez(html);
    }
    D().selection.createRange().pasteHTML(html);
    cD();
};
function setHTML(html, nL) {
    ContentEdit.value = html;
    switch (H.aK) {
        case "CODE":
            D().designMode = "On";
            D().open();
            D().write(hh());
            D().body.innerText = html;
            D().close();
            D().body.contentEditable = "true";
            H.dn = false;
            break;
        case "EDIT":
            D().designMode = "On";
            D().open();
            D().write(hh() + iK(html) + "</body>");
            D().execCommand("2D-Position", true, true);
            D().execCommand("MultipleSelection", true, true);
            D().execCommand("LiveResize", true, true);
            D().close();
            if (config.FixWidth) {
                D().body.contentEditable = "false";
                D().getElementById("eWebEditor_FixWidth_Div").contentEditable = "true";
            } else { }
            gP(hE);
            H.dn = true;
            break;
        case "TEXT":
            D().designMode = "On";
            D().open();
            D().write(hh());
            if (config.FixWidth) {
                eWebEditor_Temp_HTML.innerText = html;
                html = eWebEditor_Temp_HTML.innerHTML;
                D().body.innerHTML = iK(html);
            } else {
                D().body.innerText = html;
            }
            D().close();
            if (config.FixWidth) {
                D().body.contentEditable = "false";
                D().getElementById("eWebEditor_FixWidth_Div").contentEditable = "true";
            } else {
                D().body.contentEditable = "true";
            }
            H.dn = false;
            break;
        case "VIEW":
            D().designMode = "off";
            D().open();
            D().write(hh() + iK(html));
            D().close();
            if (config.FixWidth) {
                D().body.contentEditable = "false";
                D().getElementById("eWebEditor_FixWidth_Div").contentEditable = "false";
            } else {
                D().body.contentEditable = "false";
            }
            H.dn = false;
            break;
    }
    D().body.onpaste = mg;
    D().body.onhelp = me;
    D().body.ondragend = new Function("return pe();");
    D().onkeydown = new Function("return mi(eWebEditor.event);");
    D().onkeyup = new Function("return onKeyUp(eWebEditor.event);");
    D().oncontextmenu = new Function("return mO(eWebEditor.event);");
    D().onmousedown = new Function("return mk();");
    D().onmouseup = new Function("return mj();");
    if ((config.ShowBorder != "0") && H.dn) {
        config.ShowBorder = "0";
        hN();
    }
    if (!nL) {
        saveHistory();
    }
};
function getHTML() {
    var html;
    if ((H.aK == "EDIT") || (H.aK == "VIEW")) {
        if (config.FixWidth) {
            html = D().getElementById("eWebEditor_FixWidth_DIV").innerHTML;
        } else {
            html = D().body.innerHTML;
        }
    } else {
        html = D().body.innerText;
    }
    if (H.aK != "TEXT") {
        if ((html.toLowerCase() == "<p>&nbsp;</p>") || (html.toLowerCase() == "<p></p>")) {
            html = "";
        }
    }
    return html;
};
function appendHTML(html) {
    if (la()) {
        return false;
    }
    if (H.aK == "EDIT") {
        D().body.innerHTML += html;
    } else {
        D().body.innerText += html;
    }
};
function kR() {
    if (!di()) {
        return;
    }
    bp();
    if (!I.aF) {
        saveHistory();
    }
    var bB = ez(clipboardData.getData("Text"));
    insertHTML(bB);
    saveHistory();
    bp();
};
function di() {
    if (H.aK == "EDIT") {
        return true;
    }
    alert(lang["MsgOnlyInEditMode"]);
    bp();
    return false;
};
function la() {
    if (H.aK == "VIEW") {
        alert(lang["MsgCanotSetInViewMode"]);
        return true;
    }
    return false;
};
function au(al, cu) {
    if (!di()) {
        return;
    }
    bp();
    if (!I.aF) {
        saveHistory();
    }
    if (cu == "RemoveFormat") {
        al = cu;
        cu = null;
    }
    if (cu == null) {
        var s = "";
        switch (al.toLowerCase()) {
            case "justifyleft":
                s = "left";
                break;
            case "justifycenter":
                s = "center";
                break;
            case "justifyright":
                s = "right";
                break;
            case "justifyfull":
                s = "justify";
                break;
        }
        var b = false;
        if (s == "left" || s == "center" || s == "right") {
            var G = D().selection.createRange();
            G.type = D().selection.type;
            if (G.type == "Control") {
                var A = G.item(0);
                try {
                    if (s == "center") {
                        A.align = "";
                        A.style.display = "block";
                        A.style.margin = "0px auto";
                        A.style.textAlign = s;
                    } else {
                        A.align = s;
                        A.style.display = "";
                        A.style.margin = "";
                        A.style.textAlign = "";
                    }
                    b = true;
                } catch (e) { }
            }
        }
        if (!b) {
            if ((al.toLowerCase() == "selectall") && (config.FixWidth)) {
                lw();
            } else {
                D().execCommand(al);
            }
            if (s) {
                var G = D().selection.createRange();
                var p = kg("P");
                if (!p) {
                    p = kg("DIV");
                }
                if (p) {
                    p.style.textAlign = s;
                    if (s == "justify") {
                        p.style.textJustify = "inter-ideograph";
                    } else {
                        p.style.textJustify = "";
                    }
                }
            }
        }
    } else {
        D().execCommand(al, "", cu);
    }
    saveHistory();
    bp();
    cD();
};
function lw() {
    var r = D().body.createTextRange();
    r.moveToElementText(D().getElementById("eWebEditor_FixWidth_DIV"));
    r.select();
};
function km(al) {
    bp();
    var G = D().selection;
    if (G.type != "Text") {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var aa = G.createRange();
    var r = D().body.createTextRange();
    var lS = 0;
    while (r.compareEndPoints("StartToStart", aa) < 0) {
        r.moveStart("character", 1);
        lS++;
    }
    var dK = 0;
    while (r.compareEndPoints("EndToEnd", aa) > 0) {
        r.moveEnd("character", -1);
        dK--;
    }
    var a = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
    var l, u, iA, iG;
    for (var i = 0; i < 26; i++) {
        l = a[i];
        u = a[i].toUpperCase();
        switch (al) {
            case "uppercase":
                iA = l;
                iG = u;
                break;
            case "lowercase":
                iA = u;
                iG = l;
                break;
        }
        r = aa.duplicate();
        while (r.findText(iA, 0, 4)) {
            r.text = iG;
            r = aa.duplicate();
        }
    }
    r = D().body.createTextRange();
    r.moveStart("character", lS);
    r.moveEnd("character", dK);
    r.select();
    saveHistory();
};
function eG(al, v) {
    bp();
    var hA = D().selection.type.toLowerCase();
    if (hA != "text") {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var r = D().selection.createRange();
    var pf = r.getBookmark();
    D().execCommand("fontname", "", "eWebEditor_Temp_FontName");
    var hF = D().body.getElementsByTagName("FONT");
    var Q = new Array();
    for (var i = 0; i < hF.length; i++) {
        var cL = hF[i];
        if (cL.getAttribute("face") == "eWebEditor_Temp_FontName") {
            Q[Q.length] = hF[i];
        }
    }
    for (var i = 0; i < Q.length; i++) {
        var cL = Q[i];
        kh(cL, al);
        hP(cL);
        lK(cL, al, v);
        cL.removeAttribute("face");
        var dC = cL.parentElement;
        if (dC.tagName == "FONT") {
            kj(dC);
        }
        if ((dC.tagName == "FONT") || (dC.tagName == "SPAN")) {
            if (dC.innerText == cL.innerText) {
                dC.style.cssText = dC.style.cssText + ";" + cL.style.cssText;
                dC.innerHTML = cL.innerHTML;
                continue;
            }
        }
    }
    r.moveToBookmark(pf);
    r.select();
    saveHistory();
};
function ln(B, al, v) {
    try {
        switch (al) {
            case "face":
                B.style.fontFamily = v;
                break;
            case "size":
                B.style.fontSize = v;
                break;
            case "color":
                B.style.color = v;
                break;
            default:
                break;
        }
    } catch (e) { }
};
function kh(B, al) {
    ln(B, al, "");
    var bo = B.children;
    for (var j = 0; j < bo.length; j++) {
        kh(bo[j], al);
        if (bo[j].tagName == "FONT") {
            kj(bo[j]);
        }
    }
};
function lK(B, al, v) {
    ln(B, al, v);
    var bo = B.children;
    for (var j = 0; j < bo.length; j++) {
        if ((bo[j].tagName == "SPAN") || (bo[j].tagName == "FONT")) {
            lK(bo[j], al, v);
        }
    }
};
function hP(B) {
    var bo = B.children;
    for (var j = 0; j < bo.length; j++) {
        hP(bo[j]);
        if ((bo[j].tagName == "FONT") || (bo[j].tagName == "SPAN")) {
            if ((bo[j].style.cssText == "") || (bo[j].innerHTML == "")) {
                bo[j].removeNode(false);
                hP(B);
                return;
            }
        }
    }
};
function kj(nF) {
    if (nF.style.fontFamily == "") {
        var s = nF.getAttribute("face");
        if (s) {
            nF.style.fontFamily = s;
        }
    }
    nF.removeAttribute("face");
    if (nF.style.fontSize == "") {
        var s = nF.getAttribute("size");
        s = kn(s);
        if (s) {
            nF.style.fontSize = s;
        }
    }
    nF.removeAttribute("size");
    if (nF.style.color == "") {
        var s = nF.getAttribute("color");
        if (s) {
            nF.style.color = s;
        }
    }
    nF.removeAttribute("color");
};
function kn(s) {
    var r;
    switch (s + "") {
        case "1":
            r = "8pt";
            break;
        case "2":
            r = "10pt";
            break;
        case "3":
            r = "12pt";
            break;
        case "4":
            r = "14pt";
            break;
        case "5":
            r = "18pt";
            break;
        case "6":
            r = "24pt";
            break;
        case "7":
            r = "36pt";
            break;
        default:
            r = "";
            break;
    }
    return r;
};
function setMode(bZ) {
    if (bZ == H.aK) {
        return;
    }
    if (!aq.dA) {
        if ((bZ == "CODE") || (bZ == "EDIT") || (bZ == "VIEW")) {
            alert(lang["MsgNotCompatibleHtml"]);
            return false;
        }
    }
    if (bZ == "TEXT") {
        if (H.aK == ModeEdit.value) {
            if (!confirm(lang["MsgHtmlToText"])) {
                return false;
            }
        }
    }
    var bC = "";
    switch (H.aK) {
        case "CODE":
            if (bZ == "TEXT") {
                eWebEditor_Temp_HTML.innerHTML = D().body.innerText;
                bC = eWebEditor_Temp_HTML.innerText;
            } else {
                bC = D().body.innerText;
            }
            break;
        case "TEXT":
            bC = D().body.innerText;
            bC = ez(bC);
            break;
        case "EDIT":
        case "VIEW":
            if (bZ == "TEXT") {
                bC = D().body.innerText;
            } else {
                if (config.FixWidth) {
                    bC = D().getElementById("eWebEditor_FixWidth_DIV").innerHTML;
                } else {
                    bC = D().body.innerHTML;
                }
            }
            break;
        default:
            bC = ContentEdit.value;
            break;
    }
    try {
        document.getElementById("eWebEditor_CODE").className = "SB_Mode_BtnOff";
    } catch (e) { }
    try {
        document.getElementById("eWebEditor_EDIT").className = "SB_Mode_BtnOff";
    } catch (e) { }
    try {
        document.getElementById("eWebEditor_TEXT").className = "SB_Mode_BtnOff";
    } catch (e) { }
    try {
        document.getElementById("eWebEditor_VIEW").className = "SB_Mode_BtnOff";
    } catch (e) { }
    try {
        document.getElementById("eWebEditor_" + bZ).className = "SB_Mode_BtnOn";
    } catch (e) { }
    H.aK = bZ;
    ModeEdit.value = bZ;
    setHTML(bC);
    var jv = document.getElementById("eWebEditor_ToolarTR");
    if (bZ == "EDIT") {
        jv.style.display = "";
    } else {
        jv.style.display = "none";
    }
};
function mv(B) {
    if (B) {
        B.disabled = (!H.dn);
        for (var i = 0; i < B.children.length; i++) {
            mv(B.children[i]);
        }
    }
};
function ao(url, oD) {
    if (url.indexOf(".") < 0) {
        url = url + ".htm";
    }
    url = "dialog/" + url;
    url = url.toLowerCase();
    if (oD) {
        if (!di()) {
            return;
        }
    }
    bp();
    if (!I.aF) {
        saveHistory();
    }
    var Q = showModalDialog(url, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
    saveHistory();
    bp();
    cD();
};
function pF() {
    if (!di()) {
        return;
    }
    saveHistory();
    window.open("dialog/fullscreen.htm?style=" + an.StyleName, 'FullScreen' + an.aZ, 'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,fullscreen=yes');
};
function nt() {
    if (!di()) {
        return;
    }
    if (D().selection.type == "Control") {
        var es = D().selection.createRange();
        if (es(0).tagName.toUpperCase() != "IMG") {
            alert(lang["MsgHylnkLimit"]);
            return;
        }
    }
    ao("hyperlink.htm", true);
};
function ez(text) {
    if (text == null) {
        return "";
    }
    text = text.replace(/&/g, "&amp;");
    text = text.replace(/\"/g, "&quot;");
    text = text.replace(/</g, "&lt;");
    text = text.replace(/>/g, "&gt;");
    text = text.replace(/\n/g, "<br>");
    return text;
};
function dT(al) {
    if (!di()) {
        return;
    }
    bp();
    saveHistory();
    var G = D().selection.createRange();
    switch (al) {
        case "nowdate":
            var d = new Date();
            insertHTML(d.toLocaleDateString());
            break;
        case "nowtime":
            var d = new Date();
            insertHTML(d.toLocaleTimeString());
            break;
        case "br":
            insertHTML("<br>");
            break;
        case "code":
            insertHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #CCCCCC; TABLE-LAYOUT: fixed"><tr><td bgcolor=#FDFDDF style="WORD-WRAP: break-word"><font style="color: #990000;font-weight:bold">' + lang["HtmlCode"] + '</font><br>' + ez(G.text) + '</td></tr></table>');
            break;
        case "quote":
            insertHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #CCCCCC; TABLE-LAYOUT: fixed"><tr><td bgcolor=#F3F3F3 style="WORD-WRAP: break-word"><font style="color: #990000;font-weight:bold">' + lang["HtmlQuote"] + '</font><br>' + ez(G.text) + '</td></tr></table>');
            break;
        case "big":
            insertHTML("<big>" + G.text + "</big>");
            break;
        case "small":
            insertHTML("<small>" + G.text + "</small>");
            break;
        case "printbreak":
            insertHTML("<div style=\"FONT-SIZE: 1px; PAGE-BREAK-BEFORE: always; VERTICAL-ALIGN: middle; HEIGHT: 1px; BACKGROUND-COLOR: #c0c0c0\">&nbsp; </div>");
            break;
        default:
            alert(lang["ErrParam"]);
            break;
    }
    G = null;
};
function hN() {
    if (!di()) {
        return;
    }
    var iJ = D().getElementsByTagName("FORM");
    var df = D().body.getElementsByTagName("INPUT");
    var gV = D().body.getElementsByTagName("TABLE");
    var ba = D().body.getElementsByTagName("A");
    for (a = 0; a < iJ.length; a++) {
        if (config.ShowBorder == "0") {
            iJ[a].runtimeStyle.border = "1px dotted #FF0000";
        } else {
            iJ[a].runtimeStyle.cssText = "";
        }
    }
    for (b = 0; b < df.length; b++) {
        if (config.ShowBorder == "0") {
            if (df[b].type.toUpperCase() == "HIDDEN") {
                df[b].runtimeStyle.border = "1px dashed #000000";
                df[b].runtimeStyle.width = "15px";
                df[b].runtimeStyle.height = "15px";
                df[b].runtimeStyle.backgroundColor = "#FDADAD";
                df[b].runtimeStyle.color = "#FDADAD";
            }
        } else {
            if (df[b].type.toUpperCase() == "HIDDEN") {
                df[b].runtimeStyle.cssText = "";
            }
        }
    }
    for (i = 0; i < gV.length; i++) {
        if (config.ShowBorder == "0") {
            gV[i].runtimeStyle.border = "1px dotted #BFBFBF";
        } else {
            gV[i].runtimeStyle.cssText = "";
        }
        aA = gV[i].rows;
        for (y = 0; y < aA.length; y++) {
            er = aA[y].cells;
            for (x = 0; x < er.length; x++) {
                if (config.ShowBorder == "0") {
                    er[x].runtimeStyle.border = "1px dotted #BFBFBF";
                } else {
                    er[x].runtimeStyle.cssText = "";
                }
            }
        }
    }
    for (a = 0; a < ba.length; a++) {
        if (config.ShowBorder == "0") {
            if (ba[a].href.toUpperCase() == "") {
                ba[a].runtimeStyle.borderBottom = "1px dashed #000000";
            }
        } else {
            ba[a].runtimeStyle.cssText = "";
        }
    }
    if (config.ShowBorder == "0") {
        config.ShowBorder = "1";
    } else {
        config.ShowBorder = "0";
    }
    mQ();
};
function mQ() {
    eWebEditor.scrollBy(0, 0);
};
var hE = 100;
var cS = new Array(10, 25, 50, 75, 100, 150, 200, 500);
function gP(size) {
    D().body.runtimeStyle.zoom = size + "%";
    hE = size;
};
function kf() {
    ao('findreplace.htm', true);
};
function mU() {
    var db = null;
    var ib = D().selection.type;
    if (ib != "Control") {
        return;
    }
    var gJ = D().selection.createRange();
    for (var i = 0; i < gJ.length; i++) {
        db = gJ.item(i);
        if (db.style.position != 'relative') {
            db.style.position = 'relative';
        } else {
            db.style.position = 'static';
        }
    }
};
function zIndex(action) {
    var db = null;
    var ib = D().selection.type;
    if (ib != "Control") {
        return;
    }
    var gJ = D().selection.createRange();
    for (var i = 0; i < gJ.length; i++) {
        db = gJ.item(i);
        if (action == 'forward') {
            db.style.zIndex += 1;
        } else {
            db.style.zIndex -= 1;
        }
        db.style.position = 'relative';
    }
};
function iF(bE, attrName, lh) {
    if (bE) {
        var G = D().selection;
        if (G.type == "Control") {
            var aa = G.createRange();
            var nF = aa(0);
            if (nF.tagName.toUpperCase() == bE) {
                if ((attrName) && (lh)) {
                    if (nF.getAttribute(attrName, 2).toLowerCase() == lh.toLowerCase()) {
                        return true;
                    }
                } else {
                    return true;
                }
            }
        }
    }
    return false;
};
function kg(bE) {
    var nF = null;
    if (D().selection.type != "Control") {
        nF = D().selection.createRange().parentElement();
        while (nF.tagName.toUpperCase() != bE) {
            nF = nF.parentElement;
            if (nF == null) {
                break;
            }
        }
    }
    return nF;
};
function fu(size) {
    if (!aq.dA) {
        alert(lang["MsgNotCompatibleFunc"]);
        return false;
    }
    for (var i = 0; i < parent.frames.length; i++) {
        if (parent.frames[i].document == self.document) {
            var B = parent.frames[i].frameElement;
            var height = parseInt(B.offsetHeight);
            if (height + size >= 300) {
                B.height = height + size;
            }
            break;
        }
    }
};
function lp() {
    if (!di()) {
        return;
    }
    saveHistory();
    var b = false;
    if (D().selection.type == "Control") {
        var es = D().selection.createRange();
        if (es(0).tagName.toUpperCase() == "IMG") {
            b = true;
        }
    }
    if (!b) {
        alert(lang["MsgMapLimit"]);
        return;
    }
    window.open("dialog/map.htm", "lp" + an.aZ, "toolbar=no,location=no,directories=no,status=not,menubar=no,scrollbars=no,resizable=yes,width=450,height=300");
};
function mf() {
    if (!di()) {
        return;
    }
    bp();
    if (!hY("P")) {
        alert(lang["MsgNotParagraph"]);
        return;
    }
    ao('paragraph.htm', true);
};
function hY(bE) {
    var G = D().selection.createRange();
    G.type = D().selection.type;
    if (G.type != "Control") {
        var fX = D().body;
        var dg = fX.getElementsByTagName(bE);
        var ap = new Array();
        var aU = fX.createTextRange();
        for (var i = 0; i < dg.length; i++) {
            aU.moveToElementText(dg(i));
            if (G.inRange(aU)) {
                ap[ap.length] = dg[i];
            } else {
                if (((G.compareEndPoints("StartToEnd", aU) < 0) && (G.compareEndPoints("StartToStart", aU) > 0)) || ((G.compareEndPoints("EndToStart", aU) > 0) && (G.compareEndPoints("EndToEnd", aU) < 0))) {
                    ap[ap.length] = dg[i];
                }
            }
        }
        if (ap.length > 0) {
            return true;
        }
    }
    return false;
};
function addUploadFile(oB, oY, ph) {
    is(an.nZ, oB);
    is(an.ob, oY);
    is(an.nY, ph);
};
function is(jY, kb) {
    if (kb == "") {
        return;
    }
    if (jY) {
        var eK = parent.document.getElementsByName(jY)[0];
        if (eK) {
            if (eK.value != "") {
                eK.value = eK.value + "|";
            }
            eK.value = eK.value + kb;
            eK.fireEvent("onchange");
        }
    }
};
function kG(eO, html) {
    eO.value = html;
    var ip = eO.name;
    var oE = eO.form;
    var hU = eO.document;
    var ga = 50000;
    for (var i = 1; i < hU.getElementsByName(ip).length; i++) {
        hU.getElementsByName(ip)[i].value = "";
    }
    if (html.length > ga) {
        eO.value = html.substr(0, ga);
        html = html.substr(ga);
        while (html.length > 0) {
            var iT = hU.createElement("<TEXTAREA NAME='" + ip + "'></TEXTAREA>");
            iT.style.display = "none";
            iT.value = html.substr(0, ga);
            oE.appendChild(iT);
            html = html.substr(ga);
        }
    }
};
var ik;
function remoteUpload(nC) {
    if (config.AutoRemote != "1") {
        return;
    }
    if (H.aK == "TEXT") {
        return;
    }
    ik = nC;
    var eO = document.getElementsByName("eWebEditor_UploadText")[0];
    kG(eO, getHTML());
    kF(lang["MsgRemoteUploading"]);
    eWebEditor_UploadForm.submit();
};
function remoteUploadOK() {
    ah.style.display = "none";
    if (H.aZ) {
        if (ik) {
            eval("parent." + ik);
        }
    }
};
function pk() {
    if (H.aK == "TEXT") {
        return;
    }
    if (!cr(true)) {
        return;
    }
    kF(lang["MsgLocalUploading"]);
    var bN = getHTML();
    O.LocalUpload(bN);
    window.setTimeout("lM()", 100);
};
function lM() {
    if (O.Status != "ok") {
        window.setTimeout("lM()", 100);
        return;
    }
    if (dc()) {
        ah.style.display = "none";
        return;
    }
    var cx = O.OriginalFiles;
    var dP = O.SavedFiles;
    if (cx) {
        var cc = cx.split("|");
        var bb = dP.split("|");
        for (var i = 0; i < cc.length; i++) {
            if (bb[i]) {
                var ei = cc[i];
                var dY = bb[i].substr(bb[i].lastIndexOf("/") + 1);
                var ed = bb[i];
                addUploadFile(ei, dY, ed);
            }
        }
    }
    var bN = O.Body;
    setHTML(bN, true);
    O = null;
    ah.style.display = "none";
};
function kF(gg) {
    nX.innerHTML = gg;
    ah.style.top = (document.body.clientHeight - parseFloat(ah.style.height)) / 2;
    ah.style.left = (document.body.clientWidth - parseFloat(ah.style.width)) / 2;
    ah.style.display = "";
};
var I = new Object;
I.data = [];
I.position = 0;
I.cG = [];
I.aF = false;
function saveHistory() {
    I.aF = true;
    var html = getHTML();
    if (I.data[I.position] != html) {
        var oS = I.data.length;
        var oy = I.data.length - I.position;
        for (var i = 1; i < oy; i++) {
            I.data.pop();
            I.cG.pop();
        }
        I.data[I.data.length] = html;
        if (D().selection.type != "Control") {
            try {
                I.cG[I.cG.length] = D().selection.createRange().getBookmark();
            } catch (e) {
                I.cG[I.cG.length] = "";
            }
        } else {
            var oC = D().selection.createRange();
            var nF = oC.item(0);
            I.cG[I.cG.length] = "[object]|" + nF.tagName + "|" + oG(nF);
        }
        if (oS != 0) {
            I.position++;
        }
    }
};
function oG(nF) {
    var pJ = D().body.getElementsByTagName(nF.tagName);
    for (var i = 0; i < pJ.length; i++) {
        if (pJ[i] == nF) {
            return i;
        }
    }
    return null;
};
function os() {
    I.data.length = 0;
    I.cG.length = 0;
    I.position = 0;
    I.aF = false;
};
function fE(value) {
    if (!I.aF) {
        saveHistory();
    }
    if (value == -1) {
        if (I.position > 0) {
            I.position = I.position - 1;
            setHTML(I.data[I.position], true);
            lo();
        }
    } else {
        if (I.position < I.data.length - 1) {
            I.position = I.position + 1;
            setHTML(I.data[I.position], true);
            lo();
        }
    }
    bp();
    cD();
};
function lo() {
    var iq = I.cG[I.position];
    if (iq) {
        eWebEditor_Layout.focus();
        if (iq.substring(0, 8) != "[object]") {
            r = D().body.createTextRange();
            if (r.moveToBookmark(I.cG[I.position])) {
                r.select();
            }
        } else {
            if (H.aK == "EDIT") {
                r = D().body.createControlRange();
                var a = iq.split("|");
                var pJ = D().body.getElementsByTagName(a[1]);
                var nF = pJ[a[2]];
                r.addElement(nF);
                r.select();
            }
        }
    }
};
function hh() {
    var dQ = "<head>";
    dQ += "<link href='" + H.bV + "/skin/" + config.Skin + "/editorarea.css' type='text/css' rel='stylesheet'>";
    if (config.AreaCssMode != "1") {
        dQ += "<link href='" + H.bV + "/language/" + lang.ad + ".editorarea.css' type='text/css' rel='stylesheet'>";
    }
    switch (H.aK) {
        case "CODE":
            dQ += "<link href='" + H.bV + "/skin/" + config.Skin + "/editorarea." + lang.ad + ".code.css' type='text/css' rel='stylesheet'>";
            break;
        case "TEXT":
            dQ += "<link href='" + H.bV + "/skin/" + config.Skin + "/editorarea." + lang.ad + ".text.css' type='text/css' rel='stylesheet'>";
            break;
        case "EDIT":
        case "VIEW":
            if (config.AreaCssMode != "1") {
                dQ += "<link href='" + H.bV + "/skin/" + config.Skin + "/editorarea." + lang.ad + ".edit.css' type='text/css' rel='stylesheet'>";
            }
            dQ += H.gb;
            break;
    }
    dQ += H.BaseHref + "</head>";
    var cd = "<body>";
    if ((config.FixWidth) && (H.aK != "CODE")) {
        cd = "<body class='eWebEditor_FixWidth_BODY'>";
    }
    return dQ + cd;
};
function getCount(hW) {
    var M = getText();
    M = M.replace(/\n/g, "");
    M = M.replace(/\r/g, "");
    var l = M.length;
    var n = 0;
    for (var i = 0; i < l; i++) {
        if (M.charCodeAt(i) < 0 || M.charCodeAt(i) > 255) {
            if (hW != 0) {
                n++;
                if (hW == 3) {
                    n++;
                }
            }
        } else {
            if (hW != 1) {
                n++;
            }
        }
    }
    return n;
};
function getText() {
    var s = getHTML();
    if (H.aK != "TEXT") {
        eWebEditor_Temp_HTML.innerHTML = s;
        s = eWebEditor_Temp_HTML.innerText;
    }
    return s;
};
function mA() {
    try {
        var nb = new ActiveXObject("ieSpell.ieSpellExtension");
        nb.CheckAllLinkedDocuments(D());
    } catch (exception) {
        if (confirm(lang["MsgIeSpellDownload"])) {
            window.open("http://www.iespell.com/download.php", "IeSpellDownload");
        }
    }
};
var jE, aw, jG, jH, dz;
var bv = new Object();
function pH() {
    jG = "<table border=0 cellpadding=0 cellspacing=0 class='Menu_Box' id=Menu_Box><tr><td class='Menu_Box'><table border=0 cellpadding=0 cellspacing=0 class='Menu_Table'>";
    aw = "<tr><td class='Menu_Sep'><table border=0 cellpadding=0 cellspacing=0 class='Menu_Sep'><tr><td></td></tr></table></td></tr>";
    jH = "</table></td></tr></table>";
    jE = "<head>" + "<link href='" + H.bV + "/language/" + lang.ad + ".css' type='text/css' rel='stylesheet'>" + "<link href='" + H.bV + "/skin/" + config.Skin + "/menuarea.css' type='text/css' rel='stylesheet'>" + "</head>" + "<body scroll='no' onConTextMenu='event.returnValue=false;' ondragstart='event.returnValue=false;' onselectstart='event.returnValue=false;' onselect='event.returnValue=false;'>";
    dz = window.createPopup();
    var bx = dz.document;
    bx.open();
    bx.write(jE);
    bx.close();
};
function da(at, nP, gY, op) {
    var dB = "";
    if (at == "") {
        dB += "<tr><td class='Menu_Item'><table border=0 cellpadding=0 cellspacing=0 width='100%'><tr><td valign=middle class=MouseOut onMouseOver=\"this.className='MouseOver'\" onMouseOut=\"this.className='MouseOut'\" onclick=\"parent." + nP + ";parent.dz.hide();\">";
    } else {
        dB += "<tr><td class='Menu_Item'><table border=0 cellpadding=0 cellspacing=0 width='100%'><tr><td valign=middle class=MouseDisabled>";
    }
    at = (at) ? "_Disabled" : "";
    dB += "<table border=0 cellpadding=0 cellspacing=0><tr><td class=Menu_Image_TD>";
    if (typeof (gY) == "number") {
        var ds = "skin/" + config.Skin + "/buttons.gif";
        var gr = 16 - gY * 16;
        dB += "<div class='Menu_Image" + at + "'><img src='" + ds + "' style='top:" + gr + "px'></div>";
    } else if (gY != "") {
        var ds = "skin/" + config.Skin + "/" + gY;
        dB += "<img class='Menu_Image" + at + "' src='" + ds + "'>";
    }
    dB += "</td><td class='Menu_Label" + at + "'>" + op + "</td></tr></table>";
    dB += "</td></tr></TABLE></td><\/tr>";
    return dB;
};
function F(at, aO, fZ) {
    var cA = Buttons[aO];
    if (!fZ) {
        fZ = lang[aO];
    } else {
        fZ = lang[fZ];
    }
    return da(at, cA[1], cA[0], fZ);
};
function az(aO, cl) {
    var at = "";
    if (!cl) {
        cl = aO;
    }
    if (!D().queryCommandEnabled(cl)) {
        at = "disabled";
    }
    return F(at, aO);
};
function fk(al) {
    var bm = "";
    var at = "disabled";
    switch (al) {
        case "TableInsert":
            if (!hy()) {
                at = "";
            }
            bm += F(at, "TableInsert");
            break;
        case "TableProp":
            if (hy() || bq()) {
                at = "";
            }
            bm += F(at, "TableProp");
            break;
        case "TableCell":
            if (bq()) {
                at = "";
            }
            bm += F(at, "TableCellProp");
            bm += F(at, "TableCellSplit");
            bm += aw;
            bm += F(at, "TableRowProp");
            bm += F(at, "TableRowInsertAbove");
            bm += F(at, "TableRowInsertBelow");
            bm += F(at, "TableRowMerge");
            bm += F(at, "TableRowSplit");
            bm += F(at, "TableRowDelete");
            bm += aw;
            bm += F(at, "TableColInsertLeft");
            bm += F(at, "TableColInsertRight");
            bm += F(at, "TableColMerge");
            bm += F(at, "TableColSplit");
            bm += F(at, "TableColDelete");
            break;
    }
    return bm;
};
function mO(event) {
    if (!H.dn) {
        return false;
    }
    var C = "";
    C += az("Cut");
    C += az("Copy");
    C += F("", "Paste");
    C += az("Delete");
    C += az("SelectAll");
    C += aw;
    if (bq()) {
        C += fk("TableProp");
        C += fk("TableCell");
        C += aw;
    }
    if (iF("TABLE")) {
        C += fk("TableProp");
        C += aw;
    }
    if (iF("IMG")) {
        C += F("", "Image", "CMenuImg");
        C += aw;
        C += F("", "zIndexForward");
        C += F("", "zIndexBackward");
        C += aw;
    }
    if (iF("OBJECT", "classid", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000")) {
        C += F("", "Flash", "CMenuFlash");
        C += aw;
    }
    if (hY("P")) {
        C += F("", "ParagraphAttr", "CMenuParagraph");
        C += aw;
    }
    C += F("", "FindReplace");
    bv.x = event.clientX;
    bv.y = event.clientY;
    bv.ew = 0;
    bv.html = C;
    bv.rel = D().body;
    bv.show();
    return false;
};
function bD(menu) {
    if (!H.dn) return false;
    bp();
    var C = "";
    switch (menu) {
        case "font":
            C += az("Bold");
            C += az("Italic");
            C += az("UnderLine");
            C += az("StrikeThrough");
            C += aw;
            C += az("SuperScript");
            C += az("SubScript");
            C += aw;
            C += F("", "UpperCase");
            C += F("", "LowerCase");
            C += aw;
            C += F("", "ForeColor");
            C += F("", "BackColor");
            C += aw;
            C += F("", "Big");
            C += F("", "Small");
            break;
        case "paragraph":
            C += az("JustifyLeft");
            C += az("JustifyCenter");
            C += az("JustifyRight");
            C += az("JustifyFull");
            C += aw;
            C += az("OrderedList", "insertorderedlist");
            C += az("UnOrderedList", "insertunorderedlist");
            C += az("Indent");
            C += az("Outdent");
            C += aw;
            C += az("Paragraph", "insertparagraph");
            C += F("", "BR");
            C += aw;
            C += F((hY("P")) ? "" : "disabled", "ParagraphAttr", "CMenuParagraph");
            break;
        case "edit":
            var at = "";
            if (I.data.length <= 1 || I.position <= 0) {
                at = "disabled";
            }
            C += F(at, "UnDo");
            if (I.position >= I.data.length - 1 || I.data.length == 0) at = "disabled";
            C += F(at, "ReDo");
            C += aw;
            C += az("Cut");
            C += az("Copy");
            C += F("", "Paste");
            C += F("", "PasteText");
            C += F("", "PasteWord");
            C += aw;
            C += az("Delete");
            C += az("RemoveFormat");
            C += aw;
            C += az("SelectAll");
            C += az("UnSelect");
            C += aw;
            C += F("", "FindReplace");
            C += F("", "QuickFormat");
            break;
        case "object":
            C += F("", "BgColor");
            C += F("", "BackImage");
            C += aw;
            C += F("", "absolutePosition");
            C += F("", "zIndexForward");
            C += F("", "zIndexBackward");
            C += aw;
            C += F("", "ShowBorders");
            C += aw;
            C += F("", "Quote");
            C += F("", "Code");
            break;
        case "component":
            C += F("", "Image");
            C += F("", "Flash");
            C += F("", "Media");
            C += F("", "File");
            C += aw;
            C += F("", "RemoteUpload");
            C += F("", "LocalUpload");
            C += aw;
            C += F("", "Fieldset");
            C += F("", "Iframe");
            C += az("HorizontalRule", "InsertHorizontalRule");
            C += F("", "Marquee");
            C += aw;
            C += F("", "CreateLink");
            C += F("", "Anchor");
            C += F("", "Map");
            C += az("Unlink");
            break;
        case "tool":
            C += F("", "Template");
            C += F("", "Symbol");
            C += F("", "Excel");
            C += F("", "Emot");
            C += aw;
            C += F("", "EQ");
            C += F("", "Art");
            C += aw;
            C += F("", "NowDate");
            C += F("", "NowTime");
            C += aw;
            C += F("", "ImportWord");
            C += F("", "ImportExcel");
            C += F("", "Capture");
            break;
        case "file":
            C += F("", "Refresh");
            C += aw;
            C += F("", "ModeCode");
            C += F("", "ModeEdit");
            C += F("", "ModeText");
            C += F("", "ModeView");
            C += aw;
            C += F("", "SizePlus");
            C += F("", "SizeMinus");
            C += aw;
            C += F("", "Print");
            C += aw;
            C += F("", "About");
            C += F("", "Site");
            height = 208;
            break;
        case "table":
            C += fk("TableInsert");
            C += fk("TableProp");
            C += aw;
            C += fk("TableCell");
            break;
        case "form":
            C += az("FormText", "InsertInputText");
            C += az("FormTextArea", "InsertTextArea");
            C += az("FormRadio", "InsertInputRadio");
            C += az("FormCheckbox", "InsertInputCheckbox");
            C += az("FormDropdown", "InsertSelectDropdown");
            C += az("FormButton", "InsertButton");
            break;
        case "gallery":
            C += F("", "GalleryImage");
            C += F("", "GalleryFlash");
            C += F("", "GalleryMedia");
            C += F("", "GalleryFile");
            break;
        case "zoom":
            for (var i = 0; i < cS.length; i++) {
                if (cS[i] == hE) {
                    C += da("", "gP(" + cS[i] + ")", 120, cS[i] + "%");
                } else {
                    C += da("", "gP(" + cS[i] + ")", 119, cS[i] + "%");
                }
            }
            break;
        case "fontsize":
            var v = nr();
            for (var i = 0; i < lang["FontSizeItem"].length; i++) {
                if (lang["FontSizeItem"][i][0] == v) {
                    C += da("", "eG('size','" + lang["FontSizeItem"][i][0] + "')", 120, lang["FontSizeItem"][i][1]);
                } else {
                    C += da("", "eG('size','" + lang["FontSizeItem"][i][0] + "')", 119, lang["FontSizeItem"][i][1]);
                }
            }
            break;
        case "fontname":
            var v = D().queryCommandValue("FontName");
            for (var i = 0; i < lang["FontNameItem"].length; i++) {
                if (lang["FontNameItem"][i] == v) {
                    C += da("", "eG('face','" + lang["FontNameItem"][i] + "')", 120, lang["FontNameItem"][i]);
                } else {
                    C += da("", "eG('face','" + lang["FontNameItem"][i] + "')", 119, lang["FontNameItem"][i]);
                }
            }
            break;
        case "formatblock":
            var v = D().queryCommandValue("FormatBlock");
            if (v) {
                v = v.toLowerCase();
            } else {
                v = "";
            }
            for (var i = 0; i < lang["FormatBlockItem"].length; i++) {
                if (lang["FormatBlockItem"][i][0].toLowerCase() == v) {
                    C += da("", "au('FormatBlock','" + lang["FormatBlockItem"][i][0] + "')", 120, lang["FormatBlockItem"][i][1]);
                } else {
                    C += da("", "au('FormatBlock','" + lang["FormatBlockItem"][i][0] + "')", 119, lang["FormatBlockItem"][i][1]);
                }
            }
            break;
    }
    var e = event.srcElement;
    var x = event.clientX - event.offsetX;
    var y = event.clientY - event.offsetY;
    if (e.style.top) {
        y = y - parseInt(e.style.top);
    }
    if (e.tagName.toLowerCase() == "img") {
        e = e.parentNode;
        x = x - e.offsetLeft - e.clientLeft;
        y = y - e.offsetTop - e.clientTop;
    }
    if (e.className == "TB_Btn_Image") {
        e = e.parentNode;
        x = x - e.offsetLeft - e.clientLeft;
        y = y - e.offsetTop - e.clientTop;
    }
    y = y + e.offsetHeight;
    var ew = parseInt(e.offsetWidth);
    bv.x = x;
    bv.y = y;
    bv.ew = ew;
    bv.html = C;
    bv.rel = document.body;
    bv.show();
    bp();
    return false;
};
bv.show = function() {
    var bx = dz.document;
    bx.body.innerHTML = jG + this.html + jH;
    dz.show(0, 0, 0, 0, this.rel);
    this.kZ();
};
bv.kZ = function() {
    var lG = dz.document;
    if (!this.nk()) {
        window.setTimeout("bv.kZ()", 50);
        return;
    }
    var w = lG.body.scrollWidth;
    var h = lG.body.scrollHeight;
    if (this.x + w > document.body.clientWidth) {
        this.x = this.x - w + this.ew;
    }
    dz.show(this.x, this.y, w, h, this.rel);
};
bv.nk = function() {
    var bx = dz.document;
    if (bx.readyState != "complete" && bx.readyState != "interactive") {
        return false;
    }
    if (bx.images) {
        for (var i = 0; i < bx.images.length; i++) {
            var img = bx.images[i];
            if (img.readyState != "complete") {
                return false;
            }
        }
    }
    return true;
};
function nr() {
    var v = "";
    if (D().selection.type != "Control") {
        var G = D().selection.createRange();
        var aU = D().body.createTextRange();
        var nF = G.parentElement();
        v = nF.style.fontSize;
        var pJ = nF.childNodes;
        for (var i = 0; i < pJ.length; i++) {
            if (pJ[i].nodeType == 1) {
                aU.moveToElementText(pJ[i]);
                if (((G.compareEndPoints("StartToEnd", aU) < 0) && (G.compareEndPoints("StartToStart", aU) > 0)) || ((G.compareEndPoints("EndToStart", aU) > 0) && (G.compareEndPoints("EndToEnd", aU) < 0))) {
                    if (pJ[i].style.fontSize != v) {
                        v = "";
                        break;
                    }
                }
            }
        }
    }
    return v;
};
var aI;
var aL;
var jJ;
var bQ;
function nA() {
    if (!hy()) {
        ao('table.htm', true);
    }
};
function nB() {
    if (hy() || bq()) {
        ao('table.htm?action=modify', true);
    }
};
function mB() {
    if (bq()) {
        ao('tablecell.htm', true);
    }
};
function mK() {
    if (bq()) {
        ao('tablecellsplit.htm', true);
    }
};
function nJ() {
    if (bq()) {
        ao('tablecell.htm?action=row', true);
    }
};
function nv() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var cN = 0;
    cb = aL.cells;
    for (var i = 0; i < cb.length; i++) {
        cN = cN + cb[i].getAttribute('colSpan');
    }
    var gp = bQ.insertRow(aL.rowIndex);
    for (i = 0; i < cN; i++) {
        bW = gp.insertCell();
        bW.innerHTML = "&nbsp;";
        if (config.ShowBorder == "yes") {
            bW.runtimeStyle.border = "1px dotted #BFBFBF";
        }
    }
    saveHistory();
};
function ny() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var cN = 0;
    cb = aL.cells;
    for (var i = 0; i < cb.length; i++) {
        cN = cN + cb[i].getAttribute('colSpan');
    }
    var gp = bQ.insertRow(aL.rowIndex + 1);
    for (i = 0; i < cN; i++) {
        bW = gp.insertCell();
        bW.innerHTML = "&nbsp;";
        if (config.ShowBorder == "yes") {
            bW.runtimeStyle.border = "1px dotted #BFBFBF";
        }
    }
    saveHistory();
};
function nI() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var qh = aI.getAttribute('rowSpan');
    aA = bQ.rows;
    if (aL.rowIndex + 1 != aA.length) {
        var mn = aA[aL.rowIndex + aI.rowSpan].cells;
        var iB = mn[aI.cellIndex].getAttribute('rowSpan');
        var moveTo = aI.rowSpan;
        if (!iB) iB = 1;
        aI.rowSpan = aI.rowSpan + iB;
        aA[aL.rowIndex + moveTo].deleteCell(aI.cellIndex);
    }
    saveHistory();
};
function nD(ls) {
    if (!bq()) {
        return;
    }
    if (ls < 2) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var mh = ls - 1;
    var iz = mh;
    var gl = 0;
    for (var i = 0; i < aI.cellIndex; i++) {
        gl += aL.cells[i].colSpan;
    }
    var aA = bQ.rows;
    while (aI.rowSpan > 1 && iz > 0) {
        var ii = aA[aL.rowIndex + aI.rowSpan - 1];
        aI.rowSpan -= 1;
        var gv = 0;
        var position = -1;
        for (var n = 0; n < ii.cells.length; n++) {
            gv += ii.cells[n].getAttribute('colSpan');
            if (gv > gl) {
                position = n;
                break;
            }
        }
        var bW = ii.insertCell(position);
        bW.innerHTML = "&nbsp;";
        if (config.ShowBorder == "yes") {
            bW.runtimeStyle.border = "1px dotted #BFBFBF";
        }
        iz -= 1;
    }
    for (var n = 0; n < iz; n++) {
        var cN = 0;
        cb = aL.cells;
        for (var i = 0; i < cb.length; i++) {
            cN = cN + cb[i].getAttribute('colSpan');
        }
        var gp = bQ.insertRow(aL.rowIndex + 1);
        for (var j = 0; j < aL.rowIndex; j++) {
            for (var k = 0; k < aA[j].cells.length; k++) {
                if ((aA[j].cells[k].rowSpan > 1) && (aA[j].cells[k].rowSpan >= aL.rowIndex - aA[j].rowIndex + 1)) {
                    aA[j].cells[k].rowSpan += 1;
                }
            }
        }
        for (i = 0; i < cb.length; i++) {
            if (i != aI.cellIndex) {
                aL.cells[i].rowSpan += 1;
            } else {
                bW = gp.insertCell();
                bW.colSpan = aI.colSpan;
                bW.innerHTML = "&nbsp;";
                if (config.ShowBorder == "yes") {
                    bW.runtimeStyle.border = "1px dotted #BFBFBF";
                }
            }
        }
    }
    saveHistory();
};
function nz() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    bQ.deleteRow(aL.rowIndex);
    saveHistory();
};
function mN() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    gf = (aL.cells.length - 1) - (aI.cellIndex);
    aA = bQ.rows;
    for (i = 0; i < aA.length; i++) {
        hM = aA[i].cells.length - 1;
        position = hM - gf;
        if (position < 0) {
            position = 0;
        }
        bK = aA[i].insertCell(position);
        bK.innerHTML = "&nbsp;";
        if (config.ShowBorder == "yes") {
            bK.runtimeStyle.border = "1px dotted #BFBFBF";
        }
    }
    saveHistory();
};
function mJ() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    gf = (aL.cells.length - 1) - (aI.cellIndex);
    aA = bQ.rows;
    for (i = 0; i < aA.length; i++) {
        hM = aA[i].cells.length - 1;
        position = hM - gf;
        if (position < 0) {
            position = 0;
        }
        bK = aA[i].insertCell(position + 1);
        bK.innerHTML = "&nbsp;";
        if (config.ShowBorder == "yes") {
            bK.runtimeStyle.border = "1px dotted #BFBFBF";
        }
    }
    saveHistory();
};
function mG() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var pR = aI.getAttribute('colSpan');
    cb = aL.cells;
    if (aI.cellIndex + 1 != aL.cells.length) {
        var mw = cb[aI.cellIndex + 1].getAttribute('colSpan');
        aI.colSpan = pR + mw;
        aL.deleteCell(aI.cellIndex + 1);
    }
    saveHistory();
};
function mL() {
    if (!bq()) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    gf = (aL.cells.length - 1) - (aI.cellIndex);
    aA = bQ.rows;
    for (var i = 0; i < aA.length; i++) {
        py = aA[i].cells.length - 1;
        position = py - gf;
        if (position < 0) {
            position = 0;
        }
        er = aA[i].cells;
        if (er[position].colSpan > 1) {
            er[position].colSpan = er[position].colSpan - 1;
        } else {
            aA[i].deleteCell(position);
        }
    }
    saveHistory();
};
function mH(lJ) {
    if (!bq()) {
        return;
    }
    if (lJ < 2) {
        return;
    }
    if (!I.aF) {
        saveHistory();
    }
    var my = lJ - 1;
    var gX = my;
    var bK;
    var gl = 0;
    var hH = 0;
    for (var i = 0; i < aI.cellIndex; i++) {
        gl += aL.cells[i].colSpan;
        if (aL.cells[i].rowSpan > 1) {
            hH += 1;
        }
    }
    var aA = bQ.rows;
    while (aI.colSpan > 1 && gX > 0) {
        bK = aL.insertCell(aI.cellIndex + 1);
        bK.innerHTML = "&nbsp;";
        if (config.ShowBorder == "yes") {
            bK.runtimeStyle.border = "1px dotted #BFBFBF";
        }
        aI.colSpan -= 1;
        gX -= 1;
    }
    for (i = 0; i < aA.length; i++) {
        var gv = 0;
        var position = -1;
        for (var n = 0; n < aA[i].cells.length; n++) {
            gv += aA[i].cells[n].getAttribute('colSpan');
            if (gv + hH > gl) {
                position = n;
                break;
            }
        }
        if (aL.rowIndex != i) {
            if (position != -1) {
                aA[i].cells[position + hH].colSpan += gX;
            }
        } else {
            for (var n = 0; n < gX; n++) {
                bK = aA[i].insertCell(aI.cellIndex + 1);
                bK.innerHTML = "&nbsp;";
                bK.rowSpan = aI.rowSpan;
                if (config.ShowBorder == "yes") {
                    bK.runtimeStyle.border = "1px dotted #BFBFBF";
                }
            }
        }
    }
    saveHistory();
};
function hy() {
    if (D().selection.type == "Control") {
        var es = D().selection.createRange();
        if (es(0).tagName.toUpperCase() == "TABLE") {
            bQ = D().selection.createRange()(0);
            return true;
        }
    }
    return false;
};
function bq() {
    if (D().selection.type != "Control") {
        var nF = D().selection.createRange().parentElement();
        while (nF.tagName.toUpperCase() != "TD" && nF.tagName.toUpperCase() != "TH") {
            nF = nF.parentElement;
            if (nF == null) {
                break;
            }
        }
        if (nF) {
            aI = nF;
            aL = aI.parentElement;
            jJ = aL.parentElement;
            bQ = jJ.parentElement;
            return true;
        }
    }
    return false;
};
function nG(url) {
    if (url.indexOf("://") >= 0) {
        return url;
    }
    if (url.substr(0, 1) == "/") {
        return url;
    }
    var gL = H.bV;
    while (url.substr(0, 3) == "../") {
        url = url.substr(3);
        gL = gL.substring(0, gL.lastIndexOf("/"));
    }
    return gL + "/" + url;
};
function fR(url) {
    document.write('<scr' + 'ipt type="text/javascript" src="' + url + '" onerror="alert(\'Error loading \' + this.src);"><\/scr' + 'ipt>');
};
function mE() {
    if (!config.L) {
        //document.write("<table style='width:100%;height:100%;border-collapse:collapse' borderColor=#999999 bgColor=#ffffff border=1><tr><td align=center style='font-size:9pt'>eWebEditor!<br><br>" + lang["ErrLicense"] + "</td></tr></table>");
        //return;
    }
    document.write("<table id=eWebEditor_Layout border=0 cellpadding=0 cellspacing=0 width='100%' height='100%'>");
    document.write("<tr id='eWebEditor_ToolarTR' style='display:none'><td>");
    mF();
    document.write("</td></tr>");
    document.write("<tr><td height='100%'>");
    document.write("	<input type='hidden' ID='ContentEdit' value=''>");
    document.write("	<input type='hidden' ID='ModeEdit' value=''>");
    document.write("	<input type='hidden' ID='ContentLoad' value=''>");
    document.write("	<input type='hidden' ID='ContentFlag' value='0'>");
    document.write("	<iframe class='Composition' ID='eWebEditor' style='width:100%;height:100%' marginwidth=1 marginheight=1 scrolling='yes' frameborder='0' src='" + config.HttpBlankUrl + "'></iframe>");
    document.write("</td></tr>");
    if (config.StateFlag) {
        document.write("<tr><td class=SB>");
        document.write("	<TABLE border='0' cellPadding='0' cellSpacing='0' width='100%' class=SB>");
        document.write("	<TR valign=middle>");
        document.write("	<td>");
        document.write("		<table border=0 cellpadding=0 cellspacing=0 class=SB_Mode>");
        document.write("		<tr>");
        document.write("		<td class=SB_Mode_Left></td>");
        if (config.SBCode) {
            document.write("		<td class=SB_Mode_BtnOff id=eWebEditor_CODE onclick=\"setMode('CODE')\" unselectable=on><table border=0 cellpadding=0 cellspacing=0><tr><td class=SB_Mode_Btn_Img>" + fH("ModeCode") + "</td><td class=SB_Mode_Btn_Text>" + lang["StatusModeCode"] + "</td></tr></table></td>");
            document.write("		<td class=SB_Mode_Sep></td>");
        }
        if (config.SBEdit) {
            document.write("		<td class=SB_Mode_BtnOff id=eWebEditor_EDIT onclick=\"setMode('EDIT')\" unselectable=on><table border=0 cellpadding=0 cellspacing=0><tr><td class=SB_Mode_Btn_Img>" + fH("ModeEdit") + "</td><td class=SB_Mode_Btn_Text>" + lang["StatusModeEdit"] + "</td></tr></table></td>");
            document.write("		<td class=SB_Mode_Sep></td>");
        }
        if (config.SBText) {
            document.write("		<td class=SB_Mode_BtnOff id=eWebEditor_TEXT onclick=\"setMode('TEXT')\" unselectable=on><table border=0 cellpadding=0 cellspacing=0><tr><td class=SB_Mode_Btn_Img>" + fH("ModeText") + "</td><td class=SB_Mode_Btn_Text>" + lang["StatusModeText"] + "</td></tr></table></td>");
            document.write("		<td class=SB_Mode_Sep></td>");
        }
        if (config.SBView) {
            document.write("		<td class=SB_Mode_BtnOff id=eWebEditor_VIEW onclick=\"setMode('VIEW')\" unselectable=on><table border=0 cellpadding=0 cellspacing=0><tr><td class=SB_Mode_Btn_Img>" + fH("ModeView") + "</td><td class=SB_Mode_Btn_Text>" + lang["StatusModeView"] + "</td></tr></table></td>");
        }
        document.write("		</tr>");
        document.write("		</table>");
        document.write("	</td>");
        if (an.FullScreen != "1") {
            document.write("	<td align=right>");
            document.write("		<table border=0 cellpadding=0 cellspacing=0 class=SB_Size>");
            document.write("		<tr>");
            document.write("		<td class=SB_Size_Btn onclick='fu(300)' title='" + lang["SizePlus"] + "'>" + fH("SizePlus") + "</td>");
            document.write("		<td class=SB_Size_Sep></td>");
            document.write("		<td class=SB_Size_Btn onclick='fu(-300)' title='" + lang["SizeMinus"] + "'>" + fH("SizeMinus") + "</td>");
            document.write("		<td class=SB_Size_Right></td>");
            document.write("		</tr>");
            document.write("		</table>");
            document.write("	</td>");
        }
        document.write("	</TR>");
        document.write("	</Table>");
        document.write("</td></tr>");
    }
    document.write("</table>");
    document.write("<div id='eWebEditor_Temp_HTML' style='visibility:hidden;overflow:hidden;position:absolute;width:1px;height:1px'></div>");
    document.write("<div style='position:absolute;display:none'>");
    document.write("<form id='eWebEditor_UploadForm' action='" + config.ServerExt + "/upload." + config.ServerExt + "?action=remote&type=remote&style=" + an.StyleName + "&language=" + lang.ad + "&cusdir=" + an.CusDir + "' method='post' target='eWebEditor_UploadTarget'>");
    document.write("<input type='hidden' name='eWebEditor_UploadText'>");
    document.write("</form>");
    document.write("<iframe name='eWebEditor_UploadTarget' width=0 height=0 src='" + config.HttpBlankUrl + "'></iframe>");
    document.write("</div>");
    document.write("<div id=ah style='width:200px;height:30px;position:absolute;display:none'>");
    document.write("<table border=0 cellpadding=0 cellspacing=1 bgcolor='#000000' width='100%' height='100%'><tr><td bgcolor=#3A6EA5><marquee id='nX' align='middle' behavior='alternate' scrollamount='5' style='font-size:9pt;color:#ffffff'></marquee></td></tr></table>");
    document.write("</div>");
};
function mF() {
    var result = "<table border=0 cellpadding=0 cellspacing=0 width='100%' id='eWebEditor_Toolbar' unselectable>";
    for (var i = 0; i < config.Toolbars.length; i++) {
        result += "<tr><td class=TB_Left></td><td class=TB_Center><table border=0 cellpadding=0 cellspacing=0><tr>";
        var tb = config.Toolbars[i];
        for (var j = 0; j < tb.length; j++) {
            var aO = tb[j];
            if ((aO == "Maximize") && (an.FullScreen == "1")) {
                aO = "Minimize";
            }
            var cA = Buttons[aO];
            if (aO == "TBSep") {
                result += "<td class=TB_Btn_Padding><div class='TB_Sep'></div></td>";
            } else if (cA[3] == 0) {
                result += "<td class=TB_Btn_Padding><div class='TB_Btn' name='TB_Name_" + aO + "' title=\"" + lang[aO] + "\" onclick=\"" + cA[1] + "\">";
                if (typeof (cA[0]) == "number") {
                    var ds = "skin/" + config.Skin + "/buttons.gif";
                    var gr = 16 - cA[0] * 16;
                    result += "<div class='TB_Btn_Image'><img src='" + ds + "' style='top:" + gr + "px'></div>";
                } else {
                    var ds = "skin/" + config.Skin + "/" + cA[0];
                    result += "<img class='TB_Btn_Image' src='" + ds + "'>";
                }
                result += "</div></td>";
            } else if (cA[3] == 1) {
                var gh = "";
                var dO = "";
                switch (aO) {
                    case "FontName":
                        gh = " style='width:115px'";
                        for (var k = 0; k < lang[aO + "Item"].length; k++) {
                            dO += "<option value='" + lang[aO + "Item"][k] + "'>" + lang[aO + "Item"][k] + "</option>";
                        }
                        break;
                    case "FontSize":
                        gh = " style='width:55px'";
                        for (var k = 0; k < lang[aO + "Item"].length; k++) {
                            dO += "<option value='" + lang[aO + "Item"][k][0] + "'>" + lang[aO + "Item"][k][1] + "</option>";
                        }
                        break;
                    case "FormatBlock":
                        gh = " style='width:90px'";
                        for (var k = 0; k < lang[aO + "Item"].length; k++) {
                            dO += "<option value='" + lang[aO + "Item"][k][0] + "'>" + lang[aO + "Item"][k][1] + "</option>";
                        }
                        break;
                    case "ZoomSelect":
                        gh = " style='width:55px'";
                        for (var k = 0; k < cS.length; k++) {
                            dO += "<option value='" + cS[k] + "'>" + cS[k] + "%</option>";
                        }
                        break;
                }
                result += "<td class=TB_Btn_Padding><select name='TB_Name_" + aO + "' onchange=\"" + cA[1] + "\" size=1 " + gh + "><option selected>" + lang[aO] + "</option>" + dO + "</select></td>";
            }
        }
        result += "</tr></table></td><td class=TB_Right></td></tr>";
    }
    result += "</table>";
    document.write(result);
};
function fH(aO, qc) {
    var ni = Buttons[aO];
    var gr = 16 - ni[0] * 16;
    var ds = "skin/" + config.Skin + "/buttons.gif";
    return "<div><img src='" + ds + "' style='top:" + gr + "px'></div>";
};
function bp() {
    if ((H.aK != "CODE") && (config.FixWidth)) {
        if (document.activeElement.id != "eWebEditor") {
            eWebEditor.focus();
        }
        try {
            var aa = D().selection.createRange();
            if (aa.parentElement().tagName == "BODY") {
                D().getElementById("eWebEditor_FixWidth_DIV").focus();
            } else {
                aa.select();
            }
        } catch (e) { }
    } else {
        eWebEditor.focus();
    }
};
var O;
config.kx = 2201;
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
        ao("installactivex.htm", true);
    }
    return b;
};
function dc() {
    var ci = O.Error;
    alert(ci);
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