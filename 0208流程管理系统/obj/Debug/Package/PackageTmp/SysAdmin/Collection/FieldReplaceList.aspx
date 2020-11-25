<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldReplaceList.aspx.cs" EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Collection.FieldReplaceList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>采集字段</title>
        <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>当前位置：信息采集->采集任务->采集字段 -> 字段结果替换</h4>
        <div class="function">
            <input type="button" onclick="location.href='FieldList.aspx?ID=<%=this.ID %>'" value="返回" />
            <input type="button" onclick="location.href='FieldReplaceEdit.aspx?Action=add&TaskID=<%=TaskID %>&FieldID=<%=this.ID %>'" value="添加" />
        </div>
        <ul class="ulheader"> 
            <li style="width:250px">原内容</li>
            <li style="width:200px;">新内容</li>
            <li style="width:70px;">先于标签</li>
            <li style="width:70px;">使用正则</li>
             <li style="width:70px;">提取旧值</li>
            <li style="width:70px;">重复处理</li>
            <li style=" width:150px;">操作</li>
        </ul>
        <asp:Repeater ID="rptFieldReplace" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width:250px" title="<%#Eval("OldContent")%>"><%#Eval("OldContent")%></li>
                    <li style="width: 200px;" title="<%#Eval("NewContent")%>"><%#Eval("NewContent")%></li>
                    <li style="width:70px;"><asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsReplaceFirst").ToString()%>' CommandName="ISFIRST" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsReplaceFirst"), "未知")%></asp:LinkButton></li>
                    <li style="width:70px;"><asp:LinkButton ID="LinkButton3" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRegex").ToString()%>' CommandName="ISREGEX" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsRegex"), "未知")%></asp:LinkButton></li>
                    <li style=" width:70px;"><asp:LinkButton ID="LinkButton4" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsObtainOldVlaue").ToString()%>' CommandName="ISOLDVALUE" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsObtainOldVlaue"), "未知")%></asp:LinkButton></li>
                    <li style="width:70px;"><asp:LinkButton ID="LinkButton6" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRepeat").ToString()%>' CommandName="ISRPT" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsRepeat"), "未知")%></asp:LinkButton></li>
                   <li style="width: 150px">
                    <input type="button"  value="修改" onclick="location.href='FieldReplaceEdit.aspx?action=edit&id=<%# Eval("ID")%>&TaskID=<%=TaskID%>&FieldID=<%=this.ID %>'" />
                        <asp:Button ID="LinkButton5" runat="server" OnCommand="FieldReplace_Del" CommandName="DELDP" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除该记录吗?")' Text="删除"></asp:Button>
                                 </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
  <script type="text/javascript"><%=jsMessage %></script>
  </body>
</html>
