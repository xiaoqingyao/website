using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class seeorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MemberID"] == null)
            {
                return;
            } 

            string sql = "SELECT distinct dbo.tb_Order.OrderID, dbo.tb_Order.TotalMoney, dbo.tb_Order.OrderDate, dbo.tb_Order.OrderState, dbo.tb_Order.PayType,dbo.tb_Order.IsPayed, dbo.tb_Order.ReceiverName, dbo.tb_Order.ReceiverTel, dbo.tb_Order.Address, dbo.tb_Order.Code, dbo.tb_Order.Email,dbo.tb_Member.MemberName, dbo.tb_Order.MemberID FROM dbo.tb_Order, dbo.tb_Member  where  tb_Order.MemberID=tb_Member.MemberID and dbo.tb_Order.MemberID = " + Int32.Parse(Session["MemberID"].ToString()) + " ORDER BY dbo.tb_Order.OrderDate DESC";
            BindData(sql);
         
        } 
    } 

    private void BindData(string sql)
    {

        DataSet ds = DBHelper.GetDataSet(sql);
        
        this.gvOrderList.DataSource = ds.Tables[0].DefaultView;
        gvOrderList.DataBind();
    } 


    protected void gvOrderList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrderList.PageIndex = e.NewPageIndex;
        string sql = "SELECT distinct dbo.tb_Order.OrderID, dbo.tb_Order.TotalMoney, dbo.tb_Order.OrderDate, dbo.tb_Order.OrderState, dbo.tb_Order.PayType,dbo.tb_Order.IsPayed, dbo.tb_Order.ReceiverName, dbo.tb_Order.ReceiverTel, dbo.tb_Order.Address, dbo.tb_Order.Code, dbo.tb_Order.Email,dbo.tb_Member.MemberName, dbo.tb_Order.MemberID FROM dbo.tb_Order, dbo.tb_Member  where  tb_Order.MemberID=tb_Member.MemberID and dbo.tb_Order.MemberID = " + Int32.Parse(Session["MemberID"].ToString()) + " ORDER BY dbo.tb_Order.OrderDate DESC";
        BindData(sql);
    } 
    protected void gvOrderList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    } 
} 