<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrojanScan.aspx.cs" Inherits="AllPower.Web.Admin.TrojanScan" ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>木马扫描</title>
  <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    
       <script src="../JS/Common.js" type="text/javascript"></script>
    
    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>    
    
     <script type="text/javascript" src="../js/public.js"></script> 

    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(
                         function() {
                                  $("#theForm").validationEngine({ promptPosition: "centerRight" });
                                  
                                  $("#checkBoxAll").click(function() {
                                  $("input[name='chkId']").attr("checked", $(this).attr("checked"));
                              });
                         });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a><a> &gt;</a>  <span class="breadcrumb_current">木马扫描</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt><%=Resources.Trojan.ScanRange%></dt>
                    <dd>
                    <div style="overflow:auto; height:250px; width:200px;">
                    <table>
                        <asp:Repeater ID="rptFolderList" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <input id="chkId"  name="chkId"  type="checkbox" value='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <img src="../Images/folder.gif" />
                                    </td>
                                    <td>
                                        <%# Eval("Name") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        </table>
                         
                    </div>
                    <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />全选/清空
                    </dd>
                </dl>
                <dl>
                    <dt><%=Resources.Trojan.FileType%></dt>
                    <dd> <asp:TextBox ID="txtFileType" runat="server"  Width="250px"
                            CssClass="validate[required,length[2,200]]"></asp:TextBox>* 多个请用 | 进行分隔</dd>
                </dl>        
                <dl>
                    <dt><%=Resources.Trojan.FeatureCode%></dt>
                    <dd> <asp:TextBox ID="txtCode" runat="server"  Rows="10" Columns="35" TextMode="MultiLine" ></asp:TextBox>多个请换行</dd>
                </dl>
              <dl>
                    <dt>
                        <%=Resources.Trojan.TimeRange%></dt>
                    <dd>
                        <asp:TextBox ID="txtStart" runat="server" Width="100px" CssClass="Wdate"
                            onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                     
                        <asp:TextBox ID="txtEnd" runat="server" Width="100px" CssClass="Wdate"
                            onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                    </dd>
                </dl>
                
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnStart" runat="server" Text="<%$Resources:Trojan,StartScan %>" OnClick="btnStart_Click"
                CssClass="subButton" />
            
        </div>
    </div>
    </form>
</body>
</html> 