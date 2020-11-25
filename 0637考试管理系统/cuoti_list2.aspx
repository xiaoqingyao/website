﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cuoti_list2.aspx.cs" Inherits="cuoti_list2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" style="width: 100%">
            <tr>
                <td align="left" style="height: 17px">
                    &nbsp;<table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                        cellpadding="4" cellspacing="0" style="width: 90%">
                        <tr bgcolor="#4296e7">
                            <td colspan="1">
                                <div align="center">
                                    <font color="#ffffff">我的错题列表</font></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="79%">
                                &nbsp;<asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                    BorderColor="DodgerBlue" Height="139px" PageSize="6" Width="100%">
                                    <SelectedItemStyle BackColor="Blue" />
                                    <PagerStyle NextPageText="上一页" PrevPageText="下一页" />
                                    <ItemStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="序号">
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="ctid" HeaderText="题目ID"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="lx" HeaderText="题型"></asp:BoundColumn>
                                        
                                        <asp:BoundColumn DataField="addtime" HeaderText="考试时间"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="删除">
                                            <ItemTemplate>
                                                <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=cuotijilu&npage=cuoti_list2.aspx'
                                                    onclick="return confirm('确定要删除？')">删除</a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid></td>
                        </tr>
                        <tr>
                            <td colspan="1">
                                <div align="center">
                                </div>
                            </td>
                        </tr>
                        <tr bgcolor="#4296e7">
                            <td colspan="1">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="height: 18px">
                </td>
            </tr>
            <tr>
                <td align="left">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
