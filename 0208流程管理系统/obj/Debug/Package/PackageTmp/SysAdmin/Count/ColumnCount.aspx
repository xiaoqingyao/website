<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ColumnCount.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.ModuleCount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>标签列表</title>
       <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

<%-- <script type="text/javascript" src="../js/win.js"></script>--%>
<script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    function checkSearch() {
        if ($("#txtDate2").val() < $("#txtDate1").val()) {
            alert({ msg: "请输入正确的日期!", title: "信息提示" });
            return false;
        }
        return true;
    }
    $(document).ready(function() {
        var totalcount = 0;
        var todaycount = 0;
        $("li[name=totalCount]").each(function() {
            totalcount += parseInt($(this).html());
        
        });
        $("li[name=todayCount]").each(function() {
            todaycount += parseInt($(this).html());

        });
        $("#total").html(totalcount);
        $("#today").html(todaycount);
    });
</script>
</head>
<body>
    <div class="container" id="_ListInfoListTable">
        <form id="theForm" runat="server">
        <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
        <h4>
            位置： <a href="TemplateList.aspx">扩展应用</a> > <span style="color: Blue">栏目统计</span>
        </h4>
        <div id="searchContainer">
            <ul>              
                <li><a href="ColumnCount.aspx">显示全部</a></li> <li>|</li>
                <li><a href="ColumnCount.aspx?time=1">最近一周</a> </li><li>|</li>
                <li><a href="ColumnCount.aspx?time=2">最近一月</a> </li><li>|</li>
                <li><a href="ColumnCount.aspx?time=3">最近一年</a> </li>
            </ul>
            <br />
        </div>
        <div style="float: left; padding-top: 20px;">
            &nbsp; 日期：<asp:TextBox ID="txtDate1" Width=100px runat="server" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
          &nbsp;到 &nbsp;<asp:TextBox Width="100px"  onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" ID="txtDate2" runat="server"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnQuery_Click" />
        </div>
        <div style="padding-top: 10px">
        </div>       
        <div class="function">&nbsp;</div>
        <ul class="ulheader">
          
            <li style="width: 20%;">栏目</li>
            <li style="width: 9%;">总访问量(<span id="total"></span>)</li>
            <li style="width: 9%;">今日访问量(<span id="today"></span>)</li>
            <li style="width: 10%;"></li>
        </ul>
        <div id="HQB_ListInfo" style="padding: 0; margin: 0;">
            <asp:Repeater ID="reptCount" runat="server">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 20%;">
                            <%#Eval("NodeName")%>
                        </li>
                        <li style="width: 9%;" name="totalCount" >
                            <%#Eval("TotalCount")%>
                        </li>
                        <li style="width: 9%;"  name="todayCount"><%#Eval("TodayCount")%></li>
                        <li>
                          <a href="InfoCount.aspx?node=<%#Eval("NodeCode") %>" <%#Convert.ToBoolean(Eval("Enable"))?"":"disabled=disabled" %> style='color: <%#Convert.ToBoolean(Eval("Enable"))?"blue":"gray" %>'> 详细</a> </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
          
        </form>
    </div>
</body>
</html>
