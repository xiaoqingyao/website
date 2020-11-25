<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help" ValidateRequest="false" %> 

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
     
                    <asp:Panel ID="Panel3" runat="server" Height="800px">
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:Image ID="Image4" runat="server" Height="31px" 
                                        ImageUrl="~/images/购物帮助.jpg" Width="583px" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        1、搜索商品 当当网为您提供了方便快捷的商品搜索功能： （1）您可以通过在首页输入关键字的方法来搜索您想要购买的商品 
                        （2）您还可以通过当当的分类导航栏来找到您想要购买的商品分类，根据分类找到您的商品 （3）观看 搜索商品 演示 2、放入购物车 
                        在您想要购买的商品的详情页点击“购买”，商品会添加到您的购物车中；您还可以继续挑选商品放入购物车，一起结算。 
                        （1）在购物车中，系统默认每件商品的订购数量为一件，如果您想购买多件商品，可修改购买数量 （2）在购物车中，您可以将商品 移至收藏 ，或是选择删除 
                        （3）在购物车中，您可以直接查看到商品的优惠折和参加促销活动的商品名称、促销主题 
                        （4）购物车页面下方的商品是当当网根据您挑选的商品为您作出的推荐，若有您喜爱的商品，点击“放入购物车”即可 温馨提示： 
                        （1）商品价格会不定期调整，最终价格以您提交订单后订单中的价格为准 
                        （2）优惠政策、配送时间、运费收取标准等都有可能进行调整，最终成交信息以您提交订单时网站公布的最新信息为准 
      
                                     </asp:Panel>
                                   
</asp:Content>

