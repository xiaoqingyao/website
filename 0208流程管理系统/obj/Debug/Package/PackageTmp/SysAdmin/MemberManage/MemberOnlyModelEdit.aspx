<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberOnlyModelEdit.aspx.cs"
     Inherits="AllPower.Web.Admin.MemberOnlyModelEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会员模型修改</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
     <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../JS/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../JS/public.js"></script>
</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">会员管理</a><a> &gt;</a> <span class="breadcrumb_current">
                修改模型</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        <%=Resources.Member.CurrentModel%></dt>
                    <dd>
                        <asp:Label ID="lblModel" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="hiCurrentModelID" runat="server" />
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.Member.NewModel%></dt>
                    <dd>
                        <asp:DropDownList ID="ddlMemberModel" runat="server">
                        </asp:DropDownList>
                    </dd>
                </dl>
                <div class="Submit">
                 
                <span style="color: #ff6c00"> 注：</span> 当修改会员的模型后，会员以前的模型信息将被删除！
                
                </div>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Update %>" OnClick="btnSave_Click" CssClass="subButton" />
            <input type="button" name="Submit422" value="<%= Resources.Common.Back %>" onclick='location.href="MemberEdit.aspx?action=edit&memberID=<%=MemberID %>";'
               class="subButton"/>
        </div>
       
    </div>
    </form>
</body>
</html>
