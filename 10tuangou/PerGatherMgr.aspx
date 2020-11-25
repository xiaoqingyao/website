<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PerGatherMgr.aspx.cs" Inherits="PerGatherMgr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>发起团购</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 570px">
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 150px">
                </td>
                <td style="height: 150px">
                    <asp:GridView ID="gvPerGather" runat="server" AutoGenerateColumns="False" Style="text-align: center"
                        Width="555px" OnRowDataBound="gvPerGather_RowDataBound" OnRowDeleting="gvPerGather_RowDeleting" OnRowEditing="gvPerGather_RowEditing">
                        <Columns>
                            <asp:BoundField DataField="pGatherId" HeaderText="自发团购编号" />
                            <asp:BoundField DataField="perName" HeaderText="用户名" />
                            <asp:BoundField DataField="title" HeaderText="标题" />
                            <asp:BoundField DataField="gatherDesc" HeaderText="内容" />
                            <asp:BoundField DataField="gatherTime" HeaderText="发布时间" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="height: 150px">
                </td>
            </tr>
            <tr>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>