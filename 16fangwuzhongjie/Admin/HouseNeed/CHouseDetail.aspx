﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="CHouseDetail.aspx.cs" Inherits="houseIntermediaryMIS.Admin.HouseNeed.CHouseDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 138px;
        }
        .style3
        {
            width: 244px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="plShowHouse" runat="server">
        <table bordercolor="#e3e3e3" cellspacing="0" bordercolordark="#ffffff" cellpadding="0"
            width="100%" align="center" border="1" id="table1" style=" font-size:14px; padding-left:15px" >
            <tr>
                <td align="center" colspan="3" height="22" style=" font-size:16px">
                    <strong>房 源 信 息</strong>
                </td>
            </tr>
            <tr>
                <td align="right" width="19%" height="22">
                    <font color="#999999">房源编号：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblId" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">信息类型：</font>
                </td>
                <td colspan="2" valign="middle" height="22">
                    <asp:Label ID="lblType" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="19%" align="right" height="22">
                    <font color="#999999">区域位置：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblArea" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">房源地址：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblAddr" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">房源类型：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblHouseType" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">房源户型：</font>
                </td>
                <td width="37%" height="22">
                    <asp:Label ID="lblFYHX" runat="server"></asp:Label>
                </td>
                <td height="22">
                    <img height="8" width="8" border="0"><font color="#999999">朝向：
                        <asp:Label ID="lblDirection" runat="server"></asp:Label></font>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">楼 层：</font>
                </td>
                <td width="37%" height="22">
                    <asp:Label ID="lblFloor" runat="server"></asp:Label>
                </td>
                <td width="42%" height="22">
                    <img height="8" width="8" border="0"><font color="#999999">装修情况：
                        <asp:Label ID="lblZXQK" runat="server"></asp:Label></font>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">面积：</font>
                </td>
                <td width="37%" height="22">
                    <asp:Label ID="lblSquare" runat="server"></asp:Label>
                </td>
                <td height="22">
                    <img height="8" width="8" border="0">
                    <font color="#999999">
                        <asp:Label ID="lblPriceType" runat="server"></asp:Label>
                        <asp:Label ID="lblPrice" runat="server"></asp:Label></font>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">基础设施：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblJCSS" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">配套设施：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblPTSS" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">交通情况：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblJTQK" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">备 注：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Label ID="lblOther" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td align="right" height="22">
                    <font color="#999999">图片1：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Image runat="server" ID="pic1" />
                </td>
            </tr>
             <tr>
                <td align="right" height="22">
                    <font color="#999999">图片2：</font>
                </td>
                <td colspan="2" height="22">
                    <asp:Image runat="server" ID="pic2" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center" height="22">
                    <b>联 系 人 信 息</b>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">联 系 人：</font>
                </td>
                <td width="37%" height="22">
                    <asp:Label ID="lblLinkMan" runat="server"></asp:Label>
                </td>
                <td height="22">
                    <img height="8" width="8" border="0">
                    <font color="#999999">E-mail: </font>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">联系电话1：</font>
                </td>
                <td width="37%" height="22">
                    <asp:Label ID="lblTel1" runat="server"></asp:Label>
                </td>
                <td height="22">
                    <img height="8" width="8" border="0">
                    <font color="#999999">联系电话2:
                        <asp:Label ID="lblTel2" runat="server"></asp:Label></font>
                </td>
            </tr>
            <tr>
                <td align="right" height="22">
                    <font color="#999999">有效期：</font>
                </td>
                <td width="37%" height="22">
                    <asp:Label ID="lblExpire" runat="server"></asp:Label>
                </td>
                <td height="22">
                    <img height="8" width="8" border="0">&nbsp;<font color="#999999">发布时间: </font>
                    <asp:Label ID="lblAddTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:RadioButtonList ID="rblCheckYesOrNo" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                        CellPadding="5" 
                        onselectedindexchanged="rblCheckYesOrNo_SelectedIndexChanged">
                        <asp:ListItem Value="1">通过</asp:ListItem>
                        <asp:ListItem Value="0">审核中</asp:ListItem>
                        <asp:ListItem Value="-1">不通过</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:TextBox ID="txtWhy" runat="server" TextMode="MultiLine" Height="60px"  Visible="false"
                        Width="280px"></asp:TextBox>
                </td>
                <td height="45">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="style3" >
                               <span style=" color:Red"> <asp:Label ID="lbMore" runat="server" Text=""></asp:Label></span>
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:Button ID="lbkCheckConfirm" runat="server" Font-Size="15px" 
                                    Text="提交审核结果" Height="33px" Width="100px" 
                                    onclick="lbkCheckConfirm_Click" />
                                <asp:LinkButton ID="lkbModify" runat="server" onclick="lkbModify_Click">去修改</asp:LinkButton>
                                <a href="#"></a>&nbsp;<a href="javascript:window.print();">打印</a>&nbsp;<a href="javascript:window.close();">关闭</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </tr> </table>
    </asp:Panel>
    <asp:Panel ID="plEditHouse" runat="server" Visible="false">
        <table cellspacing="1" cellpadding="1" width="100%" align="center" border="0" style="font-size: 14px">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2"> 
                审核 <%=strType%> 信息
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
                        <option value="0">请选择...</option>
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
                    <asp:TextBox ID="Addr" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
                    (请填写小区名或路段）
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
                        <option value="未提供">-</option>
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
                        <option value="未提供">-</option>
                        <option value="一居室">一居室</option>
                        <option value="二居室">二居室</option>
                        <option value="三居室">三居室</option>
                        <option value="四居室">四居室</option>
                        <option value="其它">其它</option>
                    </select>&nbsp; 装修情况<select id="dropZXQK" name="dropZXQK" runat="server">
                        <option value="未提供">-</option>
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
                <td align="right">
                    楼 层：
                </td>
                <td>
                    第<asp:TextBox ID="Floor1" onblur="Isval(Floor1,'楼 层')" runat="server" Width="40px"></asp:TextBox>层（若是地下室，请填负数。如：-1）&nbsp;&nbsp;&nbsp;共<asp:TextBox
                        ID="Floor2" onblur="Isvalidity(Floor2,'总层数')" runat="server" Width="40px"></asp:TextBox>
                    层
                </td>
            </tr>
            <tr>
                <td align="right">
                    面积：
                </td>
                <td>
                    <asp:TextBox ID="Square" onblur="Isvalidity(Square,'面积')" runat="server" Width="56px"></asp:TextBox>平方米&nbsp;&nbsp;
                    <asp:Label ID="lblPrice1" runat="server">租价</asp:Label>
                    <asp:TextBox ID="Price" onblur="Isvalidity(Price,'价格')" runat="server" Width="56px"></asp:TextBox>&nbsp;
                    <asp:Label ID="lblPrice2" runat="server">元</asp:Label>(价格面议请输入0)
                </td>
            </tr>
            <tr>
                <td align="right">
                    基础设施：
                </td>
                <td>
                    <asp:CheckBoxList ID="cblJCSS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="水">水&amp;nbsp;</asp:ListItem>
                        <asp:ListItem Value="电">电&amp;nbsp;</asp:ListItem>
                        <asp:ListItem Value="煤气/天然气">煤气/天然气&amp;nbsp;</asp:ListItem>
                        <asp:ListItem Value="暖气">暖气&amp;nbsp;</asp:ListItem>
                        <asp:ListItem Value="有线电视">有线电视&amp;nbsp;</asp:ListItem>
                        <asp:ListItem Value="宽带">宽带&amp;nbsp;</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    配套设施：
                </td>
                <td>
                    <p>
                        <asp:CheckBoxList ID="cblPTSS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="电话">电话&amp;nbsp;</asp:ListItem>
                            <asp:ListItem Value="热水淋浴器">热水淋浴器&amp;nbsp;</asp:ListItem>
                            <asp:ListItem Value="彩电">彩电&amp;nbsp;</asp:ListItem>
                            <asp:ListItem Value="空调">空调&amp;nbsp;</asp:ListItem>
                            <asp:ListItem Value="冰箱">冰箱&amp;nbsp;</asp:ListItem>
                            <asp:ListItem Value="洗衣机&amp;nbsp;">洗衣机&amp;nbsp;</asp:ListItem>
                            <asp:ListItem Value="家具">家具&amp;nbsp;</asp:ListItem>
                        </asp:CheckBoxList>
                    </p>
                </td>
            </tr>
            <tr>
                <td align="right">
                    交通情况：
                </td>
                <td>
                    <asp:TextBox ID="JTQK" runat="server" Width="220px"></asp:TextBox>
                    (<span style="font-size: 14px">公交地铁等线路</span>)
                </td>
            </tr>
            <tr>
                <td align="right" width="20%" rowspan="2">
                    备 注：
                </td>
                <td valign="top" align="left">
                    （可填写其它个人要求，字数不超过200字）<br />
                    <asp:TextBox ID="Other" runat="server" Height="70" Width="450px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" width="20%">
                    联系人信息
                </td>
            </tr>
            <tr>
                <td align="right" width="20%">
                    <font color="Red">*</font>联 系 人：
                </td>
                <td valign="top" align="left">
                    <asp:TextBox ID="LinkMan" runat="server"></asp:TextBox>&nbsp;&nbsp; E-mail<asp:TextBox
                        ID="Email" runat="server" onblur="check_email(Email)"></asp:TextBox>
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
                        <option value="0">请选择...</option>
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
                    <asp:Button ID="btnSubmit" runat="server" Text="保存修改" OnClick="btnSubmit_Click">
                    </asp:Button>&nbsp;
                    <input type="reset" value=" 复 原 " />
                    <asp:LinkButton ID="lkbReturn" runat="server" OnClick="lkbReturn_Click">返回</asp:LinkButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
