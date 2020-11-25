<%@ Page language="c#" Debug="true" %>
<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<Script runat="server">
 void gldl_Click(object sender, System.EventArgs e)
		{     
			
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="Select * from admin where admin='"+admin.Text+"' and password='"+password.Text+"'";
                        SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			SqlDataReader dr=Comm.ExecuteReader();
			if(dr.Read())
                          {  
                            dr.Close();
                            Conn.Close();
                            Response.Redirect("adminindex.aspx");
                           }
                        else
                            message.Text="输入不正确,请输入正确的账号与密码!";
                            
                        
                 }
</Script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统—管理登陆</title>
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
            <TABLE id=Table3 cellSpacing=0 cellPadding=1 width="100%" 
              border=0>
              <TR>
                <TD height=90>&nbsp;</TD></TR>
              <TR>
                <TD align=middle height=30><FONT size=4><B><FONT 
                  size=3>管理员入口</FONT></B></FONT></TD></TR>
			  <TR><TD><hr width=500 align="center" ></TD></TR>
              <TR>
                <TD align=middle>
                  <TABLE class=p9 height=135 cellSpacing=0 cellPadding=0 
                  width=578 align=center border=0>
                    
                    <TR>
                      <TD colSpan=2 height=13>&nbsp;</TD></TR>
                    <FORM runat="server" method=post>
                    <TR>
                      <TD align=right width=244 height=20>管理账号:</TD>
                      <TD align=left width=334 height=20><asp:textBox id="admin" runat="server"/>
					      <asp:requiredfieldvalidator id="rvf2" ErrorMessage="账号不允许为空" ControlToValidate="admin" disply="static" runat="server"><SPAN  class=p9>*账号号不允许为空</SPAN></asp:requiredfieldvalidator>
					  </TD></TR>
					<TR><TD>&nbsp;</TD></TR>
                    <TR>
                      <TD align=right height=20>密&nbsp;码:</TD>
                      <TD align=left height=20><asp:TextBox id="password" size=20 runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:requiredfieldvalidator id="rvf3" runat="server"  ErrorMessage="密码不允许为空" ControlToValidate="password"><SPAN  class=p9>*密码不允许为空</SPAN></asp:requiredfieldvalidator> 
                      </TD></TR>
					 <TR><TD>&nbsp;</TD></TR>
					<TR><TD>&nbsp;</TD>
					<TD><asp:button id="gldl" onclick=gldl_Click text="登 陆" runat="server"/></TD></TR>
					<TR><TD>&nbsp;</TD></TR>
					<TR><TD></TD></TR>
		                        <TR><TD></TD><TD><FONT color=#CC0000 face="华文楷体" size=4><asp:label ID="message" runat="server"/></FONT></TD></TR></FORM></TABLE></TD></TR>
              <TR>
                <TD   height=100>&nbsp;</TD></TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
