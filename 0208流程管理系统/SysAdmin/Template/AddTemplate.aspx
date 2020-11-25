<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTemplate.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.AddTemplate"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增模板</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script src="../JS/template.js" type="text/javascript"></script>

    <script src="../JS/lineInTextBox.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="javascript">
        $(document).ready(function() {
         $("#theForm").validationEngine({ promptPosition: "centerRight" });
            var lCount = <%=lableCount %>;
            if (lCount > 16) {
                $("#btnMore").css("display", "block");
            }            
       
            
//           选项卡中
            
             $("#menu1 > div").click(function() {
              
              
                if($(this).attr("title").length>0)
                {
                    insertAtCursor($('#txtLableContent'), $(this).attr("title"));  //插入变量
                    $(this).parent("div").children("div").css({ "background-color": "white", "color": "#0A246A"});   
                    $(this).css({ "background-color": "#0A246A", "color": "white" });
                }           
             
            });  
                      
           
        });
        function lableClick(obj)
        {      
            //$(obj).children("div").css({ "background-color": "white", "color": "#0A246A"});
            $(obj).parent("div").children("div").css({ "background-color": "white", "color": "#0A246A"});            
            $(obj).css({ "background-color": "#0A246A", "color": "white" });
        
        }
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
        function ShowTab(i)
        {
            var obj=$("#menu_tab"+i); //选项卡
            if(i==0)
            {
                $("#menu0").show();
                    $("#menu1").hide();
                    $("#menu_tab0")[0].className ='selected';
                     $("#menu_tab1")[0].className ='';
            }
            else
            {
            $("#menu0").hide();
                    $("#menu1").show();
               $("#menu_tab1")[0].className ='selected';
                     $("#menu_tab0")[0].className ='';
            }
            
        }
 
//        $(document).ready(function(){
//           $("#hidDiv").html($("#menu0").html());
//        });
//        
       function selectLable(name)
        {
            if(name.trim() != "")
            {    
                $("#originalContent").css("display","none");
                $("#hidDiv").html("");
                $("#hidDiv").css("display","block");

                $("#originalContent").find("div").each(function (){
                    if($(this).html().indexOf(name)  > -1)
                    {       
                        $(this).clone().appendTo("#hidDiv");
                    }                    
                });
            }else{
                $("#originalContent").css("display","");
                $("#hidDiv").css("display","none");
            }
        }

    </script>

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
            margin: 1px;
        }
        #row
        {
            background: #ecf0f5;
            height: 462px;
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
            line-height: 20px;
            padding-left: 34px;
        }
        .tag_menu
        {
            width: 100%;
            margin: 0 auto 0; *margin-bottom:-7px;/*border-bottom:3px solid #99D3FB;*/overflow:hidden;}
        .tag_menu ul
        {
            text-align: left;
        }
        .tag_menu li
        {
            float: left;
            height: 23px;
            padding: 0;
            display: inline;
        }
        .tag_menu li a
        {
            background: url(../Images/tag_menu.gif) no-repeat 0 -23px;
            height: 23px;
            line-height: 23px;
            float: left;
            width: 75px;
            display: block;
            white-space: nowrap;
            text-decoration: none;
            color: #1589C8;
            text-align: center;
        }
        .tag_menu li a.selected
        {
            background: url(../Images/tag_menu.gif) no-repeat 0 0;
        }
        .tag_menu li a.selected:link, .tag_menu li a.selected:visited
        {
            font-weight: bold;
            text-decoration: none;
            color: #fff;
        }
        .tag_menu li a.selected:hover, .tag_menu li a.selected:active
        {
            color: #fff;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="theForm" runat="server">
    <div>
        <div class="container">
            <h4>
                位置：模板模型&gt; <a href="TemplateList.aspx?NodeCode=<%=NodeCode %>">模板管理</a> &gt; <font
                    color="blue">添加模板</font></h4>
            <div id="panel">
                <fieldset>
                    <dl>
                        <dt style="width: 120px">模板名称：</dt>
                        <dd>
                            <asp:TextBox ID="txtTemplateName" runat="server" Width="300px" CssClass="validate[required,length[2,20]]"></asp:TextBox><span
                                style="color: Red"><select name="selExt" id="selExt" runat="server">
                                <option value=".html">.html</option>
                                <option value=".htm">.htm</option>
                                <option value=".aspx">.aspx</option>
                                </select></span>
                        </dd>
                    </dl>
                    <dl>
                        <dt style="width: 120px">模板路径：</dt>
                        <dd>
                            <asp:Label ID="lblPath" runat="server" Text=""></asp:Label>
                        </dd>
                    </dl>
                    <dl>
                    </dl>
                    <div style="float: left; padding-left: 120px; width: 65%">
                        <div id="ol">
                            <textarea cols="2" rows="10" id="row" disabled></textarea></div>
                        <asp:TextBox ID="txtLableContent" runat="server" TextMode="MultiLine" Height="460px"
                            CssClass="validate[required]" Width="95%" Wrap="false"></asp:TextBox></div>
                    <div style="width: 20%; float: left; padding-left: 10px">
                        <div class="tag_menu">
                            <ul>
                                <li><a href="#" class="selected" onclick="ShowTab(0)" id="menu_tab0">插入标签</a></li>
                                <li><a href="#" onclick="ShowTab(1)" id="menu_tab1">插入变量</a></li>
                            </ul>
                        </div>
                        <div id="select" style="border: solid 1px #8ECBF9; width: 98%; height: 442px; overflow-y: auto;
                            padding-left: 2px; padding-top: 2px; cursor: hand">
                            <div id="menu0">
                            <div id="search" style="background-color:#ECF0F5; ">
                                搜索：
                                <input id="txtLableName" type="text" onkeyup="selectLable(this.value)" /></div>
                                <div id="originalContent">
                                    <asp:Repeater ID="rptLableList" runat="server">
                                        <ItemTemplate>
                                            <div onclick="lableClick(this);openFrame(<%#Eval("LableID") %>)">
                                                <%#Eval("Title")%></div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div style="display: none" id="hidDiv">
                                </div>
                            </div>
                            <div id="menu1" style="display: none">
                                <div title='{$MetaTitle}')'>
                                    页面标题</div>
                                <div title='{$MetaDescription}'>
                                    页面描述</div>
                                <div title='{$MetaKeyword}'>
                                    页面关键字</div>
                                <div title='{$SiteURL}'>
                                    站点URL</div>
                                <div title='{$UploadImg}'>
                                    上传图片URL</div>
                                <div title='{$MediasURL}'>
                                    上传视频URL</div>
                                <div title='{$FilesURL}'>
                                    上传文件URL</div>
                                <div title='{$MenuName NodeCode=""}'>
                                    栏目名称</div>
                                <div title='{$MenuURL NodeCode=""}'>
                                    栏目路径</div>
                                <div title='{$MenuIntro NodeCode=""}'>
                                    栏目描述</div>
                                <div title='{$MenuBanner NodeCode=""}'>
                                    栏目banner图片（flash）</div>
                                <div title='{$MenuIcon NodeCode=""}'>
                                    栏目图标</div>
                                <div onclick="openframe({ url: 'LableSinglePage.aspx', width: '650', height: '300',title:'编辑单页标签参数' });">
                                    单页标签
                                </div>
                                <div onclick="openframe({ url: 'LableInclude.htm', width: '500', height: '260',title:'编辑包含标签参数' });">
                                    包含标签</div>
                                <div onclick="openframe({ url: 'ParamSpecial.aspx', width: '650', height: '300',title:'编辑专题标签参数' });">
                                    专题栏目标签</div>
                            </div>
                        </div>
                    </div>
                    <div style="clear: left">
                    </div>
                </fieldset>
            </div>
            <div class="Submit">
                <asp:Button ID="btnSave" runat="server" Text="保 存" CssClass="subButton" OnClick="btnSave_Click" />
                <input type="button" name="Submit" value=" 恢 复 " class="subButton" onclick="javascript:UnDo();" />
                <input type="button" name="ReBack" value=" 返 回 " class="subButton" onclick='javascript:history.go(-1);' />
            </div>
        </div>
    </div>
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
