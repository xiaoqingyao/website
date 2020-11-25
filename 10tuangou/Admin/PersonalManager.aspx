<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PersonalManager.aspx.cs" Inherits="Admin_PersonalManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>会员管理</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 527px">
            <tr>
                <td style="width: 3px; height: 32px">
                </td>
                <td style="width: 603px; height: 32px">
                    &nbsp;
                </td>
                <td style="width: 36250px; height: 32px">
                </td>
            </tr>
            <tr>
                <td style="width: 3px; height: 32px">
                </td>
                <td style="width: 603px; height: 32px">
                    <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label><asp:TextBox ID="txtPerName"
                        runat="server"></asp:TextBox><asp:Button ID="bnSelect" runat="server" ForeColor="LightSkyBlue"
                            OnClick="bnSelect_Click" Text="查找" /></td>
                <td style="width: 36250px; height: 32px">
                </td>
            </tr>
            <tr>
                <td style="width: 3px; height: 1px">
                </td>
                <td style="width: 603px; height: 1px">
                    <asp:GridView ID="gvPersonal" runat="server" AutoGenerateColumns="False" 
                        OnRowDataBound="gvPersonal_RowDataBound" OnRowDeleting="gvPersonal_RowDeleting"
                        Style="vertical-align: middle; text-align: center" Width="839px">
                        <Columns>
                            <asp:BoundField DataField="perName" HeaderText="用户名" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                            <asp:BoundField DataField="phone" HeaderText="电话号码" />
                            <asp:BoundField DataField="address" HeaderText="地址" />
                            <asp:BoundField DataField="msn" HeaderText="MSN" />
                            <asp:BoundField DataField="qq" HeaderText="QQ" />
                            <asp:BoundField DataField="functionId" HeaderText="功能编号" />
                            <asp:BoundField DataField="score" HeaderText="积分" />
                            <asp:BoundField DataField="regDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="注册日期" />
                            <asp:BoundField DataField="lastLoginDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="最后登陆日期" />
                            <asp:CommandField CancelText="" DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗?')&quot;&gt;删除"
                                EditText="" HeaderText="删除" InsertText="" NewText="" SelectText="" ShowDeleteButton="True"
                                UpdateText="" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 36250px; height: 1px">
                </td>
            </tr>
            <tr>
                <td style="width: 3px; height: 67px">
                </td>
                <td style="width: 603px; height: 67px">
                </td>
                <td style="width: 36250px; height: 67px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
