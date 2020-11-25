<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="AllPower.Web.Admin.Categorys.CategoryList" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
    <script type="text/javascript">
        function BindTree(id, state, CID, nodeid) {
            var obj = id.substring(1, id.length);
           
         var json="";
         $.ajax({
             type: "post",
             url: "CategoryAjax.aspx",
             dataType: '"json"',
             data: { "id": obj, "state": state },
             success: function(msg2) {
                 msg2 = msg2.substring(0, msg2.lastIndexOf("]") + 1);
                 var inHm = "<div style='margin-left:20px;'  id='d" + obj + "'><ul>";
                 var hehm = "";
                 if (msg2.length != "0") {
                     json = eval('(' + msg2 + ')');
                     var ame = "";
                     for (var i = 0; i < json.length; i++) {

                         var Namelen = 120 - json[i].Name.length * 12;

                         if (json[i].Num != "0") {

                             ame = "<a  style=' cursor:pointer;' onclick=BindTree('L" + json[i].ID + "',0,'" + CID + "'," + nodeid + ")>" + json[i].Name + "</a> ";

                         }

                         else {
                             ame = json[i].Name;
                         }
                         var isNo = json[i].IsValid == "True" ? "<span style='color:red;'>√</span>" : "<span style='color:white;'>√</span>";
                         var eble = json[i].IsValid== "True" ? "禁用" : "启用";
                         inHm += "<li id='L" + json[i].ID + "'><table><tr><td  width='75' align='left'>" + ame + "</td><td width='5'>" + isNo + "</td><td><a href='CategoryEdit.aspx?cid=" + CID + "&action=add&id=" + json[i].ID + "&nodeid=" + nodeid + "'><img src='../Images/icon_add.gif' /></a></td><td><a href='CategoryEdit.aspx?cid=" + CID + "&action=edit&id=" + json[i].ID + "&nodeid=" + nodeid + "' ><img src='../Images/pen.gif' /></a></td><td><a  onclick=Delet(" + json[i].ID + ",0,'" + CID + "'," + nodeid + ",'del','" + json[i].Name + "'," + obj + ",2)><img src='../Images/DTree/del.gif' border='0' /></a></td><td><a   class='abtn' onclick=Enable(" + json[i].ID + ",0,'" + CID + "'," + nodeid + ",'del','" + json[i].Name + "'," + obj + ",2,'" + json[i].IsValid + "') >" + eble + "</a></td><td><a onclick=ChildOrder(" + json[i].ID + "," + obj + ",2,'" + CID + "'," + nodeid + ",'up')><img src='../Images/icon_up.gif' border='0' /></a></td><td><a onclick=ChildOrder(" + json[i].ID + "," + obj + ",2,'" + CID + "'," + nodeid + ",'down')><img src='../Images/icon_down.gif' border='0' /></a></td></tr></table></li>";
                     }
                     inHm += "</ul></div>";
                     $("#d" + obj + "").remove(); $("#L" + obj + "").append(inHm);


                 }
                 else {
                     $("#d" + obj + "").html("");
                 }
             }
         });
        }


        function ChildOrder(obj, parentid, method, CID, nodeid,type) {
            $.ajax({
                type: "post",
                url: "CategoryListOrder.aspx",
                dataType: '"json"',
                data: { "id": obj, "order": type },
                success: function(msg2) {
                    BindTree("1"+parentid, '1', CID, nodeid);
                }
            });
        }
        function order(obj, ord) {
            $.ajax({
                type: "post",
                url: "CategoryListOrder.aspx",
                dataType: '"json"',
                data: { "id": obj, "order": ord },
                success: function(msg2) {
                var s = location.href;
                    var d = s.substring(s.lastIndexOf("?"),s.length);
                    var url = "CategoryList.aspx" + d;
                    window.location.href = url;
                }
            });

        }
        function Delet(obj, state, CID, nodeid, action, NodeName,id,me) {

            $("#Text1").val(obj + "&" + state + "&" + CID + "&" + nodeid + "&" + action + "&" + NodeName+"&"+id+"&"+me);
            selfconfirm({ msg: '确定要执行删除操作吗？', fn: function(data) { deledata(data) } });return false;
          }
          function deledata(data) {

              if (data == "true") {
                  var str = $("#Text1").val().split('&');
                  var json = "";
                  $.ajax({
                      type: "post",
                      url: "CategoryListOrder.aspx",
                      dataType: '"json"',
                      data: { "id": str[0], "order": str[1], "action": str[4], "CID": str[3], "NodeName": str[5] },
                      success: function(msg2) {

                          msg2 = msg2.substring(0, msg2.lastIndexOf("]") + 1);
                          json = eval('(' + msg2 + ')');
                          alert({ msg: json[0].msg, title: '消息提示！' });
                          BindTree("1"+str[6], "1", str[2], str[3]);
                    }
               });
              }
          }
          function Enable(obj, state, CID, nodeid, action, NodeName, id, me, Isvalid) {
              $.ajax({
                  type: "post",
                  url: "EnableAjax.aspx",
                  dataType: '"json"',
                  data: { "id": obj, "IsValid": Isvalid },
                  success: function(msg2) {
                      msg2 = msg2.substring(0, msg2.lastIndexOf("]") + 1);
                      json = eval('(' + msg2 + ')');
                      alert({ msg: json[0].msg, title: '消息提示！' });
                      BindTree("1" + id, "1", CID, nodeid);
                  }
              });
          }

          function dao()
           {
                 
           }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server"  />
    <div style="display:none;">
        <input id="Text1" type="text" />
        
    </div>
    <div>
        <h4>
            当前位置：<a href="CategoryList.aspx?cid=l"><%=Resources.Orgin.HeadManage %>
                > </a><a href="CategoryList.aspx?cid=<%=CID %>">
                    <%=Menu %>管理</a>
        </h4>
        <div id="searchContainer" style="display:none;">
            <ul class="hassele">
                <li><span>商家名称：</span></li>
                <li>
                    <asp:TextBox ID="txtSearch" runat="server" Width="100px" MaxLength="50" /></li>
            </ul>
        </div>
        <div class="function" style="display:none;">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" Style="display: none" />
            <asp:Button ID="btnDisable" runat="server" Text="<%$Resources:Common,OnTitle %>"
                OnClick="btnDisable_Click" OnClientClick="return GetSelectTitle()" />
            <asp:Button ID="btnUnDisable" runat="server" Text="<%$Resources:Common,OffTitle %>"
                OnClick="btnUnDisable_Click" OnClientClick="return GetSelectTitle()" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnNew_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$resources:common,del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
        <table  cellpadding="0" cellspacing="0" style="margin-left:20px;">
         <%-- <tr style="background-color:#E6F1FE; font-size:13px; font-style:normal;">
          <td style="width: 45px">--%>
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" style="display:none;"  /><%--</td>--%>
           <%-- <td style="width: 5%">
              <strong>  <%=Resources.Orgin.Order%></strong></td>--%>
            <%--<td style="width: 15%;">
               <strong>  <%=Resources.Orgin.ID%></strong></td>
            <td style="width: 20%;">
               <strong>  <%=CName%></strong></td>
            <td style="width: 8%;">
               <strong>  <%=Resources.Orgin.State %></strong></td>
            <td style="width: 15%;">
                <strong> <%=Resources.Orgin.AddMan%></strong></td>
            <td style="width: 30%;">
               <strong>  <%=Resources.Orgin.Operate%></strong></td>
        </tr>--%>
        <asp:Repeater ID="rptCategory" runat="server">
            <ItemTemplate>
                <tr>
                    <%--<td style="width: 40px">
                        <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' style="width: 16px;
 height: 16px; margin-top:3px;"/>
                    </td>
                    <td style="width: 5%">
                        <asp:TextBox ID="txtOrder" runat="server" Text='<%# Eval("Orders")%>' Width="30"></asp:TextBox>
                    </td>
                    <td style="width: 15%;">
                        <%# Eval("ID")%></td>--%>
                    <td  style="width: 20%;" ><%--<a href="CategoryEdit.aspx?action=edit&id=<%# Eval("ID")%>&cid=<%=CID%>"
                        id="Title<%# Eval("ID")%>">--%>
                        <a href="javascript:BindTree('L<%# Eval("ID") %>',0,'<%=CID %>',<%=NodeCode %>);">
                        <%# Eval("Name")%></a>
                         <table style="margin-left:20px;">
                       <tr>
                          <td >
                        </td>
                       </tr>
                    </table>
                         </td>
                    <td style="width: 8%;"><font color="red">
                        <%# AllPower.Common.Utils.ParseModelFieldState(Eval("IsValid"), "")%></font>
                    </td>
                    <td style="width: 13%;">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("AddMan") %>'></asp:Label>
                    </td>
                    <td>
                    <ul>
                    <li>
                    <a id="lnkNew"  runat="server" href='<%#"CategoryEdit.aspx?action=add&id="+Eval("ID")+"&cid="+CID+"&nodeid="+NodeCode %>'>
                        <img src="../Images/icon_add.gif" /></a><a id="lnkEdit" runat="server" href='<%#"CategoryEdit.aspx?action=edit&id="+Eval("ID")+"&cid="+CID+"&nodeid="+NodeCode %>'>
                        <img src="../Images/pen.gif" />    </a> <%--<%#"if(confirm(\"确定要删除该记录吗?\")){GetSingleTitle(\""+Eval("ID") +"\");}"%>--%>
                        <asp:LinkButton ID="lnkbDelete"  runat="server" OnCommand="Category_Del"
                            CommandName="deldp" ToolTip='<%#Eval("Name")%>' CommandArgument='<%#Eval("ID") %>'
                             
                            OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setDelete(data)}});return false;">
                            
                            <img src="../Images/DTree/del.gif" border='0' /></asp:LinkButton>
                        <asp:LinkButton ID="lbtnState" class="abtn" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsValid").ToString()%>'
                            CommandName="STATE" runat="server"><%#Eval("IsValid").ToString() == "True" ? "禁用" : "启用"%>
                            </asp:LinkButton>
                             <img  src="../Images/icon_up.gif" onclick="order('<%# Eval("id") %>','up')" border='0' />
                             <img  src="../Images/icon_down.gif" onclick="order('<%# Eval("id") %>','down')" border='0' /></li>
                        </ul> 
                    </td>
                </tr>
                <tr>
                  <td colspan="4" >
                       <table style="margin-left:20px;">
                           <tr>
                             <td id="L<%# Eval("ID")%>""></td>
                           </tr>
                       </table>
                  </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table>
        <div style="display:none;">
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged"
                ShowCustomInfoSection="Left" CustomInfoSectionWidth="26%" ShowPageIndexBox="always"
                UrlPaging="true" PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>">
            </webdiyer:AspNetPager>
        </ul>
        </div>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
