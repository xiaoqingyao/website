<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonFieldList.aspx.cs"   Inherits="KingTop.Web.Admin.CommonFieldList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>���Ź���</title>
        <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
        <script type="text/javascript" src="../js/publicform.js"></script>
        <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery.dialog.js"></script>
        <script type="text/javascript" src="../js/win.js"></script>
        <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/Common.js"></script>
         <script src="../JS/FieldManage.js" type="text/javascript"></script>
         <style type="text/css">.rowSelected{background-color:#efefef;} a{color:#000000;}</style>
</head>
<body >
    <form name="theForm" method="post" runat="server">
    <div class="container">
        <h4>
            ��ǰλ�ã� <%GetPageNav(NodeCode);%></h4>
            <div id="searchContainer">
            <span>
                <asp:DropDownList ID="ddlSearchType" runat="server">
                    <asp:ListItem Text="����" Value="[Name]"></asp:ListItem>
                    <asp:ListItem Text="����" Value="[FieldAlias]"></asp:ListItem>
                </asp:DropDownList>
            </span>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="�� ��"  OnClick="btnSearch_Click" />
        </div>
        <div class="function">
        <ul style=" list-style:none; height:25px;">
            <li>    
                <%if (IsDel == "0" || IsDel == ""){ %><input type="button"  value="�����ֶ�" onclick="javascript:location.href='CommonFieldEdit.aspx?<%=urlParam %>';"><%} %>
                <input type="button" value="��ʾȫ��" onclick="location.href='?NodeCode=<%=NodeCode %>'" />
                <input type="button" value="����վ" onclick="location.href='?IsDel=1'" style=" display:none;" />
                <input type="button"  value="ˢ��" onclick="javascript:location.href=location.href;">
            </li>
        </ul>
        </div>
        <ul class="ulheader">
            <li style="width:180px;"><a href="javascript:sort('Name')">�ֶ���</a></li>
            <li style="width:200px;">����</li>
            <li style="width:80px;"><a href="javascript:sort('BasicField')">�ֶ�����</a></li>
            <li  style="width:60px;"><a href="javascript:sort('IsSearch')">������ʾ</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsListEnable')">�б���ʾ</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsInputValue')">�༭��ʾ</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsEnable')">״̬</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsRequired')">����</a></li>
            <li style="width:50px;"><a href="javascript:sort('Orders')">����</a></li>
             <li style="width:80px;"><a href="javascript:sort('IsDefault')">Ĭ�Ϲ���</a></li>
            <li  style="width:100px;">����</li>
         </ul>
         <div id="FiledManageList">
        <asp:Repeater ID="rptModelField" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody" onmouseover="$(this).addClass('rowSelected')" onmouseout="$(this).removeClass('rowSelected')">
                    <li style="width:180px;"><%#Eval("Name") %></li>
                    <li style="width:200px;"><%#Eval("FieldAlias")%></li>
                    <li style="width:80px;"><%#commonField.BasicType[Eval("BasicField")]%></li>
                    <li  style="width:60px;">
                        <asp:LinkButton ID="LinkButton4" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsSearch").ToString()%>' CommandName="ISSEARCH" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsSearch"), "��")%></asp:LinkButton>&nbsp;
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton3" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsListEnable").ToString()%>' CommandName="ISLIST" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsListEnable"), "��")%></asp:LinkButton>
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton5" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsInputValue").ToString()%>' CommandName="ISEDIT" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsInputValue"), "��")%></asp:LinkButton>
                    </li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#KingTop.Common.Utils.ParseState(Eval("IsEnable"),"״̬����")%></asp:LinkButton></li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton1" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRequired").ToString()%>' CommandName="REQUIRED" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsRequired"), "��")%></asp:LinkButton>
                   </li>
                    <li style="width:50px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_ModelCommonField', '<%#Eval("ID") %>', this.value)" /></span></li>
                    <li style="width:80px;">
                        <asp:LinkButton ID="LinkButton6" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsDefault").ToString()%>' CommandName="ISDEFAULT" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsDefault"), "��")%></asp:LinkButton>
                    </li>
                    <li  style="width:100px;">
                        <%if (IsDel == "0" || IsDel == "")
                          { %>
                        
                        <input type="button" value="�޸�" id="btnEdit"  onclick="location.href='CommonFieldEdit.aspx?action=edit&id=<%# Eval("ID")%>&<%= urlParam%>'"/>
                        <asp:Button ID="btnLogicDelete" runat="server" OnCommand="CommonField_Del" CommandName="DELONE"  CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("ȷ��Ҫɾ������ֶ�������վ��?")' Text="ɾ��"></asp:Button>
                            <%}
                          else
                          { %>
                        <asp:Button ID="btnRevert" runat="server" OnCommand="CommonField_Del" CommandName="REVERT" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("ȷ����ԭ����ֶ���?")' Text="��ԭ"></asp:Button>
                           <asp:Button ID="btnDelete" runat="server" OnCommand="CommonField_Del" CommandName="DELDP"  CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("ȷ��Ҫ����ɾ������ֶ���?")' Text="ɾ��"></asp:Button>
                             <%} %>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        </div>
    </div>
<ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>    <asp:hiddenfield ID="hdnUrlParm" runat="server"></asp:hiddenfield>
    <input type="hidden" id="IsListPage"  value="1"/>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>

