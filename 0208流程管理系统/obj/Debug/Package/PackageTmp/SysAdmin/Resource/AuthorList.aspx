<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthorList.aspx.cs" Inherits="AllPower.Web.Admin.AuthorList" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
        <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
        <script type="text/javascript" src="../js/publicform.js"></script>
        <script type="text/javascript" src="../js/regExp.js"></script>
        <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
        <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery.dialog.js"></script>
        <script type="text/javascript" src="../js/win.js"></script>
        <script src="../JS/Common.js" type="text/javascript"></script>
            <script type="text/javascript">
                $(function() {
                $("#btnNew").click(function() { location.href = "AuthorEdit.aspx?action=add&NodeCode=<%=NodeCode %>"; })
                    $("body").find("input").each(function() {
                        if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                            $(this).click(function() { location.href = "AuthorEdit.aspx?action=edit&ID=" + $(this).attr("RecordID") + "&NodeCode=<%=NodeCode %>"; })
                        }
                    });
                });
    </script>
        </head>
<body>
    <form id="theForm" runat="server"><input type="hidden" name="hidLogTitle" id="hidLogTitle" />
            <div class="container" id="AuthorInfoList">
        <h4>位置:<%GetPageNav(NodeCode);%></h4>
        <div id="searchContainer">
            <asp:DropDownList ID="ddlSearchType" runat="server">
                <asp:ListItem Text="姓名" Value="[Name]"></asp:ListItem>
                <asp:ListItem Text="电话" Value="[Tel]"></asp:ListItem>
                <asp:ListItem Text="分类" Value="[TypeName]"></asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text='<%$Resources:Common,Search %>' />&nbsp;
        </div>    
        <div class="function">
             <input type="button" id="btnNew" runat="server" value="添加" />
             <asp:Button ID="btnDelete" runat="server" Text="删除所选" OnClientClick="return reConfirmMulti(this, '确定要删除当前所选记录吗？', 'AuthorInfo')"  CommandName="Bacth" OnCommand="Author_Delete"/>
             
         </div>
        <ul class="ulheader">
            <li style="width: 45px;"><input type="checkbox" id="SelAll" name="SelAll" onclick="SelectAll('SelAll', 'AuthorInfoList')" /></li>
            <li style="width: 14%">序号</li>
            <li style="width: 14%">姓名</li>
            <li style="width: 6%">性别</li>
            <li style="width: 10%">电话</li>
            <li style="width: 10%">作者分类</li>
            <li style="width: 6%">状态</li>
            <li style="width: 6%">推荐状态</li>
            <li style="width: 6%">置顶状态</li>
            <li style="width:7%;">排序</li>
            <li style="width: 11%">操作</li>
        </ul>
        <div id="AuthorInfo">
        <asp:Repeater ID="rptAuthor" runat="server">
        <ItemTemplate>
        <ul class="ulheader ulbody">
            <li style="width:45px;"><input type="checkbox" name="chkID" value="<%#Eval("ID") %>"></li>
            <li style="width:14%;"><%#Eval("ID") %></li>
             <li style="width:14%;"> <span id="Title<%# Eval("ID")%>"> <%#Eval("Name") %></span></li>
            <li style="width:6%;"><%# AllPower.Common.Utils.ParseGender(Eval("Gender"),"保密") %></li>
             <li style="width:10%;"><%# Eval("Tel") %></li>
             <li style="width:10%;"><%#Eval("TypeName") %></li>
             <li style="width:6%;">    <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>'
                            CommandName="STATE" runat="server" RecordID='<%#Eval("ID")%>'  OnClientClick="setLogTitle(this)">
                                <%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%>
                        </asp:LinkButton></li>
                    <li style="width:6%;">    <asp:LinkButton ID="LinkButton3" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRecommend").ToString()%>'
                            CommandName="RECOMMEND" runat="server"  RecordID='<%#Eval("ID") %>'  OnClientClick="setLogTitle(this)">
                                <%#AllPower.Common.Utils.ParseIsRecommend(Eval("IsRecommend"), "不推荐")%>
                        </asp:LinkButton></li>
<li style="width:6%;">    <asp:LinkButton ID="LinkButton4" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsTop").ToString()%>'
                            CommandName="TOP" runat="server"  RecordID='<%#Eval("ID") %>'  OnClientClick="setLogTitle(this)">
                                <%#AllPower.Common.Utils.ParseIsTop(Eval("IsTop"), "不置顶")%>
                        </asp:LinkButton></li>                        
             <li style=" width:7%;"><input type="text" style="width: 50px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_Author', '<%#Eval("ID") %>', this.value)" /></li>
             <li style="width:11%;">
             
             <asp:Button ID="btnDelete" runat="server" OnCommand="Author_Delete"  CommandName="Single" CommandArgument='<%#Eval("ID") %>' OnClientClick="return reConfirm(this,'确定要删除当前记录吗?');"
                            RecordID='<%#Eval("ID") %>' Text="删除"></asp:Button>
                <input type="button" value="修改" id="btnEdit" runat="server" btntype="edit" RecordID='<%#Eval("ID") %>' />
            </li>
       </ul>
        </ItemTemplate>
        </asp:Repeater>     
        </div>
<ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>      </div>
    </form>
        <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
