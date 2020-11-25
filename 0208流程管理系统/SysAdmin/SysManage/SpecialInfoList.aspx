<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialInfoList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SpecialInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>专题信息列表</title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="SpecialInfoList">
        <h4>
            位置：内容管理->专题信息列表</h4>
            <div id="searchContainer">
            标题：<asp:TextBox ID="txtTitle" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索"  OnClick="btnSearch_Click" />
</div>
       <div class="function">
       <%=backBtn %>
        <%if (SpecialID != "")
                  { %><input type="button" value="推荐" onclick="batchRecommendInfo('<%=SpecialID %>')" /><%} %>
           <asp:Button ID="Button1" OnClientClick="return CheckSelect('SpecialInfoList');" OnCommand="SpecialInfo_Del" CommandArgument="_chkID" CommandName="Batch" runat="server" Text="删除所选" />
            <input type="button" onclick="location.href='?<%=urlParam %>'" value="显示全部" />
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
               <input type="checkbox" id="_SelectAll" onclick="SelectAll('_SelectAll','SpecialInfoList')" name="_SelectAll" /></li>
            <li style="width: 400px">标题</li>
            <li style="width: 100px">状态</li>
            <li style="width: 250px">操作</li>
        </ul>
            
            <asp:Repeater ID="rptSpecialInfo" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
              <li style="width: 40px"><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></li>
             <li style="width: 400px"><%if (showType == 1)
                  { %>
                 <b> [<a href="?SpecialID=<%#Eval("SpecialID") %>"><%#Eval("SpecialName") %></a> - <a href="?SpecialID=<%#Eval("SpecialID") %>&SpecialMenuID=<%#Eval("SpecialMenuID") %>"><%#Eval("SpecialMenuName") %></a>]</b><%#Eval("Title") %>
                  <%}
                  else if (showType == 2)
                  { %>
                 <b> [<a href="?SpecialID=<%#Eval("SpecialID") %>&SpecialMenuID=<%#Eval("SpecialMenuID") %>"><%#Eval("SpecialMenuName") %></a>] </b><%#Eval("Title") %>
                  <%}
                  else
                  { %>
                  <%#Eval("Title") %>
                  <%} %></li>
             <li style="width: 100px;"><%#Eval("StateName") %></li>
          <li style="width: 250px;">
                <asp:Button ID="btnDel" OnCommand="SpecialInfo_Del" CommandArgument='<%#Eval("ID") %>' CommandName="One" runat="server" Text="删除"></asp:Button>
                <input type="button" onclick="location.href='../Model/<%#Eval("BrowseLink").ToString().Replace("K_U_","") %>View.aspx?ID=<%#Eval("InfoID") %>'" value="浏览" />
                <input type="button" onclick="openframe({ title: '专题信息评论设置', url: 'SetSpecialInfoComment.aspx?ID=<%#Eval("ID") %>', width: '600', height: '300' })" value="评论设置" />
                <%if (SpecialID != "")
                  { %><input type="button" value="推荐" onclick="openframe({ title: '<%#Eval("SpecialName") %>-信息推荐', url: 'SpecialInfoRecommend.aspx?SpecialID=<%=SpecialID %>&ID=<%#Eval("ID") %>', width: '600', height: '300' })" /><%} %>
            </li>
            </ul>
            </ItemTemplate>
            </asp:Repeater>
          </div>
        <ul class="page">
        <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
            UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
            PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
            HorizontalAlign="Center" NumericButtonCount="6">
        </webdiyer:AspNetPager>
    </ul>
    </form>
    
    <script type="text/javascript">
        function batchRecommendInfo(specialID) {
            if (isSelected()) {
                openframe({ title: '专题信息推荐', url: 'SpecialInfoRecommend.aspx?SpecialID=' + specialID, width: '600', height: '300' });
            }
        }

        // 列表中复选框全选或取消
        function isSelected() {
            var isTrue;

            isTrue = false;

            $("#SpecialInfoList").find("input[type='checkbox']:not('#_SelectAll')").each(function() {
                if ($(this).attr("checked") == true) { isTrue = true; }
            }
    );

            if (!isTrue) {
                alert({ msg: '请选择要推荐的记录！', title: '提示信息' })
            }

            return isTrue;
        }

    </script>
</body>
</html>
