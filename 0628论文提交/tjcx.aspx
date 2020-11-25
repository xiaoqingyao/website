<%@ Page language="c#" Debug="true" %>
<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<Script runat="server">
 void find_Click(object sender, System.EventArgs e)
		{     
			
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="select * from lwtj where stuNo='"+stuNo.Text+"' and password='"+password.Text+"'";
                        SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			SqlDataReader dr=Comm.ExecuteReader();
			if (dr.Read())
                           {                                                                                            Session["theno"]=dr["stuNo"].ToString(); 
                           Session["thepwd"]=dr["password"].ToString();
                            Session["thename"]=dr["stuName"].ToString();
                            Session["thezy"]=dr["stuZy"].ToString();
                            Session["thetel"]=dr["stuTel"].ToString();
                            Session["theemail"]=dr["email"].ToString();
                            Session["jsname"]=dr["teacherName"].ToString();
                            Session["jsno"]=dr["teacherNo"].ToString();
                            Session["thetitle"]=dr["lwTitle"].ToString();
                            
                            dr.Close();
                            Conn.Close();
                            Response.Redirect("cxjg.aspx");
                            }
                            
                        else
                             message.Text="输入不正确!";
                            
                        
                 }
</Script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统-论文提交查询</title>
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
                  size=3>论文提交查询</FONT></B></FONT></TD></TR>
			  <TR><TD><hr width=500 align="center"></TD></TR>
              <TR>
                <TD align=middle>
                  <TABLE class=p9 height=135 cellSpacing=0 cellPadding=0 
                  width=578 align=center border=0>
                    
                    <TR>
                      <TD colSpan=2 height=13>&nbsp;</TD></TR>
                    <FORM runat="server" method=post>
                    <TR>
                      <TD align=right width=244 height=20>学&nbsp;号</TD>
                      <TD align=left width=334 height=20><asp:textBox id="stuNo" runat="server"/>
					      <asp:requiredfieldvalidator id="rvf2" ErrorMessage="学号不允许为空" ControlToValidate="stuNo" disply="static" runat="server"><SPAN  class=p9>*学号不允许为空</SPAN></asp:requiredfieldvalidator>
					  </TD></TR>
					<TR><TD>&nbsp;</TD></TR>
                    <TR>
                      <TD align=right height=20>密&nbsp;码</TD>
                      <TD align=left height=20><asp:TextBox id="password" size=20 runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:requiredfieldvalidator id="rvf3" runat="server"  ErrorMessage="密码不允许为空" ControlToValidate="password"><SPAN  class=p9>*密码不允许为空</SPAN></asp:requiredfieldvalidator> 
                      </TD></TR>
					 <TR><TD>&nbsp;</TD></TR>
					<TR><TD>&nbsp;</TD>
					<TD><asp:button id="find" onclick=find_Click text="查 询" runat="server"/></TD></TR>
					<TR><TD>&nbsp;</TD></TR>
					<TR><TD></TD><TD><FONT color=#CC0000 face="华文楷体" size=4><asp:label ID="message" runat="server"/></FONT></TD></TR></FORM></TABLE></TD></TR>
             <TR>
              <TD  align=middle>
               <table>
		 <TR>
                  <TD class=p9><p><font color="#ff0000" size=2>登陆提示:</font></td></tr>
		    <tr><td class=p9><p><font color="#FF6600">1.登陆密码为学生提交论文时所设密码.</font></p></td></tr>
                      <tr><td class=p9><p><font color="#FF6600">2.登陆后若出现与提交论文时相似的页面,你可以在里面对你的论文及个人信息进行更新.</font></p><tr><td>
                      <tr><td class=p9><p><font color="#FF6600">3.若出现"已审核提示",说明你的论文已被你的指导老师审核,你将无法再对你的信息进行修改.</font></p></TD></TR></TABLE>
               <TR><TD height=60>&nbsp;</TD></TR>
        </TD></TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
