/// <reference path="jquery-3.2-vsdoc2.js" />
/// <reference path="Common.js" />

/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-11-18
// 功能描述：模型编辑页 -- 相册基本类型字段
===========================================================================*/
function AlbumsDel(id) {
    var rsID, originalValue;
    var fieldName, currentImgUrl, arrImg;
    var ajaxParam;

    rsID = $("#" + id).attr("RsID");
    fieldName = $("#" + id).attr("fieldName");
    originalValue = $("#" + fieldName).val();
    currentImgUrl = $("#" + id).attr("img");

    if (rsID.trim() != "" && originalValue.trim() != "") {
        if (originalValue.indexOf(currentImgUrl) > -1) {
            arrImg = originalValue.split("[---]");

            for (var i = 0; i < arrImg.length; i++) {
                if (arrImg[i].indexOf(currentImgUrl) > -1) {
                    originalValue = originalValue.replace("[---]" + arrImg[i], "");
                    originalValue = originalValue.replace(arrImg[i], "");
                    break;
                }
            }
        }
    }

    ajaxParam = "{tableName:'" + $("#hdnTableName").val() + "',fieldName:'" + fieldName + "',newValue:'" + originalValue + "',id:'" + rsID.trim() + "',imgPath:'" + $("#" + id).attr("rootPath").replace(/\\/g, "/") + "/" + currentImgUrl + "'}";

    $.ajax({
        type: "post",
        contentType: "application/json",
        data: ajaxParam,
        url: "ModelAjaxDeal.asmx/AlbumsContentSync",
        dataType: "json",
        success: function(msg) { }
    });

    $("#" + id).remove();
}

var Albums = function() {
    var albumsContainer;    // 显示相片的容器(ul标签)
    var albumsNewTitle      // 要添加的相片标题文本框
    var albumsNewURL;       // 要添加的相片地址文本框
    var thumbAlbumsNewURL;  // 要添加的小图地址文本框
    var albumsNewBtn;       // 添加相片按钮
    var thumbAlbumsNewBtn;  // 添加小图按钮
    var uploadParam;        // 打开上传相片窗口参数
    var fieldName;          // 保存相册内容的字段名
    var currentImgUrl;      // 当前相片地址
    var rootUrl;            // 图片上传目录URL
    var rootPath;           // 图片上传目录
    var rsID;               // 当前记录ID
    var titleInputWidth;    // 要添加的相片标题文本框宽度
    var counter;
    var hasTumb;            // 是否上传小图

    rootUrl = $("#hdnUploadImgUrl").val();
    rootPath = $("#hdnUploadImgPath").val();
    rsID = $("#hdnRSID").val();
    fieldName = arguments[0];
    uploadParam = eval(arguments[1]);
    hasTumb = arguments[2];
    albumsContainer = document.getElementById(fieldName + "AlbumsContainer");
    albumsNewTitle = document.getElementById(fieldName + "AlbumsNewTitle");
    albumsNewURL = document.getElementById(fieldName + "AlbumsNewURL");
    albumsNewBtn = document.getElementById(fieldName + "AlbumsNewBtn");
    titleInputWidth = parseInt(uploadParam.ThumbWidth, 10);
    counter = 0;

    if (hasTumb) {
        thumbAlbumsNewBtn = document.getElementById(fieldName + "ThumbAlbumsNewBtn");
        thumbAlbumsNewURL = document.getElementById(fieldName + "ThumbAlbumsNewURL");
    } else {
        thumbAlbumsNewBtn = null;
        thumbAlbumsNewURL = null;
    }

    if (isNaN(titleInputWidth)) {
        titleInputWidth = 120;
    } else {
        titleInputWidth = titleInputWidth - 10;
    }

    currentImgUrl = albumsNewURL.value;

    save = function() {
        var fieldValue = "";

        $(albumsContainer).find("li").each(function() {
            imgUrl = $(this).children("input[type='hidden']").val();
            $(this).find("input[type='text']").each(function() { imgTitle = $(this).val(); });

            if (fieldValue == "") {
                if (hasTumb) {
                    fieldValue = imgTitle + "[###]" + imgUrl + "[###]" + $(this).attr("ThumbUrl");
                } else {
                    fieldValue = imgTitle + "[###]" + imgUrl;
                }
            } else {
                if (hasTumb) {
                    fieldValue += "[---]" + imgTitle + "[###]" + imgUrl + "[###]" + $(this).attr("ThumbUrl");
                } else {
                    fieldValue += "[---]" + imgTitle + "[###]" + imgUrl;
                }
            }
        });

        $("#" + fieldName).val(fieldValue);
    }

    addImg = function(imgTitle, imgUrl, thumbUrl) {
        var htmlCode;

        if (thumbUrl == null) {
            htmlCode = "<li style=\"float:left; padding:3px; margin:5px; border:1px solid #dddddd;\" RsID=\"" + rsID + "\" fieldName=\"" + fieldName + "\" rootPath=\"" + rootPath + "\" img=\"" + imgUrl + "\" id=\"" + fieldName + "_Lst_" + counter.toString() + "\">";
        } else {
            htmlCode = "<li style=\"float:left; padding:3px; margin:5px; border:1px solid #dddddd;\" ThumbUrl=\"" + thumbUrl + "\" RsID=\"" + rsID + "\" fieldName=\"" + fieldName + "\" rootPath=\"" + rootPath + "\" img=\"" + imgUrl + "\" id=\"" + fieldName + "_Lst_" + counter.toString() + "\">";
        }

        htmlCode += "<input type=\"hidden\" value=\"" + imgUrl + "\">";
        htmlCode += " <table cellpadding=\"0\"  cellspacing=\"0\">";
        htmlCode += "<tr><td style=\"text-align:center;\"><span style=\"cursor:pointer;\" onclick=\"AlbumsDel('" + fieldName + "_Lst_" + counter.toString() + "')\">[-]</span></td></tr>"
        htmlCode += "<tr><td><img src=\"" + rootUrl + imgUrl + "\" style=\"width:" + uploadParam.ThumbHeight + "px;\" /></td></tr>";
        htmlCode += "<tr><td style=\"text-align:center;\"><input type=\"text\" value=\"" + imgTitle  + "\" style=\"  width:" + titleInputWidth.toString() + "px\" /></td></tr>";
        htmlCode += " </table>";
        htmlCode += " </li>";
        $(albumsContainer).append(htmlCode);
        counter = counter + 1;
    }


    this.sync = function() {

        if (currentImgUrl != albumsNewURL.value) {
            currentImgUrl = albumsNewURL.value;

            if (thumbAlbumsNewURL != null && thumbAlbumsNewURL != undefined) {
                addImg(albumsNewTitle.value, currentImgUrl, thumbAlbumsNewURL.value);
            } else {
                addImg(albumsNewTitle.value, currentImgUrl, null);
            }
        }
    }

    this.init = function() {
        var imgTitle, imgUrl;

        $(albumsNewBtn).click(function() {
            InputImages(uploadParam.FormName, uploadParam.ElementName, uploadParam.ControlType, uploadParam.ExtType, uploadParam.MaxSize, uploadParam.GetSizeControl, uploadParam.ThumbWidth, uploadParam.ThumbHeight);
        });

        if (hasTumb && thumbAlbumsNewBtn != null) {
            $(thumbAlbumsNewBtn).click(function() {
                InputImages(uploadParam.FormName, uploadParam.ThumbElementName, uploadParam.ControlType, uploadParam.ExtType, uploadParam.MaxSize, uploadParam.GetSizeControl, uploadParam.ThumbWidth, uploadParam.ThumbHeight);
            });
        }

        if (rsID.trim() != "") {
            var arrImg, arrTemp;
            var originalValue;

            originalValue = $("#" + fieldName).val();

            if (originalValue.trim() != "") {
                arrImg = originalValue.split("[---]");

                for (var i = 0; i < arrImg.length; i++) {
                    arrTemp = arrImg[i].split("[###]");

                    if (hasTumb && arrTemp.length > 2) {
                        addImg(arrTemp[0], arrTemp[1], arrTemp[2]);
                    } else {
                        addImg(arrTemp[0], arrTemp[1], null);
                    }
                }
            }
        }

        setInterval(this.sync, 200);
        $("#theForm").submit(function() { save(); });
    }
}


