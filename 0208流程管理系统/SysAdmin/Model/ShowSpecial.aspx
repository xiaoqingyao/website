<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowSpecial.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.ShowSpecial" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script> 
    <script src="../JS/ShowSpecial.js" type="text/javascript"></script>
    <script type="text/javascript">$(pageInit);</script>
    <link href="../css/showspecial.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="theForm" runat="server">
    <div  class="subject">
        <asp:Repeater ID="rptSpecial" runat="server">
        <ItemTemplate>
           <h4><%#Eval("Name")%></h4>
             <ul id="_Special_<%#Eval("ID")%>" title="<%#Eval("Name")%>" style=" margin-top:3px;">
                <asp:Repeater ID="rptMenu" runat="server" DataSource='<%#Eval("Special_Menu") %>'>
                    <ItemTemplate>
                        <li id="_SpecialMenu_<%#Eval("ID")%>">
                            <input type="checkbox" onclick="selectSpecialMenu('<%#Eval("SpecialID")%>','<%#Eval("ID")%>','<%#Eval("Name")%>',this.checked)" id="<%#Eval("ID")%>" model="<%#Eval("ModelID")%>" />  
                           <label for="<%#Eval("ID")%>" ><%#Eval("Name") %></label> 
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
<br clear="left" />
        </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
