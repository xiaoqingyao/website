<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogInfo.aspx.cs" Inherits="BlogInfo" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<%@ Register src="Controls/Left.ascx" tagname="Left" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���˲���ϵͳ[��ҵ���]</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form runat="server">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="250" valign="top">
    
    <uc3:Left ID="Left1" runat="server" />

    </td>
    <td align="center" valign="top"><table width="677" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">
          
          <table width="677" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
              <td style="border-bottom:#a5c94f solid 1px;">
                <div class="aa_1">������־</div>
              </td>
            </tr>
            <tr>
            <td style="line-height:30px;" align="center">
                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                    <td valign="top" style="line-height:40px; text-align:left; font-size:16px;">
                    <b>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal ID="BlogName" runat="server"></asp:Literal></b><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span style="color:#888; font-size:12px;">
                        ���ͣ�<asp:Literal ID="typename" runat="server"></asp:Literal>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        �������<%=hits%> ��
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        �����ˣ�<asp:Literal ID="ltlusername" runat="server"></asp:Literal>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><font color="blue">�Ӻ���</font></asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ʱ�䣺<asp:Literal ID="addtime" runat="server"></asp:Literal>
                    </span>
                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="  ��Ҫ�ղش˲���  " OnClick="Button2_Click" />
                    
                    </td>
                    </tr>
                    <tr>
                    <td style="line-height:30px; text-align:left;padding:20px 0 0 20px;font-size:16px;">
                        <%=jieshao%></td>
                    </tr>
                </table>
                
            </td>
            </tr>
            <tr>
            <td style="line-height:30px;" align="left">

<table width="677" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
            <tr>
                <td style="border-bottom:#C8ECD4 solid 1px;">
                <div class="aa_0">��������</div></td>
            </tr>
            <tr><td align="left" style="line-height:25px;padding-top:10px;">
                
    <div style="text-align:left;width:100%; float:left;">
<asp:Repeater ID="rptList" runat="server">
<ItemTemplate>
        <div style="float:left;padding:10px 0 0 20px;border-bottom:solid 1px #ddd;">
            <div style="float:left;width:350px;"><b>�����ˣ�</b><%#Eval("commentuser") %></div>
            <div style="float:left;width:250px; text-align:right;"><b>����ʱ�䣺</b><%#Eval("commenttime") %></div>
            
            <div style="float:left;width:600px;padding:5px 0;"><b>�������ݣ�</b><%#Eval("commentcontent") %></div>
            
        </div>
</ItemTemplate>
</asp:Repeater> 
    </div>
    
    <div style="text-align:left;width:100%; float:left;">
        <div style="float:left;padding:10px 0 0 40px;">
             <div style="float:left;width:600px;"><b>��Ҫ���ۣ�</b></div>
             <div style="float:left;width:600px;">&nbsp;&nbsp;&nbsp;&nbsp;�����ˣ�
                <asp:TextBox ID="txtCommentUser" runat="server" Width="80px"></asp:TextBox></div>
             
             <div style="float:left;width:600px;">�������ݣ�
                 <asp:TextBox ID="txtCommentContent" runat="server" TextMode="MultiLine" Columns="55" Rows="4"></asp:TextBox></div>
            
            <div style="float:left;width:600px;padding:20px 0; text-align:center;">
                <asp:Button ID="Button1" runat="server" Text="�ύ����" OnClick="Button1_Click" /></div>
        </div>
    </div>
            </td></tr>
          </table>
          
          
          
            
            </td>
            </tr>
          </table>
          
          

          <table width="100" border="0" cellspacing="0" cellpadding="0"><tr><td height="20"></td></tr></table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>