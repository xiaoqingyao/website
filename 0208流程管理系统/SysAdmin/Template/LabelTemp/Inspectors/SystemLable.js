
//function commandButtons() {
//    return new Array("插入标签", "objectTag(0)", "插入数据源", "objectTag(1)", "取消", "window.close()")
//}
var levstr = "";  // 子栏目代码
var num = ""; //空白
function objectTag(type) {
    switch (type) {
        case 0: //保存通用列表标签
            savePublic();
            break;
        case 1: //保存栏目类型标签
            saveMunu();
            break;

    }

    window.close();
}
function savePublic() {
    var name = document.getElementById("hidName").value;
    var temptxt = "{HQB_" + name + " LableType=\"LIST\"";
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
    temptxt += ' {/HQB_' + name.split('_')[0] + '}';

    dreamweaver.getDocumentDOM("document").source.wrapSelection(temptxt, '');

}

function saveMunu() {
    var temptxt = "";
    var type = document.getElementById("Type");
    var name = document.getElementById("hidName").value;
    var temptxt = "{HQB_" + name + " LableType=\"MENU\"";
    if (type.options[type.selectedIndex].value == "3") {
        temptxt = "{HQB_" + name + " LableType=\"NAV\"";
    }

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
    if (document.getElementById("Level") != null) {
        temptxt += " Level=\"" + document.getElementById("Level").value + "\"";
    }
    var selectArr = document.getElementsByTagName('select');
    for (var i = 0; i < selectArr.length; i++) {
        temptxt += ' ' + selectArr[i].id + '="' + selectArr[i].options[selectArr[i].selectedIndex].value + '"';
    }


    var loop = document.getElementById("code") != null ? document.getElementById("code").value : "";
    temptxt = temptxt + "}" + loop + "{/HQB_" + name.split('_')[0] + "}";
    dreamweaver.getDocumentDOM("document").source.wrapSelection(temptxt, '');
    levstr = "";
    num = "";
}
function saveSlide() {                  //保存幻灯片类型
    var name = document.getElementById("hidName").value;
    var str = "{" + name + " LableType=\"LIST\" TableName=\"K_U_Commend\"";
    var widthHeight = "";

    var showTitle = "";
    if ($("#PageSize").val() != "") {
        str += " PageSize=\"" + $("#PageSize").val() + "\"";
    }
    str += " Menu=\"" + document.getElementById("Menu").value + "\"";
    if (document.getElementById("IsShowTitle") != null) {
        showTitle = '{$Field(1,Title,0,0)}';
        showTitle = showTitle.replace(",0,", "," + $("#TitleLength").val() + ",");
    }
    if ($("#FlashWidth").val() != "") {
        widthHeight += " focus_width='" + $("#FlashWidth").val() + "';\r\n";

    }
    if ($("#FlashHeight").val() != "") {
        widthHeight += " focus_height='" + $("#FlashHeight").val() + "';\r\n";
    }

    str += "}\r\n[HQB.Loop]\r\n picarr[i]='<%=imgUrl%>{$Field(1,UploadPic,0,0)}';\r\n linkarr[i]='{$Field(1,Url,0,0)}';\r\n textarr[i] = '" + showTitle + "';" + widthHeight +
"\r\n i+=1;[/HQB.Loop]\r\n{/" + name + "}";

    var source = dreamweaver.getDocumentDOM("document").documentElement.outerHTML;

    var offs = dreamweaver.getSelection();
    var lib = source.substring(offs[0], offs[1]);
    var newSource = source.substring(0, offs[0]) + str + source.substring(offs[1]);
    dreamweaver.getDocumentDOM("document").documentElement.outerHTML = newSource;
}
function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

function resetContent(conID) {
    var content = document.getElementById(conID);
    if (content != null) {
        content.value = content.value.replace(/::\]::/gi, ']').replace(/::\[::/gi, '[')
    }
}