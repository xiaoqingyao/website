//弹出窗口脚本
Function.prototype.bind = function(obj) {
    var t = this;
    return function() {
        return t.apply(obj, arguments);
    }
};
function bluebirdWindow() { }
bluebirdWindow.prototype = {
    divX: 0,
    divY: 0,
    mouseX: 0,
    mouseY: 0,
    zindex: 0,
    isMove: false,
    isBlock: true,
    w_window: null,
    canClose: true,
    w_title: '系统窗口',
    contentDivCss: 'w_content',
    init: function() {
        var w_window = $C('div', { 'class': 'bluebirdWindow' });
        this.w_window = w_window;
        if (true == this.canClose) {
            this.closeImg = $C('div', { 'class': 'closeimg' });
            switchEffect(this.closeImg, 'closeimg_over');
            eve.observe(this.closeImg, 'click', this.closeWindow, this);
            w_window.appendChild($C('div', { 'class': 'closediv' }, this.closeImg));
        }
        this.w_window.appendChild(this.createHtml());
        this.contentDiv.style.width = this.w_width + 'px';
        //this.w_window.style.top=document.documentElement.scrollTop+200+'px';
        this.w_window.style.top = document.documentElement.clientHeight / 4 + 'px';
        //alert(document.documentElement.clientHeight);
        //this.w_window.style.top=document.body.clientHeight*3+'px';
        this.w_window.style.left = '-1000px';
        this.w_window.style.zIndex = bluebirdWindow.prototype.zindex++;
        if (true == this.isBlock) {
            this.block = $C('div', { 'class': 'shadow' });
            this.block.style.height = document.body.offsetHeight + 'px';
            parent.document.body.appendChild(this.block);
        }
        parent.document.body.appendChild(this.w_window);
        var w_width = this.w_width || this.w_window.clientWidth;
        this.w_window.style.left = parseInt((parent.document.body.clientWidth - w_width) / 2) + 'px';
        //this.w_window.style.top=parseInt((parent.document.body.clientHeight-w_height)/2)+'px';
        if (true == this.canClose) {//如果这个窗口可以移动,加入可移动事件
            eve.observe(this.w_window.getElementsByTagName('td')[1], 'mousedown', this.initDrag, this);
            eve.observe(this.w_window, 'mousedown', this.checkIstop, this);
        }
    },
    createHtml: function() {
        this.contentDiv = $C('div', { 'class': this.contentDivCss }, this.innerDiv);
        return $C('table', { 'cellPadding': '0', 'cellSpacing': '0' }, $C('tbody', {}, $C('tr', {}, $C('td', { 'class': 'w_all' }, $C('img', { 'src': 'images/window/lt_corner.gif' })), $C('td', { 'class': 'w_all t_bg' + ((this.canClose) ? ' move' : '') }, $C('div', { 'class': 'w_title' }, this.w_title)), $C('td', { 'class': 'w_all' }, $C('img', { 'src': 'images/window/rt_corner.gif' }))), $C('tr', {}, $C('td', { 'class': 'w_all l_bg' }), $C('td', { 'class': 'w_center' }, this.contentDiv), $C('td', { 'class': 'w_all r_bg' })), $C('tr', {}, $C('td', { 'class': 'w_all lrb_corner' }), $C('td', { 'class': 'w_all b_bg' }), $C('td', { 'class': 'w_all lrb_corner moveposition' }))));
    },
    closeWindow: function() {
        eve.stopObserve(this.w_window.getElementsByTagName('td')[1], 'mousedown', this.initDrag);
        removeDom(this.w_window);
        if (true == this.isBlock) removeDom(this.block);
        for (var m in this) this[m] = null;
    },
    checkIstop: function() {
        if (parseInt(this.w_window.style.zIndex) + 1 != bluebirdWindow.prototype.zindex) this.w_window.style.zIndex = bluebirdWindow.prototype.zindex++; //如果不是最顶层,置顶
    },
    initDrag: function(e) {
        if (true == this.isMove) return;
        this.isMove = true;
        var divPosition = this.getPosition(this.w_window);
        this.divX = divPosition[1];
        this.divY = divPosition[0];
        this.mouseX = e.clientX;
        this.mouseY = e.clientY;
        eve.observe(parent.document.body, 'mousemove', this.drag, this);
        eve.observe(parent.document.body, 'mouseup', this.stopDrag, this);
    },
    drag: function(e) {
        var mx = e.clientX - this.mouseX;
        var my = e.clientY - this.mouseY;
        this.w_window.style.left = this.divX + mx + 'px';
        this.w_window.style.top = this.divY + my + 'px';
        this.divX += mx;
        this.divY += my;
        this.mouseX += mx;
        this.mouseY += my;
    },
    stopDrag: function() {
        eve.stopObserve(parent.document.body, 'mousemove', this.drag, this);
        eve.stopObserve(parent.document.body, 'mouseup', this.stopDrag, this);
        this.isMove = false;
    },
    getPosition: function(obj) {
        return [obj.offsetTop, obj.offsetLeft];
    }
};
var PopDialog = new Object();
PopDialog.warn = function(str, cssName, titlestr, w_width) {
    var frame = new bluebirdWindow();
    frame.w_width = w_width;
    frame.w_title = titlestr;
    frame.innerDiv = $C('table', { 'width': '100%' }, $C('tbody', {}, $C('tr', {}, $C('td', { 'class': 'w_imgtd ' + cssName }, str)), $C('tr', {}, $C('td', { 'class': 'cen' }, this.createButton('确定', frame.closeWindow.bind(frame), emptyFunc, frame)))));
    frame.init();
}
PopDialog.alert = function(str, w_width) {
    this.warn(str, 'w_alert', '系统提示', w_width || 300);
}
PopDialog.error = function(str, w_width) {
    this.warn(str, 'w_error', '出错了', w_width || 300);
}
PopDialog.ok = function(str, w_width) {
    this.warn(str, 'w_ok', '成功了', w_width || 300);
}
PopDialog.info = function(str, w_width) {
    this.warn(str, 'w_info', '系统消息', w_width || 300);
}
PopDialog.confirm = function(str, btnObj, w_width) {
    var btnTd = $C('td', { 'class': 'cen' });
    var frame = new bluebirdWindow();
    for (var btn in btnObj)
        btnTd.appendChild(this.createButton(btn, btnObj[btn], frame.closeWindow.bind(frame)));
    frame.w_width = w_width || 400;
    frame.w_title = '网页对话框';
    frame.innerDiv = $C('table', { 'width': '100%' }, $C('tbody', {}, $C('tr', {}, $C('td', { 'class': 'w_imgtd w_confirm' }, str)), $C('tr', {}, btnTd)));
    frame.init();
}
PopDialog.createButton = function(val, act, closeAct) {
    var btn = $C('input', { 'class': 'btn', 'type': 'button', 'value': val });
    eve.observe(btn, 'click', act);
    eve.observe(btn, 'click', closeAct);
    switchEffect(btn, 'btn_over');
    return btn;
}
PopDialog.html = function(inHtml, w_title, w_width, c_css, userCloseFunc) {//userCloseFunc 自定义关闭事件
    var frame = new bluebirdWindow();
    frame.w_width = w_width || 500;
    frame.isBlock = false;
    frame.w_title = w_title || '系统窗口';
    frame.contentDivCss = c_css || 'w_content';
    //if(closeFunc)frame.closeWindow=userCloseFunc;
    frame.innerDiv = $C('table', { 'width': '100%' }, $C('tbody', {}, $C('tr', {}, $C('td', {}, inHtml))));
    frame.init();
    if (true == userCloseFunc)
        return frame;
    else
        return frame.closeWindow.bind(frame);
}
PopDialog.staticHtml = function(inHtml, w_title, w_width) {
    var frame = new bluebirdWindow();
    frame.w_width = w_width || 500;
    frame.w_title = w_title || '系统窗口';
    frame.canClose = false;
    frame.innerDiv = $C('table', { 'width': '100%' }, $C('tbody', {}, $C('tr', {}, $C('td', {}, inHtml))));
    frame.init();
    return frame.closeWindow.bind(frame);
}
function $C(eName, propertys) {
    var childObj, argLen = arguments.length;
    var domAttr;
    var tmpObj = parent.document.createElement(eName);
    var fix = { 'class': 'className', 'colspan': 'colSpan', 'rowspan': 'rowSpan' };
    for (var pro in propertys) {
        domAttr = fix[pro] || pro;
        tmpObj[domAttr] = propertys[pro];
    }
    if (argLen == 2) return tmpObj;
    for (var i = 2; i < argLen; i++) {
        childObj = arguments[i];
        if ('string' == typeof (arguments[i]))
            tmpObj.innerHTML += arguments[i];
        else {
            try {
                tmpObj.appendChild(childObj);
            } catch (e) {
                if ('number' == typeof (arguments[i]))
                    tmpObj.innerHTML = arguments[i] + '';
                else
                    alert('创建' + eName + '参数中参数:' + arguments[i] + '有问题');
            }
        }
    }
    return tmpObj;
}

var eve = {
    guid: 1,
    observe: function(elem, type, handle, obj) {
        if (!handle.guid) handle.guid = this.guid++;
        var fn = handle;
        handle = function() {
            return fn.apply(obj || this, arguments);
        };
        handle.guid = fn.guid;
        elem[type] = {};
        elem[type][fn.guid] = handle;
        if (browser.ie)
            elem.attachEvent("on" + type, handle);
        else
            elem.addEventListener(type, handle, false);
        elem = null;
    },
    stopObserve: function(elem, type, handle) {
        if (browser.ie)
            elem.detachEvent("on" + type, elem[type][handle.guid]);
        else
            elem.removeEventListener(type, elem[type][handle.guid], false);
        delete (elem[type][handle.guid]);
        elem = null;
    }
};

var browser = (function() {//浏览器判断
    var b = navigator.userAgent.toLowerCase();
    return {
        safari: /webkit/.test(b),
        opera: /opera/.test(b),
        ie: /msie/.test(b) && !/opera/.test(b),
        mozilla: /mozilla/.test(b) && !/(compatible|webkit)/.test(b)
    };
})();

function emptyFunc() { }
function $(id) {
    return document.getElementById(id);
}

function switchEffect(elem, cname) {//靠CSS和鼠标移入移出事件来达到两种效果替换
    (new ourMouseover(elem, cname)).init();
}
function ourMouseover(elem, cname) {
    this.element = elem;
    this.cname = cname;
    isOver = false; //是否onmouseover
}
ourMouseover.prototype = {
    init: function() {
        eve.observe(this.element, 'mouseover', this.mouseOver.bind(this), false);
        eve.observe(this.element, 'mouseout', this.mouseOut.bind(this), false);
    },
    mouseOver: function() {
        if (true == this.isOver) return;
        addClass(this.element, this.cname);
        this.isOver = true;
    },
    mouseOut: function() {//可以不用判断是否已经mouseout
        removeClass(this.element, this.cname);
        this.isOver = false;
    }
};
function addClass(elem, cName) {//增加一个className
    if (elem.className.indexOf(cName) >= 0) return; //如果已经有了这个classname,return
    var s = (elem.className == '') ? '' : ' ';
    elem.className += s + cName;
}
function removeClass(elem, cName) {//去掉一个className
    var t = elem.className.indexOf(cName);
    if (cName == elem.className) return elem.className = '';
    var s = '';
    if (-1 == t) return;
    if (0 == t)
        s = cName + ' ';
    else
        s = ' ' + cName;
    elem.className = elem.className.replace(s, '');
}
function removeDom(obj) {
    var m = obj.childNodes;
    for (var i = m.length - 1; i >= 0; i--) {
        if (m[i].nodeType != 1) continue;
        if (m[i].childNodes.length > 0)
            removeDom(m[i]);
        else {
            try {
                obj.removeChild(m[i]);
                m[i] = null;
            } catch (e) { }
        }
    }
    try {
        obj.parentNode.removeChild(obj);
    } catch (e) { debug(obj.className); }
    obj = null;
}
//HTML 内容
function Html(Url) {
    var closeBtn = $C('input', { 'type': 'button', 'value': '关闭', 'class': 'btn' });
    switchEffect(closeBtn, 'btn_over');
    var T = "<iframe frameborder='0' scrolling='no' height='100%;' width='100%' src=" + Url + "></iframe>"
    var closeFunction = PopDialog.html($C('div', {}, T), 'Html内容');
    eve.observe(closeBtn, 'click', closeFunction);
}