<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyAllAnswer.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Model.SurveyAllAnswer" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>当前问题回答详情列表</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script type="text/javascript" src="../js/regExp.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/Common.js"></script>

</head>
<body>
    <form id="frmSurveyAnswer" name="frmSurveyAnswer" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a><a> &gt;</a> <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>">
                问卷调查管理</a><a> &gt;</a> <span style="color: Blue">回答详情列表</span>
        </h4>
        <div class="function">
            <asp:Button ID="btnBack" runat="server" Text="返回问卷调查结果列表" OnClick="btnBack_Click" />
        </div>
        <ul class="ulheader">
            <li style="width: 10%">IP</li>
            <li style="width: 45%">回答</li>
            <li style="width: 25%">日期</li>
        </ul>
        <asp:Repeater ID="rptAllAnswer" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 10%">
                        <%#Eval("IP") %></li>
                    <li style="width: 45%">
                        <%#Eval("Answer")%></li>
                    <li style="width: 25%">
                        <%#Eval("AddDate")%></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul>
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="page" PageSize="20"
                AlwaysShow="True" UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%"
                ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
