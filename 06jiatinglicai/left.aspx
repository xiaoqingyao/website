<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link rel="stylesheet" href="skin/css/base.css" type="text/css" />
<link rel="stylesheet" href="skin/css/menu.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language='javascript'>var curopenItem = '1';</script>
<script language="javascript" type="text/javascript" src="skin/js/frame/menu.js"></script>
<base target="main" />
</head>
<body target="main">
    <form id="form1" runat="server">
    <table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td style='padding-left:3px;padding-top:8px' valign="top">
      <% if (Session["power"].ToString() == "管理员")
         { %>   
 <dl class='bitem'>
        <dt onClick='showHide("items1_3")'><b>基础信息管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_3'>
          <ul class='sitemu' style="text-align:left;">         
            <li><a href='in_Type/Add.aspx' target='main'>添加收支类型信息</a> </li>
             <li><a href='in_Type/Manage.aspx' target='main'>管理收支类型信息</a> </li>
               <li><a href='bank/Add.aspx' target='main'>添加银行账号信息</a> </li>
             <li><a href='bank/Manage.aspx' target='main'>管理银行账号信息</a> </li>
          </ul>
        </dd>
      </dl>
      
          <dl class='bitem'>
        <dt onClick='showHide("items1_112")'><b>投资资讯管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_112'>
          <ul class='sitemu' style="text-align:left;">
             <li><a href='news/Add.aspx' target='main'>添加投资资讯信息</a> </li>
             <li><a href='news/Manage.aspx' target='main'>管理投资资讯信息</a> </li>
          </ul>
        </dd>
      </dl>
      
         <dl class='bitem'>
        <dt onClick='showHide("items1_4")'><b>家庭成员管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_4'>
          <ul class='sitemu' style="text-align:left;">
             <li><a href='family/Add.aspx' target='main'>添加家庭成员信息</a> </li>
             <li><a href='family/Manage.aspx' target='main'>管理家庭成员信息</a> </li>
          </ul>
        </dd>
      </dl>
      
           <dl class='bitem'>
        <dt onClick='showHide("items1_11")'><b>家庭财务管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_11'>
          <ul class='sitemu' style="text-align:left;">
             <li><a href='in_Pay/Manage.aspx' target='main'>管理收支信息</a> </li>
             
             <li><a href='Loan_Money/Manage.aspx' target='main'>管理借(贷)款信息</a> </li>
             
             <li><a href='assets/Manage.aspx' target='main'>管理家庭资产信息</a> </li>
             
             <li><a href='account/Manage.aspx' target='main'>管理账户信息</a> </li>
             <li><a href='invest/Manage.aspx' target='main'>管理投资信息</a> </li>
          </ul>
        </dd>
      </dl>

       <dl class='bitem'>
        <dt onClick='showHide("items1_91")'><b>数据分析</b></dt>
        <dd style='display:block' class='sitem' id='items1_91'>
          <ul class='sitemu' style="text-align:left;">
               <li><a href='analysis/month_analysis.aspx' target='main'>月收支分析</a> </li>
                <li><a href='analysis/loan_analysis.aspx' target='main'>月借(贷)款分析</a> </li>
                 <li><a href='analysis/family_analysis.aspx' target='main'>家庭资产分析</a> </li>
               
                 <li><a href='analysis/account_analysis.aspx' target='main'>账户分析</a> </li>
                  <li><a href='analysis/invest_analysis.aspx' target='main'>投资分析</a> </li>
                  <li><a href='analysis/jsq.htm' target='main'>计算器</a> </li>
          </ul>
        </dd>
      </dl>
<%} %>
     

   <% if(Session["power"].ToString()=="家庭成员") { %>
      <dl class='bitem'>
        <dt onClick='showHide("items1_5")'><b>家庭财务管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_5'>
          <ul class='sitemu' style="text-align:left;">
             <li><a href='in_Pay/Add.aspx' target='main'>添加收支信息</a> </li>
             <li><a href='in_Pay/Manage.aspx' target='main'>管理收支信息</a> </li>
             
             <li><a href='Loan_Money/Add.aspx' target='main'>添加借(贷)款信息</a> </li>
             <li><a href='Loan_Money/Manage.aspx' target='main'>管理借(贷)款信息</a> </li>
             
              <li><a href='assets/Add.aspx' target='main'>添加家庭资产信息</a> </li>
             <li><a href='assets/Manage.aspx' target='main'>管理家庭资产信息</a> </li>
             
             <li><a href='account/Add.aspx' target='main'>添加账户信息</a> </li>
             <li><a href='account/Manage.aspx' target='main'>管理账户信息</a> </li>
             
                <li><a href='invest/Add.aspx' target='main'>添加投资信息</a> </li>
             <li><a href='invest/Manage.aspx' target='main'>管理投资信息</a> </li>
          </ul>
        </dd>
      </dl>
      
       <dl class='bitem'>
        <dt onClick='showHide("items1_9")'><b>数据分析</b></dt>
        <dd style='display:block' class='sitem' id='Dd1'>
          <ul class='sitemu' style="text-align:left;">
               <li><a href='analysis/month_analysis.aspx' target='main'>月收支分析</a> </li>
                <li><a href='analysis/loan_analysis.aspx' target='main'>月借(贷)款分析</a> </li>
                 <li><a href='analysis/family_analysis.aspx' target='main'>家庭资产分析</a> </li>
                 <li><a href='analysis/account_analysis.aspx' target='main'>账户分析</a> </li>
                     <li><a href='analysis/save_analysis.aspx' target='main'>个人储蓄</a> </li>
                      <li><a href='analysis/loan_analysis2.aspx' target='main'>个人贷款</a> </li>
                  <li><a href='analysis/invest_analysis.aspx' target='main'>投资分析</a> </li>
                  <li><a href='news/Add.aspx' target='main'>添加投资资讯信息</a> </li>
             <li><a href='news/Manage.aspx' target='main'>管理投资资讯信息</a> </li>
                    <li><a href='analysis/jsq.htm' target='main'>计算器</a> </li>
          </ul>
        </dd>
      </dl>
<%} %>

   
      
	  </td>
  </tr>
</table>
    </form>
</body>
</html>
