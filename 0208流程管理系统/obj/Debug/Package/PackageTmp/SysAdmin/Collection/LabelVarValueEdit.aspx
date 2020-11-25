<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelVarValueEdit.aspx.cs" EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Collection.LabelVarValueEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/Collection.js"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">.container dl{ border:0;}.container dl dd{margin-right:2px;} .CollectionAddress  input{margin-bottom:10px;}</style>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <dl>
            <dd>
            <table  class="CollectionAddress">
            <tr>
                <td valign="top">
                     <asp:ListBox ID="lstbValueList" Width="480" Height="190" ondblclick="return VarValueItemModify('lstbValueList')" runat="server"></asp:ListBox>
                </td>
                <td valign="top" style=" padding-left:5px; padding-top:15px; text-align:center;">
                    <input type="button" onclick="AddressRemoveAll('lstbValueList')" value=" 清 除 " /><br />
                    <input type="button" value="修改选中" onclick="VarValueItemModify('lstbValueList')" /><br />
                    <input type="button" value="删除选中" onclick="AddressItemDel('lstbValueList')"/><br />
                    <input type="button" value="向上移动" onclick="UpOrder('lstbValueList')" /><br />
                    <input type="button" value="向下移动" onclick="DownOrder('lstbValueList')" /><br />
                </td>
            </tr>
            <tr><td colspan="2">  注：多个值用$$$隔开 如 深圳市$$$广州市$$$东莞市</td></tr>
            </table>
            </dd>
        </dl>
        
        
        <dl>
            <dd style="padding-right:8px;"><textarea style=" width:468px; height:45px;" id="InputValue"></textarea></dd>
            <dd><input type="button" value="确定输入" id="btnEnsureInput" optype="input" onclick="PaserLabelVarValue($('#InputValue').val(),'lstbValueList')" /></dd>
        </dl>
        <center style=" clear:both;"><asp:Button ID="btnSave" OnClientClick="setLabelVarValue('lstbValueList')" runat="server" OnClick="Save" Text="保存变量值" />&nbsp;&nbsp;&nbsp;<input type="button"  onclick="parent.Closed()" value="关 闭"/></center>
        
    </div>
    <asp:HiddenField ID="hdnLabelVarValue" runat="server" />
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>

