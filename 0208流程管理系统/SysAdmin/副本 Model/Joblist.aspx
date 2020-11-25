<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageList.aspx.cs" EnableViewState="false" Inherits="KingTop.Web.Admin.ModelList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
        <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
        <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
        <script type="text/javascript" src="../js/publicform.js"></script>
        <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
        <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery.dialog.js"></script>
        <script type="text/javascript" src="../js/win.js"></script>
        <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
         <script language="javascript" type="text/javascript" src="../JS/Common.js"></script>
       <script language="javascript" src="../JS/ControlManageList.js" type="text/javascript"></script>
   
</head>
<body>
<div class="container"id="_ListInfoListTable">
  <h4>位置： <%GetPageNav(NodeCode);%></h4>
       <form name="searchForm" method="post">
      <div id="searchContainer">
        <ul>
        <li>职位名称</li><li><input   type="text" value="" style="width:100px;"  maxlength="300" name="Title" id="Title" /></li><li>学历要求</li><li><select  id="requirements" name="requirements"><option   value="0">不限</option><option   value="1">高中</option><option   value="2">专科</option><option   value="3">本科</option><option   value="4">硕士</option><option   value="5">博士</option><input type="hidden" value="6" id="{#ID#}"  name="requirements{Type}" /></select></li><li>招聘分类</li><li><select  id="jobUnit" name="jobUnit"><option   value="1">总部</option><option   value="2">社会招聘</option><input type="hidden" value="6" id="{#ID#}"  name="jobUnit{Type}" /></select></li><li>职位类别</li><li><select  id="jobclass" name="jobclass"><option   value="0">不限</option><option   value="1">市场策划</option><option   value="2">平面设计</option><option   value="3">网站制作</option><option   value="4">销售</option><option   value="5">网络推广</option><option   value="6">财务</option><option   value="7">其它</option><input type="hidden" value="6" id="{#ID#}"  name="jobclass{Type}" /></select></li><li>经验要求</li><li><select  id="empirical" name="empirical"><option   value="0">不限</option><option   value="1">一年工作经验</option><option   value="2">两年工作经验</option><option   value="3">三年工作经验</option><option   value="5">五年工作经验以上</option><input type="hidden" value="6" id="{#ID#}"  name="empirical{Type}" /></select></li><li>添加日期</li><li>从：</li><li><li><input id="AddDate"  value=""   name="AddDate" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></li></li><li>到：</li><li><input id="AddDate{0}"  value=""   name="AddDate{0}" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></li>
        <li><input type="submit" value="搜索" /></li>
       </ul><br clear="left" />
        </div>
    </form>
    <form id="theForm" runat="server">
    
    <div class="function" style="text-align:left" id="HQB_Model_ListLink"><asp:Repeater runat="server" ID="rptFlowStep"><ItemTemplate><a href="?StepID=<%#Eval("StepID") %>" target="_self"><%#Eval("StepName") %></a></ItemTemplate></asp:Repeater></div>
    <div class="function" style=" text-align:center;"><asp:Repeater runat="server" ID="rptFlowState"><ItemTemplate><a href="?Action={s}{(FlowState)(=)(<%#Eval("StateValue") %>)}&StepID=<%#Eval("StepID") %>"><%#Eval("StateName") %></a></ItemTemplate></asp:Repeater></div>
    <div  class="function">
    <asp:PlaceHolder ID="plParseModelLinkButton" runat="server"><input type="button" onclick='backOriginalUrl(<%=originalUrl %>)' value="返回" style=" display:<%=originalUrlDisplay%>;"/><%if(!string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){%><input type="button" value="添加" Href="Jobedit.aspx?action=add"  EditUrlParam="" id="btnNew" /><%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" value="删除" onclick="return confirmSetAction(this,'{e}{(IsDel)(1)}','确定删除选定记录至回收站？');"  runat="server" id="btnDelete" /><%}%></asp:PlaceHolder>
        <asp:PlaceHolder ID="plDParseModelLinkButton" runat="server"></asp:PlaceHolder>
    </div>
             <ul class="ulheader"><li  style="width:45px;"><input type="checkbox" name="SlectAll" id="SlectAll" /></li><li  style="width:200px;">职位名称</li><li  style="width:60px;">招聘人数</li><li  style="width:100px;"><a href="javascript:sort('K_U_Job.Author','3')">招聘单位</a></li><li  style="width:100px;"><a href="javascript:sort('K_U_Job.jobclass','3')">职位类别</a></li><li  style="width:100px;"><a href="javascript:sort('K_U_Job.EndDate','3')">截止日期</a></li><li  style="width:100px;"><a href="javascript:sort('K_U_Job.jobUnit','3')">招聘分类</a></li><li  style="width:70px;">审核状态</li><li  style="width:60px;" ><a href="javascript:sort('K_U_Job.Orders','3')">排序</a></li><li style="width:100px;" >操作</li>  </ul>
          <div id="HQB_ListInfo" style=" padding:0; margin:0;">
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
         <ul class="ulheader ulbody"><li style="width:45px;"><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></li><li isClip="1"  style="text-align:left;width:200px;"><%#Eval("Title") %></li><li isClip="1"  style="text-align:left;width:60px;"><%#Eval("PersonNum") %></li><li isClip="1"  style="text-align:left;width:100px;"><%#Eval("Author") %></li><li  style="text-align:left;width:100px;"><%#ctrManageList.ParseFieldValueToText("100011346973121",Eval("jobclass") )%></li><li  style="text-align:left;width:100px;"><%#string.Format("{0:yyyy-MM-dd}",Eval("EndDate").ToString()) %></li><li  style="text-align:left;width:100px;"><%#ctrManageList.ParseFieldValueToText("100011347631252",Eval("jobUnit") )%></li><li  style="text-align:left;width:70px;"><%#ctrManageList.ParseFieldValueToText("100011298851562",Eval("FlowState") )%></li><li  id="HQB_Orders_<%#Eval("ID") %>" style="width:60px;"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input style="width:70px;" type="text" value="<%#Eval("Orders") %>" onblur="setOrders('K_U_Job','<%#Eval("ID") %>',this.value)"  CssClass="validate[required,custom[onlyNumber]]"/></span></li><li style="width:100px;" ><%if(!string.Equals(ctrManageList.IsDel,"1") &&  !string.Equals(ctrManageList.IsArchiving,"1")){%><input type="button"  BtnType="Edit"  Href='<%#"Jobedit.aspx?action=edit&ID=" + Eval("ID").ToString()%>' value="修改"/>&nbsp;<%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" BtnType="Delete" onclick="return rptConfirmSetAction(this,'<%#"{e}{(IsDel)(1)}{ID=" + Eval("ID").ToString() + "}"%>','确定删除当前记录？');" RecordID="<%#Eval("ID")%>"  value="删除" /><%}%>&nbsp;</li></ul>
        </ItemTemplate>
        </asp:Repeater>
        </div>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>

   <asp:HiddenField ID="hdnNotSearchField" runat="server" value="" /><asp:HiddenField ID="hdnBackDeliverUrlParam" runat="server" value="NodeCode"  /> <asp:HiddenField ID="hdnModelID" Value="100000027148437" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_U_Job" runat="server" />  <asp:HiddenField ID="hdnDeliverAndSearchUrlParam" runat="server"  Value=""/> <input type="hidden" value="" id="HQB_Model_DeliverUrlParam" /><asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />   <asp:HiddenField ID="hdnForignTableCol" value="" runat="server" /><asp:HiddenField ID="hdnShowCol" value="K_U_Job.ID,K_U_Job.FlowState,K_U_Job.Title,K_U_Job.PersonNum,K_U_Job.Author,K_U_Job.jobclass,K_U_Job.EndDate,K_U_Job.jobUnit,K_U_Job.Orders" runat="server" />
      <asp:HiddenField ID="hdnNodeCode" runat="server" />
      <input type="hidden" name="hidLogTitle" id="hidLogTitle"/>
   <input type="hidden" name="action" id="HQB_Action" value="" />
   <asp:HiddenField ID="hdnIsAllowFlow" runat="server" />
   <input type="hidden" value="<%=backUrlParam %>" id="HQB_BackUrlParam"/>
   </form>
    </div>
      <div style="position:absolute; z-index:1000; border:#e4e4e4 1px solid; background:#f5f5f5;line-height:22px; display:none;" id="HQB_Replcae_Title_Display" onmouseout="javascript:$(this).css('display','none')">
          <table border="0" cellspacing="5" cellpadding="0"><tr><td></td></tr></table>
      </div>
             <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
