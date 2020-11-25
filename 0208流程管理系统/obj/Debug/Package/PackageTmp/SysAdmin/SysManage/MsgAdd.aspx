<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgAdd.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.MsgAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head id="Head1" runat="server">
    <title>操作管理</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script type="text/javascript" src="../js/Common.js"></script>

    

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript">
        jQuery(function() {
            var arrID = new Array();
            var arrName = new Array();
            $("#msgClose").toggle(
		function() {
		    $("#list").hide();
		    $("#msgMain").css({ width: 482 })
		},
		function() {
		    $("#list").show();
		    $("#msgMain").css({ width: 341 })
		}
	)
            $("#list a").each(function() {
                $(this).toggle(
		function() {
		    var n = $(this).attr("rel");
		    var m = $(this).html();
		    arrID.push(n)
		    arrName.push(m)
		    $("#nameID").val(arrID);
		    $("#namelist").val(arrName);
		    $(this).addClass("sel");
		},
		function() {
		    var n = $(this).attr("rel");
		    for (var i = 0; i < arrID.length; i++) {
		        if (arrID[i] == n) {
		            arrID.splice(i, 1)
		            arrName.splice(i, 1);
		        }
		    }
		    $("#nameID").val(arrID);
		    $("#namelist").val(arrName);
		    $(this).removeClass("sel");
		}
		)
            })
        })
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">内部短消息</a> &gt; <span class="breadcrumb_current"> 发送短消息</span>
        </h4>
        <ul id="tags">
        	<li><a href="MsgReceiveList.aspx">己接收的短消息</a> </li>
        	<li><a href="MsgSendList.aspx">己发送的短消息</a></li>
        	<li class="selectTag"><a href="MsgAdd.aspx?action=New">发送内部短信</a></li>
        </ul>
        <div class="mynotesearch">        
       <div id="msgContainer">
            <div id="msgMain">
                <h4>
                    收信人：</h4>
                <textarea readonly="readonly" runat=server id="namelist" ></textarea>
                <input type="hidden" runat=server id="nameID" />               
                <asp:TextBox ID="txID" Visible="false" runat="server" ReadOnly="true" Width="280px"
                    BackColor="Gainsboro"></asp:TextBox>
                <h4>
                    短信内容：</h4>
                <asp:TextBox ID="txtContent" TextMode="MultiLine" runat="server" class="validate[required,length[0,150]] text-input"></asp:TextBox>                
                <asp:TextBox ID="txtSendDate" runat="server"  Visible=false Width="41px"></asp:TextBox>
                <p style="text-align: right; padding: 5px;">
                    <asp:Button ID="btnEdit" CssClass="subButton" runat="server" Text="发送短信" OnClick="btnEdit_Click" /></p>
            </div>
            <div id="msgClose">
            </div>
            <div id="list">
                <h4>
                    选择收件人：</h4>
                <ul>
                    <asp:Repeater ID="rptAccountList" runat="server">
                        <ItemTemplate>
                            <li><a href="javascript:;" rel="<%#Eval("UserID") %>"><%#Eval("UserName") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        </div> 
        <br clear="left" />
    </div>
    </form>
</body>
</html>
