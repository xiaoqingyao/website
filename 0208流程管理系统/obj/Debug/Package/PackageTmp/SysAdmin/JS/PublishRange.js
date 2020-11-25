/// <reference path="jquery-3.2-vsdoc2.js" />

/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-03-25
// 功能描述：发布范围自定义系统字段JS功能代码
===========================================================================*/
// 界面相关
jQuery(function($) {
    $(".selectedWindows ul li").mouseover(function() { $(this).addClass("hover"); }).mouseout(function() { $(this).removeClass("hover"); });
    $(".popWrap .title").mouseover(function() {
        $(this).addClass("hover");
    }).mouseout(function() {
        $(this).removeClass("hover");
    }).click(function() {
        $(".sel").removeClass("sel");
        $(".selcontaier").hide();
        $(this).addClass("sel").next().show();
    }
	);
    PageInit();
})

// 页面初始加载
function PageInit() {
    if ($(parent.document.getElementById("PublishRange")).val() == "") {
        $("#navTitle" + $("#hdnSiteID").val()).addClass("sel");
        $("#Site" + $("#hdnSiteID").val()).show();
        SelSiteUser($("#hdnSiteName").val(), $("#hdnSiteID").val(), "WebSite" + $("#hdnSiteID").val(), true);
    } else {
        $(".title").first().addClass("sel");
        ShowSelectedUser("已选用户");
    }
}

// 从字符串中分离用户ID和用户名
function UserInfoSplit(userInfo) {
    var arrUserInfo, arrUser, arrUserID, arrUserName;
    var jsonResult;

    if (userInfo != "") {
        arrUserInfo = userInfo.split("$$$");
        arrUserName = new Array();
        arrUserID = new Array();

        for (var i = 0; i < arrUserInfo.length; i++) {
            if (arrUserInfo[i] != "") {
                arrUser = arrUserInfo[i].split("|");
                arrUserID[i] = arrUser[0];
                arrUserName[i] = arrUser[1];
            }
        }

        jsonResult = { "UserID": arrUserID, "UserName": arrUserName };
    }
    else {
        jsonResult = null;
    }

    return jsonResult;

}

// 用户列显示初始化
function UserListInit() {
    var arrUserID;

    arrUserID = $(parent.document.getElementById("PublishRange")).val().split(",");
    $("#CurrentUser li").each(function() {
        for (var k = 0; k < arrUserID.length; k++) {
            if ($(this).attr("userID") == arrUserID[k]) {
                $(this).addClass("selected");
                break;
            }
        }
    });
}

// 与父窗口的显示文本及隐藏域中值同步
function Synchronous(userID, userName, isAdd) {
    var originalID;         // 设置前已选中的用户ID
    var originalName;       // 设置前已选中的用户名
    var temp;               // 临时变量，无意义用于存放临时值，字符串类型

    originalID = $(parent.document.getElementById("PublishRange")).val();
    originalName = $(parent.document.getElementById("HQB_PublishRange")).val();

    if (isAdd) {    // 添加用户
        temp = "," + originalName + ",";

        if (temp.match("," + userName + ",") == null) { // 原值不存在则添加
            if (originalName == "") {   // 与显示文本框同步
                originalName = userName;
            } else {
                originalName += "," + userName;
            }

            if (originalID == "") {   // 与隐藏域值同步
                originalID = userID;
            } else {
                originalID += "," + userID;
            }
        }
    } else {        // 删除用户
        originalName = "," + originalName + ",";    // 与显示文本框同步
        originalName = originalName.replace("," + userName, "");
        leftTag = originalName.substr(0, 1);
        rightTag = originalName.substr(originalName.length - 1, 1);
        if (leftTag == ",") {
            originalName = originalName.substr(1);
        }
        if (rightTag == ",") {
            originalName = originalName.substr(0, originalName.length - 1);
        }

        originalID = "," + originalID + ",";        // 与隐藏域值同步
        originalID = originalID.replace("," + userID, "");
        leftTag = originalID.substr(0, 1);
        rightTag = originalID.substr(originalID.length - 1, 1);
        if (leftTag == ",") {
            originalID = originalID.substr(1);
        }
        if (rightTag == ",") {
            originalID = originalID.substr(0, originalID.length - 1);
        }
    }

    $(parent.document.getElementById("PublishRange")).val(originalID);
    $(parent.document.getElementById("HQB_PublishRange")).val(originalName);
}

// 显示用户
function DisplayUserInfo(userInfo, isSelected, isList) {
    var jsonUser;
    var userInfoHtml;                    // 显示当前操作用户HTML代码
    var leftTag, rightTag;

    jsonUser = UserInfoSplit(userInfo);  // 从字符串中分离用户ID和用户名

    userInfoHtml = "";

    //显示选择的用户
    if (isSelected) {   // 添加用户
        if (jsonUser != null) {
            for (var k = 0; k < jsonUser.UserID.length; k++) {
                userInfoHtml += "<li class=\"selected\" userName=\"" + jsonUser.UserName[k] + "\" userID=\"" + jsonUser.UserID[k] + "\" onclick=\"SetUser('" + jsonUser.UserID[k] + "','" + jsonUser.UserName[k] + "',this)\">" + jsonUser.UserName[k] + "</li>";
                if (!isList) {
                    Synchronous(jsonUser.UserID[k], jsonUser.UserName[k], isSelected);  // 与父窗口同步
                }
            }
        }
    } else {    // 删除用户
        if (jsonUser != null) {
            for (var k = 0; k < jsonUser.UserID.length; k++) {
                userInfoHtml += "<li userName=\"" + jsonUser.UserName[k] + "\" userID=\"" + jsonUser.UserID[k] + "\" onclick=\"SetUser('" + jsonUser.UserID[k] + "','" + jsonUser.UserName[k] + "',this)\">" + jsonUser.UserName[k] + "</li>";
                if (!isList) {
                    Synchronous(jsonUser.UserID[k], jsonUser.UserName[k], isSelected);   // 与父窗口同步
                }
            }
        }
    }

    $("#CurrentUser").html(userInfoHtml);   // 显示
    UserListInit();
}

// 选择站点下所有用户
function SelSiteUser(listHeaderName, siteID, chkBoxID, isList) {
    var treeContainerID;    // 用户导航树的父标签ID
    var isSelected;         // 根节点是否启用
    var userInfo;           // 选中的站点下的所有用户信息

    $("#ListHeader").html(listHeaderName);
    isSelected = $("#" + chkBoxID).attr("checked");
    treeContainerID = "Site" + siteID.toString();
    userInfo = "";

    $("#" + treeContainerID).find("input").each(function() {
        if (userInfo != "") {   // 获取所有用户信息
            userInfo = userInfo + "$$$" + $(this).val();
        } else {
            userInfo = $(this).val();
        }

        if (isSelected) {       // 设置子节点选中状态
            $(this).attr("checked", "checked");
        }
        else {
            $(this).removeAttr("checked");
        }
    });

    DisplayUserInfo(userInfo, isSelected, isList);  // 显示
}


//选择用户组下的用户
function SelUserGroup(listHeaderName, numCode, chkBoxID, isList) {
    var isSelected;     // 用户组是否选中
    var userInfo;       // 用户组及子用户组的所有用户
    var jsonUser;

    userInfo = $("#" + chkBoxID).val();
    isSelected = $("#" + chkBoxID).attr("checked");

    $("#ListHeader").html(listHeaderName);
    for (var i = 0; i < 1000; i++) {
        var chkID;

        chkID = "#chkBox_" + numCode + "_" + i.toString();

        if ($(chkID)[0] != null) {
            if (userInfo != "") {   // 获取所有用户信息
                userInfo = userInfo + "$$$" + $(chkID).val();
            }
            else {
                userInfo = $(chkID).val();
            }

            if (isSelected) {        // 设置子节点选中状态
                $(chkID).attr("checked", "checked");
            } else {
                $(chkID).removeAttr("checked");
            }
        } else {
            break;
        }
    }

    DisplayUserInfo(userInfo, isSelected, isList);  // 显示
}

// 显示已选中的用户
function ShowSelectedUser(listHeaderName) {
    var userInfoHtml;
    var arrUserID, arrUserName;

    userInfoHtml = "";
    $("#ListHeader").html(listHeaderName);

    if ($(parent.document.getElementById("PublishRange")).val() != "") {
        arrUserID = $(parent.document.getElementById("PublishRange")).val().split(",");
        arrUserName = $(parent.document.getElementById("HQB_PublishRange")).val().split(",");

        for (var k = 0; k < arrUserID.length; k++) {
            if (arrUserID[k] != "") {
                userInfoHtml += "<li class=\"selected\" userName=\"" + arrUserName[k] + "\" userID=\"" + arrUserID[k] + "\" onclick=\"SetUser('" + arrUserID[k] + "','" + arrUserName[k] + "',this)\">" + arrUserName[k] + "</li>";
            }
        }

        $("#CurrentUser").html(userInfoHtml);
    }
}

// 选中/取消用户
function SetUser(userID, userName, sender) {
    var isAdd;

    if ($(sender).hasClass("selected")) {   // 已选中则取消
        isAdd = false;
        $(sender).removeClass("selected");
    } else {    // 未选中则选中
        $(sender).addClass("selected");
        isAdd = true;
    }

    Synchronous(userID, userName, isAdd);  // 与父窗口同步
}

// 添加当前显示列中的用户
function AddCurrentList() {
    $("#CurrentUser li").each(function() {
        $(this).addClass("selected");
        Synchronous($(this).attr("userID"), $(this).attr("userName"), true);
    });
}

// 删除当前显示列中的用户
function DelCurrentList() {
    $("#CurrentUser li").each(function() {
        $(this).removeClass("selected");
        Synchronous($(this).attr("userID"), $(this).attr("userName"), false);
    });
}