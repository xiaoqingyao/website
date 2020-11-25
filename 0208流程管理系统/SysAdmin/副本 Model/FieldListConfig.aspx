<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldListConfig.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.FieldListConfig" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
     <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="../JS/jquery.dialog.js" type="text/javascript"></script>
    <script src="../JS/win.js" type="text/javascript"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/FieldManage.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(function() {
            if ($("#hdnEnable").val().toLowerCase() == "true") {
                $("#Main").css("display", "block");
                $("#Prompt").css("display", "none");
            } else {
                $("#Main").css("display", "none");
                $("#Prompt").css("display", "block");
            }

            if ($("#hdnBasicField").val() == "11") {
                $("#BascField_Image").css("display", "block");
            }
        });

    function isEnter(isOne) {  // 是否启用
        if (isOne == 1) {
            $("#Main").css("display", "block");
            $("#Prompt").css("display", "none");
        }
        else {
            parent.Closed();
        }
    }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
     <div class="container">
        
<h4>字段 <asp:Label ID="labFieldName" ForeColor="Red" runat="server" Text="Label"></asp:Label>  <%=configTypeName %>参数设置</h4>
    <div id="Prompt" style=" padding-top:80px;display:none;">
         <center>当前字段在<%=configTypeName %>不显示，<a href="javascript:isEnter(1)" style=" color:Red; font-weight:bolder;">是</a> <a href="javascript:isEnter(0)"  style=" color:Red; font-weight:bolder;">否</a> 启用？</center>   
    </div>    <div id="Main" style=" display:none;">
   <dl>
        <dt>
            字段别名：</dt>
        <dd>
            <asp:TextBox runat="server" ID="txtFieldAlias" CssClass="validate[required,length[1,64]]"></asp:TextBox>*</dd>
    </dl>
    <asp:MultiView ID="FieldAttribute" runat="server" ActiveViewIndex="0">
        <asp:View ID="SearchAttribute" runat="server">
           <dl>
                <dt><%=Resources.Model.UiType%>：</dt>
                <dd><asp:DropDownList Style="float: left;" ID="ddlSearchUIType" runat="server">
                        <asp:ListItem Selected="True" Value="0" Text='<%$Resources:Model,Null%>'></asp:ListItem>
                        <asp:ListItem Value="1" Text='<%$Resources:Model,Range%>'></asp:ListItem>
                        <asp:ListItem Value="2" Text='<%$Resources:Model,ListAndText%>'></asp:ListItem>
                    </asp:DropDownList>
                </dd>
           </dl>
           <dl>
               <dt><%=Resources.Model.ModelFiledSearchWidth%>：</dt>
                <dd><asp:TextBox runat="server" ID="txtSearchWidth" Text="100"></asp:TextBox></dd>
           </dl>
           <dl>
                <dt><%=Resources.Model.ModelFiledSearchOrder%>：</dt>
                <dd><asp:TextBox runat="server" ID="txtSearchOrders" Text="1"></asp:TextBox><%=Resources.Model.ModelFiledRequierdNumber%></dd>
           </dl>
         </asp:View>
        <asp:View ID="ListAttribute" runat="server">
            <dl>
                <dt><%=Resources.Model.ModelFiledCoulumnWidth%>：</dt>
                <dd><asp:TextBox runat="server" ID="txtListWidth" Text="20"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt><%=Resources.Model.ModelFiledListAlignment%>：</dt>
                <dd>
                   <asp:DropDownList ID="ddlListAlignment" Width="120" runat="server">
                        <asp:ListItem Text='<%$Resources:Model,ModelFiledLeft%>' Value="1"></asp:ListItem>
                        <asp:ListItem Text='<%$Resources:Model,ModelFiledCenter%>' Value="2"></asp:ListItem>
                        <asp:ListItem Text='<%$Resources:Model,ModelFiledRight%>' Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </dd>
            </dl>
            <dl>
                <dt><%=Resources.Common.Orders%>：</dt>
                <dd><asp:TextBox runat="server" ID="txtListOrders" Text="1"></asp:TextBox><%=Resources.Model.ModelFiledRequierdNumber%></dd>
            </dl>
            <dl>
                <dt><%=Resources.Model.ModelFiledIsLink%>：</dt>
                <dd><asp:CheckBox ID="chkListIsLink" runat="server" onclick="displayContainer('ListIsLinkDisplay',this.checked)" /></dd>
                <dd style="padding-left: 15px; float: left; display: none" id="ListIsLinkDisplay"><%=Resources.Model.ModelFiledLinkUrl%><asp:TextBox runat="server" ID="txtListLinkUrl"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt><%=Resources.Model.ModelFiledIsOrder%>：</dt>
                <dd><asp:CheckBox ID="chkListIsOrder" runat="server" Checked="true" onclick="displayContainer('ListIsOrderDisplay',this.checked)" /></dd>
                <dd style="padding-left: 5px; float: left; padding-left: 15px;" id="ListIsOrderDisplay">
                    <asp:RadioButtonList ID="radlListOrderOption" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Text='<%$Resources:Model,ModelFiledOrderAsc%>'></asp:ListItem>
                    <asp:ListItem Value="2" Text='<%$Resources:Model,ModelFiledOrderDesc%>'></asp:ListItem>
                    <asp:ListItem Selected="True" Value="3" Text='<%$Resources:Model,ModelFiledOrderAll%>'></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl style=" display:none;" id="BascField_Image">
                <dt>列表缩略图显示方式：</dt>
                <dd >
                    <asp:RadioButtonList ID="radlThumbDisplayType" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
                    <asp:ListItem Value="1" Text="当前图的缩略图" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="0" Text="当前图"></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
        </asp:View>
        <asp:View ID="EditAttribute" runat="server">
            <dl>
                <dt>提示信息：</dt>
                <dd><asp:TextBox runat="server" ID="txtMessage" Height="101px" TextMode="MultiLine" Width="313px"></asp:TextBox></dd>
            </dl>
        <dl id="BasicField_TextBoxWidth">
            <dt><%=Resources.Model.txtBoxWidth%></dt>
            <dd><asp:TextBox runat="server" ID="txtTextBoxWidth" Text="100"></asp:TextBox>px</dd>
        </dl>
        <dl id="BasicField_TextBoxHeight"> 
            <dt><%=Resources.Model.txtBoxHeight%></dt>
            <dd><asp:TextBox runat="server" ID="txtTextBoxHieght" Text="30"></asp:TextBox>px</dd>
        </dl>
        <dl id="BasicField_DefaultValue">
            <dt>
                <%=Resources.Model.ModelFiledDefaultValue%></dt>
            <dd>
                <asp:TextBox runat="server" ID="txtDefaultValue"></asp:TextBox> 日期类型可直接输入函数或日期</dd>
        </dl>
        <dl id="BasicField_ColumnLength">
            <dt>
                <%=Resources.Model.ModelFiledDataLength%></dt>
            <dd>
                <asp:TextBox runat="server" ID="txtDataColumnLength" Text="100" MaxLength="10" CssClass="validate[required,custom[onlyNumber],length[1,10]]"></asp:TextBox></dd>
        </dl>
        </asp:View>
    </asp:MultiView>
  
            <div class="Submit">
            <asp:Button ID="btnModelField" runat="server" OnClick="btnFieldAttribute_Click" Text="确定" />
            <input type="button" name="Submit422" value="关闭" onclick="javascript:parent.Closed();">
       </div>  
     </div>
</div>
    <asp:HiddenField ID="hdnBasicField" runat="server" /><asp:HiddenField ID="hdnEnable" runat="server" /><asp:HiddenField ID="hdnUrlParam" runat="server" />
    
    </form>
    <script type="text/javascript"> <%=jsMessage %></script>
</body>
</html>
