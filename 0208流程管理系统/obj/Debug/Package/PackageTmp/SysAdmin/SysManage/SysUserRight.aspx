<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysUserRight.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SysUserEdit1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../JS/XmlFunction.js"></script>
    <script type="text/javascript" src="../JS/SetRightFun.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script language="javascript" type="text/javascript">
        function showDetail(strTblName, objSrc) {
            var objTbls = document.getElementsByTagName("TABLE");
            for (var i = 0; i < objTbls.length; i++) {
                var objTbl = objTbls[i];
                var strName = objTbl.getAttribute("name");
                if (strName + "" != strTblName) { continue; }
                if (objTbl.style.display == null || objTbl.style.display.length == 0 || objTbl.style.display.toLocaleLowerCase() == "inline") {
                    objTbl.style.display = "none";
                    objSrc.src = "../images/dtree/nolines_plus.gif";
                }
                else {
                    objTbl.style.display = "inline";
                    objSrc.src = "../images/dtree/nolines_minus.gif";
                }
            }
            return;
        }
        function chkOnClick(strChkName, objSrc) {
            var blnChecked = objSrc.checked;
            var blnModify = true;
//            if (!blnChecked) {
//                if (!confirm("是否清除该节点下所有的复选框？")) { blnModify = false; }
//            }
            var objTbls = document.getElementsByTagName("INPUT");
            for (var i = 0; i < objTbls.length; i++) {
                var objTbl = objTbls[i];
                var strName = objTbl.getAttribute("id");
                if (strName == null || strName + "" == "undefined") { continue; }
                if (objTbl.type != "checkbox") { continue; }
                if (objTbl.disabled == true) { continue; }
                if (strChkName.length < strName.length) {
                    if (strName.substr(0, strChkName.length) == strChkName) {
                        if (blnModify) { objTbl.checked = blnChecked; }
                    }
                }
                else { continue; }
            }
            return;
        }
        function chkOnClickEx(strChkName, objSrc) {

            var objSrcPar = objSrc.parentElement;
            var blnChk = objSrc.checked;
            var objChk = null;
            var strIsBasic = "", strIsBasicEx = "", strID = "";
            strID = objSrc.id;
            strIsBasic = objSrc.getAttribute("basic");
            var objChks = objSrcPar.getElementsByTagName("INPUT");
            for (var i = 0; i < objChks.length; i++) {
                objChk = objChks[i];
                if (objChk.type != "checkbox") { continue; }
                if (objChk.id == strID) { continue; }
                strIsBasicEx = objChk.getAttribute("basic");
                if (strIsBasic == "True") {
                    if (!blnChk) { objChk.checked = false; }
                }
                else {
                    if (blnChk && strIsBasicEx == "True") { objChk.checked = true; }
                }
            }
            return;
        }
        function btnSaveOnClick() {
            var strXml = "", strID = "", strOprCode = "", strBindOperCode = "", strNodeCode = "";
            var strMdlCode = "", strUserPk = "";
            var objChk = null;
            var objChks = document.getElementsByName("treeleaf");
            var NodeId = document.getElementById("txtNodeId").value;
            strUserPk = document.getElementById("txtUserID").value;
            if (strUserPk.length == 0) {
                alert({ msg: '未发现用户！', title: '提示信息' });
                return;
            }
            if (objChks.length == 0) {
                alert({ msg: '您没有设置模块操作的权限！', title: '提示信息' });
                return;
            }
            for (var i = 0; i < objChks.length; i++) {
                objChk = objChks[i];
                //灰色按钮不保存
                if (objChk.disabled) { continue; }
                if (!objChk.checked) { continue; }
                strID = objChk.getAttribute("id");
                if (strID == null || strID + "" == "undefined") { continue; }
                if (objChk.type != "checkbox") { continue; }
                if (strID.length < 4) continue;
                strOprCode = strID.substr(3, strID.length);
                if (strOprCode.length < 3) { strMdlCode = ""; }
                else { strMdlCode = strOprCode.substr(0, strOprCode.length - 3); }
                strBindOperCode = objChk.getAttribute("BindOperCode");
                strNodeCode = objChk.getAttribute("NodeCode");

                strXml += "<c oprcode=\"" + strOprCode + "\" mdlcode=\"" + strMdlCode + "\" BindOperCode=\"" + strBindOperCode + "\" NodeCode=\"" + strNodeCode + "\" />";
            }
            if (strXml.length == 0) {
                if (!confirm("您未选择任何权限，是否继续？")) { return; }
            }
            strXml = "<root type=\"save\" ><dataset userpk=\"" + strUserPk + "\" ><r>" + strXml + "</r></dataset></root>";
            strXml = xmlLoadXMLHttp(null, "SysUserRight.aspx?NodeId=" + NodeId, null, strXml, null);
            alert({ msg: '修改用户权限成功！', title: '提示信息' });
            return strXml;
        }
        function closeWin() {
            window.location.href = "#";
            //window.close();
        }   
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="txtUserGropCode" type="hidden" runat="server" />
    <input id="txtNodeId" type="hidden" runat="server" />
    <input id="txtRoleCode" type="hidden" runat="server" />
    <input id="txtUserID" type="hidden" runat="server" />
   <div class="container">
        <h4>位置：<%GetPageNav(NodeCode); %> &gt; <a>权限设置</a>
    </h4>
    <div class="function">
        <input id="btnOK" runat="server" type="button" value="<%$Resources:Common,Save %>"
            onclick="btnSaveOnClick()" />
        <input type="button" name="Submit422" value="<%= Resources.Common.Back %>" onclick='location.href="SysUserList.aspx<%=StrPageParams2("sysuserlist.aspx",Request.QueryString["NodeCode"]) %>";'>

    </div>
    <table border="0" cellpadding="0" cellspacing="0" id="senfe" width="100%">
        <tr>
            <td width="10px"></td>
            <td style="border:1px solid #CCCCCC">
                <asp:Table ID="tblMain" runat="server">
                </asp:Table>
            </td>
            <td width="10px"></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
