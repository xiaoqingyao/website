<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonFieldEdit.aspx.cs"    Inherits="KingTop.Web.Admin.CommonFieldEdit" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>字段管理</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
     <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script src="../JS/FieldManage.js" type="text/javascript"></script>
     <script type="text/javascript">
        var id;
        <%=jsMessage %>
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(function() {
            var name = "字段编辑";
            var listUrl = "CommonFieldList.aspx?<%=UrlParam %>";
            var addUrl = "CommonFieldEdit.aspx?action=add&<%=UrlParam %>";
            var updateUrl = "CommonFieldEdit.aspx?action=edit&?<%=UrlParam %>&id=" + id;
            showEditMessage(name, listUrl, addUrl, updateUrl);
        });

    </script>
</head>
<body>
    <form name="theForm" id="theForm" method="post" runat="server">
    <div class="container">
        <h4>
            位置: <%GetPageNav(NodeCode);%>
        </h4>
        <dl>
            <dt>
                字段别名：</dt>
            <dd>
                <asp:TextBox runat="server" ID="txtFieldAlias" CssClass="validate[required,length[1,64]]"></asp:TextBox>*</dd>
        </dl>
         <dl>
           <dt>
               名称：</dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,50]]"></asp:TextBox>
                <input type="button" value="检测是否重复"onclick="CheckNameRepeat('K_ModelField','Name','CheckNameISRepeatMSG')" />
                <span style="color:#ff0000;" id="CheckNameISRepeatMSG"></span>
                *注：字段名由字母、数字、下划线组成，并且仅能字母开头，不以下划线结尾</dd>
        </dl>
        <dl>
            <dt>
                所属分组：</dt>
            <dd>
                <asp:DropDownList ID="ddlGroupID" runat="server">
                </asp:DropDownList>
            </dd>
        </dl>
        <dl>
            <dt>
                提示信息：</dt>
            <dd>
                <asp:TextBox runat="server" ID="txtMessage" Height="101px" TextMode="MultiLine" Width="313px"></asp:TextBox>后台录入时，在标题旁的提示信息</dd>
        </dl>
        <dl>
            <dt>
                基本字段类型：</dt>
            <dd>
                <asp:RadioButtonList ID="radlBasicField" runat="server" RepeatColumns="6" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Model,Text%>'></asp:ListItem>
                    <asp:ListItem Value="2" Text='<%$Resources:Model,MuliLineText%>'></asp:ListItem>
                    <asp:ListItem Value="3" Text='<%$Resources:Model,MuliLineTextHtml%>'></asp:ListItem>
                    <asp:ListItem Value="4" Text='<%$Resources:Model,Radio%>'></asp:ListItem>
                    <asp:ListItem Value="5" Text='<%$Resources:Model,CheckBox%>'></asp:ListItem>
                    <asp:ListItem Value="6" Text='<%$Resources:Model,DropDown%>'></asp:ListItem>
                    <asp:ListItem Value="7" Text='<%$Resources:Model,DropDownList%>'></asp:ListItem>
                    <asp:ListItem Value="8" Text='<%$Resources:Model,Number%>'></asp:ListItem>
                    <asp:ListItem Value="9" Text='<%$Resources:Model,Decimal%>'></asp:ListItem>
                    <asp:ListItem Value="10" Text='<%$Resources:Model,DateTime%>'></asp:ListItem>
                    <asp:ListItem Value="11" Text='<%$Resources:Model,Images%>'></asp:ListItem>
                    <asp:ListItem Value="12" Text='<%$Resources:Model,File%>'></asp:ListItem>
                    <asp:ListItem Value="13" Text="隐藏域"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl id="BasicField_TextBoxWidth">
            <dt><%=Resources.Model.txtBoxWidth%></dt>
            <dd><asp:TextBox runat="server" ID="txtTextBoxWidth" Text="100"></asp:TextBox>px</dd>
        </dl>
        <dl id="BasicField_TextBoxHeight"> 
            <dt><%=Resources.Model.txtBoxHeight%></dt>
            <dd><asp:TextBox runat="server" ID="txtTextBoxHieght" Text="30"></asp:TextBox>px</dd>
        </dl>

         <div id="BasicField_1">
            <dl>
                <dt><%=Resources.Model.MaxLength%></dt>
                <dd><asp:TextBox runat="server" ID="txtTextBoxMaxLength" Text="30"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt><%=Resources.Model.ValidationTypes%></dt>
                <dd><asp:RadioButtonList ID="radlValidationType" runat="server" RepeatDirection="Horizontal" ></asp:RadioButtonList>
                </dd>
            </dl>
            <div id="BasicField_Validation" style="display:none;">
                <dl>
                    <dt><%=Resources.Model.ValidationMessage%></dt>
                    <dd><asp:TextBox runat="server" ID="txtValidationMessage"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt><%=Resources.Model.Validation%></dt>
                    <dd><asp:TextBox runat="server" ID="txtTextBoxValidation"></asp:TextBox></dd>
                </dl>
            </div>
         </div>      
         
         <div id="BasicField_3">
            <dl>
                <dt><%=Resources.Model.EditorType%></dt>
                <dd>
                    <ul style="list-style: none;">
                        <li style="float: left; list-style: none;">
                             <asp:DropDownList ID="ddlEditorType" runat="server" onclick="onEditorChange()">
                                <asp:ListItem Value="1" Text="CKEditor"></asp:ListItem>
                                 <asp:ListItem Value="2" Text="eWebEditor"></asp:ListItem>
                             </asp:DropDownList>
                         </li>
                         <li style="float: left; list-style: none; margin-left: 8px; display:block;" id="Editor_CKEditor" >
                            <asp:RadioButtonList ID="radlCKEditorStyle" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                                 <asp:ListItem Value="1" Text="标准型" Selected="True"></asp:ListItem>
                                  <asp:ListItem Value="2" Text="Mini型"></asp:ListItem>
                            </asp:RadioButtonList>
                       </li>
                        <li style="float: left; list-style: none; margin-left: 8px; display:none;" id="Editor_eWebEditor">
                            <asp:RadioButtonList ID="radleWebEditorStyle" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                                <asp:ListItem Value="standard650" Text="标准型" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="mini500" Text="Mini型"></asp:ListItem>
                            </asp:RadioButtonList>
                        </li>
                    </ul>
                </dd>
            </dl>
         </div>  
         
         <div id="BasicField_4">
            <dl>
                <dt><%=Resources.Model.DropDownDataType%></dt>
                <dd>
                    <asp:RadioButtonList runat="server" ID="radlDropDownDataType" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1" onclick="onDropDownDataTypeChange(1)" Text='<%$Resources:Model,TextBoxInput%>'></asp:ListItem>
                        <asp:ListItem Value="2" onclick="onDropDownDataTypeChange(2)" Text='<%$Resources:Model,DataBaseInput%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl id="DropDownDataType1">
                <dt><%=Resources.Model.ModelFieldOption%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtOptionsValue" Height="101px" TextMode="MultiLine" Width="313px"></asp:TextBox>
                    <font color="red"><%=Resources.Model.TextBoxInputValue%></font>
                </dd>
            </dl>
            <div id="DropDownDataType2" style="display:none">
                <dl>
                    <dt><%=Resources.Model.DataBaseTableList%></dt>
                    <dd><asp:DropDownList ID="ddlDropDownTable" runat="server" onchange="selectColumn(this.value)"></asp:DropDownList></dd>
                </dl>
                <dl>
                    <dt><%=Resources.Model.ColumnText%></dt>
                    <dd>
                        <asp:DropDownList ID="ddlDropDownTextColumn" runat="server" onchange="selectColumnSql()"></asp:DropDownList>
                        <asp:HiddenField ID="hdnDropDownTextColumn" runat="server" />
                    </dd>
                </dl>
                <dl>
                    <dt><%=Resources.Model.ColumnValue%></dt>
                    <dd>
                        <asp:DropDownList ID="ddlDropDownValueColumn" runat="server" onchange="selectColumnSql()"></asp:DropDownList>
                        <asp:HiddenField ID="hdnDropDownValueColumn" runat="server" />
                    </dd>
                </dl>
                <dl>
                    <dt><%=Resources.Model.SqlWhere%></dt>
                    <dd><asp:TextBox runat="server" ID="txtDropDownSqlWhere" onchange="selectColumnSql()"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt><%=Resources.Model.DataBaseSql%></dt>
                    <dd><asp:TextBox runat="server" ID="txtDropDownSql" Height="101px" TextMode="MultiLine"  Width="313px"></asp:TextBox></dd>
                </dl>
            </div>
         </div>
         
         <div id="BasicField_5">
            <dl>
                <dt><%=Resources.Model.ModelFieldOptionCount%></dt>
                <dd><asp:TextBox runat="server" ID="txtOptionCount" Text="0"></asp:TextBox><%=Resources.Model.ModelFieldOptionCountValue%></dd>
            </dl>         
         </div>
         
         <div id="BasicField_8">
            <dl id="BasicField_NumberCount">
                <dt><%=Resources.Model.ModelFiledNumber%></dt>
                <dd>
                    <asp:DropDownList ID="NumberCount" runat="server">
                        <asp:ListItem Value="0" Text="0"></asp:ListItem>
                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                        <asp:ListItem Value="5" Text="5"></asp:ListItem>
                        <asp:ListItem Value="6" Text="6"></asp:ListItem>
                    </asp:DropDownList>
                </dd>
            </dl>
             <dl>
                <dt><%=Resources.Model.ModelFiledMinValue%></dt>
                <dd><asp:TextBox runat="server" ID="txtMinValue" Text="1"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt><%=Resources.Model.ModelFiledMaxValue%></dt>
                <dd><asp:TextBox runat="server" ID="txtMaxValue" Text="999999"></asp:TextBox></dd>
            </dl>
         </div>
         
         <div id="BasicField_10">
            <dl>
                <dt><%=Resources.Model.ModelFiledDateOption%></dt>
                <dd>
                    <asp:RadioButtonList runat="server" ID="radlDateFormatOption" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Model,ModelFiledDate%>'></asp:ListItem>
                        <asp:ListItem Value="2" Text='<%$Resources:Model,ModelFiledTime%>'></asp:ListItem>
                        <asp:ListItem Value="3" Text='<%$Resources:Model,ModelFiledDateTime%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl>
                <dt><%=Resources.Model.ModelFiledDefaultValue%></dt>
                <dd>
                    <asp:RadioButtonList runat="server" ID="radlDateDefaultOption" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1" onclick="displayContainer('BasicField_DefaultValue',false)" Text='<%$Resources:Model,ModelFiledNull%>'></asp:ListItem>
                        <asp:ListItem Value="2"  onclick="displayContainer('BasicField_DefaultValue',false)"  Text='<%$Resources:Model,ModelFiledToday%>'></asp:ListItem>
                        <asp:ListItem Value="3"  onclick="displayContainer('BasicField_DefaultValue',true)"  Text='<%$Resources:Model,ModelFiledAppointedTime%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
         </div>
         
         <div id="BasicField_11">
            <dl id="BasicField_ImagesThumb" style="display: none;">
                <dt>缩略图尺寸：</dt>
                <dd>宽 &nbsp;<asp:TextBox ID="txtThumbWidth" Text="125" runat="server"></asp:TextBox>px&nbsp;&nbsp;&nbsp;高&nbsp;<asp:TextBox ID="txtThumbHeight" Text="125" runat="server"></asp:TextBox>px</dd>
            </dl>  
             <dl>
                <dt>是否多文件：</dt>
                <dd>
                    <asp:RadioButtonList ID="radlIsMultiFile" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Value="1" Text='<%$Resources:Common,Yes%>'  onclick="displayContainer('BasicField_TextBoxHeight',true)" ></asp:ListItem>
                        <asp:ListItem Value="0" Selected="True"  onclick="displayContainer('BasicField_TextBoxHeight',false)" Text='<%$Resources:Common,No%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl>
                <dt><%=Resources.Model.ModelFiledIsUpload%>：</dt>
                <dd>
                    <asp:RadioButtonList ID="radlIsUpload" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>' onclick="displayContainer('BasicField_AllowUpload',true)" ></asp:ListItem>
                        <asp:ListItem Value="0" Text='<%$Resources:Common,No%>' onclick="displayContainer('BasicField_AllowUpload',false)"></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <div id="BasicField_AllowUpload">
                <dl>
                    <dt><%=Resources.Model.ModelFileSizt%>：</dt>
                    <dd><asp:TextBox runat="server" ID="txtMaxSize" Text="4096"></asp:TextBox>KB</dd>
                </dl>
                <dl>
                    <dt><%=Resources.Model.ModelFileType%>：</dt>
                    <dd><asp:TextBox runat="server" ID="txtImageType"></asp:TextBox><%=Resources.Model.ModelFileTypeMessage%></dd>
                </dl>
            </div>
            <dl>
                <dt><%=Resources.Model.ModelFileSaveSize%>：</dt>
                <dd>
                    <ul style=" list-style:none;">
                        <li style=" list-style:none; float:left;"><asp:CheckBox ID="chkIsSaveFileSize" runat="server" Checked="true" onclick="displayContainer('BasicField_IsSaveFileSize',this.checked)" /><%=Resources.Common.Save%></li>
                        <li style=" list-style:none; float:left; margin-left:10px;" id="BasicField_IsSaveFileSize"><asp:TextBox runat="server" ID="txtSaveFileName"></asp:TextBox><%=Resources.Model.ModelFileSaveName%></li>
                    </ul>
                </dd>
            </dl>        
         </div>

        <dl id="BasicField_DefaultValue">
            <dt>
                <%=Resources.Model.ModelFiledDefaultValue%></dt>
            <dd>
                <asp:TextBox runat="server" ID="txtDefaultValue"></asp:TextBox></dd>
        </dl>
        <dl id="BasicField_ColumnLength">
            <dt>
                <%=Resources.Model.ModelFiledDataLength%></dt>
            <dd>
                <asp:TextBox runat="server" ID="txtDataCoulumnLength" Text="100" MaxLength="10" CssClass="validate[required,custom[onlyNumber],length[1,10]]"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>是否必填：</dt>
            <dd>
                <asp:RadioButtonList ID="radlIsRequired" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Selected="True" Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>是否在编辑页显示：</dt>
            <dd>
                <asp:RadioButtonList ID="radlIsInputValue" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>是否启用：</dt>
            <dd>
                <asp:RadioButtonList ID="radlIsEnable" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>是否在前台列表显示：</dt>
            <dd>
                <asp:RadioButtonList ID="radlIsListVisible" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>是否搜索条件：</dt>
            <dd>
                <asp:CheckBox ID="chkIsSearch" runat="server" onclick="displayContainer('IsSearchDisplay',this.checked)" /><%=Resources.Common.Yes%>
                <ul style="list-style: none; margin: 2px; display: none;" id="IsSearchDisplay">
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.UiType%>
                    </li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:DropDownList Style="float: left;" ID="ddlSearchUIType" runat="server">
                            <asp:ListItem Selected="True" Value="0" Text='<%$Resources:Model,Null%>'></asp:ListItem>
                            <asp:ListItem Value="1" Text='<%$Resources:Model,Range%>'></asp:ListItem>
                            <asp:ListItem Value="2" Text='<%$Resources:Model,ListAndText%>'></asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledSearchWidth%></li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:TextBox runat="server" ID="txtSearchWidth" Text="100"></asp:TextBox></li>
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledSearchOrder%></li>
                    <li>
                        <asp:TextBox runat="server" ID="txtSearchOrders" Text="1"></asp:TextBox><%=Resources.Model.ModelFiledRequierdNumber%></li>
                </ul>
            </dd>
        </dl>
        <dl>
            <dt>列表是否显示：</dt>
            <dd>
                <asp:CheckBox ID="chkIsListEnable" runat="server" onclick="displayContainer('IsListEnableDisplay',this.checked)" /><%=Resources.Common.Yes%>
                <ul id="IsListEnableDisplay" style="display: none; list-style: none; margin: 2px;">
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledCoulumnWidth%></li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:TextBox runat="server" ID="txtListWidth" Text="20"></asp:TextBox></li>
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledListAlignment%></li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:DropDownList ID="ddlListAlignment" runat="server">
                            <asp:ListItem Text='<%$Resources:Model,ModelFiledLeft%>' Value="1"></asp:ListItem>
                            <asp:ListItem Text='<%$Resources:Model,ModelFiledCenter%>' Value="2"></asp:ListItem>
                            <asp:ListItem Text='<%$Resources:Model,ModelFiledRight%>' Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li style="margin: 0; padding: 0; padding-left: 5px;">
                        <%=Resources.Common.Orders%><asp:TextBox runat="server" ID="txtListOrders" Text="1"></asp:TextBox><%=Resources.Model.ModelFiledRequierdNumber%></li>
                    <li style="padding: 0; margin: 0; padding-left: 5px;">
                        <ul style="list-style: none; margin: 0px; padding: 0;">
                            <li style="padding-left: 5px; float: left;">
                                <%=Resources.Model.ModelFiledIsLink%><asp:CheckBox ID="chkListIsLink" runat="server" onclick="displayContainer('ListIsLinkDisplay',this.checked)" /></li>
                            <li style="padding-left: 15px; float: left; display: none" id="ListIsLinkDisplay">
                                <%=Resources.Model.ModelFiledLinkUrl%><asp:TextBox runat="server" ID="txtListLinkUrl"></asp:TextBox></li>
                        </ul>
                    </li>
                    <li style="padding: 0; margin: 0; padding-left: 5px; clear: both;">
                        <ul style="list-style: none; margin: 0px; padding: 0;">
                            <li style="padding-left: 5px; float: left;">
                                <%=Resources.Model.ModelFiledIsOrder%><asp:CheckBox ID="chkListIsOrder" runat="server" Checked="true" onclick="displayContainer('ListIsOrderDisplay',this.checked)" /></li>
                            <li style="padding-left: 5px; float: left; padding-left: 15px;" id="ListIsOrderDisplay">
                                <asp:RadioButtonList ID="radlListOrderOption" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Text='<%$Resources:Model,ModelFiledOrderAsc%>'></asp:ListItem>
                                    <asp:ListItem Value="2" Text='<%$Resources:Model,ModelFiledOrderDesc%>'></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="3" Text='<%$Resources:Model,ModelFiledOrderAll%>'></asp:ListItem>
                                </asp:RadioButtonList>
                            </li>
                        </ul>
                    </li>
                    <li style=" padding-left: 5px; clear: both;">
                        <ul style="list-style: none; margin: 0px; padding: 0;">
                            <li style="margin: 0; padding: 0; float: left; padding-left: 15px;">
                                <ul style="margin: 0; padding: 0; list-style: none;">
                                    <li style="float: left;">
                                       列表缩略图显示方式</li><li style="float: left;">
                                            <asp:RadioButtonList ID="radlThumbDisplayType" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
                                                <asp:ListItem Value="1" Text="当前图的缩略图" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="当前图"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </dd>
        </dl>
        <div class="Submit">
            <asp:Button ID="btnModelField" runat="server" OnClick="btnModelField_Click" Text="<%$Resources:Common,Add%>" />
            <input type="button" name="Submit422" value="<%=Resources.Common.Back%>" onclick="javascript:location.href='CommonFieldList.aspx?<%=UrlParam %>';">
        </div>
    </div>
    <asp:HiddenField ID="hdnAction" runat="server" />
    <asp:HiddenField ID="hdnBasicField" runat="server" />
    <asp:HiddenField ID="hdnModelID" runat="server" />
       <input type="hidden" id="IsListPage"  value="0"/>
    </form>
</body>
</html>
