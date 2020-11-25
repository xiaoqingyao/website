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
   <script src="../JS/FlowState.js" type="text/javascript"></script>
</head>
<body>
<div class="container"id="_ListInfoListTable">
  <h4>λ�ã� <%GetPageNav(NodeCode);%></h4>
       <form name="searchForm" method="post">
      <div id="searchContainer">
        <ul>
        <li>����</li><li><input type="text" name="Title" style="width:180px;" /></li><li>����ʱ��</li><li>�ӣ�</li><li><li><input id="UpdateDate"  value=""   name="UpdateDate" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></li></li><li>����</li><li><input id="UpdateDate{0}"  value=""   name="UpdateDate{0}" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></li>
        <li><input type="submit" value="����" /></li>
       </ul><br clear="left" />
        </div>
    </form>
    <form id="theForm" runat="server">
    
    <div class="function" style="text-align:left" id="HQB_Model_ListLink"><asp:Repeater runat="server" ID="rptFlowStep"><ItemTemplate><a href="?StepID=<%#Eval("StepID") %>" target="_self"><%#Eval("StepName") %></a></ItemTemplate></asp:Repeater></div>
    <div class="function" style=" text-align:center;"><asp:Repeater runat="server" ID="rptFlowState"><ItemTemplate><a href="?Action={s}{(FlowState)(=)(<%#Eval("StateValue") %>)}&StepID=<%#Eval("StepID") %>"><%#Eval("StateName") %></a></ItemTemplate></asp:Repeater></div>
    <div  class="function">
    <asp:PlaceHolder ID="plParseModelLinkButton" runat="server"><input type="button" onclick='backOriginalUrl(<%=originalUrl %>)' value="����" style=" display:<%=originalUrlDisplay%>;"/><%if(!string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){%><input type="button" value="���" Href="Articleedit.aspx?action=add"  EditUrlParam="" id="btnNew" /><%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" value="ɾ��" onclick="return confirmSetAction(this,'{e}{(IsDel)(1)}','ȷ��ɾ��ѡ����¼������վ��');"  runat="server" id="btnDelete" /><%}%><%if(ctrManageList.IsAllowFlow && !string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){%><input type="submit"  onclick="return setAction('HQB_PastFlowCheck');" value="ͨ�����"  runat="server"  id="btnPastFlowCheck" /><%}%><%if(ctrManageList.IsAllowFlow && !string.Equals(ctrManageList.IsArchiving,"1") && !string.Equals(ctrManageList.IsDel,"1")){%><input type="submit"  onclick="return setAction('HQB_CancelFlowCheck');" value="ȡ�����"  runat="server"  id="btnCancelFlowCheck" /><%}%></asp:PlaceHolder>
        <asp:PlaceHolder ID="plDParseModelLinkButton" runat="server"></asp:PlaceHolder>
    </div>
             <ul class="ulheader"><li  style="width:45px;"><input type="checkbox" name="SlectAll" id="SlectAll" /></li><li  id="Header_Title"  style="width:200px;" ><a href="javascript:sort('K_U_Article.Title','3')">����</a></li><li  style="width:70px;"><a href="javascript:sort('K_U_Article.IsComment','3')">�Ƽ���ҳ</a></li><li  style="width:70px;">�ȵ�����</li><li  style="width:100px;"><a href="javascript:sort('K_U_Article.UpdateDate','3')">����ʱ��</a></li><li  style="width:80px;">���״̬</li><li  style="width:50px;" ><a href="javascript:sort('K_U_Article.Orders','3')">����</a></li><li style="width:100px;" >����</li>  </ul>
          <div id="HQB_ListInfo" style=" padding:0; margin:0;">
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
         <ul class="ulheader ulbody"><li style="width:45px;"><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></li><li id="Title_<%#Eval("ID")%>"   style="width:200px;"  isClip="1"><%#Eval("TitlePrefix") %><a href="Articleview.aspx?ID=<%#Eval("ID") %>" title="<%#Eval("Title") %>"><span style="color:<%#Eval("ColorCode") %>;<%#Eval("TitleStyle") %>"><%#Eval("Title") %></span></a></li><li  style="text-align:left;width:70px;"><%#ctrManageList.ParseFieldValueToText("000000009950171",Eval("IsComment") )%></li><li  style="text-align:left;width:70px;"><%#ctrManageList.ParseFieldValueToText("000000007999805",Eval("IsEnable") )%></li><li  style="text-align:left;width:100px;"><%#string.Format("{0:yyyy-MM-dd}",Eval("UpdateDate").ToString()) %></li><li  style="text-align:left;width:80px;"><%#Eval("FlowState") %></li><li  id="HQB_Orders_<%#Eval("ID") %>" style="width:50px;"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input style="width:70px;" type="text" value="<%#Eval("Orders") %>" onblur="setOrders('K_U_Article','<%#Eval("ID") %>',this.value)"  CssClass="validate[required,custom[onlyNumber]]"/></span></li><li style="width:100px;" ><%if(!string.Equals(ctrManageList.IsDel,"1") &&  !string.Equals(ctrManageList.IsArchiving,"1")){%><input type="button"  BtnType="Edit"  Href='<%#"Articleedit.aspx?action=edit&ID=" + Eval("ID").ToString()%>' value="�޸�"/>&nbsp;<%}%><%if(!string.Equals(ctrManageList.IsDel,"1")){%><input type="submit" BtnType="Delete" onclick="return rptConfirmSetAction(this,'<%#"{e}{(IsDel)(1)}{ID=" + Eval("ID").ToString() + "}"%>','ȷ��ɾ����ǰ��¼��');" RecordID="<%#Eval("ID")%>"  value="ɾ��" /><%}%>&nbsp;</li></ul>
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

   <asp:HiddenField ID="hdnNotSearchField" runat="server" value="" /><asp:HiddenField ID="hdnBackDeliverUrlParam" runat="server" value="NodeCode"  /> <asp:HiddenField ID="hdnModelID" Value="000000000132380" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_U_Article" runat="server" />  <asp:HiddenField ID="hdnDeliverAndSearchUrlParam" runat="server"  Value=""/> <input type="hidden" value="" id="HQB_Model_DeliverUrlParam" /><asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />   <asp:HiddenField ID="hdnForignTableCol" value="K_ReviewFlowState|K_U_Article.FlowState|Name|StateValue" runat="server" /><asp:HiddenField ID="hdnShowCol" value="K_U_Article.ID,K_U_Article.FlowState,K_U_Article.TitlePrefix,K_U_Article.Title,K_U_Article.ColorCode,K_U_Article.TitleStyle,K_U_Article.IsComment,K_U_Article.IsEnable,K_U_Article.UpdateDate,K_U_Article.Orders" runat="server" />
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
