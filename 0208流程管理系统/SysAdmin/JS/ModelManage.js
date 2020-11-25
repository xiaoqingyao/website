/*****************************Begin : 编辑页*********************************/
function pageEditInit() {
  //  ToggleSubModel();
}

function ListButton_Add(objContainer, nameID, valueID) {
    var addHtmlCode;
    var addName, addValue, addContent;
    var template;

    template = modeManageLinkButtonTemplate;

    addName = $("#" + nameID).val();
    addValue = $("#" + valueID).val();
    addContent = addName + "|" + addValue + ",";

    addHtmlCode = template.replace("{name}", addName);
    addHtmlCode = addHtmlCode.replace("{value}", addValue);
    addHtmlCode = addHtmlCode.replace("{delContent}", addContent);
    addHtmlCode = addHtmlCode.replace("{objContainer}", objContainer);

    $("#" + objContainer).append(addHtmlCode);
    $("#hdn" + objContainer).val($("#hdn" + objContainer).val() + addContent);
}

function ListButton_Del(lstBtn, delContent, objContainer) {
    var orignalStr;

    orignalStr = $("#hdn" + objContainer).val();
    orignalStr = orignalStr.replace(delContent, "");

    $("#hdn" + objContainer).val(orignalStr);
    $(lstBtn).parent().empty();
}

function ListLinkSet(chk, objContainer, divContainer) {
    var state;
    state = $(chk).attr("checked");

    if (state == true) {

        $("#" + divContainer).empty();
        $("#hdn" + divContainer).val("");
        $("#" + objContainer).find("input").each(function() {
            $(this).attr("disabled", "disabled");
            $(this).removeAttr("checked");
        });

        $(chk).attr("checked", "checked");
    }
    else {
        $("#" + objContainer).find("input").each(function() {
            $(this).removeAttr("disabled");
        });
        $(chk).removeAttr("checked");
    }

    $(chk).removeAttr("disabled");
}

function ToggleSubModel() {
    if ($("#chkIsSub").attr("checked") == true) {
        $("#SubModel").css("display", "block");
    } else {
        $("#SubModel").css("display", "none");

    }
}

// 添加子模型分组
function AddSubModelGroup() {
    var jsonParam;
    var obj;
    var groupName;

    groupName = $("#SubModelGroupName").val();
    jsonParam = "{groupName:'" + groupName + "'}";

    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "/sysadmin/Model/ModelAjaxDeal.asmx/AddSubModelGroup",
        dataType: "json",
        data: jsonParam,
        success: function(msg) {
            if (msg.d != "") {
                obj = window.document.getElementById("ddlSubModelGroup");
                obj.options[obj.options.length] = new Option(groupName, msg.d);

                if (obj.options.length > 1) {
                    for (var i = obj.options.length - 1; i > 0; i--) {
                        obj.options[i].text = obj.options[i - 1].text;
                        obj.options[i].value = obj.options[i - 1].value;
                    }

                    obj.options[0].text = groupName;
                    obj.options[0].value = msg.d;
                }

                $("#AddSubModelGroupNamePrompt").html("");
            }
            else {
                $("#AddSubModelGroupNamePrompt").html("对不起，添加失败！");
            }
        }
    });
}

/*****************************End : 编辑页*********************************/

/*****************************Begin : 列表页*********************************/
// 模型名是否重复
function CheckModelRepeat(txtID, msgContainer) {
    var jsonParam;

    jsonParam = "{tbName:'" + $("#" + txtID).val() + "'}";
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "/sysadmin/Model/ModelAjaxDeal.asmx/CheckModelRepeat",
        dataType: "json",
        data: jsonParam,
        success: function(msg) {
            if (msg.d) {
                $("#" + msgContainer).html("对不起，已经存在此模型名。");
            }
            else {
                $("#" + msgContainer).html("恭喜您，通过检测！");
            }
        }
    });
}

function lookFieldList(url, isEnable) {
    if (isEnable == "True" || isEnable == "true") {
        location.href = url;
    } else {
        alert({ msg: '对不起，当前模型已被禁用，如需使用请先解禁当前模型。', title: '操作提示' });
        return false;
    }
}
function CreateModelConfirm(url, message) { selfconfirm({ msg: message, fn: function(data) { setBroserTitle(data, url) } }) }
function setBroserTitle(data, url) { if (data == "true") { location.href = url; } }
/*****************************End : 列表页*********************************/
