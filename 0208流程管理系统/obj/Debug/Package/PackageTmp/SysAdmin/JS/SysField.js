/// <reference path="jquery-3.2-vsdoc2.js" />
var SysField = {};
SysField.Address = {};
SysField.Address.getValue = function(id, containerID) {
    $.ajax(
    {
        type: "POST",
        contentType: "application/json",
        url: "ModelAjaxDeal.asmx/Address",
        data: "{id:'" + id + "'}",
        dataType: 'json',
        success: function(result) { $("#" + containerID).append(result.d); }
    });
}

SysField.Address.search = function()
{ }

var put = document.getElementsByName("chkID");
//全选
function selall() {
    for (i = 0; i < put.length; i++) {
        put[i].checked = true;
    }
}
//全不选
function Nselall() {
    for (i = 0; i < put.length; i++) {
        put[i].checked = false;
    }
}
//反选
function selfx() {
    for (i = 0; i < put.length; i++) {
        put[i].checked = (put[i].checked) ? false : true;
    }
}
