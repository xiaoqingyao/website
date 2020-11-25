<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.Address" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>采集地址</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
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
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(pageInitAddress);
    </script>
    <style type="text/css">.container dl dd{margin-right:8px;} .CollectionAddress  input{margin-bottom:10px;}</style>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
    <h4>位置： <a href="#">信息采集</a> > <a href="#">采集任务编辑</a></h4> 
    <dl><dd style="color:Red;">注意：地址必须以http://开头</dd></dl>
        <dl>
            <dd>
            <table  class="CollectionAddress">
            <tr>
                <td valign="top">
                     <asp:ListBox ID="lstbCollectionAddress" Width="680" Height="230" SelectionMode="Multiple" ondblclick="return AddressItemModify('lstbCollectionAddress')" runat="server"></asp:ListBox>
                </td>
                <td valign="top" style=" padding-left:5px; padding-top:15px; text-align:center;">
                    <input type="button" onclick="AddressItemAdd('lstbCollectionAddress')" value=" 添 加 " /><br />
                    <input type="button" onclick="AddressRemoveAll('lstbCollectionAddress')" value=" 清 除 " /><br />
                    <input type="button" value="修改选中" onclick="AddressItemModify('lstbCollectionAddress')" /><br />
                    <input type="button" value="删除选中" onclick="AddressItemDel('lstbCollectionAddress')"/><br />
                    <input type="button" value="向上移动" onclick="UpOrder('lstbCollectionAddress')" /><br />
                    <input type="button" value="向下移动" onclick="DownOrder('lstbCollectionAddress')" /><br />
                </td>
            </tr>
            </table>
        </dd>
        </dl>
        <dl>
             <dt></dt>
             <dd><input type="button" value="批量生成" onclick="CreateAddress(true)" /></dd>
             <dd><input type="button" value="特殊生成"  onclick="CreateAddress(false)" /></dd>
            <dd>使用URL编码</dd>
            <dd><asp:CheckBox ID="chkIsUrlEncode" runat="server" /></dd>
        </dl>
        <div id="CreateBatchAdress" style="display:none;">
            <dl>
                <dd>地址：<input type="text" id="AddressTemplate" style=" width:450px;"  value="http://127.0.0.1/show.asp?id={*}" /> </dd><dd> {*} 为要替换的变量</dd><dd><input type="button" onclick="BatchCreateAddress('lstbCollectionAddress')" value="生 成" /></dd>
            </dl>
            <dl>
                <dd>数字变化范围：<input value="0" type="text" id="BatchAddressStartNumber" class="validate[optional,regex[\d,只能为数字]]" style=" width:50px;" />&nbsp;&nbsp;到&nbsp;&nbsp;<input value="100" class="validate[optional,regex[\d,只能为数字]]"  style=" width:50px;" type="text" id="BatchAddressEndNumber" /></dd>
                <dd>间隔：<input type="text" id="BatchAddressInterval"  class="validate[optional,regex[\d,只能为数字]]" value="1"  style=" width:50px;"/></dd>
                <dd>补零：<input type="checkbox" id="BatchAddressAddZero" /></dd>
            </dl>
        </div>
        <div id="CreateSpecialAdress" style=" display:none;">
            <dl>
                <dd>地址：<input type="text" id="SpecialAddressTemplate" style=" width:450px;"  value="http://127.0.0.1/show.asp?City={$市$}" /> </dd>
                <dd><asp:DropDownList ID="ddlLabelVar"  onchange="loadLabelVarValue(this.value)" runat="server"></asp:DropDownList></dd>
                <dd>&nbsp;&nbsp;<input type="button" onclick="addSpecialAddress('lstbCollectionAddress')" value="生 成" /></dd>
            </dl>
            <dl>
                <dd><textarea style="height:200px; width:490px;" id="SpecialAddress"></textarea></dd>
                <dd id="ddLabelVarValueList" style=" width:180px;border:1px #e7e7e7 solid; height:200px; overflow:auto;line-height:15px;" runat="server"></dd>
            </dl>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" CssClass="subButton" OnClick="Save" runat="server" Text="保 存" />&nbsp;&nbsp;
	        <input class="subButton" type="button" onclick="location.href='TaskList.aspx?page=<%=PageIndex %>'" value="返回" />
        </div>  
      </div>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
