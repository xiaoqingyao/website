<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LableClassList.aspx.cs" validateRequest="false"
    Inherits="AllPower.WEB.SysAdmin.Template.LableClassList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/Common.js"></script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container" id="_ListInfoListTable">
        <h4>
            λ�ã� <a href="TemplateList.aspx">ģ�����</a> > <a href="LableClassList.aspx">��ǩ����</a>
            > <span style="color: Blue">��ǩ����</span></h4>
        <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
        <div class="function">
        <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnAdd_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="ɾ������" OnClientClick="selfconfirm({msg:'ɾ��ͬʱ������µı�ǩҲ�ᱻɾ����ȷ��ɾ����',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 5%;">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
            </li>
            <li style="width: 30%;">��������</li>
            <li style="width: 15%;">������վ</li>
            <li style="width: 12%;">���ʱ��</li>
            <li style="width: 18%;">˵��</li>
            <li style="width: 15%;">����</li>
        </ul>
        <div id="HQB_ListInfo" style="padding: 0; margin: 0;">
            <asp:Repeater ID="rptListInfo" runat="server" OnItemDataBound="rptListInfo_ItemDataBound">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 5%;">
                            <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ClassID")%>' />
                            <li style="width: 30%;"><span id='Title<%#Eval("ClassID") %>'>
                                <%#Eval("ClassName")%></span></li>
                            <li style="width: 15%;">
                                <%#Eval("SiteName") %></li>
                            <li style="width: 12%;">
                                <%#Eval("AddDate")%></li>
                            <li style="width: 18%;">
                                <%#Eval("Description")%></li>
                            <li style="width: 15%;">
                                <asp:LinkButton ID="lbtnDelete" CommandArgument='<%#Eval("ClassID") %>' Text="<%$ Resources:Common,Del%>"
                                    runat="server" CssClass="abtn" OnClientClick='<%# ("selectThisRow();selfconfirm({msg:\"ɾ��ͬʱ������µı�ǩҲ�ᱻɾ����ȷ��ɾ����\",fn:function(data){setAction(data)}});return false;")%>'></asp:LinkButton>
                                <asp:LinkButton runat="server" Text="�޸�" CommandArgument='<%#Eval("ClassId")%>' class="abtn"
                                    CommandName='<%#Eval("IsSystem")%>' OnCommand="lbtnEdit_Click" ID="lbtnEdit"></asp:LinkButton>                              
                            </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
            <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True" UrlPaging="true"
                ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>" 
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
        </div>
    </form>
    
</body>
</html>
