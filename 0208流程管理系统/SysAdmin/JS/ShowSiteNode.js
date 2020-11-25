/// <reference path="jquery-3.2-vsdoc2.js" />
/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-04-24
// 功能描述：模型编辑页面中更换节点、添加到其它节点功能所用JS代码
===========================================================================*/

$(pageInit); 
// 加载初始选中节点
function pageInit(){
    var actionType;
    var originalValue;

    actionType = $("#hdnAction").val();

    if (actionType == "change") {
        originalValue = $(parent.document.getElementById("hdnSiteID")).val() + "_" + $(parent.document.getElementById("hdnNodeID")).val();

        $("input[type='checkbox']").each(function() {
            if ($(this).val() == originalValue) {
                $(this).attr("checked", "checked");
            }
        });
    }
    else if (actionType == "current") { 
        originalValue = $(parent.document.getElementById("hdnSiteID")).val() + "_" + $(parent.document.getElementById("hdnNodeID")).val();

        $("input[type='checkbox']").each(function() {
            if ($(this).val() == originalValue) {
                $(this).attr("checked", "checked");
            }
        });
    }
    else {
        $(parent.document.getElementById("HQB_SiteNode_Container")).find("input[type='hidden']").each(function() {
            originalValue = $(this).val();

            $("#TreeMenu").find("input[type='checkbox']").each(function() {
                if ($(this).val() == originalValue) {
                    $(this).attr("checked", "checked");
                }
            }
                );
        }
        );
    }
}

// 站点节点选择
function selectSiteNode(nodeName,nodeCode,nodeCheckBox){
    var actionType;

    actionType = $("#hdnAction").val();
    
    if(actionType == "change"){
        if ($(nodeCheckBox).attr("checked") == true) {
            var nodeAndSiteID;

            nodeAndSiteID = nodeCode.split("_");
            $(parent.window.document.getElementById("HQB_NodeID")).val(nodeName);
            $(parent.window.document.getElementById("hdnSiteID")).val(nodeAndSiteID[0]);
            $(parent.window.document.getElementById("hdnNodeID")).val(nodeAndSiteID[1]);
            parent.CloseDialog();
            }
        }
    else if (actionType == "current") {
            if ($(nodeCheckBox).attr("checked") == true) {
                var nodeAndSiteID;

                nodeAndSiteID = nodeCode.split("_");
                $(parent.window.document.getElementById("DefaultNodeCode")).val(nodeAndSiteID[1]);
                parent.CloseDialog();
                }        
        }
     else {
            if ($(nodeCheckBox).attr("checked") == true) {
                var nodeItem;

                nodeItem = "<li style=\"float:none;\" id=\"li" + nodeCode + "\"><input type=\"text\" value=\"" + nodeName + "\" name=\"OtherNode_" + nodeCode + "\" id=\"OtherNode_" + nodeCode + "\"/><input type=\"hidden\" value=\"" + nodeCode + "\" name=\"hdnOtherNode_" + nodeCode + "\"/>&nbsp; <input class='AddBtn' type=\"button\" value=\"从此节点中移除\"  onclick='$(\"#li" + nodeCode + "\").remove()' /></li>";
                $(parent.window.document.getElementById("HQB_SiteNode_Container")).append(nodeItem);
            }
            else {
                $(parent.window.document.getElementById("li" + nodeCode)).remove();
            }
    }
}