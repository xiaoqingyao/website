<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shijuanshengcheng_list.aspx.cs" Inherits="shijuanshengcheng_list" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>�ޱ���ҳ</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="search" align="center" border="1" bordercolor="#cccccc" cellpadding="0"
            cellspacing="1" class="table_1" width="98%">
            <tbody>
                <tr class="tr2">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                        �����Ծ�������Ϣ�б�</td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        &nbsp;�Ծ��ţ�<asp:TextBox ID="bh" runat="server"></asp:TextBox>��Ŀ��<asp:TextBox ID="mc"
                            runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                Text="����" />
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" 
                           
                            PageSize="8" Width="100%" OnPageIndexChanged="DataGrid1_PageIndexChanged" AllowPaging="True">
                            <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <PagerStyle Font-Bold="True" Font-Names="����" ForeColor="Blue" HorizontalAlign="Right"
                NextPageText="��һҳ" PrevPageText="��һҳ" />
                            <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="���">
                                    <HeaderStyle Width="50px" />
                                    <ItemTemplate>
                                    <%#Container.ItemIndex+1 %>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField=shijuanbianhao HeaderText='�Ծ���'></asp:BoundColumn><asp:BoundColumn DataField=zhangjie HeaderText='��Ŀ'></asp:BoundColumn><asp:BoundColumn DataField=xuanzetishu HeaderText='ѡ������'></asp:BoundColumn><asp:BoundColumn DataField=xuanzetifenzhi HeaderText='ѡ�����ֵ'></asp:BoundColumn><asp:BoundColumn DataField=panduantishu HeaderText='�ж�����'></asp:BoundColumn><asp:BoundColumn DataField=panduantifenzhi HeaderText='�ж����ֵ'></asp:BoundColumn><asp:BoundColumn DataField=tiankongtishu HeaderText='�������'></asp:BoundColumn><asp:BoundColumn DataField=tiankongtifenzhi HeaderText='������ֵ'></asp:BoundColumn>
                                <asp:BoundColumn DataField=xuanzeti HeaderText='ѡ����ID'></asp:BoundColumn>
                                <asp:BoundColumn DataField=panduanti HeaderText='�ж���ID'></asp:BoundColumn>
                                <asp:BoundColumn DataField=tiankongti HeaderText='�����ID'></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="�ֹ��޸�">
                                <ItemTemplate>
                                    <a href='shijuanshengcheng_updt2.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >�ֹ��޸�</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="�鿴��ϸ">
                                <ItemTemplate>
                                    <a href='shijuan_detail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >�鿴��ϸ</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="ɾ��">
                                 <ItemTemplate>
                                    <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=shijuanshengcheng&npage=shijuanshengcheng_list.aspx'
                                        onclick="return confirm('ȷ��Ҫɾ����')">ɾ��</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Center" />
                        </asp:DataGrid></td>
                </tr>
                <tr class="tr1">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                       <a href="#" onclick="javascript:window.print();">��ӡ��ҳ</a></td>
                </tr>
            </tbody>
        </table>
    
    </div>
    </form>
</body>
</html>
