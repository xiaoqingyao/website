using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_orderlist : System.Web.UI.Page
{
    private static string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sql = "SELECT dbo.tb_Order.OrderID, dbo.tb_Order.TotalMoney, dbo.tb_Order.OrderDate, dbo.tb_Order.OrderState, dbo.tb_Order.PayType,dbo.tb_Order.IsPayed, dbo.tb_Order.ReceiverName, dbo.tb_Order.ReceiverTel, dbo.tb_Order.Address, dbo.tb_Order.Code, dbo.tb_Order.Email,dbo.tb_Member.MemberName, dbo.tb_Order.MemberID FROM dbo.tb_Order INNER JOIN dbo.tb_Member ON dbo.tb_Order.MemberID = dbo.tb_Member.MemberID ORDER BY dbo.tb_Order.OrderDate DESC";
            BindData(sql);
        } 
    } 
    private void BindData(string sql)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        this.gvOrderList.DataSource = ds.Tables[0].DefaultView;
        gvOrderList.DataBind();
    } 

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //按照不同的方式查询订单
        sql = "SELECT dbo.tb_Order.OrderID, dbo.tb_Order.TotalMoney, dbo.tb_Order.OrderDate, dbo.tb_Order.OrderState, dbo.tb_Order.PayType,dbo.tb_Order.IsPayed, dbo.tb_Order.ReceiverName, dbo.tb_Order.ReceiverTel, dbo.tb_Order.Address, dbo.tb_Order.Code, dbo.tb_Order.Email,dbo.tb_Member.MemberName, dbo.tb_Order.MemberID FROM dbo.tb_Order INNER JOIN dbo.tb_Member ON dbo.tb_Order.MemberID = dbo.tb_Member.MemberID  where 1=1 ";
        if (txtKeyword.Text != "")
        {
            sql += " and OrderID=" + Int32.Parse(txtKeyword.Text.Trim());
        } 
        if (ddlPayed.SelectedValue == "已付款")
        {
            sql += " and  IsPayed='是' ";
        } 
        if (this.ddlShipped.SelectedValue == "未付款")
        {
            sql += " and  IsPayed ='否' ";
        } 
        if (this.ddlShipped.SelectedValue == "未发货")
        {
            sql += " and  OrderState='未处理' ";
        } 
        if (ddlShipped.SelectedValue == "已发货")
        {
            sql += " and  OrderState='已处理' ";
        } 

        BindData(sql);
    } 



    protected void gvOrderList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        /*
      * 删除前的判定是否确认删除_客户端js完成
      * 从表中删除指定编号的订单信息——订单明细会被自动删除——关系图中设置了层叠
      * 删除后重新绑定
      * 
      */
        int orderid = Convert.ToInt32(this.gvOrderList.DataKeys[e.RowIndex].Value.ToString());

        //删除数据库中该编号的的信息记录
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql0 = string.Format("delete from tb_Order where OrderID ={0} ", orderid);
        SqlCommand cmd = new SqlCommand(sql0, conn);
        cmd.ExecuteNonQuery();

        //重新绑定
        string sql = "SELECT dbo.tb_Order.OrderID, dbo.tb_Order.TotalMoney, dbo.tb_Order.OrderDate, dbo.tb_Order.OrderState, dbo.tb_Order.PayType,dbo.tb_Order.IsPayed, dbo.tb_Order.ReceiverName, dbo.tb_Order.ReceiverTel, dbo.tb_Order.Address, dbo.tb_Order.Code, dbo.tb_Order.Email,dbo.tb_Member.MemberName, dbo.tb_Order.MemberID FROM dbo.tb_Order INNER JOIN dbo.tb_Member ON dbo.tb_Order.MemberID = dbo.tb_Member.MemberID ORDER BY dbo.tb_Order.OrderDate DESC";
        BindData(sql);

        //释放空间
        cmd.Dispose();
        conn.Close();

        Response.Write("<script language='javascript'>alert(' 删除成功！');document.location=document.location;</script>");

    } 
    protected void gvOrderList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrderList.PageIndex = e.NewPageIndex;
        //sql = "SELECT dbo.tb_Order.OrderID, dbo.tb_Order.TotalMoney, dbo.tb_Order.OrderDate, dbo.tb_Order.OrderState, dbo.tb_Order.PayType,dbo.tb_Order.IsPayed, dbo.tb_Order.ReceiverName, dbo.tb_Order.ReceiverTel, dbo.tb_Order.Address, dbo.tb_Order.Code, dbo.tb_Order.Email,dbo.tb_Member.MemberName, dbo.tb_Order.MemberID FROM dbo.tb_Order INNER JOIN dbo.tb_Member ON dbo.tb_Order.MemberID = dbo.tb_Member.MemberID ORDER BY dbo.tb_Order.OrderDate DESC";
        BindData(sql);
    } 
    protected void gvOrderList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int orderid = Convert.ToInt32(gvOrderList.DataKeys[e.NewEditIndex].Value); //获得当前编辑行的订单编号
        Session["orderid"] = orderid;
        string SURl = "orderupt.aspx?opt=upt&&orderid=" + orderid;
        Response.Redirect(SURl);
    } 
    protected void gvOrderList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    } 
    protected void btPrint_Click(object sender, EventArgs e)
    {

    } 
} 
