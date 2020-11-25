<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScanResult.aspx.cs" Inherits="AllPower.Web.Admin.ScanResult"  ValidateRequest="false"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> 扫描结果</title>
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
 <form id="theForm" name="theForm" method="post" runat="server">
<input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
<div class="container">
     <h4>位置： <a href="#">扩展应用</a><a> &gt;</a> <a href="TrojanScan.aspx">木马扫描</a><a> &gt;</a><a href="#">扫描结果</a></h4>
    <div id="searchContainer" style="display:none;">
        <asp:Button ID="btnMutiReplace" runat="server" Text="批量替换" CssClass="subButton"   OnClick="btnMutiReplace_Click" />
        <asp:Button ID="btnAllReplace" runat="server" Text="全部替换" CssClass="subButton" OnClick="btnAllReplace_Click"  />
    </div>
          <asp:HiddenField ID="hiOld" runat="server" />
        <asp:HiddenField ID="hiReplace" runat="server" />
      <div class="function">  
               <input type="button"   value="<%=Resources.Trojan.Replace %>"  class="subButton"  title="替换将不能恢复，请谨慎操作！"
               onclick="openframe({ title: '替换选项', url: 'ShowReplace.htm', width: '600', height: '350' })"/>
                <input type="button" name="Submit422" value="<%=Resources.Common.Back %>" onclick='location.href="TrojanScan.aspx";'
            class="subButton" />
      </div>
    <ul class="ulheader" >
        <li style="width: 5%">
            <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
        </li>
        <li style="width: 25%">
           文件名
        </li>
        <li style="width: 15%">
            修改时间
        </li>
        <li style="width: 25%">
            特征代码
        </li>
        <li style="width: 10%">
        <%= Resources.Common.Operation%></li>
    </ul>
         <asp:Repeater ID="rptScan" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 5%">
                        <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' />
                    </li>
                    <li style="width:25%" title='<%#Eval("fullName")%>'>
                        <%#Eval("fileName")%>
                    </li>
                    <li style="width: 15%">
                        <%#Eval("date","{0:yyyy-MM-dd HH:mm:ss}")%>
                    </li>
                    <li style="width: 25%">
                      <asp:TextBox Text='<%#Eval("Code")%>' runat="server" ID="liter" Width="250px" />
                    </li>
                    <li style="width: 10%">
                    <asp:LinkButton ID="lbtnDel" OnCommand="lbtnDel_Click" CommandArgument='<%#Eval("fullName") %>'
                            Text="<%$ Resources:Common,Del%> " 
                            OnClientClick='<%# ("return confirm(\""+Resources.Common.DelConfirm+"\")") %>'
                            runat="server" CssClass="abtn"></asp:LinkButton>
                     
                      <asp:LinkButton ID="lbtnView" OnCommand="lbtnView_Click" CommandArgument='<%#Eval("fullName") %>'
                            Text="<%$ Resources:Trojan,View%>" 
                            runat="server" CssClass="abtn"></asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater> 
     
            <span class="function fr">
                            </span>
    
          <webdiyer:AspNetPager ID="AspNetPager1"  CssClass="page" runat="server" PageSize="20" AlwaysShow="True"
                                    OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"  
                                    ShowPageIndexBox="always" PageIndexBoxType="DropDownList" 
                                    CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
                                    UrlPaging="True">
                                </webdiyer:AspNetPager>
        <asp:HiddenField runat="server" ID="hiFileName" />
 </div>
</form>
</body>
</html>