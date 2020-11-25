////////////////////////////////////////////////////////////////////////////////
//		本脚本包含的是对XML数据读取,修改,删除,新增等操作的一些公共方法
///////////////////////////////////////////////////////////////////////////////
function xmlCreateXMLDom(strXMLString, strXMLFilePath) {
    var objDom = new ActiveXObject("Microsoft.XMLDOM");
    objDom.validateOnParse = true;
    //objDom.validateOnParse = true;
    if (strXMLString != null) objDom.loadXML(strXMLString);
    if (strXMLFilePath != null) objDom.load(strXMLFilePath);
    //返回
    if (objDom == null || objDom.parseError.errorCode != 0) {//如果出错
        // alert('数据格式错误:'+objDom.parseError.reason);
        objDom = null;
    }
    return objDom;
}
//返回XTTP的回应XML
//openType 打开类型(GET,POST),默认为POST
//targetURL  传送目标
//contentType Content-Type的类型,默认text/xml
//sendXML 传送的内容ＸＭＬ
//objHttp	ＨＴＴＰ组件
function xmlLoadXMLHttp(openType, targetURL, contentType, sendXML, objHttp) {
    var xmlLocHttp = null;
    if (objHttp == null) xmlLocHttp = jb();
    else xmlLocHttp = objHttp;

    if (openType == null) openType = "POST";
    if (contentType == null) contentType = "text/xml";
    xmlLocHttp.open(openType, targetURL, false);
    xmlLocHttp.setRequestHeader("Content-Type", contentType);
    xmlLocHttp.send(sendXML);
    var str = xmlLocHttp.responseText;
    return str;
}
//将某XML依据扩展标记内容进行转换
//strXML,可以为null,表示需要转换的XML数据流
//objXmlDom如果没有指定strXML则需要指定objXmlDom需要处理的xml文档对象
//strXLSTFileName扩展标记语言路径
function xmlTransformNode(strXML, objXmlDom, strXLSTFileName) {
    var strReturn = "";
    var objDom = new ActiveXObject("Microsoft.XMLDOM");
    var objXLSTDom = new ActiveXObject("Microsoft.XMLDOM");
    objDom.async = "false";
    objXLSTDom.async = "false";
    objXLSTDom.validateOnParse = true;
    objXLSTDom.load(strXLSTFileName);
    if (strXML != null) objDom.loadXML(strXML);
    if (objXmlDom != null) objDom = objXmlDom;
    strReturn = objDom.transformNode(objXLSTDom);
    return strReturn;
}
function xmlAddAttribute(objNode, strAttName, strAttValue) {
    var strXML = "<root></root>";
    var objLocDom = xmlCreateXMLDom(strXML, null);
    var objAttr = objLocDom.createAttribute(strAttName);
    objAttr.value = strAttValue;
    objNode.attributes.setNamedItem(objAttr);
    return objNode;
}
function xmlAddNode(objParNode, strAddNodeName) {
    var strXML = "<root></root>";
    var objLocDom = xmlCreateXMLDom(strXML, null);
    var objNode = objLocDom.createNode(1, strAddNodeName, "");
    objParNode.appendChild(objNode);
    return objNode;
}
function xmlInsertBefore(objParNode, objBefNode, strAddNodeName) {
    var strXML = "<root></root>";
    var objLocDom = xmlCreateXMLDom(strXML, null);
    var objNode = objLocDom.createNode(1, strAddNodeName, "");
    objParNode.insertBefore(objNode, objBefNode);
    return objNode;
}
function xmlInsertAfter(objParNode, objAftNode, strAddNodeName) {
    var strXML = "<root></root>";
    var objLocDom = xmlCreateXMLDom(strXML, null);
    var objNode = objLocDom.createNode(1, strAddNodeName, "");
    var objNxtNode = null;
    if (objAftNode != null) { objNxtNode = objAftNode.nextSibling; }
    if (objNxtNode == null) { objNode = xmlAddNode(objParNode, strAddNodeName); }
    else { objNode = xmlInsertBefore(objParNode, objNxtNode, strAddNodeName); }
    return objNode;
}
function xmlAppendAttribute(objNode, strAttName, strAttValue) { //在最后添加
    var strValueOri = objNode.getAttribute(strAttName);
    if (strValueOri + '' != 'null' && strValueOri + '' != 'undefined' && strValueOri + '' != '') {
        strAttValue = strValueOri + ";" + strAttValue;
    }
    objNode.setAttribute(strAttName, strAttValue); //整理后再添加节点
    return objNode;
}

function xmlSetAttribute(objNode, strAttName, strAttValue) {   //设置属性
    objNode.setAttribute(strAttName, strAttValue);
    return objNode;
}

function xmlRemoveChildNode(objParElement, objDelNode) {
    var intCount = 0;
    if (!objParElement.hasChildNodes) return 0;
    objParElement.removeChild(objDelNode);
    return;
}

//ff下ActiveXObject定义
function jb() {
    var A = null;
    try {
        A = new ActiveXObject("Msxml2.XMLHTTP")
    } catch (e) {
        try {
            A = new ActiveXObject("Microsoft.XMLHTTP")
        } catch (oc) {
            A = null
        }
    }
    if (!A && typeof XMLHttpRequest != "undefined") {
        A = new XMLHttpRequest()
    }
    return A
} 