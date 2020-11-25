<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherControlManage.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.OtherControlManage" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        $(function() {
        $("#btnNew").click(function() { location.href = $("#btnNew").attr("Href") + $("#btnNew").attr("EditUrlParam"); ; })
            $("body").find("input").each(function() {
                if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                    $(this).click(function() { location.href = $(this).attr("Href") + $(this).attr("EditUrlParam"); })
                }
            });
        });
    </script>
    <!--{$ParseModel.Include$}-->
</head>
<body>
    <form id="theForm" runat="server">
    <div style=" padding:3px; margin:5px;"  id="HQB_Model_ListLink"><!--{$ParseModel.ListLink$}--></div>
    <div><asp:Repeater runat="server" ID="rptFlowStep"><ItemTemplate><a href="?StepID=<%#Eval("StepID") %>" target="_self"><%#Eval("StepName") %></a></ItemTemplate></asp:Repeater></div>
    <div><asp:Repeater runat="server" ID="rptFlowState"><ItemTemplate><a href="?Action={s}{(FlowState)(=)(<%#Eval("StateValue") %>)}&StepID=<%#Eval("StepID") %>"><%#Eval("StateName") %></a></ItemTemplate></asp:Repeater></div>
    <div style=" padding:3px; margin:5px;">
    <asp:PlaceHolder ID="plParseModelLinkButton" runat="server"><input type="button" onclick="backOriginalUrl('<%=originalUrl %>');" value="返回" style=" display:<%=originalUrlDisplay%>;"/> <!--{$ParseModel.ListButton$}--></asp:PlaceHolder>
    <asp:PlaceHolder ID="plDParseModelLinkButton" runat="server"></asp:PlaceHolder>
    </div>
    <div>
    <table id="_ListInfoListTable">  
        <!--{$ParseModel.ListInfo.Header$}--> 
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
        <!--{$ParseModel.ListInfo.Item$}-->
        </ItemTemplate>
        </asp:Repeater>
    </table>
    </div>

    <div>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
   </div>
   <!--$ParseModel.ServerControl$-->
   <asp:HiddenField ID="hdnModelID" Value="" runat="server"/>
   <asp:HiddenField ID="hdnTableName" Value="" runat="server"/>
   <asp:HiddenField ID="hdnNodeCode" runat="server" />
   <asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />
    <asp:HiddenField ID="hdnIsAllowFlow" Value="" runat="server" />
   <asp:HiddenField ID="hdnForignTableCol" Value="" runat="server" />
    <asp:HiddenField ID="hdnShowCol" runat="server"/>
    <input type="hidden" name="action" value="" id="HQB_Action" />
   <input type="checkbox" name="_chkID" />
   <asp:HiddenField ID="hdnDeliverAndSearchUrlParam" runat="server"/>
   <asp:HiddenField ID="hdnNotSearchField" runat="server" />
   <asp:HiddenField ID="hdnBackDeliverUrlParam" runat="server"/>
   <input type="hidden" name="hidLogTitle" id="hidLogTitle"/>
       </form>
    
    
   <form name="searchForm" method="post" action="?">
   <div>
        <div><!--{$ParseModel.Search$}--> </div>
       
        <div><input type="submit" value="搜索" /></div>
    </div>
    </form>
       <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>