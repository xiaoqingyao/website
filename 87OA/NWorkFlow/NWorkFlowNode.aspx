<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NWorkFlowNode.aspx.cs" Inherits="NWorkFlow_NWorkFlowNode" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
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
            for(var i=0;i<window.document.forms['form1'].elements.length;i++)
               {                
                  var e = form1.elements[i];
                  e.checked =false;                  
               }
               a=0;
           }       
           else
           {
                for(var i=0;i<window.document.forms['form1'].elements.length;i++)
               {                
                  var e = form1.elements[i];
                  e.checked =true;                  
               }
               a=1;
           }     
         }
           function CheckDel(){
             var number=0;
             for(var i=0;i<window.document.forms['form1'].elements.length;i++)
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
             for(var i=0;i<window.document.forms['form1'].elements.length;i++)
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;节点定义 &nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Underline="True" Text="流程名称："></asp:Label></td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <span style="color: #cccccc">*右键单击空白页面新建节点</span>&nbsp; 【<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="Red">列表显示模式</asp:LinkButton>】&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/Button/BtnAdd.jpg" ImageAlign="AbsMiddle" OnClick="ImageButton1_Click" />
                    <asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="AbsMiddle" ImageUrl="../images/Button/BtnModify.jpg"
                        OnClick="ImageButton5_Click" OnClientClick="javascript:return CheckModify();" />
                    <asp:ImageButton ID="ImageButton3" runat="server" OnClientClick="javascript:return CheckDel();" ImageUrl="../images/Button/BtnDel.jpg" ImageAlign="AbsMiddle" OnClick="ImageButton3_Click" />   
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../images/Button/BtnReport.jpg" ImageAlign="AbsMiddle" OnClick="ImageButton2_Click" /><img src="../images/Button/JianGe.jpg" /><img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
        </table>
        
    </div>
    
    <asp:Panel ID="Panel1" runat="server" Height="50px" Width="100%" Visible="False">
        <table style="width: 100%">
            <tr>
            <td ><asp:GridView ID="GVData" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                    BorderStyle="Groove" BorderWidth="1px" OnRowDataBound="GVData_RowDataBound" PageSize="15"
                    Width="100%">
                    <PagerSettings Mode="NumericFirstLast" Visible="False" />
                    <PagerStyle BackColor="LightSteelBlue" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#DEDEDE" Font-Size="12px" ForeColor="Black" Height="20px" /><AlternatingRowStyle BackColor="WhiteSmoke" />
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
					<asp:TemplateField HeaderText="节点名称"> <ItemTemplate> <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True" NavigateUrl='<%# "NWorkFlowNodeView.aspx?ID="+ DataBinder.Eval(Container.DataItem, "ID")%>'><%# DataBinder.Eval(Container.DataItem, "NodeName")%></asp:HyperLink> </ItemTemplate>   <ItemStyle HorizontalAlign="Left" />  </asp:TemplateField> 
					<asp:BoundField DataField="NodeSerils" HeaderText="节点序号" ></asp:BoundField>     					
					<asp:BoundField DataField="NodeAddr" HeaderText="节点位置" ></asp:BoundField>     
					<asp:BoundField DataField="NextNode" HeaderText="下一结点" ></asp:BoundField>  
					
						<asp:TemplateField HeaderText="相关操作"><ItemTemplate>
                        
                        【<asp:HyperLink ID="HyperLink10" runat="server" Font-Underline="True" NavigateUrl='<%# "SetNodeWrite.aspx?WorkFlowID="+ DataBinder.Eval(Container.DataItem, "WorkFlowID")+"&ID="+DataBinder.Eval(Container.DataItem, "ID") %>' ForeColor="Blue">可写设置</asp:HyperLink>】
                        【<asp:HyperLink ID="HyperLink11" runat="server" Font-Underline="True" NavigateUrl='<%# "SetNodeSecret.aspx?WorkFlowID="+ DataBinder.Eval(Container.DataItem, "WorkFlowID")+"&ID="+DataBinder.Eval(Container.DataItem, "ID") %>' ForeColor="Blue">保密设置</asp:HyperLink>】
                        【<asp:HyperLink ID="HyperLink12" runat="server" Font-Underline="True" NavigateUrl='<%# "SetNodeCondition.aspx?WorkFlowID="+ DataBinder.Eval(Container.DataItem, "WorkFlowID")+"&ID="+DataBinder.Eval(Container.DataItem, "ID") %>' ForeColor="Blue">条件设置</asp:HyperLink>】
                        
                        </ItemTemplate></asp:TemplateField>
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
                <asp:ImageButton ID="ButtonGo" runat="server" OnClientClick="javascript:return CheckValuePiece();"  ImageUrl="../images/Button/Jump.jpg" OnClick="ButtonGo_Click" /></td>
        </tr>
        </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Height="100%" Width="100%" >
        <IFRAME name="ShowForm" frameBorder="0" marginHeight="0" marginWidth="0" Height="440px" width="100%" src="ShowWorkFlow.aspx?WorkFlowID=<%=Request.QueryString["WorkFlowID"].ToString() %>" border="0"></IFRAME>
            </asp:Panel>
            
            <asp:TextBox ID="FlowNumber" runat="server" style="DISPLAY: none"></asp:TextBox>
    </form>
</body>
</html>
