<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionnaireItemList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Questionnaire.QuestionnaireItemList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/Common.js"></script></head>
<body>
    <form id="theForm" runat="server">
      <div class="container">
        <div class="function">
            <input id="Button2" type="button" value="返回"  onclick="location.href='QuestionnaireList.aspx'" />
            <input id="Button1" type="button" value="添加" onclick="location.href='QuestionnaireItemEdit.aspx?action=add&QID=<%=Request.QueryString["QID"] %>'" />
        </div>
            <ul class="ulheader">
                <li style="width: 200px">名称</li>
                <li style="width: 80px">类型</li>
                <li style="width: 60px">状态</li>
                <li style="width:60px;">排序</li>
                <li style="width: 300px;">操作</li>
            </ul>
          <asp:Repeater ID="rptQuest" runat="server">
          <ItemTemplate>
          <ul class="ulheader ulbody" >
                <li style="width: 200px;">
                <%#Eval("Title")%>
                </li>
                <li style="width: 80px;">
                    <%#GetItemType(Eval("ItemType"))%>
                </li>
                <li style="width: 60px;">
                    <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("IsEnable")%>' CommandName='<%#Eval("ID") %>' runat="server">
                            <%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%>
                    </asp:LinkButton>
                </li>
                <li style="width:60px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 50px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_QuestionnaireItem', '<%#Eval("ID") %>', this.value)" /></span></li>
                <li style="width: 300px;">
                <asp:Button ID="Button1" OnCommand="Delete"  CommandArgument='<%#Eval("ID") %>'  runat="server" Text="删除" />
                 <input type="button" value="修改" onclick="location.href='QuestionnaireItemEdit.aspx?action=edit&ID=<%#Eval("ID") %>&QID=<%=Request.QueryString["QID"] %>'" /> 
                </li>
             </ul>
          </ItemTemplate>
          </asp:Repeater>
            
             
    </div>
    </form>
</body>
</html>
