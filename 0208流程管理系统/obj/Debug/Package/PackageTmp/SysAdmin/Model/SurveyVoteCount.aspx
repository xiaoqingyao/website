<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyVoteCount.aspx.cs"
    Inherits="AllPower.Web.Admin.SurveyVoteCount" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>问卷调查投票结果</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>">问卷调查列表</a>
            > <span style="color: Blue">问卷调查投票结果</span>
        </h4>
        <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>" class="abtn" style="float: right">
            返回问卷调查列表</a>
        <asp:Repeater ID="rptItem" runat="server">
            <ItemTemplate>
                <dl>
                    <dd>
                        <h3 style="color: #0080FF; size: 10px; font: 黑体">
                            <%#Container.ItemIndex+1 %>.
                            <%#Eval("Name")%>
                        </h3>
                        <span style='<%#GetDisplay(Convert.ToInt32(Eval("Type")))[0]%>'><a href="SurveyAllAnswer.aspx?sid=<%#Eval("SurveyID") %>&qid=<%#Eval("ID") %>"
                            style="color: Blue">查看此问题的所有回答详情</a></span>
                        <ul class="ulheader" style='<%#GetDisplay(Convert.ToInt32(Eval("Type")))[1]%>'>
                            <li style="width: 300px">选项</li>
                            <li style="width: 200px">投票</li>
                        </ul>
                        <asp:Repeater ID="rptValue" runat="server" DataSource='<%#GetValue(Eval("DataItem").ToString(),Eval("ID").ToString()) %>'
                            Visible='<%#Convert.ToBoolean(GetDisplay(Convert.ToInt32(Eval("Type")))[2])%>'>
                            <ItemTemplate>
                                <ul class="ulheader ulbody">
                                    <li style="width: 300px">
                                        <%#Eval("key") %></li>
                                    <li style="width: 300px">
                                        <%#GetVote(Eval("value").ToString(),Container.ItemIndex.ToString()) %></li>
                                </ul>
                            </ItemTemplate>
                        </asp:Repeater>
                    </dd>
                </dl>
            </ItemTemplate>
        </asp:Repeater>
        <div style="clear: left">
        </div>
    </div>
    </form>
</body>
</html>
