<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PersonalManager.aspx.cs" Inherits="PersonalManager" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc1" %>
<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
  <link href="style/default.css" rel="stylesheet" type="text/css" />
  <base target="_self "/>
<script language="javascript" type="text/javascript">
// <!CDATA[

function Iframe2_onclick() {

}

// ]]>
</script>
</head>
<body style="margin-top:0; text-align:center">
    <form id="form1" runat="server">
    <center>
       <table cellpadding="0" cellspacing="0" width="770" style="background-color: #ffffff">
            <tr>
              
                <td style="height: 139px">
                    <uc2:top ID="Top2" runat="server" />
                </td>
            </tr>
            <tr>
              
                <td style="height: 36px; background-image: url(../Image/5.jpg);">
                    您当前的位置是：个人资料管理首页 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp;&nbsp;
                    
                </td>
            </tr>
            <tr>
            
                <td><table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 133px; vertical-align: top; text-align: left;">
                        <table style="width: 200px" cellpadding="0" cellspacing="0">
    <tr>
        <td>
                        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #ffffff">
                                    <tr>
                                        <td style="width: 12px; height: 33px; background-image: url(../Image/2t.jpg);">
                                        </td>
                                        <td style="background-image: url(../Image/5t.jpg); width: 753px; font-weight: bold; color: #ffffff; text-align: left;">
                                            个人管理&lt;&lt;</td>
                                        <td style="background-image: url(../Image/3t.jpg); width: 15px; height: 33px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(../Image/1t.jpg); height: 114px; width: 12px;">
                                        </td>
                                        <td style="height: 114px">
                                           <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 8px; height: 8px">
                                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/box2_01.gif" /></td>
                                                <td style="background-image: url(../Image/box2_02.gif); width: 764px; height: 8px">
                                                </td>
                                                <td style="height: 8px;">
                                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Image/box2_03.gif" /></td>
                                            </tr>
                                            <tr>
                                                <td style="background-image: url(Image/box2_04.gif); height: 179px" >
                                                </td>
                                                <td style="height: 179px;vertical-align: top; text-align: left;" >
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                           
                                                            <td  style="height: 26px; font-weight: bold; font-size: 11px; color: dimgray; background-image: url(Image/title_bg_quit.gif);" >
                                                                &nbsp; &nbsp; &nbsp;
                                                                <asp:HyperLink ID="hlGatherIndex" runat="server"  NavigateUrl="~/Default.aspx">团购首页</asp:HyperLink></td>
                                                           
                                                        </tr>
                                                      <tr>
                                                          &nbsp; &nbsp; &nbsp; &nbsp;
                                                          <asp:Label ID="lblPerName" runat="server"></asp:Label><td  style="height: 25px; font-weight: bold; font-size: 11px; color: dimgray; background-image: url(Image/title_bg_quit.gif);" >
                                                                &nbsp; &nbsp; &nbsp;
                                                                <asp:HyperLink ID="hlAddperGather" runat="server" Target="Right" NavigateUrl="~/AddPerGather.aspx">发起团购</asp:HyperLink></td>
                                                           
                                                        </tr>
                                                      <tr>
                                                           
                                                            <td  style="height: 25px; font-weight: bold; font-size: 11px; color: dimgray; background-image: url(Image/title_bg_quit.gif);" >
                                                                 &nbsp; &nbsp; &nbsp; &nbsp;
                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UpdatePassword.aspx"
                                                                    Target="Right">修改密码</asp:HyperLink></td>
                                                           
                                                        </tr>
                                                          <tr>
                                                           
                                                            <td  style="height: 25px; font-weight: bold; font-size: 11px; color: dimgray; background-image: url(../Image/title_bg_quit.gif);" >
                                                                  &nbsp; &nbsp; &nbsp;
                                                                <asp:HyperLink ID="hlOrder" runat="server" Target="Right" NavigateUrl="~/Order.aspx">我的订单记录</asp:HyperLink></td>
                                                           
                                                        </tr>
                                                          <tr>
                                                           
                                                            <td  style="height: 25px; font-weight: bold; font-size: 11px; color: dimgray; background-image: url(Image/title_bg_quit.gif);" >
                                                                  &nbsp; &nbsp; &nbsp;
                                                                <asp:HyperLink ID="hlUpdateDetails" runat="server" Target="Right" NavigateUrl="~/UpdateDetails.aspx">修改个人资料</asp:HyperLink></td>
                                                           
                                                        </tr>
                                                          <tr>
                                                           
                                                            <td  style="height: 23px; font-weight: bold; font-size: 11px; color: dimgray; background-image: url(Image/title_bg_quit.gif);" >
                                                                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/PerGatherMgr.aspx"
                                                                    Target="Right">发起团购记录</asp:HyperLink>
                                                            </td>
                                                           
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="background-image: url(../Image/box2_05.gif); height: 179px" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 8px">
                                                    <asp:Image ID="Image7" runat="server" ImageUrl="~/Image/box2_06.gif" /></td>
                                                <td style="background-image: url(../Image/box2_07.gif); height: 8px;">
                                                </td>
                                                <td style="height: 8px">
                                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Image/box2_08.gif" /></td>
                                            </tr>
                                        </table>
                                        </td>
                                        <td style="background-image: url(../Image/4t.jpg); height: 114px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 12px; height: 14px; background-image: url(../Image/6t.jpg);">
                                        </td>
                                        <td style="background-image: url(../Image/7t.jpg); height: 14px;">
                                        </td>
                                        <td style="background-image: url(../Image/8t.jpg); height: 14px;">
                                        </td>
                                    </tr>
                                </table>
        </td>
      
    </tr>
    <tr>
        <td style="height: 165px">
        </td>
   
    </tr>
    <tr>
        <td style="height: 19px">
        </td>
     
    </tr>
     <tr>
        <td>
        </td>
     
    </tr>
     <tr>
        <td>
        </td>
     
    </tr>
      <tr>
        <td>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/webtel02.jpg" /></td>
     
    </tr>
</table>
                            
                        </td>
                        <td style="vertical-align: top; text-align: left">
                          <table width="100%" cellpadding="0" cellspacing="0">
                               
                                <tr>
                                    <td>
                                     <iframe width="100%"   name="Right" id="Iframe2" height="100%"  frameborder="0" scrolling="auto" src="#" style="height: 700px; background-color: white;" onclick="return Iframe2_onclick()" ></iframe>
                                    </td>
                                  
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 133px">
                        </td>
                        <td>
                        </td>
                    </tr>
                  
                </table>
                </td>
            </tr>
            <tr>
              
                <td>
                    <uc1:Bootom ID="Bootom1" runat="server" />
                </td>
            </tr>
        </table>
    </center>
    </form>
</body>
</html>