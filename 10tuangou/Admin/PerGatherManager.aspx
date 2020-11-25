<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PerGatherManager.aspx.cs" Inherits="Admin_PerGatherManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="3" style=" height:20px;">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td >
                    <asp:GridView ID="gvPerGather" runat="server" AutoGenerateColumns="False" Height="100%"
                        OnRowDataBound="gvPerGather_RowDataBound" OnRowDeleting="gvPerGather_RowDeleting"
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="pGatherId" FooterText="自发团购编号" HeaderText="自发团购编号">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Font-Size="Smaller" />
                            </asp:BoundField>
                            <asp:BoundField DataField="perName" FooterText="用户名" HeaderText="用户名">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="title" FooterText="标题" HeaderText="标题">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gatherDesc" HeaderText="内容" />
                            <asp:BoundField DataField="gatherTime" FooterText="发布时间" HeaderText="发布时间">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:CommandField CancelText="" DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗?')&quot;&gt;删除"
                                EditText="" HeaderText="操作" InsertText="" NewText="" SelectText="" ShowDeleteButton="True"
                                UpdateText="" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 55px">
                </td>
            </tr>
            <tr>
                <td style="height: 12px">
                </td>
                <td style="width: 1109px; height: 12px">
                </td>
                <td style="width: 55px; height: 12px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
