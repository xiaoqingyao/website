<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgShow.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.MsgShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script language="javascript" type="text/javascript">
        function lnkbOK() {
            PageMethods.lnkbShow(document.getElementById("HdID").value, AlertA1);
        }
        function AlertA1(result) {
            //
            if (result == "1") {
                //closeMessage();
                //alert(result);

            }
            else {
                alert({ msg: '程序出错，请找管理员！', title: '提示信息' });
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <asp:HiddenField ID="HdID" runat="server" />
    <div class="message">
        <h3>
            窗口<font color="#ff0000" id="showTime">30</font> 秒后关闭</h3>
        <h4>
            <a href="#">
                <%=username %></a> <span><%=AddDate %></span>
        </h4>
        <div class="info">
            <%=strContent%></div>
        <div class="sfo">
            <a href="javascript:;" class="mnb" onclick='lnkbOK()'>我知道了</a>
            <a href="../SysManage/MsgReceiveList.aspx" target="frameRight">查看详情</a></div>
    </div>
    </form>
</body>
</html>
