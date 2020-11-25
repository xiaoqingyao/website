<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysUserList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SysUserList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
        <script type="text/javascript" src="../js/common.js"></script>
    <script language="javascript" type="text/javascript">
        function SetChkName(obj) {
            if (obj.checked) {
                var rpt = document.getElementById("senfe");
                var tid = rpt.rows[event.srcElement.parentElement.parentElement.rowIndex].cells[2].innerHTML;
                tid = tid.replace(/<[^>]+>/g, "");
                document.getElementById("hdName").value += tid + ",";
                alert(document.getElementById("hdName").value);
            }
        }
        
    </script>
    
</head>
<body>
    <form id="Form1" name="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <input type="hidden" name="hidMyID" id="hidMyID" runat ="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="searchContainer">
            <p>
                <span>登录名称：</span>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:HiddenField ID="hdName" runat="server" />
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>"
                    OnClick="btnQuery_Click" /></p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="BtnDel_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server" OnClick="BtnAdd_Click"
                Text="<%$Resources:Common,Add %>" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                 />
        </div>
        <ul class="ulheader">
            <li style="width: 5% ;text-align:center">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 5%;text-align:center">序号 </li>
            <li style="width: 20%">登录名称 </li>
            <li style="width: 20%">所属用户组 </li>
            <li style="width: 15%;text-align:center">最后登录时间 </li>
            <li style="width: 10%;text-align:center">状态 </li>
            <li style="width: 20%">操作 </li>
        </ul>
        <asp:Repeater ID="RptUser" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 5%; text-align:center">
                        <input type="checkbox" name="chkId" value='<%#GetMyID(Eval("UserID").ToString(),Eval("ID").ToString())%>' <%#strEnable %> />
                    </li>
                    <li style="width: 5%;text-align:center"><input
                            type="hidden" name="chkName" value='<%#Eval("UserName")%>' />
                        <%#Eval("UserID")%></li>
                    <li style="width: 20%"><a href="SysUserEdit.aspx?action=Edit&NodeCode=<%=Request.QueryString["NodeCode"] %>&Userid=<%#Eval("UserID") %>" id="Title<%#Eval("ID")%>"><%#Eval("UserName")%></a> </li>
                    <li style="width: 20%">
                        <%#Eval("UserGroupName").ToString()%>
                    </li>
                    <li style="width: 15%;text-align:center">
                        <%#AllPower.Common.Utils.GetStandardDateTime(Eval("AddDate").ToString())%>
                    </li>
                    <li style="width: 10%;text-align:center">
                        <%#AllPower.Common.Utils.ParseState((Eval("IsValid")),"0")%>
                    </li>
                    <li style="width: 20%">
                        <a id="lnkRight" class="abtn" style='<%#strEnable=="disabled"?"display:none":""%>' runat="server" href='<%# "SysUserRight.aspx?action=Edit&NodeCode="+Request.QueryString["NodeCode"]+"&Userid="+Eval("UserID") %>'>
                        权限</a> 
                        <asp:LinkButton ID="lnkbState" class="abtn" style='<%#strEnable=="disabled"?"display:none":""%>'  runat="server" OnCommand="SysUserList_State"
                            CommandName="Statedp" ToolTip='<%#Eval("UserName")%>' CommandArgument='<%#Eval("ID")+"|"+Eval("IsValid") %>'><%# AllPower.Common.Utils.ParseStateTitle(!AllPower.Common.Utils.ParseBool(Eval("IsValid").ToString()), "0")%></asp:LinkButton> 

                        <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" style='<%#strEnable=="disabled"?"display:none":""%>'
                            CommandName="deldp" ToolTip='<%#Eval("UserName")%>' CommandArgument='<%#Eval("ID") %>'
                            OnClientClick='selectThisRow();selfconfirm({msg:"确定要执行删除操作吗？",fn:function(data){setAction(data)}});return false;'
                            Visible=false >删除</asp:LinkButton>  
                        <a href="#" id="lnkDelete" class="abtn" style='<%#strEnable=="disabled"?"display:none":""%>' onclick='selectThisRow();selfconfirm({msg:"确定要执行删除操作吗？",fn:function(data){setAction(data)}});return false;' runat="server">删除</a>
                        <a id="lnkChangePWD" class="abtn" runat="server" href='<%# "SysUserChangePassword.aspx?NodeCode="+Request.QueryString["NodeCode"]+"&Userid="+Eval("UserID") %>'>修改密码</a></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True" UrlPaging="true"
                ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>" 
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    <span id="spanmsg" runat="server"></span>
    </form>
</body>
</html>
<script>    //inputMsg();</script>
