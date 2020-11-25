<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LableSystemEdit.aspx.cs" validateRequest="false"
    EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Template.LableSystemEdit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加标签</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="../JS/lineInTextBox.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">     
        #ol
        {
            position: absolute;
            z-index: 1;
            padding: 0px;
            margin: 0px;
            border: 0px;
            background: #ecf0f5;
            width: 23px;
            text-align: left;
            margin:1px;
        }
        #row
        {
            background: #ecf0f5;
            height: 252px;
            overflow: hidden;
            width: 32px;
            border-right: 0;
            line-height: 20px;
            margin: 0px;
            padding: 0px;
            text-align: center;
        }
        #txtLableContent
        {
            line-height:20px;
            padding-left:34px;
         }
    </style>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        function check(val) {
            if (val == 0) {
                
            }
            document.getElementById('webProject').style.display = (val == 1) ? "none" : "block";
            document.getElementById("public" + val).checked = true;
        }
        function changeSelect(val) {

            $.ajax({
                type: "GET",
                url: "LableSystemEdit.aspx",
                dataType: '"text"',
                data: { op: 'getproject', webSite: val },
                beforeSend: function(XMLHttpRequest) {
                    //Pause(this,100000);
                },
                success: function(result) {
                    
                    $("#ddlProject").html(result);
                },
                complete: function(XMLHttpRequest, textStatus) {

                },
                error: function() {
                    //错误处理
                    alert({ msg: msg, title: '提示消息' });
                }
            });
        }
        var id = '<%=Request.QueryString["id"] %>';
        window.onload = function() {
            if (type > -1) {
                var name = "系统标签";
                var listUrl = "LableList.aspx?NodeCode=<%=NodeCode%>";
                var addUrl = "LableSystemEdit.aspx?action=NEW&NodeCode=<%=NodeCode%>&IsSystem=1";
                var updateUrl = "?Action=EDIT&NodeCode=<%=NodeCode%>&IsSystem=1&id=" + id;
                showEditMessage(name, listUrl, addUrl, updateUrl);
            }
        }

        function formartContent() {
            var str = $.trim($("#txtLableContent").val());
            var title = str.substr(1, str.indexOf(" ") - 1);
       
            str = str.replace("{" + title, "{HQB_L" + $("#hidIdentification").val() + "_" + $("#txtTitle").val());
            $("#txtLableContent").val(str);
        }
        function openFrame(url, w, h, title) {
            if ($.trim($("#txtTitle").val()) != "") {
                openframe({ url: "" + url + "?lableName=" + $("#txtTitle").val() + "&identification=" + $("#hidIdentification").val(), width: w, height: h, title: title });
            }
            else {
                alert({ msg: '请先填写标签名', title: '提示消息' });
            }
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server"> 
    <asp:HiddenField ID="hidIdentification" runat="server" /> 
    <div class="container">        
        
         <h4>位置：<a href="TemplateList.aspx">模板管理</a> > <a href="LableList.aspx">标签管理</a> >> <span style="color: Blue">添加/修改系统标签</span></h4>
        <br />
     <div id="panel">
            <dl>
                <dt>标签名称：</dt>
                <dd>
                   <asp:TextBox runat="server" ID="txtTitle" Width="200" MaxLength="180" CssClass="validate[required,length[2,50]]" />                  
                    <asp:DropDownList runat="server" ID="ddlLableClass" CssClass="validate[required]">
                    </asp:DropDownList>
                </dd>
            </dl>
            <dl>
                <dt>是否通用：</dt>
                <dd>
                    <input type="radio" id="public1" name="public" value="1" onclick="check(1)" />是&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="public0" name="public" value="0" onclick="check(0)" checked="checked" />否
                </dd>
            </dl>
            <dl id="webProject">
                <dt>所属站点：</dt>
                <dd>
                    <asp:DropDownList ID="ddlWeb" runat="server">
                    </asp:DropDownList>
                  <%--  暂时隐藏--%>
                 <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所属方案：--%>
                    <asp:DropDownList ID="ddlProject" runat="server" Visible="false">
                    </asp:DropDownList>
                </dd>
            </dl>
            <dl>
                <dt>标签类型：</dt>
                <dd>
                    <input type="button" class="abtn" value="栏目类型" onclick="openFrame('ColumnType.aspx',740, 330,'编辑栏目类型');" />
                    <input type="button" class="abtn" value="通用列表类型" onclick="openFrame('PublicListType.aspx',740, 480,'编辑通用列表类型');" />
                    <input type="button" class="abtn" value="详细页面类型" onclick="openFrame('DetailPageType.aspx',660, 300,'编辑详细页面类型');"/>  
                    <input type="button" class="abtn" value="幻灯片类型" onclick="openFrame('SlideType.aspx',580, 260,'编辑幻灯片类型');"/>  
                    <input type="button" class="abtn" value="专题列表类型" onclick="openFrame('SpecialType.aspx',580, 330,'编辑专题列表类型');"/>  
                    <input type="button" class="abtn" value="期刊列表类型" onclick="openFrame('PeriodicalType.aspx',600, 320,'编辑期刊列表类型');" />  
                     <input type="button" class="abtn" value="类型导航" onclick="openFrame('CategoryType.aspx',580, 420,'编辑类型导航');" />  
                </dd>
            </dl>
            <dl>
                <dt>标签内容：</dt> 
                <dd>
                   <div id="ol"><textarea cols="2" rows="10" id="row"  disabled></textarea></div>
        
                   <asp:TextBox runat="server" ID="txtLableContent" TextMode="MultiLine" Width="560" Wrap="false" 
                        CssClass="validate[required]" Height="250px"></asp:TextBox>   
                         </dd>
            </dl>
            <dl>
                <dt>说明：</dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine"  Width="550"
                        Height="50" MaxLength="200"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>排序号：</dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtSequence" Width="55"></asp:TextBox></dd>
            </dl>
        </div>
        <div class="Submit" id="HQB_Operation_Button">
            <asp:Button runat="server" ID="btnSubmit" CssClass="subButton" Text="添加" OnClick="btnSubmit_Click" />
            <input type="button" value="返回" class="subButton" onclick="javascript:history.back();" />
        </div>
    </div>
    <asp:Literal ID="ltlJS" runat="server"></asp:Literal>
    </form>
</body>
</html>
