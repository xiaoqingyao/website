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
  <h4>λ�ã� <%GetPageNav(NodeCode);%></h4>
       <form name="searchForm" method="post">
      <div id="searchContainer">
        <ul>
        <li>�������</li><li>�ӣ�</li><li><li><input id="AddDate"  value=""   name="AddDate" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></li></li><li>����</li><li><input id="AddDate{0}"  value=""   name="AddDate{0}" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></li><li>��Ʒ����</li><li><input   type="text" value="" style="width:100px;"  maxlength="180" name="Title" id="Title" /></li>
       
        <li><input type="submit" value="����" /></li>
       </ul><br clear="left" />
        </div>
    </form>
    <form id="theForm" runat="server">
    
    <div class="function" style="text-align:left" id="HQB_Model_ListLink"><a href="?Action={s}{(IsCommend)(=)(1)}">�Ƽ�</a><a href="?Action={s}{(IsCommend)(=)(0)}">δ�Ƽ�</a><asp:Repeater runat="server" ID="rptFlowStep"><ItemTemplate><a href="?StepID=<%#Eval("StepID") %>" target="_self"><%#Eval("StepName") %></a></ItemTemplate></asp:Repeater></div>
    <div class="function" style=" text-align:center;"><asp:Repeater runat="server" ID="rptFlowState"><ItemTemplate><a href="?Action={s}{(FlowState)(=)(<%#Eval("StateValue") %>)}&StepID=<%#Eval("StepID") %>"><%#Eval("StateName") %></a></ItemTemplate></asp:Repeater></div>
    <div  class="function">
    <asp:PlaceHolder ID="plParseModelLinkButton" runat="server"><input type="button" onclick='backOriginalUrl(<%=originalUrl %>)' value="����" style=" display:<%=originalUrlDisplay%>;"/><%if(!string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){%><input type="button" value="���" Href="productedit.aspx?action=add"  EditUrlParam="" id="btnNew" /><%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" value="ɾ��" onclick="return confirmSetAction(this,'{e}{(IsDel)(1)}','ȷ��ɾ��ѡ����¼������վ��');"  runat="server" id="btnDelete" /><%}%><input type="submit" value="�Ƽ�" id="btnCommend" runat="server" onclick="return setAction('{e}{(IsCommend)(1)}');" /></asp:PlaceHolder>
        <asp:PlaceHolder ID="plDParseModelLinkButton" runat="server"></asp:PlaceHolder>
    </div>
             <ul class="ulheader"><li  style="width:45px;"><input type="checkbox" name="SlectAll" id="SlectAll" /></li><li  style="width:250px;">��Ʒ����</li><li  style="width:80px;">��Ʒ����</li><li  style="width:110px;">�������</li><li  style="width:100px;">���״̬</li><li  style="width:80px;" ><a href="javascript:sort('K_U_product.Orders','3')">����</a></li><li style="width:30%;" >����</li>  </ul>
          <div id="HQB_ListInfo" style=" padding:0; margin:0;">
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
         <ul class="ulheader ulbody"><li style="width:45px;"><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></li><li isClip="1"  style="text-align:left;width:250px;"><%#Eval("Title") %></li><li  style="text-align:left;width:80px;"><%#Eval("productclass") %></li><li  style="text-align:left;width:110px;"><%#string.Format("{0:yyyy-MM-dd HH:mm:ss}",Eval("AddDate").ToString()) %></li><li  style="text-align:left;width:100px;"><%#ctrManageList.ParseFieldValueToText("100011357719372",Eval("FlowState") )%></li><li  id="HQB_Orders_<%#Eval("ID") %>" style="width:80px;"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input style="width:70px;" type="text" value="<%#Eval("Orders") %>" onblur="setOrders('K_U_product','<%#Eval("ID") %>',this.value)"  CssClass="validate[required,custom[onlyNumber]]"/></span></li><li style="width:30%;" ><%if(!string.Equals(ctrManageList.IsDel,"1") &&  !string.Equals(ctrManageList.IsArchiving,"1")){%><input type="button"  BtnType="Edit"  Href='<%#"productedit.aspx?action=edit&ID=" + Eval("ID").ToString()%>' value="�޸�"/>&nbsp;<%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" BtnType="Delete" onclick="return rptConfirmSetAction(this,'<%#"{e}{(IsDel)(1)}{ID=" + Eval("ID").ToString() + "}"%>','ȷ��ɾ����ǰ��¼��');" RecordID="<%#Eval("ID")%>"  value="ɾ��" /><%}%>&nbsp;</li></ul>
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

   <asp:HiddenField ID="hdnNotSearchField" runat="server" value="" /><asp:HiddenField ID="hdnBackDeliverUrlParam" runat="server" value="NodeCode"  /> <asp:HiddenField ID="hdnModelID" Value="100000036219372" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_U_product" runat="server" />  <asp:HiddenField ID="hdnDeliverAndSearchUrlParam" runat="server"  Value=""/> <input type="hidden" value="" id="HQB_Model_DeliverUrlParam" /><asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />   <asp:HiddenField ID="hdnForignTableCol" value="K_Types|K_U_product.productclass|TypeName|TypeId" runat="server" /><asp:HiddenField ID="hdnShowCol" value="K_U_product.ID,K_U_product.FlowState,K_U_product.Title,K_U_product.productclass,K_U_product.AddDate,K_U_product.Orders" runat="server" />
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
