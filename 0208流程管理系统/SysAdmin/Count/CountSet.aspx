<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountSet.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.CountSet" validateRequest="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
 <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">

        function changeCount(id, ogStar,total) {
          
            var value = convertToint($("#txtStart" + id).val());


            var count = value - ogStar + total;
            $("#lbl" + id).html(count);
        }
        function convertToint(value) {
            if ($.trim(value) == "") {
                return 0;
            }
            else {
                return parseInt(value);
            }
        }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <asp:HiddenField ID="hidDate" runat="server" />
    <div class="container">
          <h4>
            位置： <a href="TemplateList.aspx">扩展应用</a> > <span style="color: Blue">统计设置</span>
        </h4>
        <div id="panel">
                <dl>
                    <dt width="30%"><b>总访问量:</b></dt>
                    <dd width="30%">
                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> 今日访问量:</b> <asp:Label ID="lblToday" runat="server" Text=""></asp:Label></dd>
                  
                </dl>
                <dl>
                    <dt width="30%"><b>流量统计API:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtCountUrl" TextMode="MultiLine" runat="server" 
                            width="300px" Height="40px"></asp:TextBox></dd>
                </dl>
        <dl>
                    <dt width="30%"><b>流量显示API:</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtShowUrl" Height="40px" runat="server" TextMode="MultiLine" width="300px"></asp:TextBox></dd>
                </dl>
                 <dl>
                    <dt width="30%">前台显示:</dt>
                    <dd width="70%">
                        <asp:CheckBox ID="checkTotal" runat="server" /> 总访问量 &nbsp;&nbsp;<asp:CheckBox ID="checkToday" runat="server" />今日访问量</dd>
                </dl>
                <dl>
                    <dt width="30%"> 显示类型</dt>
                    <dd width="70%">
                        <asp:RadioButtonList ID="radioShowType" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem Text="数字&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="图片" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                    </dd>
                </dl>
                <dl>
                    <dt width="30%">总访问量起始数据:</dt>
                    <dd width="70%"><asp:TextBox ID="txtStartTotal" runat="server" width="80px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%">今日访问量起始数据:</dt>
                    <dd width="70%"><asp:TextBox ID="txtStartToday" runat="server" width="80px"></asp:TextBox></dd>
                </dl>
        </div>     
        <div class="Submit" style="padding-left:300px;">
        <asp:Button Text="保存设置" CssClass="subButton" ID="btnSave" runat="server" onclick="btnSave_Click" />
        </div>
    </div>
    </form>
</body>
</html>
