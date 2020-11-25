<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
<LINK 
href="Images/Main/Top/css.css" rel=stylesheet>
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE2 {font-size: 20px}
-->
</style>
</head>

<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0"> 


    <form id="form1" runat="server">
    <div>
   <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0> 
  <TBODY> 
    <TR id=topmnuList> 
      <TD align=middle height=33> <TABLE style="WIDTH: 100%; HEIGHT: 56px" cellSpacing=0 cellPadding=0 
      align=center border=0> 
          <TBODY> 
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0> 
                  <TBODY> 
                    <TR> 
                      <TD  width=395 class="cmcc_bei_01"><div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#000000,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
                        <div align="center" class="STYLE5 STYLE1">网络在线考试系统</div>
                      </div></TD> 
                      <TD class=cmcc_bei_01 vAlign=top align=right colSpan=2> <TABLE cellSpacing=0 cellPadding=0 border=0> 
                          <TBODY> 
                            <TR> 
                              <TD width="75" background="Images/Main/Top/cmcc_tu03.gif"></TD> 
                              <TD> <a href="logout.aspx" target="_top"><IMG 
                        height=65 src="Images/Main/Top/cmcc_tu07.gif" width=62 
                        border=0></a></TD> 
                            </TR> 
                          </TBODY> 
                        </TABLE></TD> 
                    </TR> 
                  </TBODY> 
                </TABLE></TD> 
            </TR> 
          </TBODY> 
        </TABLE></TD> 
    </TR> 
    <TR> 
      <TD vAlign=top width="100%" bgColor=#ffffff height=26> <TABLE class=cmcc_bei_02 height=26 cellSpacing=0 cellPadding=0 
      width="100%" border=0> 
          <TBODY> 
            <TR> 
              <TD class=cmcc_bei_02 align=middle width=209 height=20> <SCRIPT language=JavaScript>         
 today=new Date();
 function initArray(){
   this.length=initArray.arguments.length
   for(var i=0;i<this.length;i++)
   this[i+1]=initArray.arguments[i]  }
   var d=new initArray(
     "星期日",
     "星期一",
     "星期二",
     "星期三",
     "星期四",
     "星期五",
     "星期六");
document.write(
     "<font color=#000000 style='font-size:9pt;'> ",
     today.getYear(),"年",
     today.getMonth()+1,"月",
     today.getDate(),"日   ",
     d[today.getDay()+1],
     "</font>" ); 
                                      </SCRIPT> </TD> 
              <TD width="28" height=20 class=cmcc_biao_01>&nbsp; </TD> 
              <TD class=cmcc_bei_02 align=left width=584 
          background=Images/Main/Top/bei_biao.gif height=20>&nbsp;</TD> 
              <TD align=left width=590 height=20><div align="right" class="font">当前用户：<%= Session["username"].ToString().Trim() %> 您的权限：<%= Session["cx"].ToString().Trim() %>  谢谢使用本系统！</div></TD> 
            </TR> 
          </TBODY> 
        </TABLE></TD> 
    </TR> 
  </TBODY> 
</TABLE> 
    </div>
    </form>
</body>
</html>
