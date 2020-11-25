<%@ Control Language="C#" %>

    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:15px;">
        <tr>
          <td align="center">
    <script type="text/javascript">
      function search()
      {
      if(document.getElementById("txtkey").value!="")
        if(document.getElementById("searchtype").value=="1")
            window.location.href = "bloglist.aspx?key="+encodeURIComponent(document.getElementById("txtkey").value);//encodeURI
        else
            window.location.href = "memberlist.aspx?key="+encodeURIComponent(document.getElementById("txtkey").value);//encodeURI
      else
        document.getElementById("txtkey").focus();
      }
      </script>
                搜索：
              <select id="searchtype">
                  <option value="1">日志</option>
                  <option value="2">用户</option>
              </select><br />
                关键字：<input type="text" name="txtkey" id="txtkey" style=" height:18px; width:120px;border:#c7d78c solid 1px; background:#f8fef4;" value="<%=Request["key"] %>" /><br />
              <img src="images/sea_bt.gif" style="cursor:pointer;" align="absmiddle" onclick="search()" />
          </td>
        </tr>
      </table>

<table width="250" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/cpzs.jpg" width="250" height="42" border="0" /></td>
      </tr>
      <tr>
      <td background="images/cpzs_bg.jpg">
<%
    System.Data.DataTable dt = DB.getDataTable("select * from picClass");
    for (int i = 0; i < dt.Rows.Count; i++)
{
 %>
    <div style="text-align:left;width:100%; float:left;padding-top:10px; height:25px; border-bottom:solid 1px #c7d78c;">
        <div style="float:left;padding-left:40px; font-size:14px;">
            <img src="images/arrow.gif" align="absmiddle" /> <a href="bloglist.aspx?tid=<%=dt.Rows[i]["picClassId"] %>"><font color="#2d7e17"><%=dt.Rows[i]["picClassName"]%></font></a>
        </div>
    </div>
    <%} %>
      </td>
      </tr>
    </table>
    
    
    <table width="250" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
    <tr>
        <td style=" height:25px;background:url(images/menubg.gif); text-align:center;color:#fff;font-size:14px;">
            <b>最新评论</b></td>
    </tr>
    <tr>
    <td>
    <%
        System.Data.DataTable dtn = DB.getDataTable("select top 10 * from comment order by commentid desc");
        for (int i = 0; i < dtn.Rows.Count; i++)
        {
     %>
    <div style="text-align:left;width:100%; float:left; line-height:22px; border-bottom:dashed 1px #ddd;">
        <div style="float:left;width:240px;padding:10px 0 0 10px; background:url(images/arrow.gif) 0 15px no-repeat;">
            <a href="bloginfo.aspx?id=<%=dtn.Rows[i]["blogid"] %>" target="_blank">
                <font style="color:green;">
                    <%=DB.GetSubString(dtn.Rows[i]["commentcontent"].ToString(), 50,"..")%></font>
                <font color="#888888"> [<%=dtn.Rows[i]["CommentTime"]%>]</font>
            </a>
        </div>
    </div>
    <%} %>
    </td>
    </tr>
</table>
