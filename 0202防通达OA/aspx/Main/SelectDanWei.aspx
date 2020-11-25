<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectDanWei.aspx.cs" Inherits="OA.aspx.Main.SelectDanWei" %>
<html>
	<head>
		<title>选择部门单位</title> 
		<link href="../../Style/Style.css" type="text/css" rel="STYLESHEET" />
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<base target=_self />	
<script type="text/javascript">

    function OnTreeNodeChecked() {
        var ele = event.srcElement;
        if (ele.type == 'checkbox') {
            var childrenDivID = ele.id.replace('CheckBox', 'Nodes');
            var div = document.getElementById(childrenDivID);
            if (div == null) return;
            var checkBoxs = div.getElementsByTagName('INPUT');
            for (var i = 0; i < checkBoxs.length; i++) {
                if (checkBoxs[i].type == 'checkbox')
                    checkBoxs[i].checked = ele.checked;
            }
        }
    }

    var getFromParent = window.dialogArguments;
    function CheckSelect() {
        var aaaa = "";
        for (var i = 0; i < window.document.forms['form1'].elements.length; i++) {
            var e = form1.elements[i];
            if (e.checked) {
                var bijiaostr = '|' + e.title + '|';
                var Ccts = " <%=HaveChild %>";
                      //alert(Ccts);
                    if (Ccts.indexOf(bijiaostr) < 0) {
                        if (aaaa == "") {
                            aaaa = e.title;
                        }
                        else {
                            aaaa = aaaa + "," + e.title;
                        }

                    }
                }
            }
            return aaaa;
        }

        function sendFromChild() {
            window.returnValue = CheckSelect();
            window.close();
        }

        function CCC() {
            window.returnValue = "";
            window.close();
        }


        function SubmitValue() {
            var val = "";
            var returnVal = new Array();
            var inputs = document.all.tags("INPUT");
            var n = 0;
            for (var i = 0; i < inputs.length; i++) // 遍历页面上所有的 input
            {
                if (inputs[i].type == "checkbox") {
                    if (inputs[i].checked) {
                        var strValue = inputs[i].value;
                        val += strValue + ',';
                        //returnVal[n] = val;
                        n = n + 1;
                    }
                } //if(inputs[i].type="checkbox")
            } //for
            window.returnValue = val;
            window.close();
        }

　　</script>		
	</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <div>    
     <table style="width: 100%; " border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td align="right" style=" background-image:url(../../images/show_02.gif); text-align: left; height: 27px;">
                    &nbsp; 请选择好您所需要选项后，点击“确定”按钮！</td>
 
                    </tr>
        </table>
        
    </div>
        <input class="BottonCss" onclick="sendFromChild();" style="width: 70px" type="button"
            value="确定" />
        <input class="BottonCss" onclick="CCC();" style="width: 70px" type="button"
            value="取消" />
        
        <hr />
   <table width="100%">
   <tr>
   <td align="left">
   <div style="OVERFLOW:auto; padding-bottom:3px; padding-top:0px; padding-left:10px;padding-right:10px;" >
                        　　<asp:TreeView ID="ListTreeView" runat="server"  ShowCheckBoxes="All"　ShowLines="True" ExpandDepth="2" Font-Bold="False">

　　</asp:TreeView>　
　　
        </div>
        
        </td>
   </tr>
   </table>        
        
    </form>
</body>
</html>