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
  <h4>位置： <a href="#">系统管理</a><a> ></a> <a href="#">模型管理布</a><a> ></a> <span class="breadcrumb_current" > 增加文章</span> </h4>
       <form name="searchForm" method="post" action="?">
      <div id="searchContainer">
        <ul>
        
        <li><input type="submit" value="搜索" /></li>
       </ul><br clear="left" />
        </div>
    </form>
    <form id="theForm" runat="server">
    
    <div class="function" style="text-align:left" id="HQB_Model_ListLink"><a href="?Action=">显示全部</a><a href="?IsDel=1">回收站</a><asp:Repeater runat="server" ID="rptFlowStep"><ItemTemplate><a href="?StepID=<%#Eval("StepID") %>" target="_self"><%#Eval("StepName") %></a></ItemTemplate></asp:Repeater></div>
    <div class="function" style=" text-align:center;"><asp:Repeater runat="server" ID="rptFlowState"><ItemTemplate><a href="?Action={s}{(FlowState)(=)(<%#Eval("StateValue") %>)}&StepID=<%#Eval("StepID") %>"><%#Eval("StateName") %></a></ItemTemplate></asp:Repeater></div>
    <div  class="function">
    <asp:PlaceHolder ID="plParseModelLinkButton" runat="server"><input type="button" onclick='backOriginalUrl(<%=originalUrl %>)' value="返回" style=" display:<%=originalUrlDisplay%>;"/><%if(!string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){Response.Write("<input type=\"button\" value=\"添加\" onclick=\"location.href='Collectionedit.aspx?action=add';\"  runat=\"server\" id=\"btnNew\" />");}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" value="删除" onclick="return confirmSetAction('{e}{(IsDel)(1)}','确定删除选定记录至回收站？');"  runat="server" id="btnLogicDelete" /><%}%><%if(string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" id="btnRevert" onclick="return confirmSetAction('{e}{(IsDel)(0)}','确定还原选定记录？');"   value="还原" /><%}%>&nbsp;<%if(string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" id="btnDelete" onclick="return confirmSetAction('{d}','确定彻底删除选定记录？');"  runat="server"  value="删除" /><%}%></asp:PlaceHolder>
        <asp:PlaceHolder ID="plDParseModelLinkButton" runat="server"></asp:PlaceHolder>
    </div>
             <ul class="ulheader"><li  style="width:45px;"><input type="checkbox" name="SlectAll" id="SlectAll" /></li><li  style="width:400px;">标题</li><li  style="width:100px;">添加日期</li><li  style="width:80px;" ><a href="javascript:sort('K_U_Collection.Orders','3')">排序</a></li><li style="width:30%;" >操作</li> </ul>
          <div id="HQB_ListInfo" style=" padding:0; margin:0;">
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
         <ul class="ulheader ulbody"><li style="width:45px;"><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></li><li style="text-align:left; width:400px;"><a href="collectionview.aspx?id=<%#Eval("[K_U_Collection_ID]") %>" ><%#Eval("C_Title") %></a></li><li  style="text-align:left;width:100px;"><%#string.Format("{0:yyyy-MM-dd HH:mm:ss}",Eval("AddDate").ToString()) %></li><li  id="HQB_Orders_<%#Eval("ID") %>" style="width:80px;"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input style="width:70px;" type="text" value="<%#Eval("Orders") %>" onblur="setOrders('K_U_Collection','<%#Eval("ID") %>',this.value)"  CssClass="validate[required,custom[onlyNumber]]"/></span></li><li style="width:30%;" ><%if(!string.Equals(ctrManageList.IsDel,"1") &&  !string.Equals(ctrManageList.IsArchiving,"1")){%><input type="button"  id="btnEdit" onclick="<%#"location.href='" + "Collectionedit.aspx?action=edit&ID=" + Eval("ID").ToString()%>'" value="修改"/>&nbsp;<%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" id="btnLogicDelete" onclick="return rptConfirmSetAction('<%#"{e}{(IsDel)(1)}{ID=" + Eval("ID").ToString() + "}"%>','确定删除当前记录到回收站？');"  value="删除" /><%}%>&nbsp;<%if(string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" id="btnDelete" onclick="return rptConfirmSetAction('<%#"{d}{(ID)(=)(" + Eval("ID").ToString() + ")}"%>','确定彻底删除当前记录？');"   value="删除" />&nbsp;<%}%></li></ul>
        </ItemTemplate>
        </asp:Repeater>
        </div>
            <span class="function fr">  </span>

    <webdiyer:aspnetpager id="Split" CssClass="page" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    CustomInfoHTML="" CustomInfoSectionWidth="1%"></webdiyer:aspnetpager>

   <asp:HiddenField ID="hdnNotSearchField" runat="server" value="" /><asp:HiddenField ID="hdnBackDeliverUrlParam" runat="server" value=""  /> <asp:HiddenField ID="hdnModelID" Value="100000073165723" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_U_Collection" runat="server" />  <asp:HiddenField ID="hdnDeliverAndSearchUrlParam" runat="server"  Value=""/> <input type="hidden" value="" id="HQB_Model_DeliverUrlParam" /><asp:HiddenField ID="hdnCustomCol" Value="|$[K_U_Collection.ID]" runat="server" />   <asp:HiddenField ID="hdnForignTableCol" value="" runat="server" /><asp:HiddenField ID="hdnShowCol" value="K_U_Collection.ID,K_U_Collection.FlowState,K_U_Collection.C_Title,K_U_Collection.AddDate,K_U_Collection.Orders" runat="server" />
      <asp:HiddenField ID="hdnNodeCode" runat="server" />
   <input type="hidden" name="action" id="HQB_Action" value="" />
   <asp:HiddenField ID="hdnIsAllowFlow" runat="server" />
   <input type="hidden" value="<%=backUrlParam %>" id="HQB_BackUrlParam"/>
   </form>
    </div>
      <div style="position:absolute; z-index:1000; border:#e4e4e4 1px solid; background:#f5f5f5;line-height:22px; display:none;" id="HQB_Replcae_Title_Display" onmouseout="javascript:$(this).css('display','none')">
          <table border="0" cellspacing="5" cellpadding="0"><tr><td></td></tr></table>
      </div>
</body>
</html>
