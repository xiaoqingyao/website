using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

public partial class ShopCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MemberName"] == null)
            {
                Response.Write("<script language='javascript'>alert('请先登录！');location='javascript:history.go(-1)';</script>");
            } 
            else
            {
                gvShopCarBindData();
            } 
        } 
    } 
   private void gvShopCarBindData()
    {
        BuyCar.CarBind(this.gvShopCar, Int32.Parse(Session["MemberID"].ToString())); //调用静态函数

        //根据gvOrderInfo中记录个数判定lbFlag等控件是否显示，以提示用户是购物车中否有商品,控制商品总价钱和总数量，超级链接按钮是否显示。
        if (gvShopCar.Rows.Count >= 1)
        {
            lbFlag.Visible = false;
            DataSet ds = BuyCar.TotalMoneyNum(Int32.Parse(Session["MemberID"].ToString()));
            lbSumNum.Text = ds.Tables[0].Rows[0][0].ToString();
            lbSumPrice.Text = ds.Tables[0].Rows[0][1].ToString();
        } 
        else
        {
            lbFlag.Visible = true;
            lbSumPrice.Text = "0";
            lbSumNum.Text = "0";
            LinkBtKeepBuy.Visible = false;
            LinkBtCheck.Visible = false;
            LinkBtClear.Visible = false;
        }           
    } 


    /// 数据绑定gvShopCar时候触发，高亮度显示指定行
    protected void gvShopCar_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //高亮显示指定行
            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#FFFFC0'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
        } 
    } 
    protected void gvShopCar_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvShopCar.PageIndex = e.NewPageIndex;
        gvShopCarBindData();
    } 


    protected void gvShopCar_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        /*
        * 删除前的判定是否确认删除_客户端js完成
        * 从表中删除指定会员、指定购物编号的购物记录
        * 删除后重新绑定
        * 
        */
        int BuyID = Convert.ToInt32(gvShopCar.DataKeys[e.RowIndex].Value.ToString());
        BuyCar.DelShopCarByMemberID(Convert.ToInt32(Session["MemberID"].ToString()), BuyID);
        gvShopCarBindData();
    } 


    protected void gvShopCar_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvShopCar.EditIndex = e.NewEditIndex;//购物车中的记录行号，从0开始
        gvShopCarBindData();//是否必要？？？？？？？？？
    } 


    //当有商品数量发生变化的时候，更新购买商品的总数量
    protected void gvShopCar_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int BuyID = Convert.ToInt32(gvShopCar.DataKeys[e.RowIndex].Value.ToString());
        int Num = Convert.ToInt32(((TextBox)(gvShopCar.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString());

        if (IsValidNum(Num.ToString()) == true)
        {
            BuyCar.UpdateShopCarGoodsNum(Convert.ToInt32(Session["MemberID"].ToString()), BuyID, Num);// 更新购物车中对应商品的数量。
            gvShopCar.EditIndex = -1;
            gvShopCarBindData();
        } 
        else
        {
            gvShopCar.EditIndex = -1;
            gvShopCarBindData();            
        } 
    } 


    //判断修改的数据是否为有效的数据--可以直接抛给学生
    public bool IsValidNum(string num)
    {
        return Regex.IsMatch(num, @"^\+?[1-9][0-9]*$");
    } 
    protected void LinkBtClear_Click(object sender, EventArgs e)
    {
        BuyCar.DeleteShopCarByMemberID(Convert.ToInt32(Session["MemberID"].ToString()));
        gvShopCarBindData();
    } 
    protected void LinkBtKeepBuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    } 
    protected void LinkBtCheck_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkout.aspx");
    } 
} 