<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" ValidateRequest="false" Inherits="news_Add" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script src="../kindeditor/kindeditor.js" type="text/javascript"  charset="utf-8"></script>
<script type="text/javascript">
    KE.show({
        id: 'ctl00_ContentPlaceHolder1_Textarea1',
        imageUploadJson: '../../asp.net/upload_json.ashx',
        fileManagerJson: '../../asp.net/file_manager_json.ashx',
        allowFileManager: true,
        afterCreate: function(id) {
            KE.event.ctrl(document, 13, function() {
                KE.util.setData(id);
                document.forms['form1'].submit();
            });
            KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
                KE.util.setData(id);
                document.forms['form1'].submit();
            });
        }
    });      
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
    <table style="width: 100%;line-height:25px;" cellpadding="2" cellspacing="1" class="border">
        <tr>
            <td class="tdbg">
                
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
<tr>
<td  style=" text-align:right; width:20%;">资讯主题:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_title" runat="server" width="200"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">资讯内容:</td>
<td class="tbright"><div style="display:inline;float:left;">
<textarea id="Textarea1" runat="server" cols="100" rows="8" style="width:700px;height:300px;visibility:hidden;"></textarea>
 </td></tr>


</table>

            </td>
        </tr>
        <tr>
            <td class="tdbg" align="center" valign="bottom">
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" class="inputbutton" ></asp:Button>
                <input id="btnCancle" type="button"  onclick="location.href='Manage.aspx';"  class="inputbutton" value="取消" />
            </td>
        </tr>
    </table>
    <br />
    </td>
    
</asp:Content>

