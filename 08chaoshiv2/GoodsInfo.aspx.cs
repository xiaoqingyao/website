﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class GoodsInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            string  sql = "select   * from tb_Goods order by AddDate desc ";
            DataSet result = DBHelper.GetDataSet(sql);
            this.WebPager1.DataSource = result.Tables[0];
            this.WebPager1.DataBind();    
            

           
             
         
        } 
    } 


    protected void dlstGoods_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "detail")
        {
            //获得当前商品编号
            Int32 id = Int32.Parse(dlstGoods.DataKeys[e.Item.ItemIndex].ToString());
            //在新窗口中弹出商品详细信息页面
            Response.Redirect("goodsdetail.aspx?goodsid=" + id);
        } 
        else if (e.CommandName == "buy")
        {
            //当前用户是否登陆? 只有登陆用户才可以购物
            if (Session["MemberName"] != null)
            {


                int goodsid = Int32.Parse(dlstGoods.DataKeys[e.Item.ItemIndex].ToString());
                float price = BuyCar.GetPriceByGoodsID(Int32.Parse(dlstGoods.DataKeys[e.Item.ItemIndex].ToString()));
                //添加商品到表tb_BuyInfo
                BuyCar.AddShopCart(goodsid, price, Int32.Parse(Session["MemberID"].ToString()), 1);
                //提示添加成功
                Response.Write("<script>alert('恭喜您，添加成功！');document.location=document.location;</script>");

            } 
            else //没有登陆。提示：请先登录，谢谢合作！
            {
                Response.Write("<script>alert('请先登录，谢谢合作！');document.location=document.location;</script>");
            } 
        } 
    }
    protected void WebPager1_PageIndexChanged(object sender, wf.WebPager.PageChangedEventArgs e)
    {
        this.WebPager1.CurrentPageIndex = e.NewPageIndex;
        string sql = "select   * from tb_Goods order by AddDate desc ";
        DataSet result = DBHelper.GetDataSet(sql);

        this.WebPager1.DataSource = result.Tables[0];
        this.WebPager1.DataBind();  
    }
} 