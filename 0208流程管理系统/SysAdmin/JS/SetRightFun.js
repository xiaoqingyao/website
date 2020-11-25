//查看返回的字符串中是否包含警告或错误的单词
function plcIsPopMsg(strMsg) {
    var blnOK = false;
    if (strMsg != null && strMsg.length >= 3
        && (strMsg.substring(0, 2) == "错误"
        || strMsg.substring(0, 2) == "警告"
        || strMsg.substring(0, 2) == "提示")) {
        blnOK = true;
    }
    else {
        blnOK = false;
    }
    return blnOK;
}