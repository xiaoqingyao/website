<%@ Page Language="C#" MasterPageFile="~/zt.master" AutoEventWireup="true" CodeFile="ProInfo1.aspx.cs" Inherits="ProInfo" Title="产品信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style  type ="text/css">
#LinkButton1 a:hover
{
	 color :Black ;}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="in_t_l">
         <div class="in_t_l_s">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="in_t_l_sa"></asp:TextBox><a href="#"><img src="images/search_right1.gif" style="margin-bottom:-4px;" /></a>
         </div>
         <div class="pro_ys"><img src="images/1267550468552885369.gif" /></div>
        <div class="cate_leader_y">
                <a class="x1" href="#" 
            onfocus="this.blur()"></a>
                <a class="x4" href="#" 
            onfocus="this.blur()"></a>
                <a class="x3" href="#" 
            onfocus="this.blur()"></a>
                <a class="x9" href="#" 
            onfocus="this.blur()"></a>
                <a class="x8" href="#" 
            onfocus="this.blur()"></a>
                <a class="x2" href=#" 
            onfocus="this.blur()"></a>
                <a class="x5" href="#" 
            onfocus="this.blur()"></a>
                <a class="x6" href="#" 
            onfocus="this.blur()"></a>
                <a class="x7" href="#" 
            onfocus="this.blur()"></a>
                <a class="x10" href="#" 
            onfocus="this.blur()"></a>
                <a class="x11" href="#" 
            onfocus="this.blur()"></a>
                <a class="x12" href="#" 
            onfocus="this.blur()"></a>
                <a class="x13" href="#" 
            onfocus="this.blur()"></a>
                <a class="x14" href="#" 
            onfocus="this.blur()"></a>
        </div> 
    </div>
    <div class="pro_r">
        <div class="info_t_t"></div>
        <div class="info_t_b">
            <div class="info_t_b_l">
                <img src="images/11941S12_H_4.jpg" />
            </div>
            <div class="info_t_b_r">
               <div>cotton coat ㊣ 薄棉铺棉带帽长款棉衣</div>
               <div>
                    <table class="table_detail">
                       <tbody>
                            <tr>
                                 <th width="60">编号：</th>
                                 <td width="300">11941S12</td>
                            </tr>
                            <tr>
                                  <th>价格：</th>
                                  <td>￥329.00元</td>
                            </tr>
                                  				                                  
                             <tr>
                                  <th>材质：</th>
                                  <td>100%棉</td>
                             </tr>
                              <tr>
                                   <th valign="top">颜色：</th>           
                                   <td valign="top">
                                        <span class="alert">请选择颜色！</span>
                                    </td>
                              </tr>   
							<tr>
                                 <th></th>
                                 <td style="color: rgb(217, 157, 183);">颜色以服装单品图为准</td>
                             </tr>   
                             <tr>
                                 <th valign="top">尺码：</th>
                                 <td valign="top">
                                    <div class="size_select">
                                                                        
                                        <dl><a onfocus="this.blur()" href=""><font>XS</font><span></span></a>
                                            <dt></dt>
                                        </dl>
                                        <dl><a onfocus="this.blur()" href=""><font>S</font><span></span></a>
                                             <dt></dt>
                                        </dl>
                                        <dl><a onfocus="this.blur()" href=""><font>M</font><span></span></a>
                                             <dt></dt>
                                        </dl>
                                        <dl><a onfocus="this.blur()" href=""><font>L</font><span></span></a>
                                             <dt></dt>
                                        </dl>
                                         <span class="alert">请选择尺码！</span> 
                                     
                                     </div>
                                   
                                   </td>
                             </tr>
                             <tr  style="visibility: hidden; color: rgb(236, 101, 159);">
                                <th style="color: rgb(236, 101, 159);">已选择：</th>
                                   <td>
	                                  <input id="showGoodSizeValue" name="spec_218" value="" type="hidden"> 
	                                  <input id="showGoodColorValue" name="spec_220" value="" type="hidden">
	                                  <span id="showGoodColorName" style="padding-right: 10px;"></span>
	                                  <span id="showGoodSizeName"></span>
                                   </td>
                              </tr>           
                    </tbody></table>
               </div>
                 <div class="submit">
                       <div class ="button_01" style =" float :left ">
                                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">加入购物车</asp:LinkButton></div>  
                            <a href="" class="button_02">加入收藏夹</a>
                            </div>                
            </div>
        </div>
        <div class="info_t_f"></div>
        <div class="clear"></div>
        <div class="goods_info">本季的秋冬女装似乎没有以往那么妖娆、性感。自然、硬朗的中性风格成为本季主打款之一。帅气且易于搭配的风衣系列一贯都是时尚界的宠儿。<br><br>此款长款棉外套，秋冬季必备的时髦单品。多且宽大口袋的设计实用兼具跳跃感，后背部分的褶皱和连帽的款型，让你的背影也不显的单调乏味。百搭、保暖、拗造型，没有比它更适合这个多变的秋冬季了，说着说着连自己都心动了哦！</div>	
        <div style="text-align:center">
            <img src="images/11941S12_A_1.jpg" /><br /><img src="images/11941S12_A_2.jpg" /></div>	
    </div>
     <div class="clear"></div>
</asp:Content>

