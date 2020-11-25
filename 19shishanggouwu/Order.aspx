<%@ Page Language="C#" MasterPageFile="~/AccountCenter.master" EnableEventValidation="false"  AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" Title="我的订单" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="user_right_body">


     <div class="tit"><span>我的订单</span></div>
        <div class="main" style =" ">
          <table class="table center tab_x1">
            <tbody><tr class="tr_h">
              <td class="tab_l_width">订单号</td>
              <td>下单时间</td>
              <td>订单总金额</td>
              <td>订单状态</td>
              <td>操作</td>
            </tr>
               <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
            <tr class="tr_h">
              <td class="tab_l_width">
                  <a href ='orderdetail.aspx?ordernum=<%#Eval("_ordernum")%>'><%#Eval("_ordernum")%></a></td>
              <td><%#Eval("_ordertime")%></td>
              <td><%#Eval("_sumprice")%></td>
              <td><%#Eval("_prostate")%></td>
              <td>
                  <asp:ImageButton ID="ImageButton1" runat="server" 
                      ImageUrl="~/images/delete.gif" onclick="ImageButton1_Click" 
                      oncommand="ImageButton1_Command" CommandName="Delete"  CommandArgument='<%#Eval("_id")%>'/></td>
            </tr>
           </ItemTemplate>
            </asp:Repeater>
            </tbody></table>
             <div style="text-align:center;">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="True" 
                CssClass="paginator" CurrentPageButtonClass="cpb" FirstPageText="首页" 
                LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" 
                    onpagechanging="AspNetPager1_PageChanging">
            </webdiyer:AspNetPager>
        </div>
        
        </div>

    </div>
</asp:Content>

