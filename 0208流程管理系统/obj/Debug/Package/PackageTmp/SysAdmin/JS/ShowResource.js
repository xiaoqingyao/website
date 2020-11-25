/// <reference path="jquery-3.2-vsdoc2.js" />
/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-05-25
// 功能描述：模型中来源系统自定义字段在编辑页面中所用
===========================================================================*/

// 添加作者页面初始加载
function AuthorPageInit(spliteTag) {
    var selectedValue;
    var arrSelectItem;

    if (parent.document.getElementById("Author") != null) {
        selectedValue = parent.document.getElementById("Author").value;
        document.getElementById("Selected").value = selectedValue;
        arrSelectItem = selectedValue.split(spliteTag);

        $("#AuthorInfoList").find("tr:not(:first)").each(function() {
          for (var i = 0; i < arrSelectItem.length; i++) {
                if ($(this).find(":first").html() == arrSelectItem[i]) {
                    $(this).addClass("ho");
                    break;
                }
            }
        });

   }

}

// 设置作者值
function SetAuthor(obj, spliteTag, receiver) {
    var rsContent, originalContent;

    rsContent = $(obj).find("td:first").html();
    originalContent = parent.document.getElementById(receiver).value;

    if (!$(obj).hasClass("ho")) {  // 添加资源值
        $(obj).addClass("ho");
        if (originalContent == "") {
            originalContent = rsContent;
        }
        else {
            originalContent += spliteTag + rsContent;
        }
    }
    else {   // 删除资源值
        var leftTag, rightTag;

        $(obj).removeClass("ho");
        originalContent = spliteTag + originalContent + spliteTag;
        originalContent = originalContent.replace(spliteTag + rsContent, "");
        leftTag = originalContent.substr(0, spliteTag.length);
        rightTag = originalContent.substr(originalContent.length - spliteTag.length, spliteTag.length);

        if (leftTag == spliteTag) {
            originalContent = originalContent.substr(spliteTag.length, originalContent.length - spliteTag.length);
        }
        if (rightTag == spliteTag) {
            originalContent = originalContent.substr(0, originalContent.length - spliteTag.length);
        }
    }
    parent.document.getElementById(receiver).value = originalContent;
    $("#Selected").val(originalContent);
}

// 清除选中的作者
function removeAllSelected(receiver) {
    parent.document.getElementById(receiver).value = "";
    $("#Selected").val("");
    if (receiver == "Author" || receiver == "Source") {
        $(".antables").find("tr").removeClass("ho");
    }
    else {
        $("#ResourceInfoList li").each(function() { $(this).removeClass("ho"); });
    }
}


// 添加关键字页面初始加载
function KeywordPageInit(spliteTag) {
    var selectedValue;
    var arrSelectItem;
    var currentValue;

    if (parent.document.getElementById("Keyword") != null) {
        selectedValue = parent.document.getElementById("Keyword").value;
        document.getElementById("Selected").value = selectedValue;
        arrSelectItem = selectedValue.split(spliteTag);

        $("#KeywordInfoList li").each(function() {
            currentValue = $(this).html();
            for (var j = 0; j < arrSelectItem.length; j++) {
                if (trim(arrSelectItem[j]) == trim(currentValue)) {
                    $(this).addClass("ho");

                }
            }
        });
    }
}


// 设置关键字值
function SetKeyword(obj, spliteTag, receiver) {
    var rsContent, originalContent;

    rsContent = $(obj).html();
    originalContent = parent.document.getElementById(receiver).value;

    if (!$(obj).hasClass("ho")) {  // 添加资源值
        $(obj).addClass("ho");
        if (originalContent == "") {
            originalContent = rsContent;
        }
        else {
            originalContent += spliteTag + rsContent;
        }
    }
    else {   // 删除
        var leftTag, rightTag;

        $(obj).removeClass("ho");
        originalContent = spliteTag + originalContent + spliteTag;
        originalContent = originalContent.replace(spliteTag + rsContent, "");
        leftTag = originalContent.substr(0, spliteTag.length);
        rightTag = originalContent.substr(originalContent.length - spliteTag.length, spliteTag.length);

        if (leftTag == spliteTag) {
            originalContent = originalContent.substr(spliteTag.length, originalContent.length - spliteTag.length);
        }
        if (rightTag == spliteTag) {
            originalContent = originalContent.substr(0, originalContent.length - spliteTag.length);
        }
    }

    parent.document.getElementById(receiver).value = originalContent;
    $("#Selected").val(originalContent);
}




// 添加来源页面初始加载
function SourcePageInit() {
    var selectedValue;

    if (parent.document.getElementById("Source") != null) {
        selectedValue = parent.document.getElementById("Source").value;
        $("#ResourceInfoList").find("tr:not(:first)").each(function() {
            if ($(this).find(":first").html() == selectedValue) {
                $(this).addClass("ho");
            }
        });
    }
}

// 设置来源
function SetSource(obj, receiver) {
    var rsContent;

    rsContent = $(obj).find("td:first").html();

    parent.document.getElementById(receiver).value = rsContent;
    parent.CloseDialog();
}

function trim(str) {
    var reg;

    reg = /(^\s*)|(\s*$)/g
    return str.replace(reg, "");
}