<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title><script src="js/menu.js"></script>
    <style>
body { margin:0 auto; padding:0; border:0;}
td { text-align:center;}
.style1 { font:12px "宋体"; color:#004C7E;}
a { color:#004C7E; text-decoration:none;}
a:hover { color:#FFF; text-decoration:underline;}
.STYLE2 {
	font-size: 12px;
	color: #03515d;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="166" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" bgcolor="D4ECFC">
      <table width="162" height="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td background="images/list_top.gif" height="28"></td>
        </tr>
        <tr id="td1" onClick="show(1)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">系统用户管理</span></td>
        </tr>
        <tr id="show1">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="edituser.aspx" target="hsgmain">系统用户添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="listuser.aspx" target="hsgmain">系统用户查看</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
        
        
        <tr id="Tr1" onClick="show(2)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">个人资料管理</span></td>
        </tr>
        <tr id="show2" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="mod.aspx" target="hsgmain">修改密码</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
        
        <tr id="Tr2" onClick="show(3)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">旅游资讯管理</span></td>
        </tr>
        <tr id="show3" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="allgonggao_add.aspx?lb=旅游资讯" target="hsgmain">旅游资讯添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="allgonggao_list.aspx?lb=旅游资讯" target="hsgmain">旅游资讯查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
        <tr id="Tr3" onClick="show(4)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">名胜风景管理</span></td>
        </tr>
        <tr id="show4" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="mingshengfengjing_add.aspx" target="hsgmain">名胜风景添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="mingshengfengjing_list.aspx" target="hsgmain">名胜风景查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
        
        <tr id="Tr4" onClick="show(5)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">留言管理</span></td>
        </tr>
        <tr id="show5" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="lyb_gl.aspx" target="hsgmain">留言管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
               
        </table></td>
        </tr>
        
        <tr id="Tr5" onClick="show(6)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">注册用户管理</span></td>
        </tr>
        <tr id="show6" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="yonghuzhuce_list.aspx" target="hsgmain">注册用户管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                
        </table></td>
        </tr>
        
        <tr id="Tr7" onClick="show(7)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">商品信息管理</span></td>
        </tr>
        <tr id="show7" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="lb_add.aspx" target="hsgmain">商品类别管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="shangpinxinxi_add.aspx" target="hsgmain">商品信息添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="shangpinxinxi_list.aspx" target="hsgmain">商品信息管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
        
         <tr id="Tr8" onClick="show(8)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">酒店信息管理</span></td>
        </tr>
        <tr id="show8" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="jiudianxinxi_add.aspx" target="hsgmain">酒店信息添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="jiudianxinxi_list.aspx" target="hsgmain">酒店信息管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="jiudianyuding_list.aspx" target="hsgmain">酒店预订管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
        
          <tr id="Tr9" onClick="show(9)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">机票信息管理</span></td>
        </tr>
        <tr id="show9" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="jipiaoxinxi_add.aspx" target="hsgmain">机票信息添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="jipiaoxinxi_list.aspx" target="hsgmain">机票信息管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="jipiaoyuding_list.aspx" target="hsgmain">机票预订管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
        
        
        <tr id="Tr6" onClick="show(17)">
          <td height="25" background="images/list_task.jpg"> <span class="style1">系统参数管理</span></td>
        </tr>
        <tr id="show17" style="display:none">
          <td align="center" valign="top">
          <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          
                 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="dx.aspx?lb=1" target="hsgmain">系统简介</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="dx.aspx?lb=2" target="hsgmain">系统公告</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="databack.aspx" target="hsgmain">数据备份</a></span></td>
                    </tr>
                  </table></td>
                </tr>
 <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="youqinglianjie_add.aspx" target="hsgmain">友情连接添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="10" height="30"><div align="center"><img src="images/top_4.gif"></div></td>
                  <td width="89" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="youqinglianjie_list.aspx" target="hsgmain">友情连接查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
        </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
