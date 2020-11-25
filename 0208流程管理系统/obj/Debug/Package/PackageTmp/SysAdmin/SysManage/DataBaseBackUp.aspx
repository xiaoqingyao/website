<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBaseBackUp.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.DataBaseBackUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据库备份</title>
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

    <script language="javascript">
        function tiaozhuan(backfilepath) {

            if (backfilepath == "") {
                alert({ msg: '请到-系统设置-数据库设置 下设置bak文件备份路径!', title: '提示信息' });
            }
            changeMenu('Bak');
        }
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
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <ul id="tags">
            <li class="selectTag" id="liSql"><a href="javascript:changeMenu('Sql')">sql文件备份</a>
            </li>
            <li id="liBak"><a href="javascript:tiaozhuan('<%=strBakFilePath %>');">bak文件备份</a></li>
        </ul>
        <div class="mynotesearch">
            <div id="divSql">
                <div id="searchContainer" style="padding-left: 10px">
                    <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px; vertical-align: bottom" />此种备份方式会在网站服务器上<%=strSqlFilePath %>生成sql备份文件，此方式不适合数据量大的备份
                    <br />
                    <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px; vertical-align: bottom" />不能备份10M以上的数据表<br />
                    <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px; vertical-align: bottom" />备份表结构在还原时先删除数据表，然后再插入数据；
                    </div>
                <div style="text-align:right; padding-top:20px; padding-bottom:10px; padding-right:150px;">
                    <input type="checkbox" id="chkIsCreateTable" checked runat="server" />是否备份表结构 &nbsp; 
                    <asp:Button ID="Button1" runat="server" CssClass="subButton" Text="开始备份数据" OnClientClick="return GetSelectTitle()"
                        OnClick="btnSave_Click" />
                </div>
                <ul class="ulheader">
                    <li style="width: 100px; text-align: center">
                        <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
                    <li style="width: 40%">数据库表</li>
                    <li style="width: 10%">记录条数</li>
                    <li style="width: 10%">使用空间</li>
                    <li style="width: 10%">数据库大小</li>
                    <li style="width: 10%">索引大小</li>
                </ul>
                <asp:Repeater ID="rptDataTableList" runat="server">
                    <ItemTemplate>
                        <ul class="ulheader ulbody">
                            <li style="width: 100px; text-align: center">
                                <input type="checkbox" name="chkId" value='<%#Eval("name")%>' <%#AllPower.Common.Utils.ParseInt(Eval("reserved").ToString().Replace("KB",""),0)>10000?"disabled":""%> />
                            </li>
                            <li style="width: 40%"><span id='Title<%#Eval("name") %>'>
                                <%#Eval("name")%></span> </li>
                            <li style="width: 10%">
                                <%#Eval("rows")%>
                            </li>
                            <li style="width: 10%">
                                <%#Eval("reserved")%>
                            </li>
                            <li style="width: 10%">
                                <%#Eval("data")%>
                            </li>
                            <li style="width: 10%">
                                <%#Eval("index_size")%>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                   <div style="text-align:right; padding-top:20px; padding-right:150px;">
                    <asp:Button ID="btnSave" runat="server" CssClass="subButton" Text="开始备份数据" OnClientClick="return GetSelectTitle()"
                        OnClick="btnSave_Click" /></div>
            </div>
            <div id="divBak" style="display: none">
                <div style="padding-left: 10px; background-color: #F5F5F5;">
                    <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px; vertical-align: middle" />
                    bak文件方式备份，备份文件将会保存在<%=strBakFileServer %>上的<%=strBakFilePath %><br />
                    <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px; vertical-align: middle" />
                    请确认上述文件夹是否存在，若没有，请自行添加！
                </div>
                <div class="Submit">
                    <asp:Button ID="btnSave2" runat="server" Text="开始备份数据" CssClass="subButton" OnClick="btnSave2_Click" /></div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
