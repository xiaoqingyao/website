<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteEdit.aspx.cs" Inherits="AllPower.Web.Admin.VoteEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加投票</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/Advertising.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",   //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                         //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                 //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                      //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });

        window.onload = function() {
            if (type > -1) {
                showEditMessage("投票", "VoteList.aspx<%=StrPageParams %>", "VoteEdit.aspx?NodeCode=<%=NodeCode %>", "VoteEdit.aspx?NodeCode=<%=NodeCode %>&action=edit&id=<%=ID %>");
            }
        }   
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="VoteList.aspx?Action=ALL&NodeCode=<%=NodeCode %>>">
                投票管理</a>&gt; <span style="color: Blue">添加/修改投票</span></h4>
        <dl>
            <dt>
                <%=Resources.Common.Name%></dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.VoteItem%></dt>
            <dd>
                <table id='searchinnet_Table_Title' cellspacing='1' cellpadding='2' style='width: 500px;'>
                    <tr class='title'>
                        <td width='46%' align='center'>
                            <%=Resources.Common.Title%>
                        </td>
                        <td width='12%' align='center'>
                            <%=Resources.Model.VoteCount%>
                        </td>
                        <td width='12%' align='center'>
                            <%=Resources.Model.VoteNewsId%>
                        </td>
                        <td width='30%' align='center'>
                            <%=Resources.Common.Operation%>
                        </td>
                    </tr>
                </table>
                <table id='searchinnet_Table' cellspacing='1' cellpadding='2' style='width: 500px;'>
                    <asp:Repeater ID="rptItems" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td width='46%' align='left' name='god'>
                                    <input type='text' value='<%#Eval("name") %>' id="_title" name='_title' size='30'
                                        maxlength="30" class='inputtext'>
                                </td>
                                <td width='12%' align='center' name='totalNumber'>
                                    <input type='text' class='inputtext' value='<%#Eval("VoteCount") %>' name='_totalNumber'
                                        style='text-align: right' size='4'>
                                </td>
                                <td width='12%' align='right'>
                                    <span id='span_id_0' title='信息ID'>
                                        <%#Eval("NewsId")%></span>
                                    <input type='hidden' id='hdn_NewsId_0' name='_Newsid' value='<%#Eval("NewsId")%>' />
                                    <input type='hidden' id='hdn_id_0' name='_id' value='<%#Eval("id")%>' />
                                </td>
                                <td width='30%' align='center'>
                                    <span onclick='moveUp(this)' style='cursor: pointer;'>
                                        <img border='0' align='absmiddle' alt='<%=Resources.Model.UpItem%>' src='../Images/icon_up.gif' /></span>&nbsp;
                                    <span onclick='moveDown(this)' style='cursor: pointer;'>
                                        <img border='0' align='absmiddle' alt='<%=Resources.Model.DownItem%>' src='../Images/icon_down.gif' /></span>&nbsp;
                                    <span onclick='insertRow(this)' style='cursor: pointer;'>
                                        <img border='0' align='absmiddle' alt='<%=Resources.Model.AddItem%>' src='../Images/icon_add.gif' /></span>&nbsp;
                                    <span onclick='removeRowTwo(this,<%#Eval("id")%>)' style='cursor: pointer;'>
                                        <img border='0' align='absmiddle' alt='<%=Resources.Model.RemoveItem%>' src='../Images/icon_del.gif' /></span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <table cellspacing='1' cellpadding='2' style='width: 500px;'>
                    <tr>
                        <td colspan="4">
                            <input type='button' id='ctl00_CphContent_FldVoteItemId_LitText' class='' value='<%=Resources.Model.SelectItem%>' />
                            &nbsp; <span onclick="addVoteItem(-1,0,'')" style='cursor: pointer;'>
                                <img border='0' alt='<%=Resources.Model.AddItem%>' src='../Images/icon_add.gif' align="absmiddle" /></span>
                        </td>
                    </tr>
                </table>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.SubmitLimitIP%></dt>
            <dd>
                <asp:TextBox ID="txtIPLimit" runat="server" TextMode="MultiLine" Height="110px" Width="283px"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsCheck%></dt>
            <dd>
                <asp:CheckBox ID="cbType" runat="server" />
                <%=Resources.Common.Yes%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.LastTime%></dt>
            <dd>
                <asp:TextBox ID="txtExpiredTime" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
                    CssClass="validate[required]" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.VoteIPCount%></dt>
            <dd>
                <asp:TextBox ID="txtVoteIPCount" runat="server" Text="0" CssClass="validate[required,length[1,6]"></asp:TextBox>
                <%=Resources.Model.VoteIPCountMessage%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsUserVote%></dt>
            <dd>
                <asp:CheckBox ID="cbIsUserVote" runat="server" />
                <%=Resources.Common.Yes%>
            </dd>
        </dl>
        <dl style="display: none">
            <dt>会员允许投票次数<%=Resources.Common.Name%></dt>
            <dd>
                <asp:TextBox ID="txtVoteUserCount" runat="server" Text="0" CssClass="validate[required,length[1,6]"></asp:TextBox>
                <%=Resources.Model.VoteIPCountMessage%>
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />
            &nbsp;<input type="button" name="Submit422" class="subButton" value="<%= Resources.Common.Back %>"
                onclick='location.href="VoteList.aspx<%=StrPageParams %>";'>
        </div>
    </div>

    <script language="javascript" type="text/javascript">
        //--------------------------------------------------------
        //  JS控制HTMLDOM表格行上下移动(兼容多浏览器)
        //--------------------------------------------------------
        //返回浏览器类型
        function getOs() {
            if (navigator.userAgent.indexOf("MSIE") > 0) return 1;
            if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) return 2;
            if (isSafari = navigator.userAgent.indexOf("Safari") > 0) return 3;
            if (isCamino = navigator.userAgent.indexOf("Camino") > 0) return 4;
            if (isMozilla = navigator.userAgent.indexOf("Gecko") > 0) return 5;
            return 0;
        }
        function cleanWhitespace(element) {
            //遍历element的子结点
            for (var i = 0; i < element.childNodes.length; i++) {
                var node = element.childNodes[i];
                //判断是否是空白文本结点，如果是，则删除该结点
                if (node.nodeType == 3 && !/S/.test(node.nodeValue))
                    node.parentNode.removeChild(node);
            }
        }
        //获得表格对象
        var _table = document.getElementById("searchinnet_Table");
        cleanWhitespace(_table);
        var _id = 0;
        //增加节点
        function insertRow(node) {
            addVoteItem(node.parentNode.parentNode.rowIndex + 1, 0, "");
        }
        //删除节点
        function removeRow(node) {
            _table.deleteRow(node.parentNode.parentNode.rowIndex);
        }
        //删除节点
        function removeRowTwo(node, id) {
            if (confirm("删除选项将不可以恢复,您确定要删除?")) {
                _table.deleteRow(node.parentNode.parentNode.rowIndex);
                $.ajax({
                    url: "../../ajax/SysAdmin/Model/VoteItemDelel.ashx",
                    data: { id: id }
                });
                //ajax开启删除
            }
        }
        function removeLastRow() {
            _table.deleteRow(-1);
        }
        //解决火狐浏览器问题递归查找节点  节点、类型 （1 = previousSibling，2 = nextSibling)
        function getChildNode(node, type) {
            if (type == 1) {
                //判断是否是空白文本结点，则继续选择下一个节点
                return (node.nodeType == 3 && !/S/.test(node.nodeValue)) ? getChildNode(node.previousSibling, 1) : node.previousSibling;
            }
            else {
                return (node.nodeType == 3 && !/S/.test(node.nodeValue)) ? getChildNode(node.nextSibling, 2) : node.nextSibling;
            }
        }
        //使表格行上移，接收参数为链接对象
        function moveUp(_a) {
            //通过链接对象获取表格行的引用
            var _row = _a.parentNode.parentNode;
            //如果不是第一行，则与上一行交换顺序
            if (_row.previousSibling) {
                var _previousSibling = (getOs() > 1) ? getChildNode(_row, 1) : _row.previousSibling;
                swapNode(_row, _previousSibling);
            }
        }
        //使表格行下移，接收参数为链接对象
        function moveDown(_a) {
            //通过链接对象获取表格行的引用
            var _row = _a.parentNode.parentNode;
            //如果不是最后一行，则与下一行交换顺序
            if (_row.nextSibling) {
                var _nextSibling = (getOs() > 1) ? getChildNode(_row, 2) : _row.nextSibling;
                swapNode(_row, _nextSibling);
            }
        }
        //定义通用的函数交换两个结点的位置
        function swapNode(node1, node2) {
            if (node2 != null) {
                //获取父结点
                var _parent = node1.parentNode;
                //获取两个结点的相对位置
                var _t1 = node1.nextSibling;
                var _t2 = node2.nextSibling;
                //将node2插入到原来node1的位置
                if (_t1) _parent.insertBefore(node2, _t1);
                else _parent.appendChild(node2);
                //将node1插入到原来node2的位置
                if (_t2) _parent.insertBefore(node1, _t2);
                else _parent.appendChild(node1);
            }
        }
        //获取表格内所有ID、Title 值
        function voteSubmit() {
            var rows = document.getElementById("searchinnet_Table").getElementsByTagName('input');
            var idvalue = "";
            var titlevalue = "";
            var totalNumber = "";
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].name == "_id") {
                    idvalue = (idvalue == "") ? rows[i].value : idvalue + "," + rows[i].value;
                }
                if (rows[i].name == "_totalNumber") {
                    totalNumber = (totalNumber == "") ? rows[i].value : totalNumber + "," + rows[i].value;
                }
                if (rows[i].name == "_title") {
                    if (rows[i].value == "") {
                        alert("标题不能为空！");
                        rows[i].focus();
                        return false;
                    }
                    titlevalue = (titlevalue == "") ? rows[i].value : titlevalue + "," + rows[i].value;
                }
            }

            if (idvalue == '') {
                alert("投票项不能为空！");
                return false;
            }
            $get('ctl00_CphContent_HdnVoteItemId').value = idvalue;
            $get('ctl00_CphContent_HdnVoteTitle').value = titlevalue;
            $get('ctl00_CphContent_HdnTotalNumber').value = totalNumber;
            return true;
        }
        //添加新投票选项
        function addVoteItem(nodeAddress, id, title) {
            var a = _table.insertRow(nodeAddress);
            var b = a.insertCell(0);
            var c = a.insertCell(1);
            var d = a.insertCell(2);
            var e = a.insertCell(3);

            b.innerHTML = "<input type='text' class='inputtext' name='_title'  value='" + title + "' id='title_id_" + _id + "'  size='30' maxlength='30' onclick='selectVoteItme(this);'/>";
            b.width = "46%";
            c.align = "center";
            c.innerHTML = "<input type='text' class='inputtext' name='_totalNumber'  value='0' id='totalNumber_id_" + _id + "' size='4' style='text-align: right' />";
            c.width = "12%";
            d.align = "right";
            d.innerHTML = "<span id='span_id_" + _id + "' title='信息ID'>" + id + "</span><input type='hidden' id='hdn_id_" + _id + "' name='_id' value='" + id + "'/><input type='hidden' id='hdn_Newsid_" + _id + "' name='_Newsid' value='" + id + "'/>";
            d.width = "12%";
            var setVote = "<span onclick='moveUp(this)'  style='cursor: pointer;'><img border='0' id='img_id_Up" + _id + "' alt='<%=Resources.Model.UpItem%>' src='../Images/icon_up.gif'  align='absmiddle' /></span>&nbsp;";
            setVote += "&nbsp;<span onclick='moveDown(this)'  style='cursor: pointer;'><img border='0' id='img_id_Down" + _id + "' alt='<%=Resources.Model.DownItem%>' src='../Images/icon_down.gif'  align='absmiddle'/></span>&nbsp;";
            setVote += "&nbsp;<span onclick='insertRow(this)'  style='cursor: pointer;'><img border='0' id='img_id_Insert" + _id + "' alt='<%=Resources.Model.AddItem%>' src='../Images/icon_add.gif'  align='absmiddle'/></span>&nbsp;";
            setVote += "&nbsp;<span onclick='removeRow(this)'  style='cursor: pointer;'><img border='0' id='img_id_Remove" + _id + "' alt='<%=Resources.Model.RemoveItem%>' src='../Images/icon_del.gif'  align='absmiddle' /></span>";

            e.align = "center";
            e.width = "30%";
            e.innerHTML = setVote;
            _id += 1;
        }
        //返回内容值
        function returnVoteItem(str) {
            var arrstritem;
            if (str.indexOf("$")) {
                var arrstr = str.split("$");
                for (i = 0; i < arrstr.length; i++) {
                    arrstritem = arrstr[i].split(",");
                    addVoteItem(-1, arrstritem[0], arrstritem[1]);
                }
            } else {
                arrstritem = str.split(",");
                addVoteItem(-1, arrstritem[0], arrstritem[1]);
            }
        }
        function selectVoteItme(voteItem) {
            if (voteItem.value == "投票项1" || voteItem.value == "投票项2") {
                voteItem.value = "";
            }
        }
    </script>

    </form>
</body>
</html>
