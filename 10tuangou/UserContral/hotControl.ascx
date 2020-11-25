<%@ Control Language="C#" AutoEventWireup="true" CodeFile="hotControl.ascx.cs" Inherits="UserContral_hotControl" %>
<TABLE class="relate"  width="100%" cellSpacing="0" cellPadding="0" border="0">
	<TBODY>
		
		<TR>
<TD vAlign="top"><FONT face="宋体"></FONT><BR>
				<DIV align="center">
					<DIV id="demo" style="OVERFLOW: hidden; HEIGHT: 680px" align="center">
						<DIV id="demo1">
<asp:DataList ID="dispalyhot" runat="server">
    <ItemTemplate>
        <table>
            <tr>
                <td style="width: 100px">
                     <a href='<%# "Info.aspx?gid="+Eval("gatherId").ToString() %>'><asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("pdPhoto") %>' Width="90px" /></a> </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("productName") %>'></asp:HyperLink></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
					</DIV>
						<DIV id="demo2"><FONT face="宋体"></FONT>
						</DIV>
					</DIV>
					<SCRIPT>
var speed=30
demo2.innerHTML=demo1.innerHTML
function Marquee(){
if(demo2.offsetTop-demo.scrollTop<=0)
demo.scrollTop-=demo1.offsetHeight
else{
demo.scrollTop++
}
}
var MyMar=setInterval(Marquee,speed)
demo.onmouseover=function(){clearInterval(MyMar)}
demo.onmouseout=function(){MyMar=setInterval(Marquee,speed)}
					</SCRIPT>
				</DIV>
							</TD>
		</TR>
	</TBODY>
</TABLE>