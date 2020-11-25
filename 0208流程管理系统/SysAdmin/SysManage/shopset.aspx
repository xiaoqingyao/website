<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shopset.aspx.cs" Inherits="KingTop.WEB.SysAdmin.SysManage.shopset" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <style type="text/css">
        .container dl dt{ width:300px;}
    </style>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
                <dl>
                    <dt width="30%"><b>购物车是否显示编号：</b></dt>
                    <dd width="70%"><input type="radio" id="radIsShowNo0" name="radIsShowNo" value="1" checked runat="server"/> 是 
                    <input type="radio" id="radIsShowNo1" name="radIsShowNo" value="0" runat="server"/> 否</dd>
                </dl>
                <dl>
                    <dt width="30%"><b>购物车是否显示积分：</b></dt>
                    <dd width="70%"><input type="radio" id="radIsCartShowIntegral0" name="radIsCartShowIntegral" value="1" checked runat="server"/> 是 
                    <input type="radio" id="radIsCartShowIntegral1" name="radIsCartShowIntegral" value="0" runat="server"/> 否</dd>
                </dl>
                <dl>
                    <dt width="30%"><b>购物车是否显示属性：</b> </dt>
                    <dd width="70%">
                    <input type="radio" id="radIsCartShowProperty0" name="radIsCartShowProperty" value="1" checked runat="server"/> 是 
                    <input type="radio" id="radIsCartShowProperty1" name="radIsCartShowProperty" value="0" runat="server"/> 否
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>购物车是否显示商品名称方式：</b> </dt>
                    <dd width="70%">
                    <input type="radio" id="radCartShowGoodsStyle2" name="radCartShowGoodsStyle" value="2" checked runat="server"/> 图片+文字
                    <input type="radio" id="radCartShowGoodsStyle0" name="radCartShowGoodsStyle" value="0" runat="server"/> 只显示图片 
                    <input type="radio" id="radCartShowGoodsStyle1" name="radCartShowGoodsStyle" value="1" runat="server"/> 只显示文字 
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>市场价比例：</b><br />请填写数字，可以是小数<br />计算方式为：市场价=商城价*比例 </dt>
                    <dd width="70%">
                    <asp:TextBox ID="txtMarketRatio" runat="server" MaxLength="4" CssClass="validate[required,custom[Decimal]]"></asp:TextBox>
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>积分换算比例：</b><br />请填写数字，商品积分=商城价*比例/100 </dt>
                    <dd width="70%">
                    <asp:TextBox ID="txtIntegralConversionRatio" runat="server" MaxLength="4" CssClass="validate[required,custom[onlyNumber]]"></asp:TextBox>
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>积分支付比例：</b><br />请填写数字，积分换购=订单价*比例/100 </dt>
                    <dd width="70%">
                    <asp:TextBox ID="txtIntegralPayRatio" runat="server" MaxLength="4" CssClass="validate[required,custom[onlyNumber]]"></asp:TextBox>
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>商品默认图片：</b> </dt>
                    <dd width="70%">
                    <asp:TextBox ID="txtGoodsDefaultImg" runat="server"></asp:TextBox>
                    </dd>
                </dl>
        </div> 
        <div class="Submit" style="padding-left:300px;">
        <asp:Button Text="保存设置" CssClass="subButton" ID="btnSave" runat="server" onclick="btnSave_Click" />
        </div>            
    </div>
    </form>
</body>
</html>
