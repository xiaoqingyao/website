<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jipiaoyuding_list.aspx.cs" Inherits="jipiaoyuding_list" %>
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
                        ���л�ƱԤ����Ϣ�б�</td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        &nbsp;�����ţ�<asp:TextBox ID="bh" runat="server"></asp:TextBox>�������У�<asp:TextBox ID="mc"
                            runat="server"></asp:TextBox>&nbsp;������У�<asp:TextBox ID="ddcs" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
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
                                <asp:BoundColumn DataField=banjibianhao HeaderText='������'></asp:BoundColumn><asp:BoundColumn DataField=chufachengshi HeaderText='��������'></asp:BoundColumn><asp:BoundColumn DataField=daodachengshi HeaderText='�������'></asp:BoundColumn><asp:BoundColumn DataField=yudingshijian HeaderText='Ԥ��ʱ��'></asp:BoundColumn><asp:BoundColumn DataField=yudingpiaoshu HeaderText='Ԥ��Ʊ��'></asp:BoundColumn><asp:BoundColumn DataField=nindexingming HeaderText='����'></asp:BoundColumn><asp:BoundColumn DataField=nindedianhua HeaderText='�绰'></asp:BoundColumn><asp:BoundColumn DataField=nindeshenfenzheng HeaderText='���֤'></asp:BoundColumn><asp:BoundColumn DataField=beizhu HeaderText='��ע'></asp:BoundColumn><asp:BoundColumn DataField=yonghuming HeaderText='�û���'></asp:BoundColumn>
                                
                                <asp:TemplateColumn HeaderText="�޸�">
                                <ItemTemplate>
                                    <a href='jipiaoyuding_updt.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >�޸�</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="ɾ��">
                                 <ItemTemplate>
                                    <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=jipiaoyuding&npage=jipiaoyuding_list.aspx'
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
