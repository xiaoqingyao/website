<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryEdit.aspx.cs" Inherits="AllPower.WEB.Admin.Categorys.CategoryEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
  
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>  
</head>
<body>
    <form id="theForm" runat="server">
    <!--******************************增加页面代码********************************-->
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置导航：<a href="CategoryList.aspx?cid=l"><%=Resources.Orgin.HeadManage %> > </a><a href="CategoryList.aspx?cid=<%=CID %>"><%#MenuField%>管理</a> > <%#ManageMethod%>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        <asp:Label ID="lblParent" runat="server" Text="所属地区"></asp:Label>
                        ： </dt>
                    <dd>
                        <asp:DropDownList ID="ddlParent" runat="server">
                        </asp:DropDownList>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <asp:Label ID="lblChild" runat="server" Text="地区名称"></asp:Label>
                        ：</dt>
                    <dd>
                       
                                <asp:TextBox ID="txtName" runat="server" TextMode="MultiLine" Height="67px" 
                                    Width="222px" CssClass="validate[required,length[1,200]]"></asp:TextBox>&nbsp;
                                <asp:DropDownList ID="ddlColor" runat="server">
                                </asp:DropDownList>&nbsp;
                               <asp:CheckBox ID="chkBold" runat="server" Text="加粗" Width="60px" />
                                                  
                        
                        <div style="clear:both">允许批量添加，一行一个，按回车换行或多个逗号分隔。</div>                        
                    </dd>
                </dl>
                <dl>
                    <dt>描述 ： </dt>
                    <dd>
                        <asp:TextBox ID="txtDescription" runat="server" Width="319px" 
                            TextMode="MultiLine" Height="61px"></asp:TextBox>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <asp:Label ID="lblModulPage" runat="server" Text="地区页模板"></asp:Label> ： </dt>
                    <dd>
                        <asp:DropDownList ID="ddlModulPage" runat="server">
                            <asp:ListItem Selected="True">area.html</asp:ListItem>
                            <asp:ListItem>hangye.list</asp:ListItem>
                        </asp:DropDownList>
                    </dd>
                </dl>
                <div style="clear: left">
                </div>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnNew" class="subButton" runat="server" Text=" 提 交 " OnClick="btnNew_Click">
            </asp:Button>            
        </div>
    </div>
    </form>
</body>
</html>
