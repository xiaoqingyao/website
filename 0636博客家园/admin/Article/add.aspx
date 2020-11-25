<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="admin_Article_add" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发布文章</title>
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
                //出错时添加的标签
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
            <span class="back"><a href="List.aspx">返回列表</a></span><b>您当前的位置：首页 &gt; 文章管理 &gt; 发布文章</b>
        </div>
        <div style="padding-bottom: 10px;">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
            <tr>
                <th colspan="2" align="left">
                    发布文章
                </th>
            </tr>
            <tr>
                <td width="15%" align="right">
                    文章标题：
                </td>
                <td width="85%">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="input w380 required" MaxLength="250"
                        minlength="3" HintTitle="发布的文章标题" HintInfo="控制在100个字数内，标题文本尽量不要太长。"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    文章作者：
                </td>
                <td>
                    <asp:TextBox ID="txtAuthor" runat="server" CssClass="input w250 required" MaxLength="50"
                        HintTitle="文章作者" HintInfo="控制在50个字数内，如“管理员”。">管理员</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    所属栏目：
                </td>
                <td>
                    <asp:DropDownList ID="ddlClassId" CssClass=" required" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    文章内容：
                </td>
                <td>
                    <FCKeditorV2:FCKeditor ID="FCKeditor" runat="server" BasePath="~/fckeditor/" Height="400px"
                        Width="100%">
                    </FCKeditorV2:FCKeditor>
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
