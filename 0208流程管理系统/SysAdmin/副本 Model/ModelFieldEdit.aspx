<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelFieldEdit.aspx.cs"
    Inherits="KingTop.Web.Admin.ModelFieldEdit" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>字段管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />

    <script src="../JS/ModelField.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form name="theForm" id="theForm" method="post" runat="server">
    <div class="container">
        <h4>
            位置:内容管理&gt; 模型管理&gt; 字段管理&gt; 增加字段
        </h4>
        <dl>
            <dt>
                <%=Resources.Model.ModelField %></dt>
            <dd>
                <asp:Label ID="lblModelName" runat="server"></asp:Label></dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFieldGroupName %></dt>
            <dd>
                <asp:TextBox ID="txtFieldName" runat="server" CssClass="validate[required,length[1,50]]"></asp:TextBox><%=Resources.Model.ModelFiledNameMessage%></dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.FileGroup%></dt>
            <dd>
                <asp:DropDownList ID="ddlFileGroup" runat="server">
                </asp:DropDownList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.FieldAlias%></dt>
            <dd>
                <asp:TextBox runat="server" ID="txtFieldAlias" CssClass="validate[required,length[1,64]]"></asp:TextBox><%=Resources.Model.ModelFiledAliasMessage%></dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFieldMessage%></dt>
            <dd>
                <asp:TextBox runat="server" ID="txtMessage" Height="101px" TextMode="MultiLine" Width="313px"></asp:TextBox><%=Resources.Model.ModelFIledMessages%></dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFieldType%></dt>
            <dd>
                <b>
                    <%=Resources.Model.BasicField%></b>
                <asp:RadioButtonList ID="rbtlBasicField" runat="server" RepeatColumns="6" RepeatDirection="Horizontal"
                    onclick="ModelField.BasicFieldChange(this.id)">
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
                </asp:RadioButtonList>
            </dd>
        </dl>
        <asp:Panel ID="plField" runat="server">
            <dl id="tb11">
                <dt>
                    <%=Resources.Model.txtBoxWidth%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtBoxWidth" Text="25"></asp:TextBox></dd>
            </dl>
            <dl id="tb12">
                <dt>
                    <%=Resources.Model.MaxLength%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtMaxLength" Text="30"></asp:TextBox></dd>
            </dl>
            <dl id="tb13">
                <dt>
                    <%=Resources.Model.ValidationTypes%></dt>
                <dd>
                    <asp:RadioButtonList ID="rbtlValidationType" runat="server" RepeatDirection="Horizontal"
                        onclick="ModelField.ValidationTypesChange(this.id)">
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl id="td1" style="display: none">
                <dt>
                    <%=Resources.Model.ValidationMessage%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtValidationMessage"></asp:TextBox></dd>
            </dl>
            <dl id="td2" style="display: none">
                <dt>
                    <%=Resources.Model.Validation%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="TextBoxValidation"></asp:TextBox></dd>
            </dl>
            <dl id="tb21" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFieldWidth%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtWidth" Text="40"></asp:TextBox></dd>
            </dl>
            <dl id="tb22" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFieldHieght%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtHieght" Text="10"></asp:TextBox>px</dd>
            </dl>
            <dl id="tb31" style="display: none">
                <dt>
                    <%=Resources.Model.EditorType%></dt>
                <dd>
                    <ul style="list-style: none;">
                        <li style="float: left; list-style: none;">
                            <asp:DropDownList ID="ddlEditorType" runat="server" onchange="ModelField.onEditorChange()">
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
            <dl id="tb41" style="display: none">
                <dt>
                    <%=Resources.Model.DropDownDataType%></dt>
                <dd>
                    <asp:RadioButtonList runat="server" ID="rbtlDropDownDataType" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1" onclick="ModelField.DropDownDataTypeClick(1)"
                            Text='<%$Resources:Model,TextBoxInput%>'></asp:ListItem>
                        <asp:ListItem Value="2" onclick="ModelField.DropDownDataTypeClick(2)" Text='<%$Resources:Model,DataBaseInput%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl id="tb42" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFieldOption%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtOptionsValue" Height="101px" TextMode="MultiLine"
                        Width="313px"></asp:TextBox>
                    <font color="red">
                        <%=Resources.Model.TextBoxInputValue%></font>
                </dd>
            </dl>
            <dl id="te11" style="display: none">
                <dt>
                    <%=Resources.Model.DataBaseTableList%></dt>
                <dd>
                    <asp:DropDownList ID="ddlDataBase" runat="server" onchange="ModelField.SelectColumn(this.value)">
                    </asp:DropDownList>
                </dd>
            </dl>
            <dl id="te12" style="display: none">
                <dt>
                    <%=Resources.Model.ColumnText%></dt>
                <dd>
                    <asp:DropDownList ID="ddlTextColumn" runat="server" onchange="ModelField.selectColumnSql()">
                    </asp:DropDownList>
                    <asp:HiddenField ID="hidTextColumn" runat="server" />
                </dd>
            </dl>
            <dl id="te13" style="display: none">
                <dt>
                    <%=Resources.Model.ColumnValue%></dt>
                <dd>
                    <asp:DropDownList ID="ddlValueColumn" runat="server" onchange="ModelField.selectColumnSql()">
                    </asp:DropDownList>
                    <asp:HiddenField ID="hidValueColumn" runat="server" />
                </dd>
            </dl>
            <dl id="te14" style="display: none">
                <dt>
                    <%=Resources.Model.SqlWhere%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtSqlWhere" onchange="ModelField.selectColumnSql()"></asp:TextBox></dd>
            </dl>
            <dl id="te15" style="display: none">
                <dt>
                    <%=Resources.Model.DataBaseSql%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtDropDownSql" Height="101px" TextMode="MultiLine"
                        Width="313px"></asp:TextBox></dd>
            </dl>
            <dl id="tb51" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFieldOptionCount%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtOptionCount" Text="0"></asp:TextBox>
                    <%=Resources.Model.ModelFieldOptionCountValue%></dd>
            </dl>
            <dl id="tb81" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFiledNumber%></dt>
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
            <dl id="tb91" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFiledMinValue%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtMinValue" Text="1"></asp:TextBox></dd>
            </dl>
            <dl id="tb92" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFiledMaxValue%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtMaxValue" Text="999999"></asp:TextBox></dd>
            </dl>
            <dl id="tb93" style="display: none">
                <dt>文本框长度：</dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtDigitBoxWidth" Text="100"></asp:TextBox></dd>
            </dl>
            <dl id="tba1" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFiledDateOption%></dt>
                <dd>
                    <asp:RadioButtonList runat="server" ID="rbtlDateFormatOption" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Model,ModelFiledDate%>'></asp:ListItem>
                        <asp:ListItem Value="2" Text='<%$Resources:Model,ModelFiledTime%>'></asp:ListItem>
                        <asp:ListItem Value="3" Text='<%$Resources:Model,ModelFiledDateTime%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl id="tba2" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFiledDefaultValue%></dt>
                <dd>
                    <asp:RadioButtonList runat="server" ID="rbtlDateDefaultOption" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1" onclick="ModelField.ValidationDefaultTimeClick('none')"
                            Text='<%$Resources:Model,ModelFiledNull%>'></asp:ListItem>
                        <asp:ListItem Value="2" onclick="ModelField.ValidationDefaultTimeClick('none')" Text='<%$Resources:Model,ModelFiledToday%>'></asp:ListItem>
                        <asp:ListItem Value="3" onclick="ModelField.ValidationDefaultTimeClick('block')"
                            Text='<%$Resources:Model,ModelFiledAppointedTime%>'></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:TextBox ID="txtDefaultDateValue" Style="display: none" runat="server" Width="100"
                        Text=''></asp:TextBox>
                </dd>
            </dl>
            <dl id="tba3" style="display: none">
                <dt>
                    <%=Resources.Model.txtBoxWidth%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtDataBoxWidth" Text="100"></asp:TextBox></dd>
            </dl>
            <dl id="tbb1" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFiledImageWitdh%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtImagesWidth" Text="50"></asp:TextBox></dd>
            </dl>
            <dl id="tbb3" style="display: none">
                <dt>是否多文件：</dt>
                <dd>
                <ul style=" margin:0; padding:0; list-style:none;">
                    <li style=" list-style:none; float:left;"><asp:RadioButtonList ID="radlIsMultiFile" runat="server" RepeatDirection="Horizontal" onclick="ModelField.setMultiFile()">
                        <asp:ListItem  Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                        <asp:ListItem Value="0" Selected="True" Text='<%$Resources:Common,No%>'></asp:ListItem>
                    </asp:RadioButtonList></li>
                    <li style=" list-style:none; float:left; display:none; padding-left:10px;" id="dlMultiFieldHeigh" >
                      <span>文本框高度：</span>
                      <span><asp:TextBox ID="txtMultiFieldHeight" runat="server"></asp:TextBox></span>
                       
                    </li>
                </ul>
                </dd>
            </dl>
            <dl id="tbb2" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFiledIsUpload%></dt>
                <dd>
                    <asp:RadioButtonList ID="rbtlIsUpload" runat="server" RepeatDirection="Horizontal"
                        onclick="ModelField.IsUploadClick('rbtlIsUpload')">
                        <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                        <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl id="tbb211" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFileSizt%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtMaxSize" Text="4096"></asp:TextBox>
                    KB</dd>
            </dl>
            <dl id="tbb212" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFileType%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtImageType"></asp:TextBox><%=Resources.Model.ModelFileTypeMessage%></dd>
            </dl>
            <dl id="BasicImagesThumb" style="display:none;">
                <dt>缩略图尺寸：</dt>
                <dd>宽 &nbsp;<asp:TextBox ID="txtThumbWidth" Text="125" runat="server"></asp:TextBox>px&nbsp;&nbsp;&nbsp;高 &nbsp;<asp:TextBox ID="txtThumbHeight" Text="125" runat="server"></asp:TextBox>px</dd>
            </dl>
            <dl id="tbb213" style="display: none">
                <dt>
                    <%=Resources.Model.ModelFileSaveSize%></dt>
                <dd>
                    <asp:CheckBox ID="IsSaveFileSize" runat="server" onclick="ModelField.CheckBoxClick('IsSaveFileSizeDiv',this.checked)" />
                    <%=Resources.Common.Save%><br>
                    <div id="IsSaveFileSizeDiv" style="display: none">
                        <asp:TextBox runat="server" ID="txtSaveFileName"></asp:TextBox><%=Resources.Model.ModelFileSaveName%></div>
                </dd>
            </dl>
            <dl id="tcdefault">
                <dt>
                    <%=Resources.Model.ModelFiledDefaultValue%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtDefaultValue"></asp:TextBox></dd>
            </dl>
            <dl id="columnLength">
                <dt>
                    <%=Resources.Model.ModelFiledDataLength%></dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtDataCoulumnLength" Text="100" MaxLength="10" CssClass="validate[required,custom[onlyNumber],length[1,10]]"></asp:TextBox></dd>
            </dl>
        </asp:Panel>
        <dl>
            <dt>
                <%=Resources.Model.ModelFileIsRequired%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlIsRequired" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Selected="True" Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsInputValue%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlIsInput" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFileIsEnable%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlIsEnable" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsListVisible%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlIsListVisible" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFiledIsSearch%></dt>
            <dd>
                <asp:CheckBox ID="IsSearch" runat="server" onclick="ModelField.CheckBoxClick('IsSearchDiv',this.checked)" /><%=Resources.Common.Yes%>
                <ul style="list-style: none; margin: 2px; display: none;" id="IsSearchDiv">
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.UiType%>
                    </li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:DropDownList Style="float: left;" ID="ddlUiType" runat="server">
                            <asp:ListItem Selected="True" Value="0" Text='<%$Resources:Model,Null%>'></asp:ListItem>
                            <asp:ListItem Value="1" Text='<%$Resources:Model,Range%>'></asp:ListItem>
                            <asp:ListItem Value="2" Text='<%$Resources:Model,ListAndText%>'></asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledSearchWidth%></li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:TextBox runat="server" ID="txtSearchWidth" Text="20"></asp:TextBox></li>
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledSearchOrder%></li>
                    <li>
                        <asp:TextBox runat="server" ID="txtSearchOrders" Text="1"></asp:TextBox><%=Resources.Model.ModelFiledRequierdNumber%></li>
                </ul>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFiledCoulumnEnable%></dt>
            <dd>
                <asp:CheckBox ID="IsListEnable" runat="server" onclick="ModelField.CheckBoxClick('IsListEnableDiv',this.checked)" /><%=Resources.Common.Yes%>
                <ul id="IsListEnableDiv" style="display: none; list-style: none; margin: 2px;">
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledCoulumnWidth%></li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:TextBox runat="server" ID="txtListWidth" Text="20"></asp:TextBox></li>
                    <li style="padding-left: 5px; float: left;">
                        <%=Resources.Model.ModelFiledListAlignment%></li>
                    <li style="padding-left: 5px; float: left;">
                        <asp:DropDownList ID="ListAlignment" runat="server">
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
                                <%=Resources.Model.ModelFiledIsLink%><asp:CheckBox ID="ListIsLink" runat="server"
                                    onclick="ModelField.CheckBoxClick('ListIsLinkDiv',this.checked)" /></li>
                            <li style="padding-left: 15px; float: left; display: none" id="ListIsLinkDiv">
                                <%=Resources.Model.ModelFiledLinkUrl%><asp:TextBox runat="server" ID="txtListLinkUrl"></asp:TextBox></li>
                        </ul>
                    </li>
                    <li style="padding: 0; margin: 0; padding-left: 5px; clear: both;">
                        <ul style="list-style: none; margin: 0px; padding: 0;">
                            <li style="padding-left: 5px; float: left;">
                                <%=Resources.Model.ModelFiledIsOrder%><asp:CheckBox ID="ListIsOrder" runat="server"
                                    Checked="true" onclick="ModelField.CheckBoxClick('ListIsOrderDiv',this.checked)" /></li>
                            <li style="padding-left: 5px; float: left; padding-left: 15px;" id="ListIsOrderDiv">
                                <asp:RadioButtonList ID="rbtlListOrderOption" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Text='<%$Resources:Model,ModelFiledOrderAsc%>'></asp:ListItem>
                                    <asp:ListItem Value="2" Text='<%$Resources:Model,ModelFiledOrderDesc%>'></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="3" Text='<%$Resources:Model,ModelFiledOrderAll%>'></asp:ListItem>
                                </asp:RadioButtonList>
                            </li>
                        </ul>
                    </li>
                    <li style="padding: 0; margin: 0; padding-left: 5px; clear: both;">
                        <ul style="list-style: none; margin: 0px; padding: 0;">
                            <li style="margin: 0; padding: 0; float: left;">
                                <%=Resources.Model.ModelFiledDefaultOrder%><asp:CheckBox ID="ListIsDefaultOrder"
                                    runat="server" onclick="ModelField.CheckBoxClick('ListIsDefaultOrderDiv',this.checked)"
                                    Checked="true" /></li>
                            <li style="margin: 0; padding: 0; float: left; padding-left: 15px;" id="ListIsDefaultOrderDiv">
                                <ul style="margin: 0; padding: 0; list-style: none;">
                                    <li style="float: left;">
                                        <%=Resources.Model.ModelFiledOrderOption%></li><li style="float: left;">
                                            <asp:RadioButtonList ID="rbtlListDefaultOrderOption" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1" Selected="True" Text='<%$Resources:Common,Asc%>'></asp:ListItem>
                                                <asp:ListItem Value="2" Text='<%$Resources:Common,Desc%>'></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    
                    <li>列表缩略图显示方式：<asp:RadioButtonList ID="radlThumbDisplayType" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
                    <asp:ListItem Value="1"  Text="当前图的缩略图" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="0"  Text="当前图"></asp:ListItem>
                    </asp:RadioButtonList></li>
                </ul>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFiledIsRss%></dt>
            <dd>
                <asp:RadioButtonList ID="rbtlIsRss" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1" Text='<%$Resources:Common,Yes%>'></asp:ListItem>
                    <asp:ListItem Value="0" Text='<%$Resources:Common,No%>'></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl style="display: none;">
            <dt>
                <%=Resources.Model.ModelFiledUserGourp%></dt>
            <dd>
                <asp:CheckBoxList ID="cblUserGroup" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">注册会员</asp:ListItem>
                    <asp:ListItem Value="2">VIP会员</asp:ListItem>
                </asp:CheckBoxList>
            </dd>
        </dl>
        <dl style="display: none;">
            <dt>
                <%=Resources.Model.ModelFiledUserRole%></dt>
            <dd>
                <asp:CheckBoxList ID="cblRoleGroup" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">录入组</asp:ListItem>
                    <asp:ListItem Value="2">操作组</asp:ListItem>
                </asp:CheckBoxList>
            </dd>
        </dl>
        <div class="Submit">
            <input type="hidden" name="selcomp">
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="<%$Resources:Common,Add%>" />
            <input type="button" name="Submit422" value="<%=Resources.Common.Back%>" onclick="javascript:location.href='ModelFieldList.aspx<%=StrPageParams %>';"></td>
        </div>
    </div>
   <div style=" display:none;"><asp:RadioButtonList ID="rbtlFieldControls" runat="server"><asp:ListItem  Value="" Text=""></asp:ListItem></asp:RadioButtonList></div>
    <script type="text/javascript">  <%=jsMessage %>      </script>

    <asp:HiddenField ID="hdnBasicField" runat="server" />
    <input type="hidden" name="edittype" value="">
    </form>
</body>
</html>
