<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_vdvnzxsk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .style3
        {
            width: 241px;
        }
        .style4
        {
            width: 260px;
            height: 103px;
        }
        .style5
        {
            height: 24px;
        }
        .style6
        {
            width: 110px;
            height: 24px;
            font-size: x-large;
            font-weight: bold;
            color: #CC00CC;
        }
        .style9
        {
            font-size: x-large;
            width: 114px;
            height: 31px;
        }
        .style15
        {
            width: 114px;
            height: 103px;
        }
        .style16
        {
            width: 114px;
        }
      
        .style19
        {
            width: 209px;
        }
      
        .style20
        {
            width: 62px;
        }
        .style23
        {
            width: 164px;
        }
        .style24
        {
            width: 163px;
        }
        .style25
        {
            width: 162px;
        }
        .style26
        {
            width: 148px;
        }
        .style27
        {
            width: 110px;
        }
        .style29
        {
            height: 24px;
            width: 59px;
        }
        .style30
        {
            height: 24px;
            width: 64px;
        }
        .style31
        {
            height: 24px;
            width: 112px;
        }
        .style32
        {
            width: 112px;
        }
      
        </style>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style15">
                    </td>
                <td colspan ="6" bgcolor="#333399" 
                    style="font-size: xx-large; font-weight: 900; color: #FFFFFF"#FFFFFF"" align="center">
                    新闻发布</td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td class="style19"   >
                    &nbsp;</td>
                  <td class="style23"  >
                      &nbsp;</td>
                    <td class="style26" >
                        &nbsp;</td>
                    <td class="style27" >
                        &nbsp;</td>
                    <td >
                        &nbsp;</td>
                    <td class="style32">
                        &nbsp;</td>   
                <td >
                    &nbsp;</td>
            </tr>
            <tr style="border-style: double; border-width: inherit; ">
                <td class="style16">
                    &nbsp;</td>
                    <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href =main.aspx>首页|</a></td>
                     <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href =yule.aspx>娱乐|</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href =jingji.aspx>经济</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                  <a href =  keji.aspx>科技</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                   <a href = shenghuo.aspx>生活</a></td>
                <td style="color: #0000FF; font-weight: 600; font-size: x-large"
                class="style27" bgcolor="#9933FF">
                    <a href ="luntan.aspx"><a href =luntan.aspx>论坛|</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    </td> 
                <td class="style20" colspan ="6" 
                    style="font-size: x-large; color: #660066; font-weight: 800;" 
                    align="center" >
                      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" GridLines =None>
                          <Columns>
                              <asp:HyperLinkField DataTextField="title" />
                          </Columns>
                      </asp:GridView>
                      <td></td>
                      </tr>
                      <tr>
                     <td >
                     </td>  
                     <td class="style19" >               
                         &nbsp;</td>   
                <td class="style23" >
                    &nbsp;</td>

            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td  colspan="6">
                                        
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                          Width="713px" GridLines =None>
                          <Columns>
                              <asp:HyperLinkField DataTextField="body" />
                          </Columns>
                      </asp:GridView>
                                        
                </td>
                    <td></td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style19">
                                                                                                                                                                <p>
                                                                                                                                                                    &nbsp;</p>
                </td>
                <td class="style23">
                    &nbsp;</td>
                <td class="style26">
                    &nbsp;</td>
                <td class="style27">
                                        <p>
                                            &nbsp;</p>
                </td>
                <td class="style29">
                    &nbsp;</td>
                <td class="style32">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    </td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style23">
                    &nbsp;</td>
                <td class="style26">
                    </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style30">
                    &nbsp;</td>
                <td class="style31">
                    </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style25">
                    </td>
                <td class="style19">
         
                    &nbsp;</td>
                <td class="style23">
                    &nbsp;</td>
                <td class="style26" >
                    &nbsp;</td>

                <td class="style27">
                    </td>
                <td class="style30">
                    &nbsp;</td>
                    <td class="style32"></td>
                    <td></td>
                <td>
                    nn            nn</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style19">
                    <p>
                        &nbsp;</p>
                </td>
                <td class="style23">
                    &nbsp;</td>
                <td class="style26">
                    &nbsp;</td>
                <td class="style27">
                                        <p>
                                            &nbsp;</p>
                </td>
                <td class="style29">
                    &nbsp;</td>
                <td class="style32">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style24">
                </td>
                <td  colspan =6 bgcolor="#333399" align="center" style="color: #FFFFFF">
                鄂ICP备07017567 Copyright @ 2011新闻网 All Rights Reserved 
                  <a href="admlogin.aspx" style="color: #FF0000">  [管理入口]</a></td>
                <td class="style3">
                    </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
