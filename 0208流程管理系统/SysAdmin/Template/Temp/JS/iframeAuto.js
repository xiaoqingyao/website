/*================================================================
Copyright (C) 2010 华强北在线
作者:      何伟
创建时间： 2010年11月2日
功能/方法描述:控制前台Iframe自适应大小

// 更新日期        更新人      更新原因/内容
--===============================================================*/

//iframe高度自适应
function IFrameReSize(iframename) {
    var pTar = document.getElementById(iframename);
    if (pTar) {  //ff
        if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
            pTar.height = pTar.contentDocument.body.offsetHeight;
        } //ie
        else if (pTar.Document && pTar.Document.body.scrollHeight) {
            pTar.height = pTar.Document.body.scrollHeight;
        }
    }
}

//iframe宽度自适应
function IFrameReSizeWidth(iframename) {
    var pTar = document.getElementById(iframename);
    if (pTar) {  //ff
        if (pTar.contentDocument && pTar.contentDocument.body.offsetWidth) {
            pTar.width = pTar.contentDocument.body.offsetWidth;
        }  //ie
        else if (pTar.Document && pTar.Document.body.scrollWidth) {
            pTar.width = pTar.Document.body.scrollWidth;
        }
    }
}