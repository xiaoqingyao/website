<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditTemplate.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.EditTemplate"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑模板</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

 <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/template.js"></script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function() {
            var lCount = <%=lableCount %>;
            if (lCount > 16) {
                $("#btnMore").css("display", "block");
            }
        });
       function showMore()
        {
            if( $("#moreDiv").is(':visible'))
            {   $("#imgShowHide").attr("src","../img/max.png");
                $("#spanMore").html("更多..");
                $("#hidIsopen").val('false');
            }
            else
            {
                $("#imgShowHide").attr("src","../img/min.png");
                $("#spanMore").html("收起");
                  $("#hidIsopen").val('true');
            }
            $("#moreDiv").toggle();
            
        }
    </script>

    <style type="text/css">
        .buluBtn
        {
            float: left;
            width: 100px;
            cursor: pointer;
            color: #F2CD38;
            background-color: #25BAD9;
            margin: 3px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="fromeditor" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div>
        <div class="container">
            <h4>
                位置：模板模型&gt;<a href="TemplateList.aspx?Path=<%=tPath%>&Action=ALL&NodeCode=<%=NodeCode %>">模板管理</a>
                &gt;<span style="color: Blue">模板编辑</span></h4>
            <div id="panel">
                <fieldset>
                    <dl>
                        <dt>模板名称</dt>
                        <dd>
                            <asp:Label ID="txtTemplateName" runat="server" Text="Label"></asp:Label><asp:Label
                                runat="server" ID="lblPath"></asp:Label>
                        </dd>
                    </dl>
                    <dl>
                        <dt>常用标签</dt>
                        <dd>
                            <div style="word-break: break-all; word-wrap: break-word; width: 920px">
                                <asp:Repeater ID="rptLableList" runat="server">
                                    <ItemTemplate>
                                    <span class="buluBtn" style="color:White" onclick="openFrame(<%#Eval("LableID") %>)" ><%#Eval("Title")%></span>                                     
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="buluBtn" onclick="openframe({ url: 'LableSinglePage.aspx', width: '650', height: '300',title:'编辑单页标签参数' });">
                                    单页标签
                                </div>
                                <div class="buluBtn" onclick="openframe({ url: 'LableInclude.htm', width: '500', height: '260',title:'编辑包含标签参数' });">
                                    包含标签</div>
                                <div class="buluBtn" onclick="openframe({ url: 'ParamSpecial.aspx', width: '650', height: '300',title:'编辑专题标签参数' });">
                                    专题栏目标签</div>
                                <%--   <div class="buluBtn" onclick="openframe({ url: 'AllLable.aspx', width: '850', height: '512',title:'可用标签列表' });">
                                    更多标签</div>--%>
                            </div>
                            <div style="padding-top: 38px;">
                                &nbsp; &nbsp; &nbsp;<a onclick="showMore()" style="cursor:pointer; text-decoration:none"><img src="../img/max.png" id="imgShowHide" />
                                    <span id="spanMore">更多..</span></a></div>
                            <div style="display: none; word-break: break-all; word-wrap: break-word; width: 920px" 
                                id="moreDiv">
                                 <asp:Repeater ID="rptLableList2" runat="server">
                                    <ItemTemplate>
                                    <span class="buluBtn" style="color:White" onclick="openFrame(<%#Eval("LableID") %>)" ><%#Eval("Title")%></span>                                     
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>模板内容</dt>
                        <dd>
                            <asp:TextBox ID="txtLableContent" runat="server" TextMode="MultiLine" Height="360px"
                                Width="880px"></asp:TextBox>
                        </dd>
                    </dl>
                    <div style="clear: left">
                    </div>
                </fieldset>
            </div>
            <div class="Submit">
                <asp:Button ID="Button_Save" runat="server" Text="修 改" CssClass="subButton" OnClick="Button_Save_Click1" />
                <input type="button" name="Submit" value=" 恢 复 " class="subButton" onclick="javascript:UnDo();" />
                <input type="button" name="ReBack" value=" 返 回 " class="subButton" onclick="javascript:history.go(-1);" />
                <a href="editor.aspx?path=<%=Path%>" onclick="if(!confirm('确定要切换到可视化编辑吗?请在切换前先保存您的数据，否则会丢失!\n确定切换吗？')){return false;}"
                    style="display: none">切换到可视化编辑</a>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenField_Path" runat="server" />
    <input type="hidden" id="hidStart" value="0" />
    </form>
</body>

<script language="javascript" type="text/javascript">
    function UnDo() {
        if (confirm('你确定要取消所做的更改吗?')) {
            document.fromeditor.reset();
        }
    }

</script>

</html>
