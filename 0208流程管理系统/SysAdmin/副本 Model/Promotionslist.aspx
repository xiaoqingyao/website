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
  <h4>λ�ã� <a href="#">ϵͳ����</a><a> ></a> <a href="#">ģ�͹���</a><a> ></a> <span class="breadcrumb_current" > ��������</span> </h4>
       <form name="searchForm" method="post" action="?">
      <div id="searchContainer">
        <ul>
        
        <li><input type="submit" value="����" /></li>
       </ul><br clear="left" />
        </div>
    </form>
    <form id="theForm" runat="server">
    
    <div class="function" style="text-align:left" id="HQB_Model_ListLink"><a href="?Action=">��ʾȫ��</a><a href="?IsDel=1">����վ</a><a href="?IsArchiving=1">�鵵����</a><asp:Repeater runat="server" ID="rptFlowStep"><ItemTemplate><a href="?StepID=<%#Eval("StepID") %>" target="_self"><%#Eval("StepName") %></a></ItemTemplate></asp:Repeater></div>
    <div class="function" style=" text-align:center;"><asp:Repeater runat="server" ID="rptFlowState"><ItemTemplate><a href="?Action={s}{(FlowState)(=)(<%#Eval("StateValue") %>)}&StepID=<%#Eval("StepID") %>"><%#Eval("StateName") %></a></ItemTemplate></asp:Repeater></div>
    <div  class="function">
    <asp:PlaceHolder ID="plParseModelLinkButton" runat="server"><input type="button" onclick='backOriginalUrl(<%=originalUrl %>)' value="����" style=" display:<%=originalUrlDisplay%>;"/><%if(!string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){Response.Write("<input type=\"button\" value=\"���\" onclick=\"location.href='Promotionsedit.aspx?action=add&BusinessID=" + ctrManageList.KeepParamValue["BusinessID"]  + "';\"  runat=\"server\" id=\"btnNew\" />");}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" value="ɾ��" onclick="return confirmSetAction('{e}{(IsDel)(1)}','ȷ��ɾ��ѡ����¼������վ��');"  runat="server" id="btnLogicDelete" /><%}%><%if(string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" id="btnDelete" onclick="return confirmSetAction('{d}','ȷ������ɾ��ѡ����¼��');"  runat="server"  value="ɾ��" /><%}%><%if(ctrManageList.IsAllowFlow && !string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){%><input type="submit"  onclick="return setAction('HQB_PastFlowCheck');" value="ͨ�����"  runat="server"  id="btnPastFlowCheck" /><%}%><%if(ctrManageList.IsAllowFlow && !string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){%><input type="submit"  onclick="return setAction('HQB_CancelFlowCheck');" value="ȡ�����"  runat="server"  id="btnCancelFlowCheck" /><%}%><input type="submit" value="ȡ���Ƽ�"  runat="server" onclick="return setAction('{e}{(IsPub)(0)}');" /><input type="submit" value="�Ƽ�"  runat="server" onclick="return setAction('{e}{(IsPub)(1)}');" /></asp:PlaceHolder>
        <asp:PlaceHolder ID="plDParseModelLinkButton" runat="server"></asp:PlaceHolder>
    </div>
             <ul class="ulheader"><li  style="width:45px;"><input type="checkbox" name="SlectAll" id="SlectAll" /></li><li  style="width:200px;"><a href="javascript:sort('K_U_Promotions.title','3')">����</a></li><li  style="width:100px;"><a href="javascript:sort('K_U_Promotions.Starttime','3')">��ʼ����</a></li><li  style="width:100px;"><a href="javascript:sort('K_U_Promotions.EndTime','3')">��������</a></li><li  style="width:80px;"><a href="javascript:sort('K_U_Promotions.IsUndo','3')">�Ƿ���</a></li><li  style="width:60px;">��ҳ�Ƽ�</li><li  style="width:40px;" ><a href="javascript:sort('K_U_Promotions.Orders','3')">����</a></li><li style="width:30%;" >����</li> </ul>
          <div id="HQB_ListInfo" style=" padding:0; margin:0;">
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
         <ul class="ulheader ulbody"><li style="width:45px;"><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></li><li  title="<%#Eval("title") %> " isClip="1"  style="text-align:left;width:200px;"><%#Eval("title") %></li><li  style="text-align:center;width:100px;"><%#string.Format("{0:yyyy-MM-dd}",Eval("Starttime").ToString()) %></li><li  style="text-align:center;width:100px;"><%#string.Format("{0:yyyy-MM-dd}",Eval("EndTime").ToString()) %></li><li  style="text-align:center;width:80px;"><%#ctrManageList.ParseFieldValueToText("000000034188594",Eval("IsUndo") )%></li><li style="text-align:left; width:60px;"><a href="?action={e}{(IsPub)(1)}&ID=<%#Eval("[K_U_Promotions_ID]") %>" ><%#ctrManageList.ParseFieldValueToText("100000133875818",Eval("IsPub") )%></a></li><li  id="HQB_Orders_<%#Eval("ID") %>" style="width:40px;"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input style="width:70px;" type="text" value="<%#Eval("Orders") %>" onblur="setOrders('K_U_Promotions','<%#Eval("ID") %>',this.value)"  CssClass="validate[required,custom[onlyNumber]]"/></span></li><li style="width:30%;" ><%if(!string.Equals(ctrManageList.IsDel,"1") &&  !string.Equals(ctrManageList.IsArchiving,"1")){%><input type="button"  id="btnEdit" onclick="<%#"location.href='" + "Promotionsedit.aspx?action=edit&ID=" + Eval("ID").ToString()%>&BusinessID=<%=ctrManageList.KeepParamValue["BusinessID"]%>'" value="�޸�"/>&nbsp;<%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" id="btnLogicDelete" onclick="return rptConfirmSetAction('<%#"{e}{(IsDel)(1)}{ID=" + Eval("ID").ToString() + "}"%>','ȷ��ɾ����ǰ��¼������վ��');"  value="ɾ��" /><%}%>&nbsp;<%if(string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" id="btnDelete" onclick="return rptConfirmSetAction('<%#"{d}{(ID)(=)(" + Eval("ID").ToString() + ")}"%>','ȷ������ɾ����ǰ��¼��');"   value="ɾ��" />&nbsp;<%}%></li></ul>
        </ItemTemplate>
        </asp:Repeater>
        </div>
            <span class="function fr">  </span>

    <webdiyer:aspnetpager id="Split" CssClass="page" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    CustomInfoHTML="" CustomInfoSectionWidth="1%"></webdiyer:aspnetpager>

   <asp:HiddenField ID="hdnNotSearchField" runat="server" value="" /><asp:HiddenField ID="hdnBackDeliverUrlParam" runat="server" value=""  /> <asp:HiddenField ID="hdnModelID" Value="000000010823335" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_U_Promotions" runat="server" />  <asp:HiddenField ID="hdnDeliverAndSearchUrlParam" runat="server"  Value="BusinessID"/> <input type="hidden" value="&BusinessID=<%=ctrManageList.KeepParamValue["BusinessID"]%>" id="HQB_Model_DeliverUrlParam" /><asp:HiddenField ID="hdnCustomCol" Value="|$[K_U_Promotions.ID]" runat="server" />   <asp:HiddenField ID="hdnForignTableCol" value="" runat="server" /><asp:HiddenField ID="hdnShowCol" value="K_U_Promotions.ID,K_U_Promotions.FlowState,K_U_Promotions.title,K_U_Promotions.Starttime,K_U_Promotions.EndTime,K_U_Promotions.IsUndo,K_U_Promotions.IsPub,K_U_Promotions.Orders" runat="server" />
      <asp:HiddenField ID="hdnNodeCode" runat="server" />
   <input type="hidden" name="action" id="HQB_Action" value="" />
   <asp:HiddenField ID="hdnIsAllowFlow" runat="server" />
   <input type="hidden" value="<%=backUrlParam %>" id="HQB_BackUrlParam"/>
   </form>
    </div>
</body>
</html>
