/// <reference path="jquery-3.2-vsdoc2.js" />
/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-03-25
// 功能描述：模型详细页预览
===========================================================================*/

$(function() {
    if ($("#K_U_Message_PublishRange")[0] != null) {    // 发布范围显示处理
        var publishRange, showContent;
        var arrUser, user;

        showContent = "";
        publishRange = $("#K_U_Message_PublishRange").html();
        arrUser = publishRange.split(",");

        for (var i = 0; i < arrUser.length; i++) {
            user = arrUser[i].split("$$");
            if (user != null && user.length > 1) {
                if (showContent == "") {
                    showContent = user[1];
                }
                else {
                    showContent += "," + user[1];
                }
            }
        }
        $("#K_U_Message_PublishRange").html(showContent)
    }
});