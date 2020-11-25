<%@ Page Language="C#" MasterPageFile="~/aadmin/mu.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" Title="后台首页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style5 {
            width: 208px;
            height: 162px;
        }
        .auto-style6 {
            width: 31%;
            float: left;
        }
        .auto-style7 {
            width: 65%;
            float: left;
        }
        .auto-style8 {
            width: 90%;
            height: 20px;
            color: white;
            margin-left: 31px;
            margin-top: 249px;
            margin-bottom: 0px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>

<div style="padding-top:20px; " class="auto-style6">　　　　　
    <img src="../images/admin_touxiang.png" alt="" class="auto-style5"  />　　</div>
    
<div style="padding-top:40px; text-align: center;" class="auto-style7">

<div>   当前时间是：   <script type="text/javascript">
                                                                var week;
                                                                if (new Date().getDay() == 0) week = "星期日"
                                                                if (new Date().getDay() == 1) week = "星期一"
                                                                if (new Date().getDay() == 2) week = "星期二"
                                                                if (new Date().getDay() == 3) week = "星期三"
                                                                if (new Date().getDay() == 4) week = "星期四"
                                                                if (new Date().getDay() == 5) week = "星期五"
                                                                if (new Date().getDay() == 6) week = "星期六"
                                                                document.write(new Date().getFullYear() + "年" + (new Date().getMonth() + 1) + "月" + new Date().getDate() + "日 " + week);</script>

                                                            <span id="time"></span>

                                                            <script type="text/javascript">                                                                setInterval("time.innerHTML=new Date().getHours()+':'+new Date().getMinutes()+':'+new Date().getSeconds()", 1000);</script></div>
    <br />
  登入IP：<asp:Label ID="Label3" runat="server" Text="Label："></asp:Label>
    <br />
    <br />
                                                            
<div>
 登入用户：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    </div>角色：<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <div>欢迎进入网站管理中心！<br />
    </div>
</div>
<div style="clear:both;"></div>
<div style="text-align:center; background-image:url('images/title_bg2.jpg'); " class="auto-style8">相关信息及说明</div>
<div style="background-color:#ecf4fc; height:12px; margin-left:25px; width:90%"></div>

<div style="margin-left:80px; margin-top:25px; font-size:14px;">
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label><br />
  &nbsp;<br />
    </div>

</div>
</asp:Content>

