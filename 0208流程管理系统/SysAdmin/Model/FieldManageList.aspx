<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldManageList.aspx.cs"   Inherits="AllPower.Web.Admin.FieldManageList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>ģ���ֶ��б�</title>
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
        <script type="text/javascript">
            $(function() {
            $("#btnNew").click(function() { location.href = "FieldManageEdit.aspx?action=add&<%= urlParam%>"; })
                $("body").find("input").each(function() {
                    if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                        $(this).click(function() { location.href = "FieldManageEdit.aspx?action=edit&id=" + $(this).attr("RecordID") + "&<%= urlParam%>"; })
                    }
                });
            });
</script>
</head>
<body >
    <form name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" />
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
            <li style=" width:38%; float:left; text-align:left;">    
                <input type="button" value="��ʾȫ��" onclick="location.href='?ModelID=<%=ModelID %>&TableName=<%=TableName %>&NodeCode=<%=NodeCode %>&ModelName=<%=ModelName %>&IsSub=<%=IsSub %>'" />
                <input type="button" value="����վ"  onclick="location.href='?IsDel=1&ModelID=<%=ModelID %>&TableName=<%=TableName %>&IsSub=<%=IsSub %>'" />
                <input type="button"  value="ˢ��" onclick="javascript:location.href=location.href;">
                <input type="button" value="����" onclick="javascript:location.href='ModelManageList.aspx?NodeCode=<%=NodeCode %>&IsSub=<%=IsSub %>';">
            </li>
            <li style="width:58%; float:left; text-align:right;">
                <input type="button"  value="�����ֶ�" onclick="javascript:location.href='FieldManageEdit.aspx?<%=urlParam %>';">
                <input type="button" value="��������" onclick="location.href='ModelListConfig.aspx?ID=<%=ModelID %>&RefUrl=FieldManageList.aspx&TableName=<%=TableName %>&NodeCode=<%=NodeCode %>&IsSub=<%=IsSub %>'" />
                <input type="button" value="�Ƽ�����" onclick="openframe({url:'RecommendAreaSet.aspx?ID=<%=ModelID %>&NodeCode=<%=NodeCode %>&ModelName=<%=ModelName %>',width:'600', height:'300'})" />
                <input type="button" value="�������" onclick="javascript:location.href='ModelFieldGroupList.aspx?<%= urlParam%>';">
               <asp:Button ID="btnCreateModel"  OnCommand="CreateModel" runat="server" Text="����ģ��"></asp:Button>
            </li>
        </ul>
        </div>
        <ul class="ulheader">
            <li style="width:100px;"><a href="javascript:sort('Name')">�ֶ���</a></li>
            <li style="width:100px;">����</li>
            <li style="width:110px;"><a href="javascript:sort('ModelFieldGroupId')">��������</a></li>
            <li style="width:80px;"><a href="javascript:sort('BasicField')">�ֶ�����</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsSystemFiierd')">ϵͳ</a></li>
            <li  style="width:60px;"><a href="javascript:sort('IsSearch')">������ʾ</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsListEnable')">�б���ʾ</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsInputValue')">�༭��ʾ</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsEnable')">״̬</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsRequired')">����</a></li>
            <li style="width:50px;"><a href="javascript:sort('Orders')">����</a></li>
            <li  style="width:100px;">����</li>
         </ul>
         <div id="FiledManageList">
        <asp:Repeater ID="rptModelField" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody" onmouseover="$(this).addClass('rowSelected')" onmouseout="$(this).removeClass('rowSelected')">
                    <li style="width:100px;"><span id="Title<%# Eval("ID")%>"><%#Eval("Name") %></span></li>
                    <li style="width:100px;"><%#Eval("FieldAlias")%></li>
                    <li style="width:110px; text-align:center;" id="HQB_FileGroup_<%#Eval("ID") %>"><div style=" display:none;" ></div><span><%#fieldManage.FieldGroupHtml.Replace("{#Selected#}", Eval("ModelFieldGroupId").ToString()).Replace("{#ID#}", Eval("ID").ToString())%></span></li>
                    <li style="width:80px;"><%#fieldManage.BasicType[Eval("BasicField")]%></li>
                    <li style="width:40px; color:Red;"><%#AllPower.Common.Utils.ParseModelFieldState(Eval("IsSystemFiierd"), "")%></li>
                    <li  style="width:60px;">
                        <asp:LinkButton ID="LinkButton4"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsSearch").ToString()%>' CommandName="ISSEARCH" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsSearch"), "��")%></asp:LinkButton>&nbsp;
                        <a title="������������������" href="javascript:openConfig('1','<%#Eval("ID") %>')">����</a>
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton3"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsListEnable").ToString()%>' CommandName="ISLIST" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsListEnable"), "��")%></asp:LinkButton>
                        &nbsp;<a title="��������б����������" href="javascript:openConfig('2','<%#Eval("ID") %>')">����</a>
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton5"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsInputValue").ToString()%>' CommandName="ISEDIT" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsInputValue"), "��")%></asp:LinkButton>
                        &nbsp;<a title="������ñ༭ҳ�������" href="javascript:openConfig('3','<%#Eval("ID") %>')">����</a>
                    </li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton2"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"״̬����")%></asp:LinkButton></li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton1"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRequired").ToString()%>' CommandName="REQUIRED" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsRequired"), "��")%></asp:LinkButton>
                   </li>
                    <li style="width:50px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_ModelField', '<%#Eval("ID") %>', this.value)" /></span></li>
                    <li  style="width:100px;">
                        <%if (IsDel == "0" || IsDel == "")
                          { %>
                        <input type="button" value="�޸�"��id="btnEdit"��runat="server" BtnType="edit"  RecordID='<%#Eval("ID") %>' />
                        <asp:Button ID="btnDelete" runat="server"��OnCommand="FieldManage_Del" CommandName="DELONE" Enabled='<%#!Convert.ToBoolean(Eval("IsSystemFiierd")) %>' CommandArgument='<%#Eval("ID") %>'  OnClientClick="return reConfirm(this,'ȷ��Ҫɾ������ֶ�������վ��?');" RecordID='<%#Eval("ID") %>' Text="ɾ��"></asp:Button>
                            <%}
                          else
                          { %>
                          <span>
                        <asp:Button ID="btnRevert" runat="server" OnCommand="FieldManage_Del" CommandName="REVERT" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("ȷ����ԭ����ֶ���?")' Text="��ԭ"></asp:Button>
                           <asp:Button runat="server" OnCommand="FieldManage_Del" CommandName="DELDP" Enabled='<%#!Convert.ToBoolean(Eval("IsSystemFiierd")) %>' CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("ȷ��Ҫ����ɾ������ֶ���?")' Text="ɾ��"></asp:Button>
                            </span>
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
        </ul>
    <asp:hiddenfield ID="hdnUrlParm" runat="server"></asp:hiddenfield>
    <input type="hidden" id="IsListPage"  value="1"/>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>

