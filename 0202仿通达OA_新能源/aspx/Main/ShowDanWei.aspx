<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowDanWei.aspx.cs" Inherits="FTD.Web.UI.aspx.Main.ShowDanWei" %>

<html>
<head>
    <title>选择部门单位</title>
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self" />
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
      
        <table width="100%">
            <tr>
                <td align="left">
                    <div style="overflow: auto; padding-bottom: 3px; padding-top: 0px; padding-left: 10px; padding-right: 10px;">
                        <asp:TreeView ID="ListTreeView" runat="server"  ShowLines="True" ExpandDepth="2" Font-Bold="False">
                        </asp:TreeView>

                    </div>

                </td>
            </tr>
        </table>

    </form>
</body>
</html>
