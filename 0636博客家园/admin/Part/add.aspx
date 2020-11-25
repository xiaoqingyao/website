<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="admin_Part_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新增栏目</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />

    <script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../../js/jquery.validate.min.js"></script>

    <script type="text/javascript" src="../../js/messages_cn.js"></script>

    <script type="text/javascript" src="../../js/jquery.form.js"></script>

    <script type="text/javascript" src="../js/cursorfocus.js"></script>

    <script type="text/javascript" src="../js/singleupload.js"></script>

    <script type="text/javascript">
        $(function() {
            //表单验证JS
            $("#form1").validate({
                //出错时增加的标签
                errorElement: "span",
                success: function(label) {
                    //正确时的样式
                    label.text(" ").addClass("success");
                }
            });
        });
    </script>

</head>
<body style="padding: 10px;">
    <form id="form1" runat="server">
        <div class="navigation">
            <span class="back"><a href="part.aspx">返回列表</a></span><b>您当前的位置：首页 &gt; 栏目管理 &gt; 发布栏目</b>
        </div>
        <div style="padding-bottom: 10px;">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
            <tr>
                <th colspan="2" align="left">
                    增加栏目
                </th>
            </tr>
            <tr>
                <td width="25%" align="right">
                    所属类型：
                </td>
                <td width="75%">
                    <asp:DropDownList ID="ddlClassId" runat="server" CssClass="select" AutoPostBack="True"
                        Width="112px">
                        <asp:ListItem Value="-1">请选择类型...</asp:ListItem>
                        <asp:ListItem Value="1">文章类</asp:ListItem>
                        <asp:ListItem Value="2">相册类</asp:ListItem>
                        <asp:ListItem Value="3">新闻类</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="25%" align="right">
                    栏目名称：
                </td>
                <td width="75%">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="input required" size="30" MaxLength="50"
                        HintTitle="栏目名称" HintInfo="请填写该栏目的名称，至少1个字符，小于50个字符。"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div style="margin-top: 10px; text-align: center;">
            <asp:Button ID="btnSave" runat="server" Text="确认保存" CssClass="submit" OnClick="btnSave_Click" />
            &nbsp;
            <input name="重置" type="reset" class="submit" value="重置" />
        </div>
    </form>
</body>
</html>
