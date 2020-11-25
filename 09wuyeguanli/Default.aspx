<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControl/NotifyUC.ascx" TagName="NotifyUC" TagPrefix="ucNotify" %>
<%@ Register Src="UserControl/NewsUC.ascx" TagName="NewsUC" TagPrefix="ucNews" %>
<%@ Register Src="UserControl/QueryUC.ascx" TagName="QueryUC" TagPrefix="ucQuery" %>
<%@ Register Src="UserControl/Control_End.ascx" TagName="Control_End" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>首页</title>
    <link href="Css/newCss.css" rel="stylesheet"/>
   <link href="Css/css.css" rel="stylesheet" />
    <script type="text/javascript" src="aui-artDialog/jquery.js"></script>
    
    <script type="text/javascript">	
        $(function(){
		    //ajax调用不使用缓存
			$.ajaxSetup({cache:false});
			
			$(".menutitle").mouseenter(function(){
                $(this).addClass("active");
            })
                
            $(".menutitle").mouseleave(function(){
                $(this).removeClass("active");
            })			     
        })
        
        function linkProducts(url){
            $("#i_frame").attr("src", url);
        }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <center>
    <table><tr><td>
        <div style="width:1000px; background-image:url(Image/index_05.png); height:142px">
            <div style="height:113px; width:100px">&nbsp;</div>
            <div class="userInfo">
                <div id="logindiv" class="<%=css2 %>"><%--<a id="linkLogin" href="Login.aspx">登录&nbsp;</a>--%></div>
                <div id="mymenu" class="<%=css %>">
                    <div class="personalmenu">
                        <div class="logininfo"><span style="font-weight:bold; color:blue"><%=user %></span> | <a href="EditUserPwd.aspx">修改密码</a> | <asp:LinkButton runat="server" Text="退出" 
                                ID="ButtonQuit" onclick="ButtonQuit_Click"></asp:LinkButton></div>
                        
                    </div>
                </div>
            </div>
          </div>
        <table border="0" cellpadding="0" cellspacing="0" style="background-color">
            <tr>
                <td>
                    <div id="main" class="bottom <%=normalusercss %>">
                        <div class="left">
                            <div id="MyQuery" class="mycontrol" style=" width:245px">
                                <ucQuery:QueryUC id="MyQueryUC" runat="server"></ucQuery:QueryUC>
                            </div>
                            <div id="MyNotify" class="mycontrol" style="margin-top:7px">
                                <ucNotify:NotifyUC id="MyNotifyUC" runat="server"></ucNotify:NotifyUC>
                            </div>
                            <div id="MyNews" class="mycontrol"  style="margin-top:7px">
                                <ucNews:NewsUC id="MyNewsUC" runat="server" ></ucNews:NewsUC>
                            </div>
                        </div>
                        <div class="right">
                            <div id="menubar">
                                <div id="main" class="menutitle" onclick="linkProducts('main.aspx', 'main')">首页</div> 
                                <div id="Money" class="menutitle" onclick="linkProducts('Money.aspx', 'Money')">我的水电费</div>
                                <div id="WuYeMoney" class="menutitle" onclick="linkProducts('WuYeMoney.aspx','WuYeMoney')">我的物业费</div>
                                <div id="Car" class="menutitle" onclick="linkProducts('Car.aspx', 'Car')">我的车位</div>
                                <div id="Repair" class="menutitle" onclick="linkProducts('Repair.aspx', 'Repair')">我的报修</div>
                                <div id="Complaint" class="menutitle" onclick="linkProducts('Complaint.aspx', 'Complaint')">我的投诉</div>
                                <div id="LY" class="menutitle" onclick="linkProducts('main1.aspx', 'main1')">留言板</div>
                                <div id="ZC" class="menutitle" onclick="linkProducts('zhuce.aspx', 'ZC')">注册</div>
                                <div id="DL" class="menutitle" onclick="window.location.href='ULogin.aspx'">登录</div>
                            </div>
                            <div id="iframe" style="height:574px; margin-top:5px; width:738px;">
                                <iframe id="i_frame" name="i_frame" width="100%" height="99.8%" marginheight="0" frameborder="0" src="main.aspx" scrolling="no"></iframe>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div><uc1:Control_End ID="Control_End1" runat="server" /></div></td></tr></table>
    </center>
    </form>
</body>
</html>
