<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main1.aspx.cs" Inherits="main1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>留言本</title>
</head>
<body>

    <form id="Form1" Runat="Server">
<center>
  [<a href="ly.aspx"><font size="2">我要留言</font></a>]
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  [<a href="main.aspx"><font size="2">返回首页</font></a>]</center>
 <table><tr><td height="8"></td></tr></table>
    <% n_count = 0;%>
    <asp:Repeater id="repeater1" runat="server">
      <HeaderTemplate>  <!-- <HeaderTemplate></HeaderTemplate>之间的内容只出现一次。-->
        <table border="0" width="808" cellpadding="1" align="center">
      </HeaderTemplate>
      <ItemTemplate>  <!-- <ItemTemplate></ItemTemplate>之间的内容循环出现 -->
        <tr>
          <td width="15%">
             <table border="1" width="100%" bordercolor="black" bgcolor="F0F8FF">
               <tr height="150">
                 <td align="center">
                   <img src="<%# DataBinder.Eval(Container.DataItem,"PicAddr1") %>" width="50" height="100"/>
                   <br/>
                   <small>昵称：<font color='black'><%# DataBinder.Eval(Container.DataItem,"NiCheng") %>
                   <%# DataBinder.Eval(Container.DataItem,"户主") %></font></small></td>
               </tr>
             </table>
          </td>
          <td width="2%"></td>     
          <td>
             <table border="0" width="100%" bgcolor="F0F8FF" cellpadding="0">
             <tr>
               <td>
                &nbsp;&nbsp;<small>主题：<font color='black'><%# DataBinder.Eval(Container.DataItem, "Title")%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                            
                发表时间：<font color='black'><%# DataBinder.Eval(Container.DataItem,"DDate") %></font></small></td>
             </tr>
             <tr>
               <td><hr></td>
             </tr>
             <tr>
               <td height="47" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;    
                 <small id="small2"><font color='black'><%#DataBinder.Eval( Container.DataItem,"Content") %></font></small>
              </td>
            </tr>
             <tr>
              <!-- 显示回复内容-->
               <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<small><strong><font color='red'>回复</strong>：</font><font color="black"><%# DataBinder.Eval(Container.DataItem,"reply") %></font></small></td>
             </tr>
             <tr><td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<small><strong><font color='red'>回复时间</strong>：<font color="black"><%# DataBinder.Eval(Container.DataItem,"ReplyDate") %></font></small></td>
             </tr>
             <tr>
               <td><hr></td>
             </tr>
            <tr>
             <td>&nbsp;                         
            <a href="<%# DataBinder.Eval(Container.DataItem,"HomePage") %>" target="_blank">
            <img src="pic\home.gif" alt="<%# DataBinder.Eval(Container.DataItem,"HomePage") %>" border="0"></a>
            &nbsp;&nbsp;                         
            <a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%# DataBinder.Eval(Container.DataItem,"QQ") %>" target="_blank">
            <img src="pic\qq.gif" alt="<%# DataBinder.Eval(Container.DataItem,"QQ") %>" border="0"></a>
            &nbsp;&nbsp;                         
            <a href="mailto:<%#DataBinder.Eval( Container.DataItem,"Email") %>">
            <img src="pic\email.gif" alt="<%# DataBinder.Eval(Container.DataItem,"Email")%>" border="0"></a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     

                  <a href="del.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID")%>">                         
                  <img src="pic\del.gif" border="0"></a>      
                      
         </td>
         </tr>
         </table>
        </td>
       </tr>
     </ItemTemplate>
     
     <SeparatorTemplate>   <!--<SeparatorTemplate></SeparatorTemplate> 间隔的内容-->
        <tr><td colspan="2"></td></tr>
      <% n_count = n_count + 1;%> 
      
     </SeparatorTemplate>
     <FooterTemplate>  <!-- <footerTemplate></footerTemplate>结束。只出现一次 -->
</table>
     </FooterTemplate>
    </asp:Repeater>
    <span id="err" runat="server" /> 

    

   <center> <table>
    
    <tr><td height="13"></td></tr>
    <tr>
	   <td align="center" colspan="2" style="font-size:12px">总记录数：<%= zjl %>条&nbsp;&nbsp;共<%= pagecount%>页/第<asp:Label  ID="lebCurrentPage" runat="server" Text="1"></asp:Label>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <asp:LinkButton ID="lbtfirst" runat="server" onclick="lbtfirst_Click">首页</asp:LinkButton>
		    &nbsp;
		    <asp:LinkButton ID="lbtprev" runat="server" onclick="lbtprev_Click">上一页</asp:LinkButton>
		    &nbsp;
		    <asp:LinkButton ID="lbtnext" runat="server" onclick="lbtnext_Click">下一页</asp:LinkButton>
		    &nbsp;
		    <asp:LinkButton ID="lbtlast" runat="server" onclick="lbtlast_Click">末页</asp:LinkButton></td></tr></table></center>

    
    </form>
</body>
</html>
