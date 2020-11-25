/// <reference path="jquery-3.2-vsdoc2.js" />
/// <reference path="Common.js" />

/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标// 创建日期：2010-11-19
// 功能描述：模型中商品相关字段JS
===========================================================================*/

// 字段配置  本店售价 Price   市场售价   MarketPrice 积分购买金额 IntegralAmount  会员价格 MemberPrice  促销价  PromotionalPrice
var GoodsFieldDeal = function() {
    var marketRatio;            // 市场价比例  市场价 = 本店售价 * 市场价比例
    var integralPayRatio        // 积分支付比例

    marketRatio = 0;
    integralPayRatio = 0;

    $.ajax({
        type: "Post",
        contentType: "application/json",
        dataType: "json",
        data: "{siteID:'" + $("#hdnSiteID").val() + "'}",
        url: "ModelAjaxDeal.asmx/GetShopSetConfig",
        success: function(msg) {
            var jsonConfig;
            jsonConfig = eval(msg.d);
            marketRatio = jsonConfig.MarketRatio;
            integralPayRatio = jsonConfig.IntegralPayRatio;

            if (document.getElementById("Price") != undefined) {
                $("#Price").change(function() {
                    if (document.getElementById("MarketPrice") != undefined) {
                        document.getElementById("MarketPrice").value = parseFloat($(this).val()) * marketRatio;
                    }

                    if (document.getElementById("IntegralAmount") != undefined) {
                        document.getElementById("IntegralAmount").value = parseFloat($(this).val()) * integralPayRatio * 0.01;
                    }
                });

                $("body").find("#Price").parent("dd:first").append("<input class=\"btn\" type=\"button\" value=\" 按市场价计算 \" onclick=\"window.document.getElementById('Price').value = window.document.getElementById('MarketPrice').value * (1/" + marketRatio + ");\"/>");
            }
        }
    });

    $(function() {
        if (document.getElementById("RelatedGoods") != undefined) {          // 商品关联到商口
            $("body").find("#RelatedGoods").parent().parent().parent().find("dt").html("");
        }

        if (document.getElementById("RelatedAccessories") != undefined) {    // 商品关联到配件
            $("body").find("#RelatedAccessories").parent().parent().parent().find("dt").html("");
        }

        if (document.getElementById("RelatedArticle") != undefined) {    // 商品关联到文章
            $("body").find("#RelatedArticle").parent().parent().parent().find("dt").html("");
        }
    });

    if (document.getElementById("MarketPrice") != undefined) {    // 市场售价
        $("body").find("#MarketPrice").parent("dd:first").append("<input type=\"button\" value=\" 取整数 \" onclick=\"window.document.getElementById('MarketPrice').value = parseInt(window.document.getElementById('MarketPrice').value,10);\"/>");
    }

    if (document.getElementById("MemberPrice") != undefined) {   // 会员价格
        $.ajax({
            type: "post",
            dataType: "xml",
            data: "siteID=" + $("#hdnSiteID").val(),
            url: "ModelAjaxDeal.asmx/GetMemberGroup",
            success: function(msg) {
                var memberPriceHtmlCode = "";
                var jsonMemberPrice;
                var i = 1;

                $(msg).find("MenberGroup").each(function() {
                    if (i % 4 != 0) {
                        memberPriceHtmlCode += $(this).children("GroupName").text() + " <input onchange=\"SyncMemberPrice()\"  groupName=\"" + $(this).children("GroupName").text() + "\" groupID=\"" + $(this).children("ID").text() + "\" type=\"text\" id=\"Member" + $(this).children("ID").text() + "\" value=\"-1\" />";
                    } else {
                        memberPriceHtmlCode += $(this).children("GroupName").text() + " <input onchange=\"SyncMemberPrice()\"  groupName=\"" + $(this).children("GroupName").text() + "\" groupID=\"" + $(this).children("ID").text() + "\" type=\"text\" id=\"Member" + $(this).children("ID").text() + "\" value=\"-1\" />" + "<br/>";
                    }
                    i++;
                });

                memberPriceHtmlCode += "<br />会员价格为-1时表示会员价格按会员等级折扣率计算。你也可以为每个等级指定一个固定价格";
                $("body").find("#MemberPrice").parent("dd:first").append(memberPriceHtmlCode);

                try {
                    jsonMemberPrice = eval($("#MemberPrice").val());
                    for (var k = 0; k < jsonMemberPrice.length; k++) {
                        $("#Member" + jsonMemberPrice[k].ID).val(jsonMemberPrice[k].Price);
                    }
                }
                catch (e) { }
            }
        });
    }
    if (document.getElementById("PStartDate") != undefined) {     // 促销开始时间
        if (document.getElementById("PEndDate") != undefined) {     // 促销结束时间
            var obj = $("body").find("#PEndDate").parent().parent();
            $("body").find("#PStartDate").parent().append(" 至  " + $("body").find("#PEndDate").parent().html());
            obj.remove();
        }
    }

    if (document.getElementById("PromotionalPrice") != undefined) {    // 促销价  PromotionalPrice
        var promotionalPriceTitle;

        promotionalPriceTitle = $("body").find("#PromotionalPrice").parent().parent().find("dt").text();

        if ($("body").find("#PromotionalPrice").val().trim() != "" && $("body").find("#PromotionalPrice").val().trim() != "0") {
            $("body").find("#PromotionalPrice").parent().parent().find("dt").html("<input id=\"HQB_Goods_Promotional\" onclick=\"EnablePromotional()\" checked=\"checked\" type=\"checkbox\">" + " " + promotionalPriceTitle);
        } else {
            $("body").find("#PromotionalPrice").parent().parent().find("dt").html("<input  id=\"HQB_Goods_Promotional\" onclick=\"EnablePromotional()\"   type=\"checkbox\">" + " " + promotionalPriceTitle);
        }

        EnablePromotional();
    }

}

var _HQB_Goods_PromotionalPrice = null, _HQB_Goods_PStartDate = null, _HQB_Goods_PEndDate = null;

function EnablePromotional() {
    if ($("#HQB_Goods_Promotional").attr("checked")) {
        if (_HQB_Goods_PromotionalPrice != null) {
            $("#PromotionalPrice").val(_HQB_Goods_PromotionalPrice);
            $("#PStartDate").val(_HQB_Goods_PStartDate);
            $("#PEndDate").val(_HQB_Goods_PEndDate);
        }
        
        $("#PromotionalPrice").removeAttr("disabled");
        $("#PStartDate").removeAttr("disabled");
        $("#PEndDate").removeAttr("disabled");
    } else {
        _HQB_Goods_PromotionalPrice = $("#PromotionalPrice").val();
        _HQB_Goods_PStartDate = $("#PStartDate").val();
        _HQB_Goods_PEndDate = $("#PEndDate").val();
        $("#PromotionalPrice").val("");
        $("#PStartDate").val("");
        $("#PEndDate").val("");
        $("#PromotionalPrice").attr("disabled", "disabled");
        $("#PStartDate").attr("disabled", "disabled");
        $("#PEndDate").attr("disabled", "disabled");
    }
}

function SyncMemberPrice() {
    var memberPriceValue;

    memberPriceValue = "[";
    $("body").find("#MemberPrice").parent("dd:first").find("input[type='text']").each(function() {
        if (memberPriceValue.length > 2) {
            memberPriceValue += ",";
        }

        memberPriceValue += "{ID:'" + $(this).attr("groupID") + "',Name:'" + $(this).attr("groupName") + "',Price:'" + $(this).val() + "'}";
    });
    memberPriceValue += "]";
    $("#MemberPrice").val(memberPriceValue);
}

var goods = new GoodsFieldDeal();