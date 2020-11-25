<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailEdit.aspx.cs" Inherits="AllPower.WEB.Admin.Emails.EmailEdit" %>

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
            位置导航：<a href="CategoryList.aspx?cid=l"><%=Resources.Orgin.HeadManage %> > </a><a href="CategoryList.aspx?cid=<%%>"><% %>管理</a> > <%=ManageMethod%>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        发件人： </dt>
                    <dd>
                        <asp:Label ID="lblSender" runat="server"></asp:Label>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        收件人：</dt>
                    <dd>
                       
                                <asp:TextBox ID="txtReceiver" runat="server" Width="723px"></asp:TextBox>
                                &nbsp;
                                &nbsp;                                                                                 
                        
                     
                </dl>
                <dl>
                    <dt>主题 ： </dt>
                    <dd>
                    </dd>
                    <asp:TextBox ID="txtTitle" runat="server" Width="725px"></asp:TextBox>
                </dl>
                <dl>
                    <dt>
                        内容： </dt>
                    <dd>
                     <asp:TextBox ID="txtContent" runat="server" Height="284px" TextMode="MultiLine" 
                            Width="728px"></asp:TextBox>
                    </dd>                   
                </dl>
                <dl>
                    <dt>
                        级别： </dt>
                    <dd>
                        <asp:DropDownList ID="ddlRang" runat="server">
                        </asp:DropDownList>
                    </dd>                   
                </dl>
                <div style="clear: left">
                </div>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnNew" class="subButton" runat="server" Text="立即发送" OnClick="btnNew_Click">
            </asp:Button>
             <asp:Button ID="btnSave" class="subButton" runat="server" Text="保存到草稿箱" 
                onclick="btnSave_Click">
            </asp:Button>            
             <asp:Button ID="btnCancel" class="subButton" runat="server" Text="取消">
            </asp:Button>                        
        </div>
    </div>
    </form>
</body>
</html>
