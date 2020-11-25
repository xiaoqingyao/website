Common = {  //公用操作集合
    action: "add",
    post: function(url, data, fn) {

        data = data.substring(data.indexOf('&') + 1);
        data = data.substring(data.indexOf('&') + 1);
        //  data = data.replace("%3C", "&lt;");
        //        alert(data);
        //        data = {content:"<script>alert</script>"}
        alert(data);
        $.ajax({
            url: url,
            cache: false,
            data: data,
            dataType: "text",
            type: "post",
            success: function(msg) {
                fn(msg);
            },
            error: function(msg, textStatus) {
                alert(textStatus);
            }
        });
    },
    arae: function(id, target, name) {  //地区边动    
        $.ajax({
            url: "../ajax/arae.ashx",
            cache: false,
            data: { id: id },
            success: function(msg) {
                msg = eval(msg);
                var strValue = "";
                $.each(msg, function(i, n) {
                    strValue += "<option value=" + n.id + ">" + n.name + "</option>";

                });
                var obj = $("#" + target);
                var hdnObj = $("#hdn" + target);
                obj.html(strValue);
                if (Common.action == "edit") { //如果是修改 还要初始化
                    obj.val(hdnObj.val());
                }
                obj.change();
                if (name) {
                    Common.SelectValue(name);
                }
            },
            error: function(msg, textStatus) {
                alert(textStatus);
            }
        });
    },
    SelectValue: function(target) {
        var obj = $("#" + target);
        var hdnObj = $("#hdn" + target);
        hdnObj.val(obj.val());
        if (Common.action == "edit") { //如果是修改 
            Common.action = "add";
        }
    }
};


function AC_FL_RunContent() {  //装载flash   
    var ret = AC_GetArgs(arguments, "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000", "application/x-shockwave-flash");
    var str = '';
   
    if ($.browser.msie) {
        str += '<object ';
        for (var i in ret.objAttrs) {
            str += i + '="' + ret.objAttrs[i] + '" ';
        }
        str += '>';
        for (var i in ret.params) {
            str += '<param name="' + i + '" value="' + ret.params[i] + '" /> ';
        }
        str += '</object>';        
    } else {
        str += '<embed ';
        for (var i in ret.embedAttrs) {
            str += i + '="' + ret.embedAttrs[i] + '" ';
        }
        str += '></embed>';
    }    
    return str;

}

function AC_GetArgs(args, classid, mimeType) {
    var ret = new Object();
    ret.embedAttrs = new Object();
    ret.params = new Object();
    ret.objAttrs = new Object();
    for (var i = 0; i < args.length; i = i + 2) {
        var currArg = args[i].toLowerCase();
        switch (currArg) {
            case "classid": break;
            case "pluginspage": ret.embedAttrs[args[i]] = 'http://www.macromedia.com/go/getflashplayer'; break;
            case "src": ret.embedAttrs[args[i]] = args[i + 1]; ret.params["movie"] = args[i + 1]; break;
            case "codebase": ret.objAttrs[args[i]] = 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0'; break;
            case "onafterupdate": case "onbeforeupdate": case "onblur": case "oncellchange": case "onclick": case "ondblclick": case "ondrag": case "ondragend":
            case "ondragenter": case "ondragleave": case "ondragover": case "ondrop": case "onfinish": case "onfocus": case "onhelp": case "onmousedown":
            case "onmouseup": case "onmouseover": case "onmousemove": case "onmouseout": case "onkeypress": case "onkeydown": case "onkeyup": case "onload":
            case "onlosecapture": case "onpropertychange": case "onreadystatechange": case "onrowsdelete": case "onrowenter": case "onrowexit": case "onrowsinserted": case "onstart":
            case "onscroll": case "onbeforeeditfocus": case "onactivate": case "onbeforedeactivate": case "ondeactivate": case "type":
            case "id": ret.objAttrs[args[i]] = args[i + 1]; break;
            case "width": case "height": case "align": case "vspace": case "hspace": case "class": case "title": case "accesskey": case "name":
            case "tabindex": ret.embedAttrs[args[i]] = ret.objAttrs[args[i]] = args[i + 1]; break;
            default: ret.embedAttrs[args[i]] = ret.params[args[i]] = args[i + 1];
        }
    }
    ret.objAttrs["classid"] = classid;
    if (mimeType) {
        ret.embedAttrs["type"] = mimeType;
    }
    return ret;
}