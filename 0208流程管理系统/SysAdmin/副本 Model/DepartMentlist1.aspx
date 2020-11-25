<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartMentlist.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.DepartMentlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>���ҹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<link href="../css/public.css" rel="stylesheet" type="text/css" />
<link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
<link href="../css/dialog.css" rel="stylesheet" type="text/css" />
<script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="../js/listcheck.js"></script>
<script type="text/javascript" src="../js/jquery.dialog.js"></script>
<script type="text/javascript" src="../js/win.js"></script>
<script type="text/javascript" src="../js/publicform.js"></script>
<script language="javascript" type="text/javascript">
    function CheckAll(form) {
        for (var i = 0; i < form.elements.length; i++) {
            var e = form.elements[i];
            if (e.name != 'chkall' && e.disabled != true)
                e.checked = form.chkall.checked;
        }
    }

    function CheckRelease() {
        var IsTrue = 0;
        var obj = document.getElementsByName("cbId");

        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "cbId") {
                if (obj[i].checked == true) {
                    IsTrue = 1;
                    break;
                }
            }
        }
        if (IsTrue == 1) {
            if (confirm("�Ƿ�ȷ��ȷ��ɾ����")) {
                return true;
            } else {
                return false;
            }
        }
        else {
            confirm("��ѡ����Ҫ������ѡ��!");
            return false;

        }
        return false;
    }	
</script>

<script language="javascript" type="text/javascript">
    function CheckAll(form) {
        for (var i = 0; i < form.elements.length; i++) {
            var e = form.elements[i];
            if (e.name != 'chkall' && e.disabled != true)
                e.checked = form.chkall.checked;
        }
    }

    function CheckRelease1() {
        var IsTrue = 0;
        var obj = document.getElementsByName("cbId");

        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "cbId") {
                if (obj[i].checked == true) {
                    IsTrue = 1;
                    break;
                }
            }
        }
        if (IsTrue == 1) {
            return true;

        }
        else {
            confirm("��ѡ����Ҫ������ѡ��!");
            return false;

        }
        return false;
    }	
</script>
<script type="text/javascript">
    function Show(none) {
        if (document.getElementById("div_email").style.display == "none") {
            document.getElementById("div_email").style.display = "block";
            return false;
        }
        else {
            document.getElementById("div_email").style.display = "none";
            return false;
        }
    }
</script>
</head>
<body>
<form id="theForm" runat="server">
 <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
<div class="container">
     <h4>λ�ã� <a href="#">ϵͳ����</a><a> &gt;</a> <a href="#">���ҵ���</a><a> &gt;</a> <span class="breadcrumb_current" > <a href="#">���ҹ���</a></span> </h4>
     
     <div id="searchContainer">
           <p>
                <span>�������ƣ�</span>
         
                <asp:TextBox ID="txtTitle" runat="server" Width="200px" ></asp:TextBox>
                <asp:Button ID="btnSearch"  runat="server" Text="�� ��" onclick="btnSearch_Click"/>
                
            </p>
         </div>
     
     <div class="function">
        <asp:Button ID="btnAdd" runat="server" Text="�� ��" onclick="btnAdd_Click"/>
        <asp:Button ID="btnDelete" runat="server"  Text="ɾ ��" OnClientClick="return CheckRelease();" onclick="btnDelete_Click" />
     </div>                                 
    <ul class="ulheader">
        <li style="width: 5%;">
            <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
        </li>
        <li style="width:150px;">��������    <li style="width:100px;">���Ҹ�����</li>
        <li style="width:60px;">�ٴ�����</li>
        <li style="width:60px;">ҽ������</li>
        <li style="width:60px;">ְ�ܿ���</li>
        <li style="width:60px;">��ɫר��</li>
        <li style="width:60px;">ʡ���ص�</li>
        <li style="width:60px;">��ѯ����</li>
        <li style="width:60px;">�������</li>
        <li style="width:60px;">����</li>
        <li style="width:100px;">�� ��</li>
    </ul>
     
        <asp:Repeater ID="rptMember" runat="server" 
         onitemcommand="rptMember_ItemCommand">
            <ItemTemplate>
               <ul class="ulheader ulbody">
                <li style="width:5%;">
                    <input type="checkbox" id="cbId" name="cbId" value='<%#Eval("ID")%>' />
                    <asp:Label ID="labID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                </li>
                    <li style="width:150px;"><%#Eval("Title")%></li>
                    <li style="width:100px;"><%#Eval("Chief")%></li>
                    <li style="width:60px;"><%#Eval("Islckj").ToString() == "1" ? "<span style=\"color:Red;\">��</span>" : "��"%></li>
                    <li style="width:60px;"><%#Eval("Isyjks").ToString() == "1" ? "<span style=\"color:Red;\">��</span>" : "��"%></li>
                    <li style="width:60px;"><%#Eval("Isznkj").ToString() == "1" ? "<span style=\"color:Red;\">��</span>" : "��"%></li>
                    <li style="width:60px;"><%#Eval("Istszk").ToString() == "1" ? "<span style=\"color:Red;\">��</span>" : "��"%></li>
                    <li style="width:60px;"><%#Eval("IsKey").ToString() == "1" ? "<span style=\"color:Red;\">��</span>" : "��"%></li>               
                    <li style="width:60px;"><%#Eval("Iszixun").ToString() == "1" ? "<span style=\"color:Red;\">��</span>" : "��"%></li>
                    <li style="width:60px;"><%#Eval("Ismenzhen").ToString() == "1" ? "<span style=\"color:Red;\">��</span>" : "��"%></li>
                    <li style="width:60px;">
                    <asp:TextBox ID="txtOrders" name="txtOrders" runat="server" Text='<%#Eval("Orders") %>' AutoPostBack="true" OnTextChanged="txtOrders_TextChanged" Width="50px" Height="15px"></asp:TextBox>
                    </li>
                    <li style="width:100px;">
                    <a href="DepartMentedit.aspx?action=edit&ID=<%#Eval("ID") %>&NodeCode=<%#Eval("NodeCode") %>">�޸�</a>&nbsp;&nbsp;
                    <asp:LinkButton ID="lbDelete" runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>'>ɾ ��</asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
                    <span class="function fr">
 
                    </span>
                    <p class="page">
                    (ÿҳ<asp:Label ID="lblPageSize" runat="server" CssClass="pagenum3"></asp:Label>��
                ��<asp:Label ID="lblRecordCount" runat="server" CssClass="pagenum3"></asp:Label>����¼
                ��<asp:Label ID="lblCurrentPage" CssClass="pagenum3" runat="server"></asp:Label>ҳ/��<asp:Label
                    ID="lblBackPage" CssClass="pagenum4" runat="server"></asp:Label>ҳ)
                <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" OnClick="lnkbtnOne_Click"
                    Style="color: #666; text-decoration: none;">��ҳ</asp:LinkButton>
                |
                <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" OnClick="lnkbtnUp_Click"
                    Style="color: #666; text-decoration: none;">��һҳ</asp:LinkButton>
                |
                <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" OnClick="lnkbtnNext_Click"
                    Style="color: #666; text-decoration: none;">��һҳ</asp:LinkButton>
                |
                <asp:LinkButton ID="lnkbtnBack" runat="server" Text="βҳ" Font-Underline="False" OnClick="lnkbtnBack_Click"
                    Style="color: #666; text-decoration: none;">βҳ</asp:LinkButton>
                ��ת����<%--<asp:TextBox ID="lblPage" runat="server" Style="ime-mode: disabled; text-align: center" Height="17px" MaxLength="8" Width="30px"></asp:TextBox>--%>
                <asp:DropDownList ID="drpPage" runat="server" Width="50">
                </asp:DropDownList>
                ҳ
                <asp:Button ID="pagebtn" name="pagebtn" runat="server" Height="19px" Text="GO" Width="50px"
                    Font-Bold="False" Font-Names="Arial" CssClass="btn" Font-Size="12px" OnClick="btn_Click"
                    Style="padding-top: 0px;" />
                <asp:Label ID="lblPageIndex" runat="server" Text="1" Visible="False"></asp:Label>
                <asp:Label ID="lblBackPageCount" runat="server" Text="0" Visible="False"></asp:Label>
                <asp:Label ID="lblSearchKeyWord" runat="server" Text="1=1 " Visible="False"></asp:Label>
                    </p>
                  </div>
</form>
</body>
</html>
