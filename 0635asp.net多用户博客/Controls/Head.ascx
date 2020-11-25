<%@ Control Language="C#" %>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right" valign="top" height="128" style="background:url(images/logo.jpg) repeat-x;">
    <div style="float:left;width:300px;">
        <embed src="images/top1.swf" width="300px" height="120" type="application/x-shockwave-flash" tybe="application/x-shockwave-flash" quality="high" menu="false" wmode="transparent">
    </div>
    <div style="float:left;">
    <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="bottom">
            
      <%if (Request.Cookies["memberinfo"] != null)
      { %>
    您好，<a href="usermain.aspx"><font color="red"><%=Server.UrlDecode(Request.Cookies["memberinfo"]["UserName"])%>，用户中心</font></a>&nbsp;&nbsp;
    <a href="userlogout.aspx"><font color="black">退出</font></a>
    <%}
      else { 
      %>
        <a href="userlogin.aspx"><font color="blue">用户登录</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="userreg.aspx"><font color="blue">用户注册</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="userrepwd.aspx"><font color="blue">密码找回</font></a>
      <%
      } %>
        </td>
      </tr>
    </table>
    </div>
    
      </td>
  </tr>
</table>
<table width="950" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
  <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="font-weight:bold; font-size:14px; text-align:center; height:31px; background:url(images/line.jpg) repeat-x;">
            
            <a href="default.aspx"><font color="green">网站首页</font></a><img src="images/xian.gif" align="absmiddle" />
            
            <a href="Bloglist.aspx"><font color="green">博客日志</font></a><img src="images/xian.gif" align="absmiddle" />
            <a href="piclist.aspx"><font color="green">相册展示</font></a>
            
        </td>
      </tr>
      <tr>
      <td>
<div style="float:left;">系统广播 <img src="images/laba.png" align="absmiddle" /></div>

<!--滚动代码开始-->
<div style="float:left;width:800px; padding-left:10px;">
<div id="scrollobj" style="white-space:nowrap;overflow:hidden;width:800px;color:Red; font-size:16px;">
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
                System.Data.DataTable dt = DB.getDataTable("select * from news order by addtime desc");
                foreach(System.Data.DataRow dr in dt.Rows){
                 %>
                &nbsp;&nbsp;&nbsp;<img src="images/Arrow_01.gif" align="absmiddle" />
                <a target="_blank" href="NewsInfo.aspx?id=<%=dr["newsid"]%>"><font color="#db0000"><%=dr["title"]%></font></a>
                <%
                }
                 %>
</span></div>
<script language="javascript" type="text/javascript">
<!--
    function scroll(obj) {
        var tmp = (obj.scrollLeft)++;
        //当滚动条到达右边顶端时
        if (obj.scrollLeft == tmp) obj.innerHTML += obj.innerHTML;
        //当滚动条滚动了初始内容的宽度时滚动条回到最左端
        if (obj.scrollLeft >= obj.firstChild.offsetWidth) obj.scrollLeft = 0;
    }
    setInterval("scroll(document.getElementById('scrollobj'))", 16);
//-->
</script>
</div>


      </td>
      </tr>
    </table>
  </td>
  </tr>
</table>