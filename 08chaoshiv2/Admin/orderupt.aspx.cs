using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_orderupt : System.Web.UI.Page
{
    public static CommonProperty order = new CommonProperty(); //静态类首先编译，程序运行期间始终存在
    protected void Page_Load(object sender, EventArgs e)
    {
        int orderid = Int32.Parse(Request.QueryString["orderid"]);
        order = GetOrderInfo();  //给order对象中各个变量赋值，在页面初始化的时候显示——只读

        #region 初始化gvOrder
        DataSet ds = BuyCar.GetOrderInfoByOrderID1(orderid);
        gvOrder.DataSource = ds.Tables[0].DefaultView;
        gvOrder.DataBind();
        #endregion





        if (!IsPostBack)
        {
            #region 付款状态、发货状态处理
            string SQL = "select * from tb_Order where OrderID=" + orderid;
            DataSet ds1 = DBHelper.GetDataSet(SQL);
            this.DropDownList2.SelectedItem.Text = ds1.Tables[0].Rows[0]["WuLiuName"].ToString();
            this.TextBox1.Text = ds1.Tables[0].Rows[0]["DanHao"].ToString();
            
        
   
            #endregion

            #region 根据是查看还是修改订单来决定某些按钮是否显示
            if (Request.QueryString["opt"].ToString() == "view")
            {
                btnSave.Visible = false;
            } 
            if (Request.QueryString["opt"].ToString() == "upt")
            {
                btnClose.Visible = false;
            } 
            #endregion
        } 


    } 

    /// <summary>
    /// 给order对象中各个变量赋值，在页面初始化的时候显示——只读
    /// </summary>
    /// <returns></returns>
    public CommonProperty GetOrderInfo()
    {
        int orderid = Int32.Parse(Request.QueryString["orderid"]);
        DataSet ds = BuyCar.GetOrderInfoByOrderID(orderid); ; //获得当前选择的订单信息
        order.OrderID = Int32.Parse(ds.Tables[0].Rows[0][9].ToString());  //订单编号   
        order.TotalMoney = float.Parse(ds.Tables[0].Rows[0][10].ToString());//订单总金额
        order.OrderDate = DateTime.Parse(ds.Tables[0].Rows[0][11].ToString());//下单时间
        order.OrderState = ds.Tables[0].Rows[0][12].ToString();//订单状态
        order.PayType = ds.Tables[0].Rows[0][13].ToString();//支付类型
        order.IsPayed = ds.Tables[0].Rows[0][14].ToString();//是否支付过  


        order.ReceiverName = ds.Tables[0].Rows[0][15].ToString();//收货人姓名
        order.ReceiverTel = ds.Tables[0].Rows[0][16].ToString();//联系人电话

        order.ReceiverAddress = ds.Tables[0].Rows[0][17].ToString();//购货人地址   Address
        order.ReceiverCode = ds.Tables[0].Rows[0][18].ToString();//邮政编码    Code
        order.ReceiverEmail = ds.Tables[0].Rows[0][19].ToString();//Email地址   Email

        order.MemberID = Int32.Parse(ds.Tables[0].Rows[0][0].ToString());//订购人ID（会员ID）
        order.MemberName = ds.Tables[0].Rows[0][1].ToString();//购货人姓名
        order.Sex = ds.Tables[0].Rows[0][2].ToString();//购物人性别
        order.MobileTel = ds.Tables[0].Rows[0][3].ToString();//联系人电话
        order.Email = ds.Tables[0].Rows[0][4].ToString();//Email地址
        order.Address = ds.Tables[0].Rows[0][5].ToString();//购货人地址
        order.Code = ds.Tables[0].Rows[0][6].ToString();//邮政编码


        return order;
    } 


    protected void btnSave_Click(object sender, EventArgs e)
    {
        /*
         * 1 获得“是否付款”、“是否发货”
         * 2 保存当前订单信息，写入订单表——订单明细表不变化——修改指定编号的订单状态位即可
         */
        int orderid = Int32.Parse(Request.QueryString["orderid"]);


        string ischecked = this.DropDownList1.SelectedItem.Text;
        string WuLiu = this.DropDownList2.SelectedItem.Text;
        string DanHao = this.TextBox1.Text;


        BuyCar.UptOrderStatebyOrderID(orderid, WuLiu, ischecked,DanHao);
        Response.Write("<script language='javascript'>alert('订单信息修改成功！');opener.location.href = opener.location.href;window.close();</script>");

    } 
} 