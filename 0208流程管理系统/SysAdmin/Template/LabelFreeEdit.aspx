<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelFreeEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.LabelFreeEdit"   EnableEventValidation="false"  EnableViewStateMac="false" ValidateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>添加/修改标签分类</title>

  <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script src="../JS/lineInTextBox.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script src="../JS/template.js" type="text/javascript"></script>
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
            height: 202px;
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
    
    <script language="javascript" type="text/javascript">
    <!--
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        function AddDate(val) {
            if (val != '') {
                val = '[$' + val + '$]'
                setContent(val);
            }
        }
        function showDailog(name) {

            openframe({ url: 'LableContent.aspx?name=' + name, width: '340', height: '170' });
        }      
        function check(val) {
           
            document.getElementById('webProject').style.display = (val == 1) ? "none" : "";
            document.getElementById("public" + val).checked = true;
        }
        function changeSelect(val) {
            $.ajax({
                type: "GET",
                url: "LableSystemEdit.aspx",
                dataType: '"text"',
                data: { op: 'getProject', webSite: val },
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
                var name = "自由标签";
                var listUrl = "LableList.aspx?NodeCode=<%=NodeCode%>";
                var addUrl = "LableFreeFirstEdit.aspx?action=NEW&NodeCode=<%=NodeCode%>";
                var updateUrl = "?Action=EDIT&NodeCode=<%=NodeCode%>&id=" + id;
                showEditMessage(name, listUrl, addUrl, updateUrl);
            }
                
        }
        
       
    //-->
    </script>
</head>
 <body>
<form id="theForm" runat="server">
<div class="container">
 <asp:HiddenField ID="hidIdentification" runat="server" />
    <asp:HiddenField ID="hidPageSize" runat="server" />
    <h4>位置：<a href="TemplateList.aspx">模板管理</a> > <a href="LableList.aspx">标签管理</a> ><a href="LableFree.aspx">自由标签</a> > <span class="breadcrumb_current" >添加/修改自由标签</span></h4>
   
    <br />
    <div style="width:98%; margin:0 auto;">
    <table cellpadding="0" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; border-color:#CCCCCC; border-bottom-width:1px; background-color:#F5F5F5;">
        <tr>
            <td style="width:120px; height:25px; text-align:center">　标签名称：</td><td>
            <asp:TextBox runat="server" ID="txtTitle" ReadOnly="True" Width="190px" CssClass="validate[required,length[2,50]]" ></asp:TextBox>&nbsp;&nbsp;<asp:DropDownList
                            ID="ddlLableClass" runat="server">
                        </asp:DropDownList><asp:HiddenField runat="server" ID="hidSQL" /><asp:HiddenField runat="server" ID="hidId" /></td>
        </tr>
        <tr>
            <td style="text-align:center; height: 25px;">
                &nbsp;是否通用：
            </td>
            <td>
                <input type="radio" id="public1" name="public" value="1" onclick="check(1)" />是&nbsp;&nbsp;&nbsp;
                <input type="radio" id="public0" name="public" value="0" onclick="check(0)" checked="checked" />否
            </td>
        </tr>
        <tbody id="webProject">
        <tr>
            <td style="text-align: center; height: 25px;">
                所属站点：
            </td>
            <td>
                <asp:DropDownList ID="ddlWeb" runat="server">
                </asp:DropDownList>
                   <%--  暂时隐藏--%>
                 <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所属方案：--%>
                    <asp:DropDownList ID="ddlProject" runat="server" Visible="false">
                    </asp:DropDownList>
            </td>
        </tr>
        </tbody>
        <tr>
            <td style="height:25px;text-align:center">　标签说明：</td><td><asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Width="300" Height="50"></asp:TextBox></td>
        </tr>
       
        <tr style="height:30px; ">
             <td style="text-align:center">　可用字段：</td>
            <td style="cursor:pointer">   
                 <asp:Literal ID="ltlField1" runat="server"></asp:Literal>
             
            </td>
        </tr>     
         <tr style="height:25px">
            <td style="text-align:center">　</td>
            <td><input type="button" onclick="insertAtCursor($('#txtLableContent'),'[HQB.Loop]您要加的内容[/HQB.Loop]')" class="abtn" value="循环内容"/>    
                     <input type="button" onclick="insertAtCursor($('#txtLableContent'),'{$AbsoulteMenuUrl}')" class="abtn" value="栏目绝对URL"/> 
                     <input type="button" onclick="insertAtCursor($('#txtLableContent'),'{$RelativeMenuUrl}')" class="abtn" value="栏目相对URL"/> 
                     <input type="button" onclick="insertAtCursor($('#txtLableContent'),'{$LoopPageName}')" class="abtn" value="内容链接地址"/> 
                     <input type="button" onclick="insertAtCursor($('#txtLableContent'),'{$Target}')" class="abtn" value="链接打开方式"/> 
            </td>
        </tr>        
        <tr>
            <td style="text-align:center">　标签内容：</td>
            <td>
           <div id="ol"><textarea cols="2" rows="10" id="row"  disabled></textarea></div>
        
                   <asp:TextBox runat="server" ID="txtLableContent" TextMode="MultiLine" Width="700"  Wrap="false"
                        CssClass="validate[required]" Height="200px"></asp:TextBox>
            </td>
        </tr>
          <tr style="height:25px">
            <td style="text-align:center">排序号：　</td>
            <td> <asp:TextBox runat="server" ID="txtSequence" Width="55"></asp:TextBox>
            </td>
        </tr>      
        <tr>
            <td colspan="2" style="height:35px;"><input type="button" id="Button1" value="返回" onclick="history.back()" class="subButton"/>　<asp:Button runat="server" ID="btnSubmit" 
                    Text="确认" CssClass="subButton" onclick="btnSubmit_Click" />　</td>
        </tr>
    </table>
    </div>
    <div style="color:Red; margin-top:20px; width:98%;">
        <p>说明：</p>
        <p>1.此功能建议具有一定sql基础的人使用。如果不熟悉sql，请谨慎使用，以防误操作引起的数据损坏。</p>
        <p>2.判断型数字赋值：0为否，1为是。</p>
        <p>3.如果设置条件的字段为文本、文本型ID、时间日期等类型，赋值时请前后加 ' ，如：= '内容' 、In('内容1'，'内容2'),否则会出错；Like关系除外。</p>
        <p>4.在下一步设置之前，建议先点击测试按钮确认sql语句没有问题再继续。</p>
    </div>
</div>
 <asp:Literal ID="ltlJS" runat="server"></asp:Literal>
</form>
</body>
</html>