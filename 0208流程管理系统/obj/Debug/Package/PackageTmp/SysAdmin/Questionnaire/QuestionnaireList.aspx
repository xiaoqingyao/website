<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionnaireList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.QuestionnaireList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
            <input type="button" value="添加" runat="server" onclick="location.href='QuestionnaireEdit.aspx?action=add'" />
        </div>
            <ul class="ulheader">
                <li style="width: 200px">名称</li>
                <li style="width: 80px">积分</li>
                <li style="width: 60px">状态</li>
                <li style="width: 400px;">操作</li>
            </ul>
          <asp:Repeater ID="rptQuest" runat="server">
          <ItemTemplate>
          <ul class="ulheader ulbody" >
                <li style="width: 200px;">
                <%#Eval("Title")%>
                </li>
                <li style="width: 80px;">
                    <%#Eval("Integral")%>
                </li>
                <li style="width: 60px;">
                    <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("IsEnable")%>' CommandName='<%#Eval("ID") %>' runat="server">
                            <%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%>
                    </asp:LinkButton>
                </li>
                <li style="width: 400px;">
                    <asp:Button ID="Button1" OnCommand="Delete"  CommandArgument='<%#Eval("ID") %>'  runat="server" Text="删除" />
                     <input type="button" value="修改" onclick="location.href='QuestionnaireEdit.aspx?action=edit&ID=<%#Eval("ID") %>'" /> 
                    <input type="button" value="问题管理" onclick="location.href='QuestionnaireItemList.aspx?QID=<%#Eval("ID") %>'" /> 
                    <input type="button" value="显示模板设置" onclick="location.href='Template.aspx?ID=<%#Eval("ID") %>'" /> 
                    <asp:Button ID="Button2" OnCommand="Create"  CommandArgument='<%#Eval("ID") %>'   runat="server" Text="生成" />
                    <input type="button" value="统计" onclick="location.href='statistic.aspx?QID=<%#Eval("ID") %>'" />
                </li>
             </ul>
          </ItemTemplate>
          </asp:Repeater>
            
             
    </div>
    </form>
    <script type="text/javascript">
    <%=jsMessage %>
    </script>
</body>
</html>
