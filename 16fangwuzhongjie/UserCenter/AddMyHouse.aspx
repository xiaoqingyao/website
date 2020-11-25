<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMyHouse.aspx.cs" Inherits="houseIntermediaryMIS.UserCenter.AddMyHouse" %>

<%@ Register TagPrefix="UCtrl" TagName="MyLeft" Src="../UserControls/MyLeftCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="../UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="../UserControls/FootCtrl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加房源信息</title>
    <script type="text/javascript" language="javascript">
<!--
    function CheckInput() {
        with (document.Form1) {
            if (ddlArea.value == 0) {
                alert("请选择所在地区！");
                ddlArea.focus();
                return false;
            }
            if (dropIsAgency.value == 0) {
                alert("请选择信息类别！");
                dropIsAgency.focus();
                return false;
            }
            if (Addr.value == '') {
                alert("请输入社区地址！");
                Addr.focus();
                return false;
            }

            if (ddlHouseType.value == 0) {
                alert("请选择房源类型！");
                ddlHouseType.focus();
                return false;
            }

            if (dropFYHX.value == "未提供") {
                alert("请选择房源户型！");
                dropFYHX.focus();
                return false;
            }

            if (LinkMan.value == "") {
                alert("请输入联系人！");
                LinkMan.focus();
                return false;
            }

            if (Tel1.value == "") {
                alert("请输入联系电话1！");
                Tel1.focus();
                return false;
            }

            if (dropExpire.value == 0) {
                alert("请选择有限期！");
                dropExpire.focus();
                return false;
            }
        }  //end with
    }

    //只能为大于或等于0的数字
    function Isvalidity(val, name) {
        if (val.value != '' && (isNaN(val.value) || val.value < 0)) {
            alert(name + "应填有效数字！");
            val.value = "";
            val.focus();
        }
    }

    //只能为不等于0的数字
    function Isval(val, name) {
        if (val.value != '' && (isNaN(val.value) || val.value == 0)) {
            alert(name + "应填有效数字！");
            val.value = "";
            val.focus();
        }
    }
    function check_email(address) {
        if ((address.value != "") && ((address.value.indexOf('@') == -1)
|| (address.value.indexOf('.') == -1))) {
            alert("E-mail格式不对！");
            address.focus();
        }
    }

    //-->
    </script>
</head>
<body leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <UCtrl:Head ID="Head1" runat="server"></UCtrl:Head>
        <table id="table1" width="900" align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top" width="180">
                    <UCtrl:MyLeft ID="MyLeft1" runat="server"></UCtrl:MyLeft>
                </td>
                <td valign="top">
                    <!--添加数据开始-->
                    <table cellspacing="1" cellpadding="1" width="100%" align="center" border="0" style="font-size: 14px">
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">发布
                            <%=strType%>
                            信息
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <font color="Red">*</font>所在地区：
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlArea" runat="server">
                                </asp:DropDownList>
                                &nbsp; *信息类型<select id="dropIsAgency" name="dropIsAgency" runat="server">
                                    <option value="0" selected>请选择...</option>
                                    <option value="1">个人信息</option>
                                    <option value="2">中介信息</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <font color="Red">*</font>房源地址：
                            </td>
                            <td>
                                <asp:TextBox ID="Addr" runat="server" Width="220px"></asp:TextBox>
                                <span style="font-size: 14px">（请填写小区名或路段）</span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <font color="Red">*</font>房源类型：
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlHouseType" runat="server">
                                </asp:DropDownList>
                                &nbsp; 朝向<select id="dropDirection" name="dropDirection" runat="server">
                                    <option value="未提供" selected>-</option>
                                    <option value="东">东</option>
                                    <option value="南">南</option>
                                    <option value="西">西</option>
                                    <option value="北">北</option>
                                    <option value="北">东北</option>
                                    <option value="北">西北</option>
                                    <option value="北">东南</option>
                                    <option value="北">西南</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <font color="Red">*</font>房源户型：
                            </td>
                            <td>
                                <select id="dropFYHX" name="dropFYHX" runat="server">
                                    <option value="未提供" selected>-</option>
                                    <option value="一居室">一居室</option>
                                    <option value="二居室">二居室</option>
                                    <option value="三居室">三居室</option>
                                    <option value="四居室">四居室</option>
                                    <option value="其它">其它</option>
                                </select>
                                装修情况<select id="dropZXQK" name="dropZXQK" runat="server">
                                    <option value="未提供" selected>-</option>
                                    <option value="毛坯房">毛坯房</option>
                                    <option value="一般装修">一般装修</option>
                                    <option value="中档装修">中档装修</option>
                                    <option value="精装修">精装修</option>
                                    <option value="新装修">新装修</option>
                                    <option value="豪华装修">豪华装修</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">楼 层：
                            </td>
                            <td>第<asp:TextBox ID="Floor1" onblur="Isval(Floor1,'楼 层')" runat="server" Width="40px"></asp:TextBox>层（若是地下室，请填负数。如：-1）&nbsp;&nbsp;&nbsp;共<asp:TextBox
                                ID="Floor2" onblur="Isvalidity(Floor2,'总层数')" runat="server" Width="40px"></asp:TextBox>
                                层
                            </td>
                        </tr>
                        <tr>
                            <td align="right">面积：
                            </td>
                            <td>
                                <asp:TextBox ID="Square" onblur="Isvalidity(Square,'面积')" runat="server" Width="56px"></asp:TextBox>平方米&nbsp;&nbsp;
                            <asp:Label ID="lblPrice1" runat="server">租价</asp:Label><asp:TextBox ID="Price" onblur="Isvalidity(Price,'价格')"
                                runat="server" Width="56px"></asp:TextBox>
                                <asp:Label ID="lblPrice2" runat="server" Text="">元</asp:Label>&nbsp;(价格面议请输入0)
                            </td>
                        </tr>
                        <tr>
                            <td align="right">基础设施：
                            </td>
                            <td>
                                <input type="checkbox" checked value="水" name="chkJCSS" />
                                水
                            <input type="checkbox" checked value="电" name="chkJCSS" />
                                电
                            <input type="checkbox" value="煤气/天然气" name="chkJCSS" />
                                煤气/天然气
                            <input type="checkbox" value="暖气" name="chkJCSS" />
                                暖气
                            <input type="checkbox" value="有线电视" name="chkJCSS" />
                                有线电视
                            <input type="checkbox" value="宽带" name="chkJCSS" />
                                宽带
                            </td>
                        </tr>
                        <tr>
                            <td align="right">配套设施：
                            </td>
                            <td>
                                <input type="checkbox" checked value="电话" name="chkPTSS" />
                                电话
                            <input type="checkbox" value="热水淋浴器" name="chkPTSS" />
                                热水淋浴器
                            <input type="checkbox" value="彩电" name="chkPTSS" />
                                彩电
                            <input type="checkbox" value="空调" name="chkPTSS" />
                                空调
                            <input type="checkbox" value="冰箱" name="chkPTSS" />
                                冰箱
                            <input type="checkbox" value="洗衣机" name="chkPTSS" />
                                洗衣机<br />
                                <input type="checkbox" value="家具" name="chkPTSS" />
                                家具
                            </td>
                        </tr>
                        <tr>
                            <td align="right">交通情况：
                            </td>
                            <td>
                                <asp:TextBox ID="JTQK" runat="server" Width="250px"></asp:TextBox><span style="font-size: 14px">（公交地铁等线路）</span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="20%">备 注：
                            </td>
                            <td valign="top" align="left">
                                <span style="font-size: 14px">（可填写其它个人要求，字数不超过500字。）</span><br />
                                <asp:TextBox ID="Other" runat="server" Width="480px" TextMode="MultiLine" Height="70"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="20%">图片附件：</td>
                            <td valign="top" align="left">
                                <asp:FileUpload ID="filePic" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="20%">图片附件2：</td>
                            <td valign="top" align="left">
                                <asp:FileUpload ID="filePic2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="20%" colspan="2">联系人信息
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="20%">
                                <font color="Red">*</font>联 系 人：
                            </td>
                            <td valign="top" align="left">
                                <asp:TextBox ID="LinkMan" runat="server"></asp:TextBox>&nbsp;&nbsp; E-mail<asp:TextBox
                                    ID="Email" onblur="check_email(Email)" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="20%">
                                <font color="Red">*</font>联系电话1：
                            </td>
                            <td valign="top" align="left" height="32">
                                <asp:TextBox ID="Tel1" runat="server"></asp:TextBox>&nbsp;&nbsp; 联系电话2<asp:TextBox
                                    ID="Tel2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="20%">
                                <font color="Red">*</font>有效期：
                            </td>
                            <td valign="top" align="left" height="32">
                                <select id="dropExpire" size="1" name="dropExpire" runat="server">
                                    <option value="0" selected>请选择...</option>
                                    <option value="1">1天</option>
                                    <option value="3">3天</option>
                                    <option value="5">5天</option>
                                    <option value="7">7天</option>
                                    <option value="15">15天</option>
                                    <option value="30">1个月</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="20%" colspan="2">
                                <asp:Button ID="btnSubmit" runat="server" Text=" 提 交 " OnClientClick="return CheckInput()" OnClick="btnSubmit_Click"></asp:Button>
                                <input type="reset" value="重 写" />
                                <asp:LinkButton ID="lkbReturn" runat="server" OnClick="lkbReturn_Click">返回</asp:LinkButton>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="2" style="padding-left: 50px;">
                                <asp:Label ID="lbErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <!--添加数据开始-->
                </td>
            </tr>
        </table>
        <UCtrl:Foot ID="Foot1" runat="server"></UCtrl:Foot>
    </form>
</body>
</html>
