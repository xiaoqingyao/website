<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialInfoRecommend.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SpecialInfoRecommend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <asp:Repeater ID="rptRecommendArea" runat="server" onitemdatabound="rptRecommendArea_ItemDataBound">
        <ItemTemplate>
        <div id="<%#Eval("ID") %>">
            <h4><%#Eval("Name") %></h4>
            <asp:CheckBoxList ID="chklRA" RepeatColumns="8" DataSource='<%#Eval("RA_RAP") %>'  DataTextField="Name" DataValueField="Tags" runat="server"></asp:CheckBoxList>
            <asp:HiddenField ID="hdnchklRA" Value='<%#Eval("ID") %>' runat="server" />
        </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    <center>
        <div style="margin: 10px; clear: both;">
            <asp:Button ID="Button1" runat="server" Text="确定" OnCommand="Save" />&nbsp;&nbsp;
            <input type="button" value="关闭" onclick="parent.Closed()" />
        </div>
    </center>
    <asp:HiddenField ID="SpecialInfoID" runat="server" />
    </form>
    <script type="text/javascript">
        var initRA;
        
        initRA = <%=jsInitRA %>;
        if(initRA.init != null){
            for(var i=0;i<initRA.init.length;i++){
                if(initRA.init[i] != null){
                   var arrRAP;
                   
                   if(initRA.init[i].RAP != ""){
                       arrRAP = initRA.init[i].RAP.split(",");
                      
                       if(arrRAP.length > 0){
                            $("#" + initRA.init[i].RA).find("input[type='checkbox']").each(function(){
                                for(var k=0;k<arrRAP.length;k++){
                                    if($(this).parent().attr("RAP") == arrRAP[k]){
                                        $(this).attr("checked","checked");
                                        break;
                                    }
                                }
                           });
                       }
                   }
                }
            }
      }
      
      // 批量操作时获取专题信息ID
      var specialInfoID = "";
      
      $(parent.document.getElementById("SpecialInfoList")).find("input[type='checkbox']:not('#_SelectAll')").each(function(){
        if($(this).attr("name") != "" && $(this).attr("checked")){
            if(specialInfoID == ""){
                specialInfoID = $(this).val();
            }else{
                specialInfoID += "," + $(this).val();
            }
        }
      });
     
      $("#SpecialInfoID").val(specialInfoID);
      <%=jsMessage %>
    </script>
</body>
</html>
