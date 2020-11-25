<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_gmaptsai" %>

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
            width: 183px;
            height: 24px;
            font-size: x-large;
            font-weight: bold;
            color: #CC00CC;
        }
        .style8
        {
            font-size: xx-large;
            width: 183px;
        }
        .style9
        {
            font-size: x-large;
            width: 243px;
            height: 31px;
        }
        .style15
        {
            width: 243px;
            height: 103px;
        }
        .style16
        {
            width: 243px;
        }
        .style18
        {
            width: 183px;
        }
        .style24
        {
            width: 243px;
            height: 34px;
        }
        .style25
        {
            width: 243px;
            height: 24px;
        }
        
        .style27
        {
            width: 170px;
        }
        .style28
        {
            height: 24px;
            width: 170px;
        }

        .style29
        {
            width: 93px;
        }
        .style30
        {
            height: 24px;
            width: 93px;
        }

        .style38
        {
            height: 24px;
            width: 183px;
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
                <td class="style16">
                    &nbsp;</td>
                <td class="style8"   >
                    &nbsp;</td>
                  <td >
                      &nbsp;</td>
                    <td class="style27">
                        &nbsp;</td>
                    <td class="style18">
                        &nbsp;</td>
                    <td class="style29">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>   
                <td class="style3">
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
                    </td> <td colspan ="6" align="center"
                     style="font-size: x-large; color: #660066" >
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                          Width="750px" GridLines =None AllowPaging="True" 
                          onpageindexchanging="GridView1_PageIndexChanging1" PageSize="4">
                          <Columns>
                              <asp:HyperLinkField DataTextField="title" DataNavigateUrlFields="id" 
                                  DataNavigateUrlFormatString="newsdetail.aspx?id={0}" />
                          </Columns>
                      </asp:GridView>
                </td>
              

                <td>
                    &nbsp;</td>

            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td >
                                        
                </td>
                <td class="style27">
                    &nbsp;</td>
                <td>                    
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style29">
                    &nbsp;</td>
                    <td></td>
                    <td></td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style18">
                                                                                                                                                                <p>
                                                                                                                                                                    &nbsp;</p>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style18">
                                        <p>
                                            &nbsp;</p>
                </td>
                <td class="style29">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style28">
                    </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style30">
                    &nbsp;</td>
                <td class="style5">
                    </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style25">
                    </td>
                <td>
         
                    &nbsp;</td>
                <td class="style28">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>

                <td class="style38">
                    </td>
                <td class="style30">
                    &nbsp;</td>
                    <td></td>
                    <td></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style3">
                    <p>
                        &nbsp;</p>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style18">
                                        <p>
                                            &nbsp;</p>
                </td>
                <td class="style29">
                    &nbsp;</td>
                <td>
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
