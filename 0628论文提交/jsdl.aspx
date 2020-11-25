<%@ Page language="c#" Debug="true" %>
<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<Script runat="server">
 void jsdl_Click(object sender, System.EventArgs e)
		{     
			
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="select * from teacher where teacherNo='"+teacherNo.Text+"' and teacherpassword='"+password.Text+"'";
                        SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			SqlDataReader dr=Comm.ExecuteReader();
			if (dr.Read())
                           {
                            Session["teano"]=teacherNo.Text;
                            Session["teaname"]=dr["teacherName"].ToString();
                            Response.Redirect("lwsh.aspx");
                           }
                        else
                            message.Text="输入不正确!";
                            
                        
                 }
</Script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统—老师登陆</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE id=Table1 cellSpacing=0 cellPadding=1 width=760 align=center bgColor=#0066b3 border=0>
  
  <TR>
    <TD vAlign=top>
      <TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff 
      border=0>
        
        <TR>
          <TD>
		  <FORM runat="server" method=post>
            <TABLE id=Table3 cellSpacing=0 cellPadding=1 width="100%" 
              border=0>
              <TR>
                <TD height=80>&nbsp;</TD></TR>
              <TR>
                <TD align=middle height=30><FONT size=4><B><FONT 
                  size=3>老师登陆</FONT></B></FONT></TD></TR>
			  <TR><TD><hr width=500 align="center"></TD></TR>
              <TR>
                <TD align=middle>
                  <TABLE class=p9 height=135 cellSpacing=0 cellPadding=0 
                  width=578 align=center border=0>
                    
                    <TR>
                      <TD colSpan=2 height=13>&nbsp;</TD></TR>
                     <TR>
                      <TD align=right width=244 height=20>工&nbsp;号</TD>
                      <TD align=left width=334 height=20><asp:textBox id="teacherNo" runat="server"/>
					      <asp:requiredfieldvalidator id="rvf2" ErrorMessage="工号不允许为空" ControlToValidate="teacherNo" disply="static" runat="server"><SPAN  class=p9>*工号不允许为空</SPAN></asp:requiredfieldvalidator>
					  </TD></TR>
					<TR><TD>&nbsp;</TD></TR>
                    <TR>
                      <TD align=right height=20>密&nbsp;码</TD>
                      <TD align=left height=20><asp:TextBox id="password" size=20 runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:requiredfieldvalidator id="rvf3" runat="server"  ErrorMessage="密码不允许为空" ControlToValidate="password"><SPAN  class=p9>*密码不允许为空</SPAN></asp:requiredfieldvalidator> 
                      </TD></TR>
					 <TR><TD>&nbsp;</TD></TR>
					<TR><TD>&nbsp;</TD>
					<TD><asp:button id="jsdl" onclick=jsdl_Click text="登陆" runat="server"/>&nbsp;&nbsp;<FONT color=#CC0000 face="华文楷体" size=4><asp:label id="message" runat="server"/></FONT></TD></TR></table>
                    <table><TR>
                      <TD class=p9><p><font color="#ff0000" size=2>登陆提示:</font></td></tr>
					  <tr><td class=p9><p><font color="#FF6600">1.首次登陆密码由系统管理员设定.</font></p></td></tr>
                      <tr><td class=p9><p><font color="#FF6600">2.登陆后可请点击"老师信息及密码修改"来进行修改.</font></p><tr><td>
                      <tr><td class=p9><p><font color="#FF6600">3.若出现无法登陆或是还未分配到密码的请与管理员联系.</font></p></TD></TR></TABLE>
            </FORM>
		  </TD></TR>
              <TR>
                <TD 
    height=50>&nbsp;</TD></TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
