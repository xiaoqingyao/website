<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fileList.aspx.cs" Inherits="fileManage_fileList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <table style="width: 757px; height: 1px" align="center">
            <tr>
                <td align="center" class="cssTitle" colspan="3">
                    －＝删除文件＝－</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 275px">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                        CellPadding="4" CellSpacing="2" CssClass="css" Height="38px" Width="753px" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <PagerSettings FirstPageText="第一页" LastPageText="最后一页" Mode="NextPreviousFirstLast"
                            NextPageText="下一页" PreviousPageText="上一页" />
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="fileID" HeaderText="ID" />
                            <asp:BoundField DataField="fileSender" HeaderText="发送人" />
                            <asp:BoundField DataField="fileAccepter" HeaderText="接收人" />
                            <asp:BoundField DataField="fileTitle" HeaderText="文件标题" />
                            <asp:BoundField DataField="fileTime" HeaderText="发送时间" />
                            <asp:BoundField DataField="fileContent" HeaderText="文件说明" />
                            <asp:CommandField DeleteImageUrl="~/icon/del.gif" HeaderText="删除文件" ShowDeleteButton="True" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
