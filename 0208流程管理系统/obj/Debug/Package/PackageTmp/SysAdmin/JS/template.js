/*================================================================
Copyright (C) 2010 华强北在线
作者:      何伟
创建时间： 2010年09月08日
功能/方法描述:模板编辑和添加的相关操作

// 更新日期        更新人      更新原因/内容
--===============================================================*/
function showlabelDiv(obj, content, width) {
    var pos = getPosition(obj);
    var objDiv = document.getElementById("LabelDivid");
    if (objDiv == null) {
        objDiv = document.createElement("div");
        objDiv.id = "LabelDivid";
    }
    objDiv.className = "selectStyle"; //For IE
    objDiv.style.position = "absolute";
    var tempheight = pos.y;
    var tempwidth1, tempheight1;
    var windowwidth = document.body.clientWidth;

    var isIE5 = (navigator.appVersion.indexOf("MSIE 5") > 0) || (navigator.appVersion.indexOf("MSIE") > 0 && parseInt(navigator.appVersion) > 4);
    var isIE55 = (navigator.appVersion.indexOf("MSIE 5.5") > 0);
    var isIE6 = (navigator.appVersion.indexOf("MSIE 6") > 0);
    var isIE7 = (navigator.appVersion.indexOf("MSIE 7") > 0);

    if (isIE5 || isIE55 || isIE6 || isIE7) { var tempwidth = pos.x + 305; } else { var tempwidth = pos.x + 312; }
    objDiv.style.width = width + "px";
    objDiv.innerHTML = content;
    if (tempwidth > windowwidth) {
        tempwidth1 = tempwidth - windowwidth
        objDiv.style.left = (pos.x - tempwidth1) + "px";
    }
    else {
        if (isIE5 || isIE55 || isIE6 || isIE7) { objDiv.style.left = (pos.x) + "px"; } else { objDiv.style.left = (pos.x) + "px"; }
    }
    if (isIE5 || isIE55 || isIE6 || isIE7) { objDiv.style.top = (pos.y + 22) + "px"; } else { objDiv.style.top = (pos.y + 22) + "px"; }

    objDiv.style.display = "";
    document.ondblclick = function() { if (objDiv.style.display == "") { objDiv.style.display = "none"; } }
    document.body.appendChild(objDiv);
}

//弹出层
function show(type, obj, title, label_width, height) {
    var label_temp1 = "<div onmousedown=\"drag(event,$('LabelDivid'));\" class=\"titile_bg\">\
    <table style=\"width:100%;\">\
    <tr>\
    <td>" + title + "</td>\
    <td style=\"width:20px\">\
    <img src=\"../../SysAdmin/images/close.gif\" style=\"cursor:pointer;\" title=\"close\" onclick=\"closediv($('LabelDivid'));\" /> \
    </td>\
    </tr>\
    </table>\
    </div>\
    <iframe src=";
    var label_temp2 = " frameborder=\"0\" id=\"select_main\" scrolling=\"yes\" name=\"select_main\" width=\"100%\" height=\"" + height + "px\" />";
    var label_temp3 = "";
    switch (type) {
        case "AllLable":
            label_temp3 = label_temp1 + "AllLable.aspx" + label_temp2;
            break;
    }
    showlabelDiv(obj, label_temp3, label_width);
}
getPosition = function(oElement) {
    var objParent = oElement
    var oPosition = new position(0, 0);
    while (objParent.tagName != "BODY") {
        oPosition.x += objParent.offsetLeft;
        oPosition.y += objParent.offsetTop;
        objParent = objParent.offsetParent;
    }
    return oPosition;
}
position = function(x, y) {
    this.x = x;
    this.y = y;
}
function closediv(objDiv) {
    objDiv.parentNode.removeChild(objDiv);
}

//拖动弹框
drag = function(a, o) {
    var d = document; if (!a) a = window.event;
    if (!a.pageX) a.pageX = a.clientX;
    if (!a.pageY) a.pageY = a.clientY;
    var x = a.pageX, y = a.pageY;
    if (o.setCapture)
        o.setCapture();
    else if (window.captureEvents)
        window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
    var backData = { x: o.style.top, y: o.style.left };
    d.onmousemove = function(a) {
        if (!a) a = window.event;
        if (!a.pageX) a.pageX = a.clientX;
        if (!a.pageY) a.pageY = a.clientY;
        var tx = a.pageX - x + parseInt(o.style.left), ty = a.pageY - y + parseInt(o.style.top);
        o.style.left = tx + "px";
        o.style.top = ty + "px";
        x = a.pageX;
        y = a.pageY;
    };

    d.onmouseup = function(a) {
        if (!a) a = window.event;
        if (o.releaseCapture)
            o.releaseCapture();
        else if (window.captureEvents)
            window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
        d.onmousemove = null;
        d.onmouseup = null;
        if (!a.pageX) a.pageX = a.clientX;
        if (!a.pageY) a.pageY = a.clientY;
        if (!document.body.pageWidth) document.body.pageWidth = document.body.clientWidth;
        if (!document.body.pageHeight) document.body.pageHeight = document.body.clientHeight;
        if (a.pageX < 1 || a.pageY < 1 || a.pageX > document.body.pageWidth || a.pageY > document.body.pageHeight) {
            o.style.left = backData.y;
            o.style.top = backData.x;
        }
    };
}

//获取并设置标签的内容到指定文本编辑域
function ReturnLabelValueText(value) {
    try {
        if (value != "") {
            var oEditor = FCKeditorAPI.GetInstance("txtLableContent");
            if (oEditor.EditMode == FCK_EDITMODE_WYSIWYG) {
                oEditor.InsertHtml(value);
            } else {
                return false;
            }
        }
    }
    catch (e) {
        insert(value);
    }
    finally {
        document.getElementById("LabelDivid").style.display = "none";
        return;
    }
}

//插入标签到模板内容中
function insert(returnValue_lable) {
    var obj = document.getElementById("txtLableContent");
    obj.focus();
    if (document.selection == null) {
        var iStart = obj.selectionStart
        var iEnd = obj.selectionEnd;
        obj.value = obj.value.substring(0, iEnd) + returnValue_lable + obj.value.substring(iEnd, obj.value.length);
    } else {
        var range = document.selection.createRange();
        range.text = returnValue_lable;
    }
}

// 在光标处插入字符串 (跨页面)
// myField 文本框对象
// 要插入的值 
//位置索引
function insertAtCursorByStart(myField, myValue, s) {
    var len = myField.value.length - s;
    myField.value = myField.value.substr(0, s) + myValue + myField.value.substr(s, len);
}

// 在光标处插入字符串 
function insertAtCursor(myField, myValue) {
    
    myField.focus();
    if (myField[0].selectionStart == undefined) {
        var range = document.selection.createRange();
        range.text = myValue;
    } else {
 
        var startPos = myField[0].selectionStart;
        var endPos = myField[0].selectionEnd;
        var str = myField.val();      
        myField.val(str.substring(0, startPos) + myValue + str.substring(endPos, str.length));

    }
 }

//根据类型来弹出标签设置框
function openFrame(id) {
    var lname, identification, lTitle, lContent;
    $.ajax({
        type: "POST",
        url: "AddTemplate.aspx",
        dataType: 'xml',
        data: { op: 'getOneLable', lableID: id },
        beforeSend: function(XMLHttpRequest) {
            //                alert({ msg: '请稍后', title: '提示信息' });
        },
        success: function(result) {

            var info = $(result).find("lable");
            info.each(function() {
                lName = $(this).find("LableName").text();
                lTitle = $(this).find("Title").text();
                identification = $(this).find("Newidex").text();
                lContent = $(this).find("LableContent").text();
             
                switch (parseInt($(this).find("IsSystem").text())) {
                    case 0:     //静态                            
                        insert(lName);
                        break;
                    case 1:     //系统
                        if (lContent.indexOf(" LableType=\"NAV\"") != -1 || lContent.indexOf(" LableType=\"MENU\"") != -1)        //栏目
                        {
                            openframe({ url: 'ColumnType.aspx?id=' + id + '&lableName=' + lTitle + '&identification=' + identification, width: '750', height: '330', title: '编辑栏目标签参数' });

                        }
                        else if (lContent.indexOf(" LableType=\"LIST\"") != -1)                                              //列表,再分幻灯片类型,专题列表类型
                        {
                            if (lContent.indexOf("TableName=\"K_U_Commend\"") != -1) {
                                insert(lName);   //幻灯片类型

                            }
                            else if (lContent.indexOf("TableName=") == -1)                                              //专题列表类型
                            {
                                openframe({ url: 'SpecialType.aspx?id=' + id + '&lableName=' + lTitle + '&identification=' + identification, width: '720', height: '460', title: '编辑专题列表标签参数' });
                            }
                            else                                                                                        //通用列表类型
                            {
                                openframe({ url: 'PublicListType.aspx?id=' + id + '&lableName=' + lTitle + '&identification=' + identification , width: '750', height: '480', title: '编辑通用列表标签参数' });
                            }
                        }
                        else if (lContent.indexOf(" LableType=\"CONTENT\"") != -1)                                          //详细
                        {
                            openframe({ url: 'DetailPageType.aspx?id=' + id + '&lableName=' + lTitle + '&identification=' + identification, width: '660', height: '300', title: '编辑详细页面类型' });

                        }
                        else if (lContent.indexOf(" LableType=\"Periodical\"") != -1)                                       //期刊
                        {
                            openframe({ url: 'PeriodicalType.aspx?id=' + id + '&lableName=' + lTitle + '&identification=' + identification , width: '600', height: '320', title: '编辑期刊列表标签参数' });

                        }
                        break;
                    case 2:     //分页
                        openframe({ url: 'ParameterSplit.htm?lName=' + lName.split(' ')[0] , width: '680', height: '160', title: '编辑分页标签参数' });
                        break;
                    case 10:   //自由
                        openframe({ url: 'ParamFree.aspx?lName=' + lName.split(' ')[0] , width: '680', height: '400', title: '编辑自由标签参数' });
                        break;
                }
            });
        },
        error: function(result, status) { //如果没有上面的捕获出错会执行这里的回调函数
            alert({ msg: '获取数据出错！', title: '提示信息' })

        }

    });

}
function getStartEnd(obj) {
    var s, e, range, stored_range;
    if (obj[0].selectionStart == undefined) {
        var selection = document.selection;
        if (obj[0].tagName.toLowerCase() == "textarea") {
            range = selection.createRange();
            stored_range = range.duplicate();
            stored_range.moveToElementText(obj[0]);
            stored_range.setEndPoint('EndToEnd', range);
            s = stored_range.text.length - range.text.length;
            e = s + range.text.length;
        }
    } else {
        s = obj[0].selectionStart;
        e = obj[0].selectionEnd;
    }
//    var te = this[0].value.substring(s, e);
    return { start: s, end: e}
}