<%@ Page Language="C#" MasterPageFile="~/AccountCenter.master" AutoEventWireup="true" CodeFile="ACIndex.aspx.cs" Inherits="ACIndex" Title="会员中心" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="user_right_body">
   <div class="tit"><span>会员中心首页</span></div>
         <div class="main">
               <div class="welcome">
                  <div class="user_name">
                  <div><span></span> 欢迎您：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
                  <div>光临&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FashionMall</div>
                  </div>
                  <div class="last_time">您的上一次登录时间: 
                      <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label> </div>
                  <div class="submit"><div class="bg_01"><div class="bg_02">购物情况：您最近30天内提交了0个订单</div></div></div>
                  <div class="hi">您可以参加活动获取优惠</div>
                  <div class="hi">您可以获得积分购物</div>
                  <div class="hi">您可以关注本站相关娱乐新闻</div>
               </div>                
        </div>
</div>        
</asp:Content>

