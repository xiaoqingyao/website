<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WorkToDo.aspx.cs" Inherits="WorkFlow_WorkToDo" %>

<html>
<head>
    <title>移动手机浙江金海环境移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../Style/Mobile/pics/homescreen.gif" rel="apple-touch-icon" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />

    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />

    <script type="text/javascript" language="javascript" src="../JS/calendar.js"></script>

    <script language="javascript">
      function selectyinzhang(imgidstr)
        {
            
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../Main/SelectYinZhang.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');            
            if(wName==null||wName=="")
            {}
            else
            {        
                //alert(imgidstr);
                imgidstr.src="http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/"+wName;  
            }
        }    
    
    function _change()
{
   var text=form1.DropDownList1.value;
   if (text !="请选择")
   {
       document.getElementById('TextBox1').value +=text+"\r\n";
   }
}

    </script>

</head>
<body onload="Load_Do();">
    <form id="form1" runat="server">
    <div id="topbar">
        <div id="leftnav">
            <a href="../Main/Main.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="title">
            办理工作</div>
    </div>
    <div id="tributton">
        <div class="links">
            <a href="../Main/Main.aspx">主页</a><a href="#">在线用户</a><a id="pressed">关于</a></div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                &nbsp; &nbsp; 当前节点：<asp:Label ID="Label2" runat="server"></asp:Label></span>
            <ul class="pageitem">
                <li class="textbox">
                    <p>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" Style="display: none"></asp:TextBox>
                    </p>
                </li>
            </ul>
            <span class="graytitle">附件：</span>
            <ul class="pageitem">
                <li class="checkbox" style="height: 100px;">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                </li>
                <li class="button">&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False"
                    Width="80" Height="20" ImageAlign="AbsMiddle" ImageUrl="../images/Button/DelFile.jpg"
                    OnClick="ImageButton3_Click" />
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <span class="graytitle">常用审批</span>
            <ul class="pageitem">
                <li class="select">
                    <asp:DropDownList ID="DropDownList1" onchange="_change()" runat="server" Width="100%">
                        <asp:ListItem>请选择</asp:ListItem>
                    </asp:DropDownList>
                    <span class="arrow"></span></li>
            </ul>
            <span class="graytitle">审批意见：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="TextBox1" runat="server" Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                </li>
            </ul>
            <span class="graytitle">上传附件：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="100%" />
                </li>
            </ul>
            <ul class="pageitem">
                <li class="button">
                    <asp:Button ID="Button1" runat="server" Text="保存并通过" OnClick="Button1_Click" Width="100px" />
                    <asp:Button ID="Button2" runat="server" Text="保存并驳回到发文人" OnClick="Button2_Click"
                        Width="160px" />
                </li>
                <li  class="button">
                
                    <asp:Button ID="Button3" runat="server" Text="保存并驳回到其他节点" OnClick="Button3_Click"
                        Width="180px" />
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <span class="graytitle">审批意见：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <p>
                        <asp:Label ID="Label5" runat="server" Height="100"></asp:Label>
                    </p>
                </li>
            </ul>
        </fieldset>
    </div>

    <script type="text/javascript">
        function Load_Do() {
            setTimeout("Load_Do()", 0);
            var content = document.getElementById("Label3").innerHTML
            document.getElementById("TextBox3").value = content;
        }
    </script>

    </form>
</body>
</html>
