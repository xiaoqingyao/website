/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.dialog.add('importword',
function(a) {
    var ishidden = function() {
        if (!window.ActiveXObject)
            return true;
        else
            return false;
    };
    var b = function(c, d, e) {
        var g = this;
        g.editMode = true;
        g.editObj = e;
        var f = g.editObj.getAttribute('name');
        if (f) g.setValueOf('info', 'txtName', f);
        else g.setValueOf('info', 'txtName', '');
    };
    return {
        title: a.lang.importword.title,
        minWidth: 350,
        minHeight: 120,
        onOk: function() {
            fileobj = window.frames["ajaxifr"].document.getElementById("fileWord");
            var uploadvalue = fileobj.value;
            if (uploadvalue != "" && uploadvalue.indexOf(".") != -1) {
                var fileext = uploadvalue.substring(uploadvalue.lastIndexOf(".") + 1).toLowerCase();
                if (fileext != "doc" && fileext != "docx") {
                    alert(a.lang.importword.NotAllowFileType);
                    return false;
                }

                try {
                    activex = new ActiveXObject("ToprandActiveX.ImportWord");
                    document.getElementById("waitimg").style.display = '';
                }
                catch (err) {
                    document.getElementById("waitimg").style.display = 'none';
                    var address = window.showModalDialog("../Editor/dowloadActiveX.aspx", "", "dialogWidth=340px;dialogHeight=270px");
                    return false;
                }
                setTimeout("getHtml(" + this.getValueOf('Upload', 'ignoreFontFace') + ");", 50);
                return false;
            }
            else {
                alert(a.lang.importword.NotNull);
                return false;
            }
            return true;
        },
        contents: [{
            id: 'Upload',
            label: a.lang.importword.title,
            width: 460,
            accessKey: 'I',
            elements: [{
                type: 'html',
                width: 460,
                onLoad: function() {
                    importobj = a;
                    if (!window.ActiveXObject) {
                        document.getElementById("div_Enable").style.display = 'none';
                        document.getElementById("div_Disable").style.display = '';
                    }
                },
                html: '<div id=div_Enable>' + a.lang.importword.name + '<br><iframe name="ajaxifr" id="ajaxifr" src="../Editor/ImportEditor/ImportWord.aspx" frameborder=0 scrolling=no style="width:360px;height:50px"></iframe><div align=center id="waitimg" style="width:360px;display:none;">' + a.lang.importword.wait + ' <img src="../Editor/CKEditor/images/pleasewait.gif"></div> </div><div style="display:none" id=div_Disable>' + a.lang.importword.disable + '</div>'

            },
            {
                type: 'hbox',
                widths: ['110px', '110px', '110px'],
                align: 'right',
                children: [{
                    type: 'checkbox',
                    id: 'ignoreFontFace',
                    label: a.lang.importword.removestyle,
                    hidden: ishidden(),
                    'default': a.config.pasteFromWordIgnoreFontFace
                },
                    {
                        type: 'checkbox',
                        id: 'removeStyle',
                        label: a.lang.importword.removestyle,
                        hidden: true,
                        'default': a.config.pasteFromWordRemoveStyle
}]
}]
}]
            };
        });
        
var fileobj;
var activex;
var importobj;
function getHtml(obj1) {
    var upurl, hostname, pathname, ports;
    hostname = location.hostname;
    ports = location.port;
    if (ports != "") {
        hostname = hostname + ":" + ports;
    }
    activex.UploadFileUrl = "http://" + hostname + "/SysAdmin/upfiles/ImportUpload.aspx";
    activex.ImportFilePath = fileobj.value;
    document.frames('ajaxifr').location.reload();
    var htmlbody = "";
    try {
        htmlbody = activex.GetFileHtml();
        htmlbody = clearhtml(obj1, htmlbody);
        importobj.insertHtml(htmlbody);
        document.getElementById("waitimg").style.display = 'none';
        var nf = fileobj.cloneNode(true);
        nf.value = '';
        fileobj.parentNode.replaceChild(nf, fileobj);
        var h = CKEDITOR.dialog.getCurrent()
        h.hide();
    }
    catch (err) {
        alert(importobj.lang.importword.Failure);
    }
}

function clearhtml(d, c) {
    var html = c;
    if (d) {
        // Remove all SPAN tags
        html = html.replace(/<\/?SPAN[^>]*>/gi, "");
        // Remove Class attributes
        html = html.replace(/<(\w[^>]*) class=([^ |>]*)([^>]*)/gi, "<$1$3");
        // Remove Style attributes
        html = html.replace(/<(\w[^>]*) style="([^"]*)"([^>]*)/gi, "<$1$3");
        // Remove Lang attributes
        html = html.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi, "<$1$3");
        // Remove XML elements and declarations
        html = html.replace(/<\\?\?xml[^>]*>/gi, "");
        // Remove Tags with XML namespace declarations: <o:p></o:p>
        html = html.replace(/<\/?\w+:[^>]*>/gi, "");
        // Replace the &nbsp;
        html = html.replace(/&nbsp;/, " ");
        // Transform <P> to <DIV>
        var re = new RegExp("(<P)([^>]*>.*?)(<\/P>)", "gi"); // Different because of a IE 5.0 error
        html = html.replace(re, "<div$2</div>");
    }
    return html;
}