<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.TaskEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript">$(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });</script>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />   
</head>
<body>
    <form id="TaskEdit" runat="server">
    <div align="left">
        <table>
            <tr>
                <td width="40%">
                    任务名称:
                </td>
                <td width="60%">
                    <asp:TextBox ID="txtTaskName" runat="server" Width="200px"></asp:TextBox>
                    <input id="hiddSiteId" runat="server" type="hidden" />
                    <input id="hiddTaskType" runat="server" type="hidden" />
                    <input id="hiddIsEnabled" runat="server" type="hidden" />
                </td>
            </tr>
            <tr>
                <td width="40%">
                    执行频率:
                </td>
                <td width="60%">
                    <asp:DropDownList ID="ddlFrequencyType" runat="server" 
                        onselectedindexchanged="ddlFrequencyType_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="Month" Selected="True">每月一次</asp:ListItem>
                        <asp:ListItem Value="Week">每周一次</asp:ListItem>
                        <asp:ListItem Value="Day">每天一次</asp:ListItem>
                        <asp:ListItem Value="Hour">每小时一次</asp:ListItem>
                        <asp:ListItem Value="Period">每周期一次</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
           <tr id="trFrequency" runat="server">
               <td width="40%">
                    任务开始时刻:
                </td>
                <td width="60%">
                    日期：<asp:DropDownList ID="ddlStartDay" runat="server"></asp:DropDownList>
                    星期：<asp:DropDownList ID="ddlStartWeekday" runat="server">
                    <asp:ListItem Value="1">星期一</asp:ListItem>
                    <asp:ListItem Value="2">星期二</asp:ListItem>
                    <asp:ListItem Value="3">星期三</asp:ListItem>
                    <asp:ListItem Value="4">星期四</asp:ListItem>
                    <asp:ListItem Value="5">星期五</asp:ListItem>
                    <asp:ListItem Value="6">星期六</asp:ListItem>
                    <asp:ListItem Value="7">星期日</asp:ListItem>
                    </asp:DropDownList>
                    小时：<asp:DropDownList ID="ddlStartHour" runat="server"></asp:DropDownList>
               </td>
           </tr>
           <tr id="trFrequency2" runat="server">
               <td width="40%">
                    周期:
                </td>
                <td width="60%">
                    每<asp:TextBox ID="txtPeriodIntervalMinute" runat="server" Width="80px"></asp:TextBox>
                    <asp:DropDownList ID="ddlPeriod" runat="server">
                        <asp:ListItem Value="Week">周</asp:ListItem>
                        <asp:ListItem Value="Day">天</asp:ListItem>
                        <asp:ListItem Value="Hour">小时</asp:ListItem>
                        <asp:ListItem Value="Minute" Selected="True">分钟</asp:ListItem>
                    </asp:DropDownList>
               </td>
           </tr>
           <tr>
            <td width="40%">
                    任务描述:
                </td>
                <td width="60%"><asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
           </tr>
           <tr><td height="20px"></td></tr>
           
           <tr id="trPublish" runat="server">
                <td width="40%">
                    选择发布服务器:
                </td>
                <td width="60%">
                    <asp:DropDownList ID="ddlServerMachine" runat="server"></asp:DropDownList>
               </td>
           </tr>
           <tr id="trCreate" runat="server">
                <td></td>
           </tr>
           <tr id="trGather" runat="server">
                <td></td>
           </tr>
           
            <tr>
                <td colspan="2" align="center" class="Submit"><asp:Button ID="btnEdit" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnEdit_Click" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

