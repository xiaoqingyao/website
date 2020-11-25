<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SystemJiaoSeView.aspx.cs" Inherits="SystemManage_SystemJiaoSeView" %>
<html>
	<head>
		<title>企业OA综合管理平台</title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script language="javascript">
  function PrintTable()
    {
        document.getElementById("PrintHide") .style.visibility="hidden"    
        print();
        document.getElementById("PrintHide") .style.visibility="visible"    
    }
  </script>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;系统管理&nbsp;>>&nbsp;查看角色
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    &nbsp;<img class="HerCss" onclick="PrintTable()" src="../images/Button/BtnPrint.jpg" id="IMG1" />&nbsp;
                    &nbsp;<img src="../images/Button/JianGe.jpg" />&nbsp;
                    <img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">            
        
        <tr>
            <td align="right" style="width: 170px; background-color: #cccccc; height: 25px;" >
                角色名称：</td>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px;" >
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                备注信息：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label2" runat="server"></asp:Label></td>
        </tr>        
        <tr>
            
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                权限配置：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                </td>
        </tr>
        </table></div>
        <table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
        <tr>
            
            <td align="center" style="height: 25px; background-color: #ffffff" background="../images/BGLine.png">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="8" RepeatDirection="Horizontal" Width="100%">
                   <asp:ListItem Value="001">办公桌--内部邮件--收件箱--查看</asp:ListItem>
                    <asp:ListItem Value="001a">添加</asp:ListItem>                    
                    <asp:ListItem Value="001d">删除</asp:ListItem>
                    <asp:ListItem Value="001e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="002">办公桌--内部邮件--草稿箱--查看</asp:ListItem>
                    <asp:ListItem Value="002a">添加</asp:ListItem>
                    <asp:ListItem Value="002s">发送</asp:ListItem>
                    <asp:ListItem Value="002m">删除</asp:ListItem>
                    <asp:ListItem Value="002e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="003">办公桌--内部邮件--已发送--查看</asp:ListItem>                    
                    <asp:ListItem Value="003e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="004">办公桌--内部邮件--已删除--查看</asp:ListItem>
                    <asp:ListItem Value="004a">添加</asp:ListItem>
                    <asp:ListItem Value="004r">恢复</asp:ListItem>
                    <asp:ListItem Value="004d">删除</asp:ListItem>
                    <asp:ListItem Value="004e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="005">办公桌--Internet邮件--收件箱--查看</asp:ListItem>
                    <asp:ListItem Value="005a">添加</asp:ListItem>                    
                    <asp:ListItem Value="005d">删除</asp:ListItem>
                    <asp:ListItem Value="005e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="006">办公桌--Internet邮件--草稿箱--查看</asp:ListItem>
                    <asp:ListItem Value="006a">添加</asp:ListItem>
                    <asp:ListItem Value="006s">发送</asp:ListItem>
                    <asp:ListItem Value="006m">删除</asp:ListItem>
                    <asp:ListItem Value="006e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="007">办公桌--Internet邮件--已发送--查看</asp:ListItem>                    
                    <asp:ListItem Value="007d">删除</asp:ListItem>
                    <asp:ListItem Value="007e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="008">办公桌--Internet邮件--已删除--查看</asp:ListItem>
                    <asp:ListItem Value="008a">添加</asp:ListItem>
                    <asp:ListItem Value="008r">恢复</asp:ListItem>
                    <asp:ListItem Value="008d">删除</asp:ListItem>
                    <asp:ListItem Value="008e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="009">办公桌--手机短信--查看</asp:ListItem>
                    <asp:ListItem Value="009a">添加</asp:ListItem>
                    <asp:ListItem Value="009s">发送</asp:ListItem>
                    <asp:ListItem Value="009d">删除</asp:ListItem>
                    <asp:ListItem Value="009e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="010">办公桌--单位公告通知--查看</asp:ListItem>
                    <asp:ListItem Value="010a">添加</asp:ListItem>
                    <asp:ListItem Value="010m">修改</asp:ListItem>
                    <asp:ListItem Value="010d">删除</asp:ListItem>
                    <asp:ListItem Value="010e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="011">办公桌--部门公告通知--查看</asp:ListItem>
                    <asp:ListItem Value="011a">添加</asp:ListItem>
                    <asp:ListItem Value="011m">修改</asp:ListItem>
                    <asp:ListItem Value="011d">删除</asp:ListItem>
                    <asp:ListItem Value="011e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="012">办公桌--投票--查看</asp:ListItem>
                    <asp:ListItem Value="012a">添加</asp:ListItem>
                    <asp:ListItem Value="012m">修改</asp:ListItem>
                    <asp:ListItem Value="012d">删除</asp:ListItem>
                    <asp:ListItem Value="012e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="013">办公桌--日程安排--查看</asp:ListItem>
                    <asp:ListItem Value="013a">添加</asp:ListItem>
                    <asp:ListItem Value="013m">修改</asp:ListItem>
                    <asp:ListItem Value="013d">删除</asp:ListItem>
                    <asp:ListItem Value="013e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="R013">办公桌--日程管理--查看</asp:ListItem>
                    <asp:ListItem Value="R013e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="014">办公桌--工作日志--查看</asp:ListItem>
                    <asp:ListItem Value="014a">添加</asp:ListItem>
                    <asp:ListItem Value="014m">修改</asp:ListItem>
                    <asp:ListItem Value="014d">删除</asp:ListItem>
                    <asp:ListItem Value="014e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="015">办公桌--公共通讯簿--查看</asp:ListItem>
                    <asp:ListItem Value="015a">添加</asp:ListItem>
                    <asp:ListItem Value="015m">修改</asp:ListItem>
                    <asp:ListItem Value="015d">删除</asp:ListItem>
                    <asp:ListItem Value="015e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="016">办公桌--共享通讯簿--查看</asp:ListItem>                    
                    <asp:ListItem Value="016e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="017">办公桌--个人通讯簿--查看</asp:ListItem>
                    <asp:ListItem Value="017a">添加</asp:ListItem>
                    <asp:ListItem Value="017m">修改</asp:ListItem>
                    <asp:ListItem Value="017d">删除</asp:ListItem>
                    <asp:ListItem Value="017e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>                   
                    
                    
                    <asp:ListItem Value="020">办公桌--基本资料--查看</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="021">办公桌--系统提醒--查看</asp:ListItem>                    
                    <asp:ListItem Value="021m">修改</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="022">办公桌--修改密码--查看</asp:ListItem>                    
                    <asp:ListItem Value="022m">修改</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="023">办公桌--邮件设置--查看</asp:ListItem>                    
                    <asp:ListItem Value="023m">修改</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="024">办公桌--常用审批--查看</asp:ListItem>
                    <asp:ListItem Value="024a">添加</asp:ListItem>
                    <asp:ListItem Value="024m">修改</asp:ListItem>
                    <asp:ListItem Value="024d">删除</asp:ListItem>
                    <asp:ListItem Value="024e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="025">办公桌--常用模板--查看</asp:ListItem>
                    <asp:ListItem Value="025a">添加</asp:ListItem>
                    <asp:ListItem Value="025m">修改</asp:ListItem>
                    <asp:ListItem Value="025d">删除</asp:ListItem>
                    <asp:ListItem Value="025e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="026">办公桌--我的权限--查看</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    
                    
                    <asp:ListItem Value="074">工作流程--工作管理--我的工作</asp:ListItem>                    
                    <asp:ListItem Value="074a">添加</asp:ListItem>                    
                    <asp:ListItem Value="074d">删除</asp:ListItem>
                    <asp:ListItem Value="074e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="075">工作流程--工作管理--待办工作</asp:ListItem>
                    <asp:ListItem Value="075e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="076">工作流程--工作管理--查询工作</asp:ListItem>                    
                    <asp:ListItem Value="076e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="077">工作流程--工作管理--工作监控</asp:ListItem>
                    <asp:ListItem Value="077d">删除</asp:ListItem>
                    <asp:ListItem Value="077e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="078">工作流程--工作管理--归档工作</asp:ListItem>
                    <asp:ListItem Value="078d">删除</asp:ListItem>
                    <asp:ListItem Value="078e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="079">工作流程--表单定义--表单设计</asp:ListItem>                    
                    <asp:ListItem Value="079a">添加</asp:ListItem>
                    <asp:ListItem Value="079m">修改</asp:ListItem>
                    <asp:ListItem Value="079d">删除</asp:ListItem>
                    <asp:ListItem Value="079e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="080">工作流程--表单定义--表单类别</asp:ListItem> 
                    <asp:ListItem Value="080m">修改</asp:ListItem>                  
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="081">工作流程--工作管理--流程定义</asp:ListItem>                    
                    <asp:ListItem Value="081a">添加</asp:ListItem>
                    <asp:ListItem Value="081m">修改</asp:ListItem>
                    <asp:ListItem Value="081d">删除</asp:ListItem>
                    <asp:ListItem Value="081e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="082">工作流程--印章管理--公共印章</asp:ListItem>                    
                    <asp:ListItem Value="082a">添加</asp:ListItem>
                    <asp:ListItem Value="082m">修改</asp:ListItem>
                    <asp:ListItem Value="082d">删除</asp:ListItem>
                    <asp:ListItem Value="082e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="083">工作流程--印章管理--私人印章</asp:ListItem>                    
                    <asp:ListItem Value="083a">添加</asp:ListItem>
                    <asp:ListItem Value="083m">修改</asp:ListItem>
                    <asp:ListItem Value="083d">删除</asp:ListItem>
                    <asp:ListItem Value="083e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="084">工作流程--印章管理--公章使用日志</asp:ListItem>
                    <asp:ListItem Value="084d">删除</asp:ListItem>
                    <asp:ListItem Value="084e">导出</asp:ListItem>  
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>                  
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="085">工作流程--印章管理--私章使用日志</asp:ListItem> 
                    <asp:ListItem Value="085d">删除</asp:ListItem>
                    <asp:ListItem Value="085e">导出</asp:ListItem>  
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>                  
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="057">公文收发--接收文件--查看</asp:ListItem>                    
                    <asp:ListItem Value="057e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="058">公文收发--传阅文件--查看</asp:ListItem>                    
                    <asp:ListItem Value="058a">添加</asp:ListItem>
                    <asp:ListItem Value="058d">删除</asp:ListItem>
                    <asp:ListItem Value="058e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="F001">公文收发--接收文件浏览--查看</asp:ListItem>                    
                    <asp:ListItem Value="F001e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="F002">公文收发--传阅文件浏览--查看</asp:ListItem>                    
                    <asp:ListItem Value="F002e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="F003">公文收发--接收文件分类--查看</asp:ListItem>
                    <asp:ListItem Value="F003a">添加</asp:ListItem>
                    <asp:ListItem Value="F003m">修改</asp:ListItem>
                    <asp:ListItem Value="F003d">删除</asp:ListItem>
                    <asp:ListItem Value="F003e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="F004">公文收发--传阅文件分类--查看</asp:ListItem>
                    <asp:ListItem Value="F004a">添加</asp:ListItem>
                    <asp:ListItem Value="F004m">修改</asp:ListItem>
                    <asp:ListItem Value="F004d">删除</asp:ListItem>
                    <asp:ListItem Value="F004e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="027">工作管理--我的计划--查看</asp:ListItem>
                    <asp:ListItem Value="027a">添加</asp:ListItem>
                    <asp:ListItem Value="027m">修改</asp:ListItem>
                    <asp:ListItem Value="027d">删除</asp:ListItem>
                    <asp:ListItem Value="027e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="028">工作管理--计划管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="028e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A001">工作管理--我的汇报--查看</asp:ListItem>
                    <asp:ListItem Value="A001a">添加</asp:ListItem>
                    <asp:ListItem Value="A001m">修改</asp:ListItem>
                    <asp:ListItem Value="A001d">删除</asp:ListItem>
                    <asp:ListItem Value="A001e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A002">工作管理--汇报管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A002e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="A003">人力资源管理--人事档案--查看</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="A004">人力资源管理--人事合同--查看</asp:ListItem>
                    <asp:ListItem Value="A004a">添加</asp:ListItem>
                    <asp:ListItem Value="A004m">修改</asp:ListItem>
                    <asp:ListItem Value="A004d">删除</asp:ListItem>
                    <asp:ListItem Value="A004e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="A005">人力资源管理--考核项目--查看</asp:ListItem>
                    <asp:ListItem Value="A005a">添加</asp:ListItem>
                    <asp:ListItem Value="A005m">修改</asp:ListItem>
                    <asp:ListItem Value="A005d">删除</asp:ListItem>
                    <asp:ListItem Value="A005e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A006">人力资源管理--考核任务--查看</asp:ListItem>
                    <asp:ListItem Value="A006a">添加</asp:ListItem>
                    <asp:ListItem Value="A006m">修改</asp:ListItem>
                    <asp:ListItem Value="A006d">删除</asp:ListItem>
                    <asp:ListItem Value="A006e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="A007">人力资源管理--考核管理--查看</asp:ListItem>
                    <asp:ListItem Value="A007a">添加</asp:ListItem>
                    <asp:ListItem Value="A007m">修改</asp:ListItem>
                    <asp:ListItem Value="A007d">删除</asp:ListItem>
                    <asp:ListItem Value="A007e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A008">人力资源管理--奖惩记录--查看</asp:ListItem>
                    <asp:ListItem Value="A008a">添加</asp:ListItem>
                    <asp:ListItem Value="A008m">修改</asp:ListItem>
                    <asp:ListItem Value="A008d">删除</asp:ListItem>
                    <asp:ListItem Value="A008e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="029">人力资源管理--上下班登记--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="030">人力资源管理--外出登记--查看</asp:ListItem>
                    <asp:ListItem Value="030a">添加</asp:ListItem>                    
                    <asp:ListItem Value="030d">删除</asp:ListItem>
                    <asp:ListItem Value="030e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="031">人力资源管理--出差登记--查看</asp:ListItem>
                    <asp:ListItem Value="031a">添加</asp:ListItem>                    
                    <asp:ListItem Value="031d">删除</asp:ListItem>
                    <asp:ListItem Value="031e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="032">人力资源管理--加班登记--查看</asp:ListItem>
                    <asp:ListItem Value="032a">添加</asp:ListItem>                    
                    <asp:ListItem Value="032d">删除</asp:ListItem>
                    <asp:ListItem Value="032e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="033">人力资源管理--病假登记--查看</asp:ListItem>
                    <asp:ListItem Value="033a">添加</asp:ListItem>                    
                    <asp:ListItem Value="033d">删除</asp:ListItem>
                    <asp:ListItem Value="033e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="034">人力资源管理--事假登记--查看</asp:ListItem>
                    <asp:ListItem Value="034a">添加</asp:ListItem>                    
                    <asp:ListItem Value="034d">删除</asp:ListItem>
                    <asp:ListItem Value="034e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="035">人力资源管理--外出审批--查看</asp:ListItem>
                    <asp:ListItem Value="035p">通过</asp:ListItem>                    
                    <asp:ListItem Value="035n">拒绝</asp:ListItem>
                    <asp:ListItem Value="035e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="036">人力资源管理--出差审批--查看</asp:ListItem>
                    <asp:ListItem Value="036p">通过</asp:ListItem>                    
                    <asp:ListItem Value="036n">拒绝</asp:ListItem>
                    <asp:ListItem Value="036e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="037">人力资源管理--加班审批--查看</asp:ListItem>
                    <asp:ListItem Value="037p">通过</asp:ListItem>                    
                    <asp:ListItem Value="037n">拒绝</asp:ListItem>
                    <asp:ListItem Value="037e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="038">人力资源管理--病假审批--查看</asp:ListItem>
                    <asp:ListItem Value="038p">通过</asp:ListItem>                    
                    <asp:ListItem Value="038n">拒绝</asp:ListItem>
                    <asp:ListItem Value="038e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="039">人力资源管理--事假审批--查看</asp:ListItem>
                    <asp:ListItem Value="039p">通过</asp:ListItem>                    
                    <asp:ListItem Value="039n">拒绝</asp:ListItem>
                    <asp:ListItem Value="039e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="040">人力资源管理--考勤设置--查看</asp:ListItem>                    
                    <asp:ListItem Value="040m">修改</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="041">人力资源管理--考勤明细--查看</asp:ListItem>                    
                    <asp:ListItem Value="041e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="042">人力资源管理--考勤查询统计--查看</asp:ListItem>                    
                    <asp:ListItem Value="042e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    
                    <asp:ListItem Value="C001">客户管理CRM--我的客户--客户信息</asp:ListItem>                    
                    <asp:ListItem Value="C001a">添加</asp:ListItem>
                    <asp:ListItem Value="C001m">修改</asp:ListItem>
                    <asp:ListItem Value="C001d">删除</asp:ListItem>
                    <asp:ListItem Value="C001e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C002">客户管理CRM--我的客户--客户联系人</asp:ListItem>                    
                    <asp:ListItem Value="C002a">添加</asp:ListItem>
                    <asp:ListItem Value="C002m">修改</asp:ListItem>
                    <asp:ListItem Value="C002d">删除</asp:ListItem>
                    <asp:ListItem Value="C002e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C003">客户管理CRM--我的客户--联系记录</asp:ListItem>                    
                    <asp:ListItem Value="C003a">添加</asp:ListItem>
                    <asp:ListItem Value="C003m">修改</asp:ListItem>
                    <asp:ListItem Value="C003d">删除</asp:ListItem>
                    <asp:ListItem Value="C003e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C004">客户管理CRM--我的客户--需求记录</asp:ListItem>                    
                    <asp:ListItem Value="C004a">添加</asp:ListItem>
                    <asp:ListItem Value="C004m">修改</asp:ListItem>
                    <asp:ListItem Value="C004d">删除</asp:ListItem>
                    <asp:ListItem Value="C004e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C005">客户管理CRM--我的客户--报价记录</asp:ListItem>                    
                    <asp:ListItem Value="C005a">添加</asp:ListItem>
                    <asp:ListItem Value="C005m">修改</asp:ListItem>
                    <asp:ListItem Value="C005d">删除</asp:ListItem>
                    <asp:ListItem Value="C005e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C006">客户管理CRM--我的客户--服务记录</asp:ListItem>                    
                    <asp:ListItem Value="C006a">添加</asp:ListItem>
                    <asp:ListItem Value="C006m">修改</asp:ListItem>
                    <asp:ListItem Value="C006d">删除</asp:ListItem>
                    <asp:ListItem Value="C006e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C007">客户管理CRM--我的客户--回访记录</asp:ListItem>                    
                    <asp:ListItem Value="C007a">添加</asp:ListItem>
                    <asp:ListItem Value="C007m">修改</asp:ListItem>
                    <asp:ListItem Value="C007d">删除</asp:ListItem>
                    <asp:ListItem Value="C007e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C008">客户管理CRM--我的客户--投诉记录</asp:ListItem>                    
                    <asp:ListItem Value="C008a">添加</asp:ListItem>
                    <asp:ListItem Value="C008m">修改</asp:ListItem>
                    <asp:ListItem Value="C008d">删除</asp:ListItem>
                    <asp:ListItem Value="C008e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C018">客户管理CRM--我的客户--送样记录</asp:ListItem>                    
                    <asp:ListItem Value="C018a">添加</asp:ListItem>
                    <asp:ListItem Value="C018m">修改</asp:ListItem>
                    <asp:ListItem Value="C018d">删除</asp:ListItem>
                    <asp:ListItem Value="C018e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C009">客户管理CRM--客户管理--客户信息管理</asp:ListItem>                    
                    <asp:ListItem Value="C009d">删除</asp:ListItem>
                    <asp:ListItem Value="C009e">导出</asp:ListItem>                    
                    <asp:ListItem Value="C009m">客户转移</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C010">客户管理CRM--客户管理--联系人管理</asp:ListItem>                    
                    <asp:ListItem Value="C010d">删除</asp:ListItem>
                    <asp:ListItem Value="C010e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="C011">客户管理CRM--客户管理--联系记录管理</asp:ListItem>                    
                    <asp:ListItem Value="C011d">删除</asp:ListItem>
                    <asp:ListItem Value="C011e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C012">客户管理CRM--客户管理--需求记录管理</asp:ListItem>                    
                    <asp:ListItem Value="C012d">删除</asp:ListItem>
                    <asp:ListItem Value="C012e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C013">客户管理CRM--客户管理--报价记录管理</asp:ListItem>                    
                    <asp:ListItem Value="C013d">删除</asp:ListItem>
                    <asp:ListItem Value="C013e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="C014">客户管理CRM--客户管理--服务记录管理</asp:ListItem>                    
                    <asp:ListItem Value="C014d">删除</asp:ListItem>
                    <asp:ListItem Value="C014e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C015">客户管理CRM--客户管理--回访记录管理</asp:ListItem>                    
                    <asp:ListItem Value="C015d">删除</asp:ListItem>
                    <asp:ListItem Value="C015e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C016">客户管理CRM--客户管理--投诉记录管理</asp:ListItem>                    
                    <asp:ListItem Value="C016d">删除</asp:ListItem>
                    <asp:ListItem Value="C016e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C019">客户管理CRM--客户管理--送样记录管理</asp:ListItem>                    
                    <asp:ListItem Value="C019d">删除</asp:ListItem>
                    <asp:ListItem Value="C019e">导出</asp:ListItem>                    
                   <asp:ListItem Value="C019m">财务输入</asp:ListItem>                
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C017">客户管理CRM--客户管理--邮件信息群发</asp:ListItem>
                    <asp:ListItem Value="C017e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C020">客户管理CRM--客户管理--客户信息统计</asp:ListItem>
                    <asp:ListItem></asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="C021">客户管理CRM--客户管理--客户参数设置</asp:ListItem>
                    <asp:ListItem></asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="X001">项目管理--项目信息--查看</asp:ListItem>                    
                    <asp:ListItem Value="X001a">添加</asp:ListItem>
                    <asp:ListItem Value="X001m">修改</asp:ListItem>
                    <asp:ListItem Value="X001d">删除</asp:ListItem>
                    <asp:ListItem Value="X001e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X002">项目管理--评审信息--查看</asp:ListItem>                    
                    <asp:ListItem Value="X002a">添加</asp:ListItem>
                    <asp:ListItem Value="X002m">修改</asp:ListItem>
                    <asp:ListItem Value="X002d">删除</asp:ListItem>
                    <asp:ListItem Value="X002e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X003">项目管理--项目进度--查看</asp:ListItem>                    
                    <asp:ListItem Value="X003a">添加</asp:ListItem>
                    <asp:ListItem Value="X003m">修改</asp:ListItem>
                    <asp:ListItem Value="X003d">删除</asp:ListItem>
                    <asp:ListItem Value="X003e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X004">项目管理--收款信息--查看</asp:ListItem>                    
                    <asp:ListItem Value="X004a">添加</asp:ListItem>
                    <asp:ListItem Value="X004m">修改</asp:ListItem>
                    <asp:ListItem Value="X004d">删除</asp:ListItem>
                    <asp:ListItem Value="X004e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X005">项目管理--项目实施--查看</asp:ListItem>                    
                    <asp:ListItem Value="X005a">添加</asp:ListItem>
                    <asp:ListItem Value="X005m">修改</asp:ListItem>
                    <asp:ListItem Value="X005d">删除</asp:ListItem>
                    <asp:ListItem Value="X005e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X006">项目管理--报销申请--查看</asp:ListItem>                    
                    <asp:ListItem Value="X006a">添加</asp:ListItem>                    
                    <asp:ListItem Value="X006d">删除</asp:ListItem>
                    <asp:ListItem Value="X006e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X007">项目管理--报销管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="X007a">通过</asp:ListItem>                    
                    <asp:ListItem Value="X007d">拒绝</asp:ListItem>
                    <asp:ListItem Value="X007e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X008">项目管理--项目利润--查看</asp:ListItem>                    
                    <asp:ListItem Value="X008a">添加</asp:ListItem>
                    <asp:ListItem Value="X008m">修改</asp:ListItem>
                    <asp:ListItem Value="X008d">删除</asp:ListItem>
                    <asp:ListItem Value="X008e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="X009">项目管理--数据统计--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A009">销售订单管理--产品信息管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A009a">添加</asp:ListItem>
                    <asp:ListItem Value="A009m">修改</asp:ListItem>
                    <asp:ListItem Value="A009d">删除</asp:ListItem>
                    <asp:ListItem Value="A009e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A010">销售订单管理--销售合同登记--查看</asp:ListItem>                    
                    <asp:ListItem Value="A010a">添加</asp:ListItem>
                    <asp:ListItem Value="A010m">修改</asp:ListItem>
                    <asp:ListItem Value="A010d">删除</asp:ListItem>
                    <asp:ListItem Value="A010e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A011">销售订单管理--销售合同管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A011a">通过</asp:ListItem>
                    <asp:ListItem Value="A011m">拒绝</asp:ListItem>
                    <asp:ListItem Value="A011d">删除</asp:ListItem>
                    <asp:ListItem Value="A011e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A012">销售订单管理--合同产品记录--查看</asp:ListItem>                    
                    <asp:ListItem Value="A012a">添加</asp:ListItem>
                    <asp:ListItem Value="A012m">修改</asp:ListItem>
                    <asp:ListItem Value="A012d">删除</asp:ListItem>
                    <asp:ListItem Value="A012e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="A013">供应商管理--供应商管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A013a">添加</asp:ListItem>
                    <asp:ListItem Value="A013m">修改</asp:ListItem>
                    <asp:ListItem Value="A013d">删除</asp:ListItem>
                    <asp:ListItem Value="A013e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A014">供应商管理--供应商联系人--查看</asp:ListItem>                    
                    <asp:ListItem Value="A014a">添加</asp:ListItem>
                    <asp:ListItem Value="A014m">修改</asp:ListItem>
                    <asp:ListItem Value="A014d">删除</asp:ListItem>
                    <asp:ListItem Value="A014e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A015">供应商管理--采购订单登记--查看</asp:ListItem>                    
                    <asp:ListItem Value="A015a">添加</asp:ListItem>
                    <asp:ListItem Value="A015m">修改</asp:ListItem>
                    <asp:ListItem Value="A015d">删除</asp:ListItem>
                    <asp:ListItem Value="A015e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A016">供应商管理--采购订单管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A016a">通过</asp:ListItem>
                    <asp:ListItem Value="A016m">拒绝</asp:ListItem>
                    <asp:ListItem Value="A016d">删除</asp:ListItem>
                    <asp:ListItem Value="A016e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A017">供应商管理--采购产品记录--查看</asp:ListItem>                    
                    <asp:ListItem Value="A017a">添加</asp:ListItem>
                    <asp:ListItem Value="A017m">修改</asp:ListItem>
                    <asp:ListItem Value="A017d">删除</asp:ListItem>
                    <asp:ListItem Value="A017e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    
                    
                    
                    <asp:ListItem Value="A018">办公用品管理--办公用品申请--查看</asp:ListItem>                    
                    <asp:ListItem Value="A018a">添加</asp:ListItem>
                    <asp:ListItem Value="A018m">修改</asp:ListItem>
                    <asp:ListItem Value="A018d">删除</asp:ListItem>
                    <asp:ListItem Value="A018e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A019">办公用品管理--办公用品管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A019a">通过</asp:ListItem>
                    <asp:ListItem Value="A019m">拒绝</asp:ListItem>
                    <asp:ListItem Value="A019d">删除</asp:ListItem>
                    <asp:ListItem Value="A019e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A020">固定资产管理--固定资产管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A020a">添加</asp:ListItem>
                    <asp:ListItem Value="A020m">修改</asp:ListItem>
                    <asp:ListItem Value="A020d">删除</asp:ListItem>
                    <asp:ListItem Value="A020e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A021">固定资产管理--资产折旧记录--查看</asp:ListItem>                    
                    <asp:ListItem Value="A021a">添加</asp:ListItem>
                    <asp:ListItem Value="A021m">修改</asp:ListItem>
                    <asp:ListItem Value="A021d">删除</asp:ListItem>
                    <asp:ListItem Value="A021e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A022">图书管理--图书管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A022a">添加</asp:ListItem>
                    <asp:ListItem Value="A022m">修改</asp:ListItem>
                    <asp:ListItem Value="A022d">删除</asp:ListItem>
                    <asp:ListItem Value="A022e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A023">图书管理--图书借阅登记--查看</asp:ListItem>                    
                    <asp:ListItem Value="A023a">添加</asp:ListItem>
                    <asp:ListItem Value="A023m">修改</asp:ListItem>
                    <asp:ListItem Value="A023d">删除</asp:ListItem>
                    <asp:ListItem Value="A023e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A024">图书管理--图书借阅管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A024a">借出</asp:ListItem>
                    <asp:ListItem Value="A024m">归还</asp:ListItem>
                    <asp:ListItem Value="A024d">删除</asp:ListItem>
                    <asp:ListItem Value="A024e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    
                    <asp:ListItem Value="A025">档案文书管理--卷库管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A025a">添加</asp:ListItem>
                    <asp:ListItem Value="A025m">修改</asp:ListItem>
                    <asp:ListItem Value="A025d">删除</asp:ListItem>
                    <asp:ListItem Value="A025e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A026">档案文书管理--档案管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A026a">添加</asp:ListItem>
                    <asp:ListItem Value="A026m">修改</asp:ListItem>
                    <asp:ListItem Value="A026d">删除</asp:ListItem>
                    <asp:ListItem Value="A026e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A027">档案文书管理--档案销毁--查看</asp:ListItem> 
                    <asp:ListItem Value="A027a">恢复</asp:ListItem>
                    <asp:ListItem Value="A027d">删除</asp:ListItem>
                    <asp:ListItem Value="A027e">导出</asp:ListItem>   
                    <asp:ListItem></asp:ListItem>                 
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A028">培训管理--培训信息--查看</asp:ListItem>                    
                    <asp:ListItem Value="A028a">添加</asp:ListItem>
                    <asp:ListItem Value="A028m">修改</asp:ListItem>
                    <asp:ListItem Value="A028d">删除</asp:ListItem>
                    <asp:ListItem Value="A028e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A029">培训管理--培训日志--查看</asp:ListItem>                    
                    <asp:ListItem Value="A029a">添加</asp:ListItem>
                    <asp:ListItem Value="A029m">修改</asp:ListItem>
                    <asp:ListItem Value="A029d">删除</asp:ListItem>
                    <asp:ListItem Value="A029e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A030">培训管理--效果评估--查看</asp:ListItem>                    
                    <asp:ListItem Value="A030a">添加</asp:ListItem>
                    <asp:ListItem Value="A030m">修改</asp:ListItem>
                    <asp:ListItem Value="A030d">删除</asp:ListItem>
                    <asp:ListItem Value="A030e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="018">会议管理--我的会议--查看</asp:ListItem>                    
                    <asp:ListItem Value="018e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="F005">会议管理--会议申请--查看</asp:ListItem>
                    <asp:ListItem Value="F005a">添加</asp:ListItem>
                    <asp:ListItem Value="F005m">修改</asp:ListItem>
                    <asp:ListItem Value="F005d">删除</asp:ListItem>
                    <asp:ListItem Value="F005e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="019">会议管理--网络会议--查看</asp:ListItem>
                    <asp:ListItem Value="019a">通过</asp:ListItem>
                    <asp:ListItem Value="019m">拒绝</asp:ListItem>
                    <asp:ListItem Value="019d">删除</asp:ListItem>
                    <asp:ListItem Value="019e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="F006">会议管理--会议查询--查看</asp:ListItem>                    
                    <asp:ListItem Value="F006e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                     <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="A031">资源调配管理--资源申请--查看</asp:ListItem>                    
                    <asp:ListItem Value="A031a">添加</asp:ListItem>
                    <asp:ListItem Value="A031m">修改</asp:ListItem>
                    <asp:ListItem Value="A031d">删除</asp:ListItem>
                    <asp:ListItem Value="A031e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="A032">资源调配管理--资源管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="A032a">通过</asp:ListItem>
                    <asp:ListItem Value="A032m">拒绝</asp:ListItem>
                    <asp:ListItem Value="A032d">删除</asp:ListItem>
                    <asp:ListItem Value="A032e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="F007">车辆管理--车辆使用申请--查看</asp:ListItem>
                    <asp:ListItem Value="F007a">添加</asp:ListItem>
                    <asp:ListItem Value="F007m">修改</asp:ListItem>
                    <asp:ListItem Value="F007d">删除</asp:ListItem>
                    <asp:ListItem Value="F007e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="F008">车辆管理--车辆使用管理--查看</asp:ListItem>
                    <asp:ListItem Value="F008a">同意</asp:ListItem>
                    <asp:ListItem Value="F008m">拒绝</asp:ListItem>
                    <asp:ListItem Value="F008d">删除</asp:ListItem>
                    <asp:ListItem Value="F008e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="F009">车辆管理--车辆维护申请--查看</asp:ListItem>
                    <asp:ListItem Value="F009a">添加</asp:ListItem>
                    <asp:ListItem Value="F009m">修改</asp:ListItem>
                    <asp:ListItem Value="F009d">删除</asp:ListItem>
                    <asp:ListItem Value="F009e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="F010">车辆管理--车辆维护管理--查看</asp:ListItem>
                    <asp:ListItem Value="F010a">同意</asp:ListItem>
                    <asp:ListItem Value="F010m">拒绝</asp:ListItem>
                    <asp:ListItem Value="F010d">删除</asp:ListItem>
                    <asp:ListItem Value="F010e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="F011">车辆管理--车辆信息管理--查看</asp:ListItem>
                    <asp:ListItem Value="F011a">添加</asp:ListItem>
                    <asp:ListItem Value="F011m">修改</asp:ListItem>
                    <asp:ListItem Value="F011d">删除</asp:ListItem>
                    <asp:ListItem Value="F011e">导出</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    
                    <asp:ListItem Value="043">组织机构信息--单位信息查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="044">组织机构信息--部门信息查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="045">组织机构信息--用户信息查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="046">文件文档中心--个人文件--查看</asp:ListItem>
                    <asp:ListItem Value="046n">新建</asp:ListItem>
                    <asp:ListItem Value="046a">添加</asp:ListItem>
                    <asp:ListItem Value="046m">修改</asp:ListItem>
                    <asp:ListItem Value="046d">删除</asp:ListItem>
                    <asp:ListItem Value="046e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="047">文件文档中心--电子刊物--查看</asp:ListItem>
                    <asp:ListItem Value="047n">新建</asp:ListItem>
                    <asp:ListItem Value="047a">添加</asp:ListItem>
                    <asp:ListItem Value="047m">修改</asp:ListItem>
                    <asp:ListItem Value="047d">删除</asp:ListItem>
                    <asp:ListItem Value="047e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="048">文件文档中心--单位文件--查看</asp:ListItem>
                    <asp:ListItem Value="048n">新建</asp:ListItem>
                    <asp:ListItem Value="048a">添加</asp:ListItem>
                    <asp:ListItem Value="048m">修改</asp:ListItem>
                    <asp:ListItem Value="048d">删除</asp:ListItem>
                    <asp:ListItem Value="048e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="049">文件文档中心--共享文件--查看</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="050">文件文档中心--我的硬盘--查看</asp:ListItem>
                    <asp:ListItem Value="050n">新建</asp:ListItem>
                    <asp:ListItem Value="050a">添加</asp:ListItem>
                    <asp:ListItem Value="050m">修改</asp:ListItem>
                    <asp:ListItem Value="050d">删除</asp:ListItem>
                    <asp:ListItem Value="050e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="051">文件文档中心--共享硬盘--查看</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="052">文件文档中心--回收站--查看</asp:ListItem>                    
                    <asp:ListItem Value="052d">删除</asp:ListItem>
                    <asp:ListItem Value="052r">恢复</asp:ListItem>
                    <asp:ListItem Value="052e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="053">信息交流--论坛BBS--查看</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="054">信息交流--版块设置--查看</asp:ListItem>
                    <asp:ListItem Value="054a">添加</asp:ListItem>
                    <asp:ListItem Value="054m">修改</asp:ListItem>
                    <asp:ListItem Value="054d">删除</asp:ListItem>
                    <asp:ListItem Value="054e">导出</asp:ListItem>      
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    <asp:ListItem Value="055">信息交流--内部聊天室--查看</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="056">内部聊天室--参数设置--查看</asp:ListItem>                    
                    <asp:ListItem Value="056m">修改</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    
                    
                    <asp:ListItem Value="059">附件程序--电话区号查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="060">附件程序--邮政编码查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="061">附件程序--列车时刻查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="062">附件程序--公交线路查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="063">附件程序--法律法规查询--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="064">附件程序--休闲游戏--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="065">附件程序--万年历--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="066">附件程序--世界时钟--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="067">附件程序--常用网址--查看</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="068">系统管理--单位信息管理--查看</asp:ListItem>
                    <asp:ListItem Value="068m">修改</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="069">系统管理--部门信息管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="069a">添加</asp:ListItem>
                    <asp:ListItem Value="069m">修改</asp:ListItem>
                    <asp:ListItem Value="069d">删除</asp:ListItem>
                    <asp:ListItem Value="069e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="070">系统管理--用户信息管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="070a">添加</asp:ListItem>
                    <asp:ListItem Value="070m">修改</asp:ListItem>
                    <asp:ListItem Value="070d">删除</asp:ListItem>
                    <asp:ListItem Value="070e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="071">系统管理--角色信息管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="071a">添加</asp:ListItem>
                    <asp:ListItem Value="071m">修改</asp:ListItem>
                    <asp:ListItem Value="071d">删除</asp:ListItem>
                    <asp:ListItem Value="071e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="086">系统管理--红头文件管理--查看</asp:ListItem>                    
                    <asp:ListItem Value="086a">添加</asp:ListItem>
                    <asp:ListItem Value="086m">修改</asp:ListItem>
                    <asp:ListItem Value="086d">删除</asp:ListItem>
                    <asp:ListItem Value="086e">导出</asp:ListItem>                    
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="072">系统管理--系统日志管理--查看</asp:ListItem> 
                    <asp:ListItem Value="072d">删除</asp:ListItem>
                    <asp:ListItem Value="072e">导出</asp:ListItem>   
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>                 
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    
                    <asp:ListItem Value="073">系统管理--系统参数设置--查看</asp:ListItem>
                    <asp:ListItem Value="073m">修改</asp:ListItem>                                   
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>   
                </asp:CheckBoxList></td>
        </tr>
        </table>
                
    </form>
</body>
</html>