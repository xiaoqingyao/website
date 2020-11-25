/*================================================================
Copyright (C) 2010 华强北在线
作者:      胡志瑶
创建时间： 2010年09月29日
功能/方法描述:标签管理中的js

// 更新日期        更新人      更新原因/内容
--===============================================================*/
function setContent(str) {
    //IE
    if (document.selection) {
        $("#txtLableContent").focus();
        var tarobj = document.selection.createRange();
        tarobj.text = str;
    }
    else {
        var tclen = $("#txtLableContent").val().length;
        var value = $("#txtLableContent").val();
        $("#txtLableContent").val(value.substr(0, $("#txtLableContent")[0].selectionStart) + str + value.substring($("#txtLableContent")[0].selectionStart, tclen));
    }
}