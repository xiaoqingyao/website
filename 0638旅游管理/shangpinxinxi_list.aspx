<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shangpinxinxi_list.aspx.cs" Inherits="shangpinxinxi_list" %>
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
                        ������Ʒ��Ϣ��Ϣ�б�</td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        &nbsp;��ţ�<asp:TextBox ID="bh" runat="server"></asp:TextBox>���ƣ�<asp:TextBox ID="mc"
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
                                <asp:BoundColumn DataField=bianhao HeaderText='���'></asp:BoundColumn><asp:BoundColumn DataField=mingcheng HeaderText='����'></asp:BoundColumn><asp:BoundColumn DataField=jiage HeaderText='�۸�'></asp:BoundColumn><asp:BoundColumn DataField=leibie HeaderText='���'></asp:BoundColumn><asp:BoundColumn DataField=jianjie HeaderText='���'></asp:BoundColumn><asp:TemplateColumn HeaderText="ͼƬ"><ItemTemplate><a href='<%#DataBinder.Eval(Container.DataItem, "tupian") %>' target='_blank'><img src='<%#DataBinder.Eval(Container.DataItem, "tupian") %>' width='88' height='99' border='0' /></a></ItemTemplate></asp:TemplateColumn><asp:BoundColumn DataField=kucun HeaderText='���'></asp:BoundColumn><asp:BoundColumn DataField=faburen HeaderText='������'></asp:BoundColumn>
                                <%--<asp:TemplateColumn HeaderText="�鿴����">
                                <ItemTemplate>
                                    <a href='pinglun_list.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >�鿴����</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>--%>
                                <asp:TemplateColumn HeaderText="�޸�">
                                <ItemTemplate>
                                    <a href='shangpinxinxi_updt.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >�޸�</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="ɾ��">
                                 <ItemTemplate>
                                    <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=shangpinxinxi&npage=shangpinxinxi_list.aspx'
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
