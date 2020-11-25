<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBaseRestore.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.DataBaseRestore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据库还原</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
    function changeMenu(name) {
            $("#tags li").each(function() {
                $(this).removeClass("selectTag");
            });
            $("#li" + name).addClass("selectTag");
            if (name == 'Sql') {
                $("#divSql").show();
                $("#divBak").hide();
            }
            else {
                $("#divSql").hide();
                $("#divBak").show();
            }
            
        }
   </script>
   

</head>
<body>
    <form id="form1" runat="server">
   <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" Style="display: none" />
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <ul id="tags">
            <li class="selectTag" id="liSql"><a href="javascript:changeMenu('Sql')">sql文件备份</a>
            </li>
            <li id="liBak"><a href="javascript:changeMenu('Bak');">bak文件备份</a></li>
        </ul>
        <div class="mynotesearch">
            <div id="divSql">
              <div id="searchContainer" style="padding-left:10px; display:none">  
                    <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px;vertical-align:bottom" />
                   </div>
                    
               <div class="function">
                          <asp:Button ID="btnDelete" runat="server"  Text="删除" OnClientClick="selfconfirm({msg:'确定删除选中的备份文件吗？',fn:function(data){setAction(data);}});return false;"
                             />
                     </div>
                <ul class="ulheader">
                    <li style="width: 50px; text-align: center">
                        <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
                    <li style="width: 30%">文件名</li>
                    <li style="width: 15%">大小</li>
                    <li style="width: 15%">创建时间</li>
                    <li style="width: 25%">操作</li>
                </ul>
                <asp:Repeater ID="rptSqlFileList" runat="server">
                    <ItemTemplate>
                        <ul class="ulheader ulbody">
                            <li style="width: 50px; text-align: center">
                                <input type="checkbox" name="chkId" value='<%#Eval("FileName")%>' />
                            </li>
                            <li style="width: 30%">
                                <span id='Title<%#Eval("FileName") %>'><%#Eval("FileName")%></span>
                            </li>
                            <li style="width: 15%">
                                <%#Eval("FileSize")%>
                            </li>
                            <li style="width: 15%">
                                <%#Eval("CreateTime")%>
                            </li>
                            <li style="width: 25%">
                                <asp:LinkButton ID="lnkbRestore" class="abtn" runat="server" OnCommand="lnkbRestore_Click"
                                    CommandArgument='<%#Eval("FileName")%>' OnClientClick='<%#"return(confirm(\"确定要从此备份还原吗?\"))"%>'>导入</asp:LinkButton>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                  
              
            </div>
            <div id="divBak" style="display:none">
                
                   
                <ul class="ulheader">   
                 <li style="width: 50px; text-align: center">
                        <input type="checkbox" name="checkBoxAll" id="checkBox1" value="" /></li>            
                    <li style="width: 35%">备份文件</li>
                  
                    <li style="width: 30%">创建时间</li>
                    <li style="width: 25%">操作</li>
                </ul>
                <asp:Repeater ID="rptBakFileList" runat="server">
                    <ItemTemplate>
                        <ul class="ulheader ulbody">    
                        <li style="width: 50px; text-align: center">
                                <input type="checkbox" name="chkId" value='<%#Eval("FileName")%>' />
                            </li>                      
                            <li style="width: 35%">
                              <span id='Title<%#Eval("FileName") %>'> <%#Eval("FileName")%></span>
                            </li>
                          
                            <li style="width: 30%">
                                <%#Eval("CreateTime")%>
                            </li>
                            <li style="width: 25%">
                                <asp:LinkButton ID="lnkbRestore2" class="abtn" runat="server" OnCommand="lnkbRestore2_Click"
                                    CommandArgument='<%#Eval("FileName")%>' OnClientClick='<%#"return(confirm(\"确定要从此备份还原吗?\"))"%>'>导入</asp:LinkButton>
                                 <asp:LinkButton ID="lnkDelete" class="abtn" runat="server" OnCommand="lnkDelete_Click"
                                    CommandArgument='<%#Eval("FileName")%>' OnClientClick='<%#"return(confirm(\"确定要删除该备份吗?\"))"%>'>删除</asp:LinkButton>
                            </li>                          
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                <div style="clear: left">
                </div>
            </div>
        </div>
    </div> <asp:Literal ID="ltljs" runat="server"></asp:Literal>
    <asp:HiddenField ID="hidIsCommIP" runat="server" Value="false" />
    </form>
</body>
</html>
