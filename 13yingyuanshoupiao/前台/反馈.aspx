<%@ Page Language="C#" AutoEventWireup="true" CodeFile="反馈.aspx.cs" Inherits="前台_反馈" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <script src="js/jquery-1.4.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#btnPost").click(function() {
                $.post("PostComment.ashx", { "msg": $("#TextBox1").val() }, function(data, status) {
                    if (status != "success") {
                        alert("服务器连接失败");
                    }
                    if (data == "forbid") {
                        alert("请文明用语");
                    }
                    else if (data == "ok") {
                    var newComment = $("<li>用户名:我自己 ;   评论内容:" + $("#TextBox1").val() + ";   评论时间:" + new Date().toLocaleDateString() + "</li>");
                        $("#ulComment").append(newComment);
                    }
                    else {
                        alert("插入失败");
                    }
                });

            });
        });
    </script>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-weight: bold;
            color: #3366FF;
            height: 312px;
            width: 1102px;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            font-size: x-large;
            font-weight: bold;
            color: #3366FF;
            text-align: center;
        }
        #btnPost
        {
            height: 39px;
            width: 121px;
            font-weight: 700;
            font-size: x-large;
            color: #3366FF;
        }
        .style4
        {
            width: 957px;
        }
        </style>
</head>
<body>
 
    <form id="form1" runat="server">
    <div class="style2">
    <img alt="" src="image/0.jpg" class="style9"/>
    
    </div>
    <p class="style3">
        欢迎您来到彩虹影院，请您对本影院提出宝贵的建议和意见，谢谢！</p>
    <p class="style3">
        建议和意见：<asp:Label ID="Label1" runat="server" style="color: #FF0000" 
            Text="感谢您的建议" Visible="False"></asp:Label>
    </p>
    <p class="style1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="312px" Width="757px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <div class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="客户反馈" 
            Height="43px" style="font-size: x-large; font-weight: 700; color: #3366FF" 
            Width="142px" onclick="Button2_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
            ID="Button3" runat="server" 
        style="font-size: x-large; color: #3366FF; font-weight: 700" Text="重置" 
            Width="142px" onclick="Button3_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" 
        style="font-size: x-large; color: #3366FF; font-weight: 700" Text="返回首页" 
            PostBackUrl = "~/前台/首页.aspx" Width="142px" />
        <br />
  <table border="0" align="center" bgcolor="#CCCCCC" style="height: 95px; width: 113%">
    <tr>
      <td style="text-align: center" class="style4"><HR>Corporation:张家港市Rainbow影院网上购票系统© 
          版权所有 技术支持：江苏科技大学（张家港）<br />
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br />
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统 
          <br />
          服务热线：0512-58888888| 传真：0512-5888888<span lang="zh-cn">8</span></td>
    </tr>
  </table>
        <br />
    </div>
    </form>
</body>
</html>