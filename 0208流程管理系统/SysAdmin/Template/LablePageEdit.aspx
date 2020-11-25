<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LableSystemEdit.aspx.cs"
    EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Template.LableSystemEdit"
    ValidateRequest="false" %>

<%--================================================================
Copyright (C) 2010 华强北在线    作者:      胡志瑶    创建时间： 2010-09-10  
    功能描述： 分页标签
===============================================================--%>
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

    <script src="../JS/lineInTextBox.js" type="text/javascript"></script>

    <script src="../JS/template.js" type="text/javascript"></script>
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
                changeSelect(0);
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
                var name = "分页标签";
                var listUrl = "LableList.aspx?NodeCode=<%=NodeCode%>";
                var addUrl = "LablePageEdit.aspx?action=NEW&NodeCode=<%=NodeCode%>&IsSystem=2";
                var updateUrl = "?Action=EDIT&NodeCode=<%=NodeCode%>&IsSystem=2&id=" + id;
                showEditMessage(name, listUrl, addUrl, updateUrl);
            }
        }
        function setContent(val) {
            insertAtCursor($('#txtLableContent'), '' + val + '');
        }    
    </script>

</head>
<body>
    <form id="theForm" runat="server"><asp:HiddenField ID="hidIdentification" runat="server" />
    <div class="container">
        <h4>
            位置：<a href="TemplateList.aspx">模板管理</a> > <a href="LableList.aspx?NodeCode=<%=NodeCode %>">
                标签管理</a> > <span style="color: Blue">添加/修改分页标签</span></h4>
        <br />
        <div id="panel">
            <dl>
                <dt>标签名称：</dt>
                <dd>
                  <asp:TextBox runat="server" ID="txtTitle" Width="200" MaxLength="180"
                        CssClass="validate[required,length[2,50]]" />
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
                <dt></dt>
                <dd>
                    <input type="button" class="abtn" value="首页地址" onclick="setContent('{$FirstPageUrl}')" />
                    <input type="button" class="abtn" value="上一页地址" onclick="setContent('{$PrevPageUrl}')" />
                    <input type="button" class="abtn" value="下一页地址" onclick="setContent('{$NextPageUrl}')" />
                    <input type="button" class="abtn" value="尾页地址" onclick="setContent('{$LastPageUrl}')" />
                    <input type="button" class="abtn" value="当前页页码" onclick="setContent('{$CurrentPageIndex}')" />
                    <input type="button" class="abtn" value="当前页地址" onclick="setContent('{$CurrentPageUrl}')" />
                    <input type="button" class="abtn" value="循环的当前变量值" onclick="setContent('{$PageIndex}')" />
                    <input type="button" class="abtn" value="循环的当前地址" onclick="setContent('{$PageUrl}')" />
                    <input type="button" class="abtn" value="分页大小" onclick="setContent('{$PageSize}')" />
                    <input type="button" class="abtn" value="总页数" onclick="setContent('{$TotalPage}')" />
                    <input type="button" class="abtn" value="记录总数" onclick="setContent('{$RSTotal}')" />
                    <input type="button" class="abtn" value="循环标签" onclick='setContent("[HQB.Loop]其他页链接内容[$$$$]当前页链接内容[/HQB.Loop]")' />
                </dd>
            </dl>
            <dl>
                <dt>标签内容：</dt>
                <dd >
                    <div id="ol">
                        <textarea cols="2" rows="10" id="row" disabled></textarea></div>
                    <asp:TextBox runat="server" ID="txtLableContent" TextMode="MultiLine" Width="560"
                        Wrap="false" CssClass="validate[required]" Height="250px"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>说明：</dt>
                <dd >
                    <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Width="550"
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
