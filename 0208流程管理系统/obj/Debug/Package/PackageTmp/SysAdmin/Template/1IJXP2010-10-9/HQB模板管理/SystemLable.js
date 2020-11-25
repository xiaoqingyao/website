function windowDimensions() { return "500,300"; }
//function commandButtons() {
//    return new Array("插入标签", "objectTag(0)", "插入数据源", "objectTag(1)", "取消", "window.close()")
//}
function objectTag(type) {
    if (type == 0) {  //保存通用列表标签
        savePublic();
    }
    else {
        saveMunu(); //保存栏目类型标签
    }

    window.close();
}
function savePublic() {

    var temptxt = "{HQB_SYS_LIST";
    var oSpanArr = document.getElementsByTagName('input');
    for (var i = 0; i < oSpanArr.length; i++) {
        if (oSpanArr[i].type == 'text') {
            if (oSpanArr[i].value != null && trim(oSpanArr[i].value) != '') {
                temptxt += ' ' + oSpanArr[i].id + '="' + oSpanArr[i].value + '"';
            }
        }
        else if (oSpanArr[i].type == 'checkbox' && oSpanArr[i].checked) {
            temptxt += ' ' + oSpanArr[i].id + '="1"';
        }
    }
    var selectArr = document.getElementsByTagName('select');
    var selectIDs;
    for (var i = 0; i < selectArr.length; i++) {
        selectIDs = "";
        for (j = 0; j < selectArr[i].options.length; j++) {
            if (selectArr[i].options[j].selected && selectArr[i].options[j].value != "") {
                selectIDs += selectArr[i].options[j].value + ",";
            }
        }
        if (trim(selectIDs) != "") {
            temptxt += ' ' + selectArr[i].id + '="' + selectIDs.substr(0, selectIDs.length - 1) + '"';
        }
    }
    temptxt += '}';
    if (document.getElementById('txtContent') != null) {
        temptxt += trim(document.getElementById('txtContent').value);
    }
    temptxt += ' {/HQB_SYS_LIST}';
    var source = dreamweaver.getDocumentDOM("document").documentElement.outerHTML;

    var offs = dreamweaver.getSelection();
    var lib = source.substring(offs[0], offs[1]);
    var newSource = source.substring(0, offs[0]) + temptxt + source.substring(offs[1]);
    dreamweaver.getDocumentDOM("document").documentElement.outerHTML = newSource;

}

function saveMunu() {

    var type = document.getElementById("Type");
    var name = "HQB_SYS_MENU";
    if (type.options[type.selectedIndex].value == "3") {
        name = "HQB_SYS_NAV";
    }
    var temptxt = "";
    var oSpanArr = document.getElementsByTagName('input');
    for (var i = 0; i < oSpanArr.length; i++) {
        if (oSpanArr[i].type = 'text') {
            if (oSpanArr[i].value != null && trim(oSpanArr[i].value) != '') {
                temptxt += ' ' + oSpanArr[i].id + '="' + oSpanArr[i].value + '"';
            }
        }
        else if (oSpanArr[i].type = 'checkbox' && oSpanArr[i].checked) {
            temptxt += ' ' + oSpanArr[i].id + '="1"';
        }
    }
    var selectArr = document.getElementsByTagName('select');
    for (var i = 0; i < selectArr.length; i++) {
        temptxt += ' ' + selectArr[i].id + '="' + selectArr[i].options[selectArr[i].selectedIndex].value + '"';
    }


    temptxt = "{" + name + temptxt + "}" + "{/" + name + "}";
    var source = dreamweaver.getDocumentDOM("document").documentElement.outerHTML;

    var offs = dreamweaver.getSelection();
    var lib = source.substring(offs[0], offs[1]);
    var newSource = source.substring(0, offs[0]) + temptxt + source.substring(offs[1]);
    dreamweaver.getDocumentDOM("document").documentElement.outerHTML = newSource;
}

function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
} 