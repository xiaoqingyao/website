/// <reference path="jquery-3.2-vsdoc2.js" />
/// <reference path="Common.js" />

/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-11-15
// 功能描述：模型编辑页记录关联
===========================================================================*/
var RelatedType = { Article: 0, Goods: 1, Accessories: 2 };     // 关联类型
var DropDownType = {Brand:0,Categories:1};

function syncLoad(context, callBack, param, requestUrl, relatedType, isSource) {
    $.ajax({
        type: "post",
        url: requestUrl,
        data: param,
        dataType: "xml",
        success: function(msg) {
            if (typeof (callBack) == "function") {
                if (typeof (isSource) != "boolean") {
                    callBack.call(context, msg, relatedType);
                } else {
                    callBack.call(context, msg, relatedType, isSource);
                }
            }
        }
    });
}

var RelatedRS = function () {
    this.FieldName = arguments[0] ? arguments[0] : "";
    this.SourceSel = arguments[1] ? document.getElementById(arguments[1]) : null;
    this.TargetSel = arguments[2] ? document.getElementById(arguments[2]) : null;
    this.PriceInpute = arguments[3] ? document.getElementById(arguments[3]) : null;
    this.ChkIsDouble = arguments[4] ? document.getElementById(arguments[4]) : null;

    this.setPriceValue = function() {
        if (this.PriceInpute && this.SourceSel.selectedIndex >= 0) {
            this.PriceInpute.value = $(this.SourceSel.options[this.SourceSel.selectedIndex]).attr("Price");
        }
    }

    this.valueSync = function() {
        var fieldValue;

        fieldValue = "";

        for (var k = 0; k < this.TargetSel.options.length; k++) {
            if (this.TargetSel.options[k].value.trim() != "") {
                if (fieldValue == "") {
                    fieldValue = this.TargetSel.options[k].value;
                } else {
                    fieldValue += "," + this.TargetSel.options[k].value;
                }
            }
        }

        $("#" + this.FieldName).val(fieldValue);
    }

    this.addItem = function(isAll) {   // 添加关联
        var text, value;
        var isTrue;

        isTrue = true;

        if (this.PriceInpute != null) {
            this.setPriceValue();
        }

        if (this.SourceSel != null && this.SourceSel.nodeName == 'SELECT') {
            if (isAll) {
                for (var i = 0; i < this.SourceSel.options.length; i++) {
                    if (this.ChkIsDouble) {                        // 商品关联
                        if (!this.ChkIsDouble.checked) {  // 单向关联
                            text = this.SourceSel.options[i].text + " --  [单向关联]";
                            value = this.SourceSel.options[i].value + "$0";

                        } else {   // 双向关联
                            text = this.SourceSel.options[i].text + " --  [双向关联]";
                            value = this.SourceSel.options[i].value + "$1";
                        }

                    } else if (this.PriceInpute) {                   // 配件关联
                        text = this.SourceSel.options[i].text + " -- [" + this.PriceInpute.value + "]";
                        value = this.SourceSel.options[i].value + "$" + this.PriceInpute.value;
                    } else {                                            // 文章关联
                        text = this.SourceSel.options[i].text;
                        value = this.SourceSel.options[i].value;
                    }

                    isTrue = true;

                    for (var k = 0; k < this.TargetSel.options.length; k++) {
                        if (this.TargetSel.options[k].value.split("$")[0] == value.split("$")[0]) {
                            isTrue = false;
                            break;
                        }
                    }

                    if (isTrue) {
                        this.TargetSel.options[this.TargetSel.options.length] = new Option(text, value);
                    }
                }
            } else {
                if (this.SourceSel.selectedIndex >= 0) {
                    if (this.ChkIsDouble) {                        // 商品关联
                        if (!this.ChkIsDouble.checked) {  // 单向关联
                            text = this.SourceSel.options[this.SourceSel.selectedIndex].text + " -- " + "[单向关联]";
                            value = this.SourceSel.options[this.SourceSel.selectedIndex].value + "$0";
                        } else {   // 双向关联
                            text = this.SourceSel.options[this.SourceSel.selectedIndex].text + " -- " + "[双向关联]";
                            value = this.SourceSel.options[this.SourceSel.selectedIndex].value + "$1";
                        }
                    } else if (this.PriceInpute) {                   // 配件关联
                        text = this.SourceSel.options[this.SourceSel.selectedIndex].text + " -- [" + this.PriceInpute.value + "]"; ;
                        value = this.SourceSel.options[this.SourceSel.selectedIndex].value + "$" + this.PriceInpute.value;
                    } else {  // 文章关联
                        text = this.SourceSel.options[this.SourceSel.selectedIndex].text;
                        value = this.SourceSel.options[this.SourceSel.selectedIndex].value;
                    }

                    isTrue = true;

                    for (var i = 0; i < this.TargetSel.options.length; i++) {
                        if (this.TargetSel.options[i].value.split("$")[0] == value.split("$")[0]) {
                            isTrue = false;
                            break;
                        }
                    }

                    if (isTrue) {
                        this.TargetSel.options[this.TargetSel.options.length] = new Option(text, value);
                    }
                }
            }
        }

        this.valueSync();
    }

    this.removeItem = function(isAll) {   //  删除已选中的关联
        if (isAll) {
            for (var i = this.TargetSel.options.length - 1; i >= 0; i--) {
                this.TargetSel.options[i] = null;
            }
        } else {
            if (this.TargetSel.options.selectedIndex >= 0) {
                this.TargetSel.options[this.TargetSel.options.selectedIndex] = null;
            }
        }

        this.valueSync();
    }

    this.responseDeal = function(msg, relatedType, isSource) {
        var title, value, price;
        var objSel;
        var opt;
        var context;
        var callBack;

        if (isSource) {
            objSel = this.SourceSel;
            context = this;
            callBack = this.addItem;

            for (var j = objSel.options.length - 1; j >= 0; j--) {
                objSel.options[j] = null;
            }

            $(msg).find("Related").each(function() {
                title = $(this).children("Title").text();
                value = $(this).children("ID").text();
                opt = new Option(title, value);

                if (relatedType != RelatedType.Article) {
                    price = $(this).children("Price").text();
                    $(opt).attr("Price", price);
                }

                objSel.options[objSel.options.length] = opt;
            });
        } else {
            objSel = this.TargetSel;

            $(msg).find("Related").each(function() {
                title = $(this).children("title").text();
                value = $(this).children("id").text();
                opt = new Option(title, value);

                objSel.options[objSel.options.length] = opt;
            });
        }
    }

    this.loadTargetOption = function(relatedType) {
        var fieldValue;
        var requestUrl, param;

        fieldValue = $("#" + this.FieldName).val();

        if (fieldValue.trim() != "") {
            requestUrl = "ModelAjaxDeal.asmx/GetOriginalRelatedRS";
            param = "relateType=" + relatedType + "&originalValue=" + fieldValue;
            syncLoad(this, this.responseDeal, param, requestUrl, relatedType, false);
        }
    }

    this.loadSourceOption = function(serachInputID, brandID, catelogryID, relatedType) {
        var searchValue, brandValue, catelogryValue; ;
        var requestUrl, param;

        brandValue = "";
        catelogryID = "";
        searchValue = $("#" + serachInputID).val();

        if (brandID != null && brandID != "" && $("#" + brandID)[0] != undefined) {
            brandValue = $("#" + brandID).val();
        }

        if (catelogryID != null  && catelogryID != "" && $("#" + catelogryID)[0] != undefined) {
            catelogryValue = $("#" + catelogryID).val();
        }

        requestUrl = "ModelAjaxDeal.asmx/GetSourcelRelatedRS";
        param = "serachValue=" + searchValue + "&brandID=" + brandValue + "&relateType=" + relatedType + "&catelogryID=" + catelogryID;
        syncLoad(this, this.responseDeal, param, requestUrl, relatedType, true);
    }

    this.loadSelectOption = function(selType, selID) {
        var requestUrl, param;

        switch (selType) {
            case DropDownType.Brand:
                param = "tableName=K_G_Brand";
                break;
            case DropDownType.Categories:
                param = "tableName=K_Category";
                break;
        }
        requestUrl = "ModelAjaxDeal.asmx/GetGoodsBrand";
        syncLoad(this, this.fillBrand, param, requestUrl, selID, null);

    }

    this.fillBrand = function(msg, selID) {
        var objSel = document.getElementById(selID);

        if (objSel != null) {
            $(msg).find("Related").each(function() {
                title = $(this).children("Title").text();
                value = $(this).children("ID").text();
                opt = new Option(title, value);

                objSel.options[objSel.options.length] = opt;
            });
        }
    }
}