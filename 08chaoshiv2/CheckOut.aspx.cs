using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CheckOut : System.Web.UI.Page
{
    public static float TM = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int MemberID = Convert.ToInt32(Session["MemberID"].ToString());
            float TotalMoney = BuyCar.GetTotalMoney(MemberID);
            TM = TotalMoney;
            if (TM <= 30)
            {
                TM += 3;
                this.Label1.Text = TM.ToString() + "（含3配送费）";
            }
            else { 
            this.Label1.Text = TM.ToString();
            }



        } 
    } 


    protected void btnSave_Click(object sender, EventArgs e)
    {/*
         * 1：将生成的信息写入订单表tb_Order，同时得到 * 2：得到订单编号
         * 3：将订单中的商品信息从tb_BuyInfo中获得写入订单明细表tb_OrderDetail
         * 4：清除当前会员在购买表tb_BuyInfo中的订购记录
         * 5；提示订单成功，关闭当前页面
         * 
         */
        int MemberID = Convert.ToInt32(Session["MemberID"].ToString());
        float TotalMoney = BuyCar.GetTotalMoney(MemberID);
        TM = TotalMoney;
        string PayType = ddlPayType.Text;    //支付方式
        string IsPayed = "否";                                //是否支付设置为“否”
        string ReceiverName = txtReciverName.Text.Trim();
        string ReceiverTel = txtReceiverPhone.Text.Trim();
        string Address = txtReceiverAddress.Text.Trim();
        string Code = txtReceiverPostCode.Text.Trim();
        string Email = txtReceiverEmails.Text.Trim();
        int OrderID = BuyCar.SaveOrder(MemberID, TotalMoney, PayType, IsPayed, ReceiverName, ReceiverTel, Address, Code, Email);//保存订单，生成订单编号

        //得到当前会员订购的商品信息，以便写入订单详细表
        DataSet ds = BuyCar.GetGoodsByMemberID(MemberID);

        //将购物信息（ds）写入订单明细表
        BuyCar.Write_tb_OrderDetail(ds, OrderID);

        //从tb_BuyInfo中删除当前会员的购物信息
        BuyCar.DeleteShopCarByMemberID(MemberID);
      
        //提示购物成功，关闭当前页
        
        Response.Write("<script language='javascript'>alert('购物成功！');window.navigate('Default.aspx');</script>");
      //  Response.Write("<script>document.location=document.location;</script>");//执行后当前页面字体会变大,解决办法是加入当前这句代码
    } 
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    } 
 
} 