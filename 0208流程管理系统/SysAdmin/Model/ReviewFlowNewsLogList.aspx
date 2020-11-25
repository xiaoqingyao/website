<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewFlowNewsLogList.aspx.cs" Inherits="AllPower.Web.Admin.ReviewFlowNewsLogList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>审核流程管理</title>
<link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
<script type="text/javascript" src="../js/publicform.js"></script>
<script type="text/javascript" src="../js/listcheck.js"></script>
<script type="text/javascript" src="../js/regExp.js"></script>
<link href="../css/dialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.dialog.js"></script>
<script type="text/javascript" src="../js/win.js"></script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form id="Form1" name="theForm" method="post" runat="server">
<div class="container">
  <h4>位置： <a href="#">内容管理</a><a> &gt;</a> 审核日志管理</h4>
  <div id="searchContainer">
  <p>
      </p>
  </div> 
  
  <ul class="ulheader">  
  <li style="width:10%"><%= Resources.Common.UserNo%></li>
  <li style="width:25%;"><%= Resources.Common.Operation%></li>
  <li style="width:25%;"><%= Resources.Model.Notation%></li>
  <li style="width:15%">IP</li>
  <li style="width:20%;"><%= Resources.Common.AddTime%></li>
  </ul>
       <asp:Repeater ID="rptModelFileGroup" runat="server">
                <ItemTemplate>   
  <ul class="ulheader ulbody">   
  <li style="width:10%"><%#Eval("AddMan")%></li>
  <li style="width:25%"><%#Eval("desc").ToString() + " " + (Convert.ToBoolean(Eval("isSuccess")) ? Resources.Common.FlowSuccess : Resources.Common.FlowFail)%></li>
  <li style="width:25%"><%#Eval("Notation")%></li>
    <li style="width:15%"><%#Eval("IP")%></li>
  <li style="width:20%">
  <%#Eval("AddDate")%>
   </li>
  </ul>
  </ItemTemplate>
                </asp:Repeater>
   <span class="function fr">
 
  </span>
  
    <webdiyer:aspnetpager id="AspNetPager1" CssClass="page" runat="server" PageSize="15" 
                          AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" 
                          ShowCustomInfoSection="Left"
                          ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    
                          CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录" 
                          UrlPaging="True"></webdiyer:aspnetpager>       
  <br clear="left" />
</div>


  
            </td>
          </tr>
        </table>
      </td>
      </tr>
    </table>
</form>
</body>
</html>