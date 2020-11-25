<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyResult.aspx.cs" Inherits="AllPower.WEB.main.Plus.Common.SurveyResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>问卷调查结果 </title>
    <link href="/SysAdmin/CSS/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="frmSurveyResult" runat="server">
    <div>
        <asp:Repeater ID="rptItem" runat="server">
            <ItemTemplate>
                <dl>
                    <dd>
                        <h3 style="color: #0080FF; size: 10px; font: 黑体">
                            <%#Container.ItemIndex+1 %>.
                            <%#Eval("Name") %>
                        </h3>
                        <br />
                        <ul class="ulheader" style='<%#GetUrDisplay(Convert.ToInt32(Eval("Type")))[1]%>'>
                            <li style="width: 150px">选项</li>
                            <li style="width: 50px">票数</li>
                            <li style="width: 60px">百分比</li>
                            <li style="width: 180px">图示</li>
                        </ul>
                        <ul class="ulheader" style='<%#GetUrDisplay(Convert.ToInt32(Eval("Type")))[0]%>'>
                            <li style="width: 55%">
                                <%#GetAnswer(Convert.ToInt32(Eval("ID")), Convert.ToInt32(Eval("Type")))%>
                            </li>
                        </ul>
                        <asp:Repeater ID="rptValue" runat="server" DataSource='<%#GetValue(Eval("DataItem").ToString(),Eval("ID").ToString()) %>'
                            Visible='<%#Convert.ToBoolean(GetUrDisplay(Convert.ToInt32(Eval("Type")))[2])%>'>
                            <ItemTemplate>
                                <ul class="ulheader ulbody">
                                    <li style="width: 150px">
                                        <%#Eval("key") %></li>
                                    <li style="width: 50px">
                                        <%#GetVote(Eval("value").ToString(),Container.ItemIndex.ToString()) %></li>
                                    <li style="width: 60px">
                                        <%#GetPercent(Eval("value").ToString(),Container.ItemIndex.ToString())%>%</li>
                                    <li style="width: 180px">
                                        <img src="images/show.gif" alt="结果图示" width='<%#GetPercent(Eval("value").ToString(),Container.ItemIndex.ToString())%>%'
                                            style='<%#GetDisplay(Eval("value").ToString(),Container.ItemIndex.ToString())%>' /></li>
                                </ul>
                            </ItemTemplate>
                        </asp:Repeater>
                    </dd>
                </dl>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
