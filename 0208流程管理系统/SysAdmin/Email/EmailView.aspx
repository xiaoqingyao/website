<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailView.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Emails.EmailView" %>

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
            位置导航：<a href="CategoryList.aspx?cid=l"><%=Resources.Orgin.HeadManage %> > </a><a href="CategoryList.aspx?cid=<%=CID %>"><%=Menu %>管理</a> > <%=ManageMethod%>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        主题： </dt>
                    <dd>
                        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        发件人：</dt>
                    <dd>
                       
                              <asp:Label ID="lblSender" runat="server" Text=""></asp:Label>
                              </dd>                                                         
                </dl>
                <dl>
                    <dt>时间 ： </dt>
                    <dd>
                    </dd>
                    <asp:Label ID="lblTime" runat="server" Text=""></asp:Label>
                </dl>
                <dl>
                    <dt>
                        收件人： </dt>
                    <dd>
                     <asp:Label ID="lblReceiver" runat="server" Text=""></asp:Label>
                    </dd>                   
                </dl>
                <dl>
                    <dt>
                        抄送人： </dt>
                    <dd>
                        <asp:Label ID="lblCopyer" runat="server" Text=""></asp:Label>
                    </dd>                   
                </dl>
                <dl>
                    <dt>
                        密送人： </dt>
                    <dd>
                     <asp:Label ID="lblSecreter" runat="server" Text=""></asp:Label>
                    </dd>                   
                </dl>               
                <div style="clear: left">
                    <asp:Label ID="lblContent" runat="server" Text=""></asp:Label>
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
