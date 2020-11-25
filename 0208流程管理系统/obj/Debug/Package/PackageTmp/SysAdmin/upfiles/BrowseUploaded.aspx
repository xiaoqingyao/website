<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseUploaded.aspx.cs" Inherits="AllPower.WEB.SysAdmin.upfiles.BrowseUploaded" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
            <script language="javascript" type="text/javascript">
                function selectAll(obj) {
                    var theTable = obj.parentElement.parentElement.parentElement;
                    var i;
                    var j = obj.parentElement.cellIndex;
                    for (i = 0; i < theTable.rows.length; i++) {
                        var objCheckBox = theTable.rows[i].cells[j].firstChild;
                        if (objCheckBox.checked != null) objCheckBox.checked = obj.checked;
                    }
                }   
             </script>
             
  <script language="javascript" > <!--
      function BuildUrlString(key, value) {
          var _key = key.toLowerCase();
          var prms = location.search;
          if (prms.length == 0)
              return location.pathname + "?" + _key + "=" + value;
          var params = prms.substring(1).split("&");
          var newparam = "";
          var found = false;
          for (i = 0; i < params.length; i++) {
              if (params[i].split("=")[0].toLowerCase() == _key) {
                  params[i] = _key + "=" + value;
                  found = true;
                  break;
              }
          }
          if (found)
              return location.pathname + "?" + params.join("&");
          else
              return location + "&" + _key + "=" + value; 
       }
//--> 
</script>


</head>
    <body>    
        <form id="form1" runat="server">   
        <script src="../Editor/CKEditor/Popup.js" language="javascript" type="text/javascript"></script>
 
        <div>    
            <table width="100%" style="font-size:12px">      
                <tr><td align="center"><asp:TextBox ID="txtSearch" runat="server" Width="200px" MaxLength="20"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="搜索" onclick="btnSearch_Click" /></td></tr>
                <tr>        
                    <td>             
                        <asp:GridView Width="100%" runat="server" ID="gridFileList"                  
                        AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333"                  
                        GridLines="None" AllowPaging="True"                  
                        PageSize="6" OnPageIndexChanging="gridFileList_PageIndexChanging"                 
                        AllowSorting="True" onsorting="gridFileList_Sorting" >
                        <Columns>
                        <asp:TemplateField HeaderText="" InsertVisible="False" ShowHeader="false">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                         <a href='javascript:ReturnUrl("<%#Eval("FilePath") %>")'><%#ShowFile(Eval("FilePath").ToString())%></a>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="" InsertVisible="False" ShowHeader="false">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                         <%#Eval("FileLength")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <script language="javascript" type="text/javascript">
            function ReturnUrl(url) {
                window.parent.CKEDITOR.tools.callFunction(<%=Request.QueryString["CKEditorFuncNum"] %>, url, '');
            }
  </script>
        </form>
    </body>
    </html>
