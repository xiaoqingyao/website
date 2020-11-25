<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LableList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.LableList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>标签列表</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

 <script type="text/javascript" src="../js/win.js"></script>

    
    <script type="text/javascript">
        function checkDelete(IsOk) {
            if (IsOk == "true") {
                if (GetSelTitle()) {
                    $("#btnHidAction").click();
                }
            }
        }
        
        function GetSelTitle() {
            var isHaveCheck = false;
            $("input").each(function() {
                if ($(this).attr("type") == "checkbox") {
                    if ($(this)[0].checked && $(this).attr("id") != "checkBoxAll") {
                        isHaveCheck = true;
                    }
                }
            });
            if (!isHaveCheck) {
                alert({ msg: '请先选择记录，然后再点击操作！', title: '提示信息' })
                return false;
            }
            else {

                return true;
            }
        }
        function seldir() //选择目录
        {
            var Dir;
            var objSrc = new ActiveXObject("Shell.Application").BrowseForFolder(0, 'Select the directory', 0, '');
            if (objSrc != null) {
                Dir = objSrc.Items().Item().Path;
                alert(Dir);
            }
        }


    </script>
</head>
<body>
    <div class="container" id="_ListInfoListTable">
        <form id="theForm" runat="server">       
        <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
        <h4>
            位置： <a href="TemplateList.aspx">模板模型</a> > <span style="color: Blue">标签管理</span>
        </h4>
        <div id="searchContainer">
            <ul>
                <li>分类列表：</li>
                <li><a href="LableList.aspx?NodeCode=<%=NodeCode %>">显示全部</a></li>
                <asp:Repeater ID="reptClass" runat="server">
                    <ItemTemplate>
                        <li>|</li>
                        <li>
                            <a href='LableList.aspx?NodeCode=<%=NodeCode %>&classID=<%#Eval("ClassID") %>'><%#Eval("ClassName") %></a>
                            </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
           <br />            
           
        </div>
        <div  style="float:left; padding-top:20px;">
        &nbsp; 类别：<asp:DropDownList ID="dropIsSystem" runat="server">
                <asp:ListItem Value="-1" Text="请选择类别"></asp:ListItem>
                <asp:ListItem Value="0" Text="静态标签"></asp:ListItem>
                <asp:ListItem Value="1" Text="系统标签"></asp:ListItem>
                <asp:ListItem Value="2" Text="分页标签"></asp:ListItem>
                <asp:ListItem Value="10" Text="自由标签"></asp:ListItem>
            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
            关键字：<asp:TextBox ID="txtLableName" runat="server" 
                ></asp:TextBox>&nbsp;
            <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnQuery_Click" />
        </div>
        <div style="padding-top:10px"></div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" Style="display: none" />
            <asp:Button ID="btnStaticNew" runat="server" Text="新建静态标签" OnClick="btnStaticNew_Click" />
            <asp:Button ID="btnSystemNew" runat="server" Text="新建系统标签" OnClick="btnSystemNew_Click" />
            <asp:Button ID="btnPageNew" runat="server" Text="新建分页标签" OnClick="btnPageNew_Click" />
            <asp:Button ID="btnFreeNew" runat="server" Text="新建自由标签" OnClick="btnFreeNew_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="删除标签" OnClientClick="selfconfirm({msg:'确定删除选中的标签？',fn:function(data){checkDelete(data)}});return false;" />
            
        </div>
        <ul class="ulheader">
            <li style="width: 5%">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 20%;">标签名称</li>
            <li style="width: 9%;">所属分类</li>
            <li style="width: 9%;">类别</li>
            <li style="width: 10%;">所属网站</li>
            <li style="width: 8%;">添加时间</li>
            <li style="width: 5%;">状态</li>
            <li style="width: 18%;">操作</li>
        </ul>
        <div id="HQB_ListInfo" style="padding: 0; margin: 0;">
            <asp:Repeater ID="rptListInfo" runat="server" OnItemDataBound="rptListInfo_ItemDataBound">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 5%;">
                            <asp:CheckBox ID="check" runat="server" />
                        </li>
                        <li style="width: 20%;"><asp:Label ID="lblName" runat="server" Text='<%#Eval("Title") %>'></asp:Label></li>
                        <li style="width: 9%;">
                            <%#Eval("ClassName")%>
                        </li>
                        <li style="width: 9%;">
                            <asp:Label ID="lblIsSystem" runat="server" Text=""></asp:Label></li>
                        <li style="text-align: left; width:10%;">
                            <%#Eval("SiteName") %></li>
                        <li style="width: 8%;">
                            <%#Eval("AddDate")%></li>
                        <li style="width: 5%;">
                            <%#AllPower.Common.Utils.ParseState((Eval("IsEnable").ToString()),"0")%></li>
                        <li style="width: 18%;">
                            <asp:LinkButton ID="lnkbState" class="abtn" runat="server" OnCommand="LableList_State"
                           CommandName="Statedp" ToolTip='<%#Eval("LableName")%>' CommandArgument='<%#Eval("LableID")+"|"+Eval("IsEnable")+"|"+Eval("IsSystem") %>'><%# AllPower.Common.Utils.ParseStateTitle(!AllPower.Common.Utils.ParseBool(Eval("IsEnable").ToString()), "1")%></asp:LinkButton>
                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("LableId")%>' CommandName='<%#Eval("IsSystem")%>'
                                ID="lbtnDelete" class="abtn" Text="删除" OnClientClick='<%# ("selectThisRow();selfconfirm({msg:\"确定删除选中的标签？\",fn:function(data){checkDelete(data)}});return false;")%>'></asp:LinkButton>
                            <%--<asp:LinkButton runat="server" Text="修改" CommandArgument='<%#Eval("LableId")%>' class="abtn"
                                CommandName='<%#Eval("IsSystem")%>' OnCommand="lbtnEdit_Click" ID="lbtnEdit"></asp:LinkButton>--%>
                            <asp:HyperLink ID="hypEdit" runat="server" class="abtn">修改</asp:HyperLink>
                            <asp:HyperLink ID="hypCopy" runat="server" class="abtn">复制</asp:HyperLink></li>
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
  <div class="function"><asp:Button ID="btnDW" runat="server"  Text="生成Dreamweaver插件"  onclick="btnDW_Click" />
      <%--<asp:Button ID="btnExport" runat="server"  Text="导出" /> <input type="button" value="test" onclick="seldir()" />--%>
      </div>
        </form>
   
    </div>
</body>
</html>
