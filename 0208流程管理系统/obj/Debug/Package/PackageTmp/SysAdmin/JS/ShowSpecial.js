/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-03-25
// 功能描述：模型专题自定义系统字段在编辑页中实现添加至专题功能
===========================================================================*/

// 初始化
function pageInit() {
    var showID;
    var arrShowID, arrID;

    HQB_Article_SpecialID = "";
    HQB_Article_SpecialName = "";
    showID = window.parent.document.getElementById("SpecialID").value;
    $("input[type='checkbox']").each(function() {
        if ($(this).attr("model") != window.parent.document.getElementById("hdnModelID").value) {
            $(this).attr("disabled", "disabled");
        }
    });
    if (showID != "") {
        arrShowID = showID.split(",");
        for (var i = 0; i < arrShowID.length; i++) {
            arrID = arrShowID[i].split("|");
            $("#_Special_" + arrID[0]).find("#" + arrID[1]).attr("checked", "checked");
        }
    }
}

// 栏目选择
function selectSpecialMenu(specialID, specialMenuID, specialMenuName, isChecked) {
    var showID, showTitle;
    var specialName;

    specialName = $("#_Special_" + specialID).attr("title")
    showID = window.parent.document.getElementById("SpecialID").value;
    showTitle = window.parent.document.getElementById("HQB_SpecialID").value;
    if (isChecked) {
        if (showID == "") {
            showID = specialID + "|" + specialMenuID;
            showTitle = specialName + ">>" + specialMenuName;
        }
        else {
            showID += "," + specialID + "|" + specialMenuID;
            showTitle += "," + specialName + ">>" + specialMenuName;
        }

    }
    else {
        showID = showID.replace("," + specialID + "|" + specialMenuID, "");
        showTitle = showTitle.replace("," + specialName + ">>" + specialMenuName, "");
        showID = showID.replace(specialID + "|" + specialMenuID, "");
        showTitle = showTitle.replace(specialName + ">>" + specialMenuName, "");
        if (showTitle.length > 0) {
            if (showTitle.substr(0, 1) == ",") {
                showTitle = showTitle.substr(1, showTitle.length - 1);
            }
        }
        if (showID.length > 0) {
            if (showID.substr(0, 1) == ",") {
                showID = showID.substr(1, showID.length - 1);
            }
        }
    }
    if (showTitle.length == 0) {
        window.parent.document.getElementById("HQB_SpecialID").style.width = "300px";
    }
    else if (showTitle.length * 12 > 600) {
        window.parent.document.getElementById("HQB_SpecialID").style.width = "600px";
    }
    else if (showTitle.length * 12 > 300) {
        window.parent.document.getElementById("HQB_SpecialID").style.width = showTitle.length * 12 + "px";
    }
    window.parent.document.getElementById("SpecialID").value = showID;
    window.parent.document.getElementById("HQB_SpecialID").value = showTitle;
}
