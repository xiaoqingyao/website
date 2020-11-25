<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="RuleEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.RuleEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>采集规则</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
     <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/Collection.js"></script>
   <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(PageInitRuleEdit);
    </script>
        <style type="text/css">.container dl dd{margin-right:8px;} .container fieldset{ border:outset 1px #000000;}
             ul{clear:both;}  ul li{ float:left; padding:5px; padding-left:10px; padding-right:2px;}
             .SysLabelVar{position:absolute; border:1px solid #999999; float:none; display:none; background-color:#ffffff;}
             .SysLabelVar li{ float:none;}
        </style>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>位置： <a href="#">信息采集</a> > <a href="#">采集任务</a> > 采集规则编辑</h4> 
     <dl>
        <dt>规则名称：</dt>
        <dd><asp:TextBox ID="txtName" Width="280" runat="server"></asp:TextBox></dd>
     </dl>
     <dl>
        <dt>规则类型：</dt>
        <dd>
            <asp:DropDownList ID="ddlRuleType" Width="100" runat="server">
                <asp:ListItem Value="1" Text="导航"></asp:ListItem>
                <asp:ListItem Value="2" Text="内容"></asp:ListItem>
                <asp:ListItem Value="3" Text="导航和内容"></asp:ListItem>
            </asp:DropDownList>
        </dd>
        <dd><asp:CheckBox ID="chkIsSA" Text="需要提取分页地址" runat="server" /></dd>
        <dd><asp:CheckBox ID="chkIsCA" Text="需要提取下层地址" runat="server" /></dd>
     </dl>
     <div id="SAContainer"  style=" width:100%; padding-left:60px;">
     <fieldset style=" width:615px; padding:4px;">
        <legend>分页地址</legend>
        <ul>
            <li>地址开始：</li>
            <li><asp:TextBox ID="txtSA_StartTags" TextMode="MultiLine" Width="200" Height="80" runat="server"></asp:TextBox></li>
            <li>地址结束：</li>
            <li><asp:TextBox ID="txtSA_EndTags" TextMode="MultiLine" Width="200" Height="80" runat="server"></asp:TextBox></li>
        </ul>
        <ul>
            <li>地址包含：</li>
             <li><asp:TextBox ID="txtSA_IncludeContent" runat="server" TextMode="MultiLine" Height="40" Width="180"></asp:TextBox>
             <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtSA_IncludeContent') " /></li>
            <li>地址不含：</li>
             <li><asp:TextBox ID="txtSA_NotIncludeContent"  TextMode="MultiLine" Height="40" runat="server" Width="180"></asp:TextBox>
             <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtSA_NotIncludeContent') " /></li>
       </ul>
       <ul>
            <li>链接类型：</li>
             <li style=" width:200px;">
                 <asp:DropDownList ID="ddlSA_ParseType" runat="server">
                 <asp:ListItem Value="1" Text="自动识别"></asp:ListItem>
                 <asp:ListItem Value="2" Text="Get自定义链接"></asp:ListItem>
                 <asp:ListItem Value="3" Text="Post自定义链接"></asp:ListItem>
                 </asp:DropDownList>
                 
             </li>
            <li><asp:CheckBox ID="chkIsPostUrl" runat="server" Text="Post地址" /></li>
             <li><asp:TextBox ID="txtSA_PostUrl" Width="200" runat="server"></asp:TextBox></li>
      </ul>
      <ul>
        <li><asp:CheckBox ID="chkSA_IsEncode" Text="结果需编码" runat="server" /></li>
        <li>范围：</li>
        <li>
            <asp:DropDownList ID="ddlSA_GetRange" runat="server">
                <asp:ListItem Value="1" Text="所有分页 "></asp:ListItem>            
                <asp:ListItem Value="2" Text="第一页 "></asp:ListItem>            
                <asp:ListItem Value="3" Text="第一页和下N页 "></asp:ListItem>            
                <asp:ListItem Value="4" Text="第一页函数型"></asp:ListItem>            
            </asp:DropDownList>
         </li>
         <li>最大页数：<asp:TextBox ID="txtSA_MaxSplitCount" Width="30" runat="server"></asp:TextBox></li>
         <li id="ContentType0"><asp:CheckBox ID="chkSA_IsJoinContent" Text="需合并分页" runat="server" /></li>
         <li id="ContentType1">接连符：<asp:TextBox ID="txtSA_JoinChar" Width="40" runat="server"></asp:TextBox></li>
      </ul>
       <ul id="SA_Param">
            <li>&nbsp;&nbsp;获取参数：</li>
            <li>
                <asp:TextBox ID="txtSA_NeedParam" TextMode="MultiLine" Width="180" Height="100" runat="server"></asp:TextBox>
                <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtSA_NeedParam') " />
            </li>
            <li>&nbsp;&nbsp;实际数据：</li>
            <li>
            <asp:TextBox ID="txtSA_RealParam" TextMode="MultiLine" Width="180" Height="100" runat="server"></asp:TextBox>
            <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtSA_RealParam') " />
            </li>
       </ul>
       <ul  id="SA_OtherParam">
            <li>下N页参数：</li>
            <li>
                <asp:TextBox ID="txtSA_OtherNeedParam" TextMode="MultiLine" Width="180" Height="100" runat="server"></asp:TextBox>
                <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtSA_OtherNeedParam') " />
            </li>
            <li>下N页数据：</li>
            <li>
                <asp:TextBox ID="txtSA_OtherRealParam" TextMode="MultiLine" Width="180" Height="100" runat="server"></asp:TextBox>
                <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtSA_OtherRealParam') " />
            </li>
       </ul>
     </fieldset>
         
     </div>
     <div id="CAContainer"  style=" width:100%; padding-left:60px; margin-top:10px;">
        <fieldset style=" width:615px; padding:4px;">
                <legend>下层地址</legend>
                <ul>
                    <li>地址开始：</li>
                    <li><asp:TextBox ID="txtCA_StartTags" TextMode="MultiLine" Width="200" Height="100" runat="server"></asp:TextBox></li>
                    <li>地址结束：</li>
                    <li><asp:TextBox ID="txtCA_EndTags" TextMode="MultiLine" Width="200" Height="100" runat="server"></asp:TextBox></li>
                </ul>
                <ul>
                    <li>地址包含：</li>
                     <li>
                         <asp:TextBox ID="txtCA_IncludeContent" runat="server"  TextMode="MultiLine" Height="40" Width="180"></asp:TextBox>
                         <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtCA_IncludeContent') " />
                    </li>
                    <li>地址不含：</li>
                     <li>
                        <asp:TextBox ID="txtCA_NotIncludeContent" runat="server"  TextMode="MultiLine" Height="40" Width="180"></asp:TextBox>
                        <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtCA_NotIncludeContent') " />
                    </li>
               </ul>
               <ul>
                    <li>链接类型：</li>
                     <li style=" width:200px;">
                         <asp:DropDownList ID="ddlCA_ParseType" runat="server">
                         <asp:ListItem Value="1" Text="自动识别"></asp:ListItem>
                         <asp:ListItem Value="2" Text="Get自定义链接"></asp:ListItem>
                         <asp:ListItem Value="3" Text="Post自定义链接"></asp:ListItem>
                         </asp:DropDownList>
                     </li>
                    <li><asp:CheckBox ID="chkCAIsPostUrl" Text="Post地址" runat="server"></asp:CheckBox></li>
                     <li><asp:TextBox ID="txtCA_PostUrl" Width="200" runat="server"></asp:TextBox></li>
              </ul>
              <ul>
                <li><asp:CheckBox ID="chkCA_IsEncode" Text="结果需编码" runat="server" /></li>
              </ul>
               <ul id="CA_Param">
                    <li>&nbsp;&nbsp;获取参数：</li>
                    <li>
                        <asp:TextBox ID="txtCA_NeedParam" TextMode="MultiLine" Width="180" Height="100" runat="server"></asp:TextBox>
                         <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtCA_NeedParam') " />
                    </li>
                    <li>&nbsp;&nbsp;实际数据：</li>
                    <li>
                        <asp:TextBox ID="txtCA_RealParam" TextMode="MultiLine" Width="180" Height="100" runat="server"></asp:TextBox>
                         <img src="../image/SysLabelParam.jpg" onclick="showSysLabelVar(this, 'txtCA_RealParam') " />
                    </li>
               </ul>
         </fieldset>     
     </div>  
     
         <div class="Submit">
        <asp:Button ID="btnSave" CssClass="subButton" OnClick="Save" runat="server" Text="添 加" />
	    <input class="subButton" type="button" onclick="location.href='RuleList.aspx?ID=<%=TaskID %>&page=<%=PageIndex %>'" value="返 回" />
    </div>
   
    </div>
    <ul class="SysLabelVar" id="HQB_Collection_SysLabel">
    <li style="float:left;"><a href="javascript:insertTextAtCursor('{*}');">{*}</a></li>
    <li style=" text-align:right; width:320px; padding-right:10px;"><span style=" cursor:pointer;" onclick="closeSysLabelVar()">关闭</span></li>
    <li><a href="javascript:insertTextAtCursor('{ViewState}');">{ViewState}</a></li>
    <li><a href="javascript:insertTextAtCursor('{EventValidation}');">{EventValidation}</a></li>
    <li><a href="javascript:insertTextAtCursor('{分页函数:递增/递减=数字,开始值=数字,结束值=数字}');">{分页函数:递增/递减=数字,开始值=数字,结束值=数字}</a></li>
    <li><a href="javascript:insertTextAtCursor('{正则:正则表达式}');">{正则:正则表达式}</a></li>
    <li><a href="javascript:insertTextAtCursor('{当天日期:日期格式}');">{当天日期:日期格式}</a></li>
    <li><a href="javascript:insertTextAtCursor('{循环函数变量值}');">{循环函数变量值}</a></li>
</ul>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
