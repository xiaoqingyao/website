<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartMentlist.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.DepartMentlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>科室管理</title>
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
            if (confirm("是否确定确定删除？")) {
                return true;
            } else {
                return false;
            }
        }
        else {
            confirm("请选择您要操作的选项!");
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
            confirm("请选择您要操作的选项!");
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
     <h4>位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">科室导航</a><a> &gt;</a> <span class="breadcrumb_current" > <a href="#">科室管理</a></span> </h4>
     
     <div id="searchContainer">
           <p>
                <span>科室名称：</span>
         
                <asp:TextBox ID="txtTitle" runat="server" Width="200px" ></asp:TextBox>
                <asp:Button ID="btnSearch"  runat="server" Text="搜 索" onclick="btnSearch_Click"/>
                
            </p>
         </div>
     
     <div class="function">
        <asp:Button ID="btnAdd" runat="server" Text="添 加" onclick="btnAdd_Click"/>
        <asp:Button ID="btnDelete" runat="server"  Text="删 除" OnClientClick="return CheckRelease();" onclick="btnDelete_Click" />
     </div>                                 
    <ul class="ulheader">
        <li style="width: 5%;">
            <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
        </li>
        <li style="width:150px;">科室名称    <li style="width:100px;">科室负责人</li>
        <li style="width:60px;">临床科室</li>
        <li style="width:60px;">医技科室</li>
        <li style="width:60px;">职能科室</li>
        <li style="width:60px;">特色专科</li>
        <li style="width:60px;">省市重点</li>
        <li style="width:60px;">咨询科室</li>
        <li style="width:60px;">门诊科室</li>
        <li style="width:60px;">排序</li>
        <li style="width:100px;">操 作</li>
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
                    <li style="width:60px;"><%#Eval("Islckj").ToString() == "1" ? "<span style=\"color:Red;\">是</span>" : "否"%></li>
                    <li style="width:60px;"><%#Eval("Isyjks").ToString() == "1" ? "<span style=\"color:Red;\">是</span>" : "否"%></li>
                    <li style="width:60px;"><%#Eval("Isznkj").ToString() == "1" ? "<span style=\"color:Red;\">是</span>" : "否"%></li>
                    <li style="width:60px;"><%#Eval("Istszk").ToString() == "1" ? "<span style=\"color:Red;\">是</span>" : "否"%></li>
                    <li style="width:60px;"><%#Eval("IsKey").ToString() == "1" ? "<span style=\"color:Red;\">是</span>" : "否"%></li>               
                    <li style="width:60px;"><%#Eval("Iszixun").ToString() == "1" ? "<span style=\"color:Red;\">是</span>" : "否"%></li>
                    <li style="width:60px;"><%#Eval("Ismenzhen").ToString() == "1" ? "<span style=\"color:Red;\">是</span>" : "否"%></li>
                    <li style="width:60px;">
                    <asp:TextBox ID="txtOrders" name="txtOrders" runat="server" Text='<%#Eval("Orders") %>' AutoPostBack="true" OnTextChanged="txtOrders_TextChanged" Width="50px" Height="15px"></asp:TextBox>
                    </li>
                    <li style="width:100px;">
                    <a href="DepartMentedit.aspx?action=edit&ID=<%#Eval("ID") %>&NodeCode=<%#Eval("NodeCode") %>">修改</a>&nbsp;&nbsp;
                    <asp:LinkButton ID="lbDelete" runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>'>删 除</asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
                    <span class="function fr">
 
                    </span>
                    <p class="page">
                    (每页<asp:Label ID="lblPageSize" runat="server" CssClass="pagenum3"></asp:Label>条
                共<asp:Label ID="lblRecordCount" runat="server" CssClass="pagenum3"></asp:Label>条记录
                第<asp:Label ID="lblCurrentPage" CssClass="pagenum3" runat="server"></asp:Label>页/共<asp:Label
                    ID="lblBackPage" CssClass="pagenum4" runat="server"></asp:Label>页)
                <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" OnClick="lnkbtnOne_Click"
                    Style="color: #666; text-decoration: none;">首页</asp:LinkButton>
                |
                <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" OnClick="lnkbtnUp_Click"
                    Style="color: #666; text-decoration: none;">上一页</asp:LinkButton>
                |
                <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" OnClick="lnkbtnNext_Click"
                    Style="color: #666; text-decoration: none;">下一页</asp:LinkButton>
                |
                <asp:LinkButton ID="lnkbtnBack" runat="server" Text="尾页" Font-Underline="False" OnClick="lnkbtnBack_Click"
                    Style="color: #666; text-decoration: none;">尾页</asp:LinkButton>
                跳转到第<%--<asp:TextBox ID="lblPage" runat="server" Style="ime-mode: disabled; text-align: center" Height="17px" MaxLength="8" Width="30px"></asp:TextBox>--%>
                <asp:DropDownList ID="drpPage" runat="server" Width="50">
                </asp:DropDownList>
                页
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
