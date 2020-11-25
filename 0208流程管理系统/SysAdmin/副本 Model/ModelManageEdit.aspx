<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelManageEdit.aspx.cs" ValidateRequest="false" EnableEventValidation="false"  Inherits="KingTop.Web.Admin.ModelManageEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
     <script type="text/javascript" src="../js/ModelManage.js"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var modeManageLinkButtonTemplate = "<%= Resources.Model.SelfDefinedListTemplateJS%>"; 
    $(pageEditInit);
        var id;
       <%=jsMessage %>
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(function() {
            var name = "模型编辑";
            var listUrl = "ModelManageList.aspx<%=StrPageParams %>";
            var addUrl = "ModelManageEdit.aspx?action=add&NodeCode=<%=NodeCode%>";
            var updateUrl = "ModelManageEdit.aspx?action=edit&NodeCode=<%=NodeCode%>&id=" + id;
            showEditMessage(name, listUrl, addUrl, updateUrl);
        });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
<div class="container">
<h4>位置：  <%GetPageNav(NodeCode);%></h4> 
           <ul id="tags">
            <li class="selectTag"><a href="javascript:;">基本属性</a> </li>
            <li><a href="javascript:;">高级属性</a> </li>
        </ul>
        <div id="panel">
        <fieldset style="display:block;">
 
<dl>
    <dt> <%=Resources.Model.ModelName %></dt>
    <dd>
    <asp:TextBox ID="txtTitle" CssClass="validate[required,length[2,128]]" runat="server"></asp:TextBox>
    </dd>
</dl>
 <dl>
    <dt><%=Resources.Model.ModelTableName %></dt>
    <dd>
        <asp:DropDownList ID="ddlPreFix" runat="server">
            <asp:ListItem Value="K_U_" Text="K_U_"></asp:ListItem>
            <asp:ListItem Value="K_F_" Text="K_F_"></asp:ListItem>
            <asp:ListItem Value="K_G_" Text="K_G_"></asp:ListItem>
        </asp:DropDownList>
  <asp:TextBox ID="txtTableName" CssClass="validate[required,custom[noSpecialCaracters]]" runat="server"></asp:TextBox>
  <input type="button" value="检测是否重复" onclick=" CheckModelRepeat('txtTableName','CheckNameISRepeatMSG')" />
  <span style="color:#ff0000;" id="CheckNameISRepeatMSG"></span>
  </dd>
</dl> 
<dl style="display:none;">
    <dt>子模型：</dt>
    <dd><asp:CheckBox ID="chkIsSub" runat="server" onclick="ToggleSubModel()" /></dd>
</dl>
<dl id="SubModel" style="<%if(IsSub=="0"){Response.Write("display:none;");}%>">

<dt>所属子模型分组：</dt>    <dd>
        <asp:DropDownList ID="ddlSubModelGroup" runat="server">
        </asp:DropDownList>
    </dd>
    <dd id="BtnAddSubModelGroupName" style=" display:block; margin-left:5px;"><input type="button" value="添加分组" onclick="javascript:$('#AddSubModelGroupName').css('display','block')" /></dd>
    <dd id="AddSubModelGroupName" style=" display:none;">
        &nbsp;&nbsp;&nbsp;<input type="text" style="width:180px;" id="SubModelGroupName" />
       &nbsp;<input type="button" onclick="AddSubModelGroup()" value="确定" />
        &nbsp;&nbsp;<span id="AddSubModelGroupNamePrompt"></span>
        &nbsp;<input type="button" value="关闭" onclick="javascript:$('#AddSubModelGroupName').css('display','none')" />
    </dd>
 </dl>

 <dl id="FieldControl" runat="server">
    <dt><%=Resources.Model.ModelSysField %></dt>
    <dd>
        <asp:CheckBoxList ID="chklField" RepeatColumns="8" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
    </dd>
</dl>                              
</fieldset>
<fieldset style="display:none;">
 <dl>
    <dt><%=Resources.Model.ModelParseTemplate %></dt>
    <dd>
<asp:DropDownList ID="ddlModuleID" runat="server">
                            </asp:DropDownList>
    </dd> 
</dl>                          
 <dl>
    <dt><%=Resources.Model.ModelIsEnable %></dt>
    <dd>
<asp:RadioButtonList ID="radlIsEnable" RepeatDirection="Horizontal" runat="server">
                                <asp:ListItem Text="启用" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="禁用" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
    </dd>
</dl>                          
 <dl>
    <dt>是否显示排序列：</dt>
    <dd>
<asp:RadioButtonList ID="radlIsOrderEdit" RepeatDirection="Horizontal" runat="server">
                                <asp:ListItem Text="是" Value="1" Selected="True" ></asp:ListItem>
                                <asp:ListItem Text="否" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
    </dd>
</dl>                          
<dl>
    <dt>列表项内容是否剪切：</dt>
    <dd>
<asp:RadioButtonList ID="radlIsListContentClip" RepeatDirection="Horizontal" runat="server">
                                <asp:ListItem Text="是" Value="1" Selected="True" ></asp:ListItem>
                                <asp:ListItem Text="否" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
    </dd>
</dl> <dl>
    <dt>列表操作列：</dt>
    <dd>
<asp:CheckBoxList ID="chklOperationColumn" RepeatColumns="8" RepeatDirection="Horizontal" runat="server">
                            </asp:CheckBoxList>
    </dd>
</dl>   

<dl>
    <dt>列表操作列宽度：</dt>
    <dd>
    <asp:TextBox ID="txtOperationColumnWidth" runat="server"></asp:TextBox> 数字(像素)或百分比（如:30%）</dd>
</dl>
                       
 <dl>
    <dt><%=Resources.Model.ModelListLink %></dt>
    <dd  id="ListLinkDiv">
<asp:CheckBoxList ID="chkListLink" runat="server" RepeatDirection="Horizontal" RepeatColumns="8">
                                <asp:ListItem Value="none" onclick="ListLinkSet(this, 'ListLinkDiv', 'ListLink')" Text="无连接栏" Selected="True"></asp:ListItem>
                            </asp:CheckBoxList><%=Resources.Model.ModelListLinkSelfDefinedInfo %><div id="ListLink" runat="server">
                                        </div>
                                        <%=Resources.Model.ModelListLinkSelfDefinedName %> 
                                        <input type="text" id="txtLinkName" name="txtLinkName">
                                        &nbsp;&nbsp;
                                        <%=Resources.Model.ModelListLinkSelfDefinedUrl %>
                                        <input type="text" id="txtLinkUrl" name="txtLinkUrl">
                                        &nbsp;<input type="button" onclick="ListButton_Add('ListLink','txtLinkName','txtLinkUrl')"
                                            value='<%=Resources.Common.Add %>'>
    </dd>
</dl>                          
                           

 <dl>
    <dt><%=Resources.Model.ModelListButton %></dt>
    <dd id="ListButtonDiv">
<asp:CheckBoxList ID="chkListButton" RepeatColumns="8" RepeatDirection="Horizontal"
                                runat="server">
                                <asp:ListItem Value="none" onclick="ListLinkSet(this,'ListButtonDiv','ListButton')"
                                    Text="无功能按钮"></asp:ListItem>
                            </asp:CheckBoxList>
                            <%=Resources.Model.ModelListButtonSelfDefinedInfo %>
                            <div id="ListButton" runat="server"></div>   
                                                                  <%=Resources.Model.ModelListButtonSelfDefinedName %><input type="text" name="txtListButtonName"
                                            id="txtListButtonName" />
                                        &nbsp;&nbsp;
                                        <%=Resources.Model.ModelListButtonSelfDefinedValue %><input type="text" name="txtListButtonValue"
                                            id="txtListButtonValue" />
                                        &nbsp;<input type="button" value=' <%=Resources.Common.Add %>' onclick="ListButton_Add('ListButton','txtListButtonName','txtListButtonValue')">

    </dd>
</dl>                          
                            
                                        
 <dl>
    <dt><%=Resources.Model.ModelCustomCol %></dt>
    <dd>
<div id="CustomCol" runat="server">
                            </div>
                              <%=Resources.Model.ModelCustomColName %><input type="text" name="txtCustomColName"
                                id="txtCustomColName" />
                            &nbsp;&nbsp;
                            <%=Resources.Model.ModelCustomColValue %><input type="text" name="txtCustomColValue"
                                id="txtCustomColValue" />
                            &nbsp;<input type="button" onclick="ListButton_Add('CustomCol','txtCustomColName','txtCustomColValue')"
                                value='<%=Resources.Common.Add %>'>
                            <%=Resources.Model.ModelCustomColInfo %>
  </dd>
</dl>                          
                            
 <dl>
    <dt><%=Resources.Model.ModelMemo %></dt>
    <dd>
<asp:TextBox ID="txtMemo" TextMode="MultiLine" Rows="10" Columns="50" runat="server"></asp:TextBox>
    </dd>
</dl>                          
 <dl>
    <dt>操作人：</dt>
    <dd>
<asp:TextBox ID="txtConfigMan"   runat="server"></asp:TextBox>您的全名，模型出问题时方便交流
    </dd>
</dl>                          
    </fieldset>                    
    </div>                        
<div class="Submit">
         <asp:Button ID="btnModel" runat="server" Text='<%$Resources:Common,Add %>' OnClick="btnModel_Click" />
        <input type="button" name="Submit422" value='<%=Resources.Common.Back %>' onclick="javascript:location.href='ModelManageList.aspx<%=StrPageParams %>';">
</div>    
    <input type="hidden" value="" id="hdnListLink" name="hdnListLink" runat="server" />
    <input type="hidden" value="" id="hdnListButton" name="hdnListButton" runat="server" />
    <input type="hidden" value="" id="hdnCustomCol" name="hdnCustomCol" runat="server" />
    <asp:HiddenField ID="hdnOriginalListLink" runat="server" />
    <asp:HiddenField ID="hdnOriginalListButton" runat="server" />
    <asp:HiddenField ID="hdnOriginalSysField" runat="server" />
     <asp:HiddenField ID="hdnOriginalCommonField" runat="server" />
     <asp:HiddenField ID="hdnPreFix" runat="server" />
     <script type="text/javascript">
        ListLinkSet($("#chkListLink_0")[0], 'ListLinkDiv', 'ListLink');
        ListLinkSet($("#chkListButton_0")[0], 'ListButtonDiv', 'ListButton');
    </script>
    </div>
   </form>
</body>
</html>
