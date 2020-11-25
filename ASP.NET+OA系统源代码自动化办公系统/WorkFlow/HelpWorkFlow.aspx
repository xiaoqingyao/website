﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HelpWorkFlow.aspx.cs" Inherits="WorkFlow_HelpWorkFlow" %>
<html>
	<head>
		<title>企业OA综合管理平台</title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<SCRIPT LANGUAGE="JavaScript">
		  		  var a;    
          function CheckValuePiece(){
           if(window.document.form1.GoPage.value == "")
            {
              alert("请输入跳转的页码！");
              window.document.form1.GoPage.focus();
              return false; 
            }
           return true;
           }
           function CheckAll(){            
            if(a==1)
            {
            for(var i=0;i<window.document.form1.elements.length;i++)
               {                
                  var e = form1.elements[i];
                  e.checked =false;                  
               }
               a=0;
           }       
           else
           {
                for(var i=0;i<window.document.form1.elements.length;i++)
               {                
                  var e = form1.elements[i];
                  e.checked =true;                  
               }
               a=1;
           }     
         }
           function CheckDel(){
             var number=0;
             for(var i=0;i<window.document.form1.elements.length;i++)
               {
                  var e = form1.elements[i];
                  if (e.Name != "CheckBoxAll")
                  {
                    if(e.checked==true)
                    {
                        number=number+1;
                    }
                  }
               }
               if(number==0)
                {
                  alert("请选择需要删除的项！");
                  return false;
                }
               if (window.confirm("你确认删除吗？"))
				{
				  return true;
				}
				else
				{
				  return false;
				}
             } 
             
             function CheckModify(){
             var Modifynumber=0;
             for(var i=0;i<window.document.form1.elements.length;i++)
               {
                  var e = form1.elements[i];
                  if (e.Name != "CheckBoxAll")
                  {
                    if(e.checked==true)
                    {
                        Modifynumber=Modifynumber+1;
                    }
                  }
               }
               if(Modifynumber==0)
                {
                  alert("请至少选择一项！");
                  return false;
                }
                if(Modifynumber>1)
                {
                  alert("只允许选择一项！");
                  return false;
                }
               
				  return true;							
             }
             
             
             
		</SCRIPT>  
<body>
    <form id="form1" runat="server">
    <div>    
     <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px; ">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;工作监控</td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    工作名称：<asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="45px"></asp:TextBox><img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPWorkToDo&LieName=WorkName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox1').value=wName;}"
                        src="../images/Button/search.gif" />
                    表单：<asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="45px"></asp:TextBox><img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPWorkToDo&LieName=FormName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox2').value=wName;}"
                        src="../images/Button/search.gif" />
                    创建人：<asp:TextBox ID="TextBox3" runat="server" Height="20px" Width="45px"></asp:TextBox><img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox3').value=wName;}"
                        src="../images/Button/search.gif" /><asp:ImageButton
                        ID="ImageButton4" runat="server" ImageAlign="AbsMiddle" ImageUrl="../images/Button/BtnSerch.jpg"
                        OnClick="ImageButton4_Click" />&nbsp; &nbsp;<asp:ImageButton ID="ImageButton3" runat="server"
                            ImageAlign="AbsMiddle" ImageUrl="../images/Button/BtnDel.jpg" OnClick="ImageButton3_Click"
                            OnClientClick="javascript:return CheckDel();" />&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../images/Button/BtnReport.jpg" ImageAlign="AbsMiddle" OnClick="ImageButton2_Click" /><img src="../images/Button/JianGe.jpg" /><img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
        </table>
        
    </div>
        <table style="width: 100%">
            <tr>
            <td ><asp:GridView ID="GVData" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                    BorderStyle="Solid" BorderWidth="1px" OnRowDataBound="GVData_RowDataBound" PageSize="15"
                    Width="100%">
                    <PagerSettings Mode="NumericFirstLast" Visible="False" />
                    <PagerStyle BackColor="LightSteelBlue" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#006599" Font-Size="12px" ForeColor="White" Height="20px" /><AlternatingRowStyle BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="LabVisible" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID")%>'
                                    Visible="False"></asp:Label><asp:CheckBox ID="CheckSelect" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle Width="20px" />
                            <HeaderTemplate>
                                <input id="CheckBoxAll" onclick="CheckAll()"  type="checkbox" />
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="工作名称">
                            <ItemTemplate>                                
                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True"
                                    NavigateUrl='<%# "WorkView.aspx?ID="+ DataBinder.Eval(Container.DataItem, "ID")%>'><%# DataBinder.Eval(Container.DataItem, "WorkName")%></asp:HyperLink>
                            </ItemTemplate>                            
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>                       
                         <asp:BoundField DataField="FormName" HeaderText="所用表单" >
                        </asp:BoundField>     
                        <asp:BoundField DataField="UserName" HeaderText="创建人" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TimeStr" HeaderText="创建时间" >
                        </asp:BoundField> 
                        <asp:TemplateField HeaderText="节点名称">
                            <ItemTemplate>                                
                                <asp:HyperLink ID="HyperLink11" runat="server" Font-Underline="True" Target="_blank" 
                                    NavigateUrl='<%# "JustShowWorkFlow.aspx?ID="+ DataBinder.Eval(Container.DataItem, "WorkFlowID")%>'><%# DataBinder.Eval(Container.DataItem, "JieDianName")%></asp:HyperLink>
                            </ItemTemplate>                            
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField> 
                        <asp:BoundField DataField="StateNow" HeaderText="当前状态" >
                        </asp:BoundField><asp:TemplateField HeaderText="强制办理">
                            <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True"
                                    NavigateUrl='<%# "WorkToDo.aspx?ID="+ DataBinder.Eval(Container.DataItem, "ID") %>' ForeColor="Blue">[强制办理]</asp:HyperLink>
                            </ItemTemplate> 
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>   
                    </Columns>
                    <RowStyle HorizontalAlign="Center" Height="25px" />
                <EmptyDataTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" style="border-right: black 1px; border-top: black 1px;
                                border-left: black 1px; border-bottom: black 1px; background-color: whitesmoke;">
                                该列表中暂时无数据！</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                </asp:GridView>
                </td>
        </tr>
        <tr>
            <td style="border-top: #000000 1px solid;border-bottom: #000000 1px solid">
                <asp:ImageButton ID="BtnFirst" runat="server" CommandName="First" ImageUrl="../images/Button/First.jpg"
                    OnClick="PagerButtonClick" />
                <asp:ImageButton ID="BtnPre" runat="server" CommandName="Pre" ImageUrl="../images/Button/Pre.jpg"
                    OnClick="PagerButtonClick" />
                <asp:ImageButton ID="BtnNext" runat="server" CommandName="Next" ImageUrl="../images/Button/Next.jpg"
                    OnClick="PagerButtonClick" />
                <asp:ImageButton ID="BtnLast" runat="server" CommandName="Last" ImageUrl="../images/Button/Last.jpg"
                    OnClick="PagerButtonClick" />
                &nbsp;第<asp:Label ID="LabCurrentPage" runat="server" Text="Label"></asp:Label>页&nbsp; 共<asp:Label
                    ID="LabPageSum" runat="server" Text="Label"></asp:Label>页&nbsp;
                <asp:TextBox ID="TxtPageSize" runat="server" CssClass="TextBoxCssUnder2" Height="20px"
                    Width="35px">15</asp:TextBox>
                行每页 &nbsp; 转到第<asp:TextBox ID="GoPage" runat="server" CssClass="TextBoxCssUnder2"
                    Height="20px" Width="33px"></asp:TextBox>
                页&nbsp;
                <asp:ImageButton ID="ButtonGo" runat="server" OnClientClick="javascript:return CheckValuePiece();"  ImageUrl="../images/Button/Jump.jpg" OnClick="ButtonGo_Click" />
                </td>
        </tr>
        </table>
    </form>
</body>
</html>