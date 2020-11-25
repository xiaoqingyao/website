using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// BuyCar 的摘要说明
/// </summary>
public class BuyCar
{
    public BuyCar()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    } 

    #region//首页中调用的方法//////////
    /// <summary>
    /// 由商品编号得到商品单价
    /// </summary>
    /// <param name="GoodsID">商品编号</param>
    /// <returns>商品单价，float类型</returns>
    public static float GetPriceByGoodsID(int GoodsID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql = string.Format("select Price from tb_Goods where GoodsID={0} ", GoodsID);
        SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        float price = float.Parse(ds.Tables[0].Rows[0][0].ToString());
        conn.Close();
        return price;
    } 

    /// <summary>
    /// 向购物表tb_BuyInfo表中添加购物信息
    /// </summary>
    /// <param name="GoodsID">商品编号</param>
    /// <param name="Price">会员价格</param>
    /// <param name="MemberID">会员编号</param>
    public static void AddShopCart(int GoodsID, float Price, int MemberID, int Num)
    {
        /*
         * 1:向tb_BuyInfo表中添加订购的商品，默认为1件
         * 2：检查表中是否存在该登陆用户订购的同名商品，如果有则数量+1即可。否则执行3。
         * 3：向表中写入订购记录。执行Inert语句。
         * 
         */

        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql = string.Empty;

        //检查表中是否存在同名的订购物品
        if (GoodsIsExist(GoodsID, MemberID))
        {
            //执行update语句，让同名的商品数量+1
            sql = string.Format("update tb_BuyInfo set Number=Number+1,SumPrice=(Number+1)*{0}  where GoodsID={1}  and MemberID={2} ", Price, GoodsID, MemberID);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        } 

        else
        {
            sql = string.Format("insert into tb_BuyInfo(GoodsID,MemberID,Number,SumPrice) values({0} ,{1} ,{2} ,{3} )", GoodsID, MemberID, Num, Price);//默认订购1件商品，总价格就是商品单价
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        } 
        conn.Close();
    } 



    /// <summary>
    /// 判定tb_BuyInfo表中是否存在该登陆用户订购的同名商品，如果有则返回true，否则返回false
    /// </summary>
    /// <param name="GoodID"></param>
    /// <param name="MemberId"></param>
    /// <returns></returns>
    private static bool GoodsIsExist(int GoodID, int MemberId)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql = string.Format("select * from tb_BuyInfo where GoodsID={0}  and MemberID={1} ", GoodID, MemberId);
        SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);

        if (ds.Tables[0].Rows.Count >= 1)
            return true; //存在同名的商品
        else
            return false;
    } 
    #endregion

    #region   #region  shopcar.aspx页面方法

    /// <summary>
    /// 给gvShopCar绑定用户编号为MemberID购买的商品信息
    /// </summary>
    /// <param name="gv">gridview控件ID</param>
    /// <param name="MemberID">当前登陆系统的会员编号</param>
    public static void CarBind(GridView gvShopCar, int MemberID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql1 = string.Format("select tb_BuyInfo.* ,GoodsName,Price from tb_BuyInfo,tb_Goods where tb_BuyInfo.GoodsID=tb_Goods.GoodsID and MemberID={0} ", MemberID);
        SqlDataAdapter sda1 = new SqlDataAdapter(sql1, conn);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        gvShopCar.DataSource = ds1;
        gvShopCar.DataBind();
        conn.Close();
    } 

    /// <summary>
    /// 获得当前购物用户的所有购物金额和商品总数量，放在记录集变量中返回
    /// </summary>
    /// <param name="MemberID">当前登陆系统会员编号</param>
    /// <returns>返回当前登陆会员购买商品信息（商品总数量、总金额）的记录集变量</returns>
    public static DataSet TotalMoneyNum(int MemberID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql1 = string.Format("select sum(Number),sum(SumPrice) from tb_BuyInfo  where  MemberID={0} ", MemberID);
        SqlDataAdapter sda1 = new SqlDataAdapter(sql1, conn);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        conn.Close();
        return ds1;
    } 

    /// <summary>
    /// tb_BuyInfo表中删除指定会员、指定购物编号的购物记录
    /// </summary>
    /// <param name="MemberID"></param>
    /// <param name="BuyID"></param>
    public static void DelShopCarByMemberID(int MemberID, int BuyID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open(); ;
        string sql1 = string.Format("delete from tb_BuyInfo  where  MemberID={0}  and BuyID={1} ", MemberID, BuyID);
        SqlCommand cmd = new SqlCommand(sql1, conn);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        conn.Close();
    } 


    /// <summary>
    /// 更新购物车中对应商品的数量。同时修改对应商品的SumPrice，以及所有商品的总数量和总价格
    /// </summary>
    /// <param name="MemberId">当前会员编号</param>
    /// <param name="BuyID">购物编号</param>
    /// <param name="Num">采购商品的新数量</param>
    public static void UpdateShopCarGoodsNum(int MemberId, int BuyID, int Num)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open(); ;
        string sql1 = string.Format("update tb_BuyInfo set Number={0} ,SumPrice={1} *(Select Price from tb_Goods where GoodsID=(select GoodsId from tb_BuyInfo where BuyID={2} ))  where  MemberID={3}  and BuyID={4} ", Num, Num, BuyID, MemberId, BuyID);
        SqlCommand cmd = new SqlCommand(sql1, conn);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        conn.Close();
    } 
    #endregion

    #region 结账 checkout.aspx
    /////////////////////////////////    //////////////////////////////////结账 checkout.aspx/////////////////////////////////////////////////////////////////////////
    /// <summary>
    /// 将订单信息写入订单表tb_Order
    /// </summary>
    /// <param name="MemberID">会员编号</param>
    /// <param name="TotalMoney">订单总金额</param>
    /// <param name="PayType">支付方式</param>
    /// <param name="IsPayed">是否付款</param>
    /// <param name="ReceiverName">收货人姓名</param>
    /// <param name="ReceiverTel">收货人电话</param>
    /// <param name="Address">收货人地址</param>
    /// <param name="code">邮编</param>
    /// <param name="Email">email</param>
    /// <returns>返回订单编号</returns>
    public static int SaveOrder(int MemberID, float TotalMoney, string PayType, string IsPayed, string ReceiverName, string ReceiverTel, string Address, string Code, string Email)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open(); ;
        //string sql1 = string.Format("insert into tb_Order(MemberID,TotalMoney,OrderDate,OrderState,PayType,IsPayed,ReceiverName,ReceiverTel,Address,code,Email) values({0} ,{1} ,{2} ,{3} ,{4} ,{5} ,{6} ,{7} ,{8} ,{9} ,{10} )", MemberID, TotalMoney, DateTime.Now, "未处理", PayType, IsPayed , ReceiverName, ReceiverTel, Address, Code, Email);
        string sql1 = "insert into tb_Order(MemberID,TotalMoney,OrderDate,OrderState,PayType,IsPayed,ReceiverName,ReceiverTel,Address,code,Email) values(" + MemberID + ", " + TotalMoney + ", '" + DateTime.Now + "','未处理', '" + PayType + "', '" + IsPayed + "' , '" + ReceiverName + "', '" + ReceiverTel + "', '" + Address + "', '" + Code + "', '" + Email + "')";
        SqlCommand cmd = new SqlCommand(sql1, conn);
        cmd.ExecuteNonQuery();

        string sql2 = "select max(OrderID) from tb_Order";
        SqlDataAdapter sda = new SqlDataAdapter(sql2, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        int OrderID = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());

        cmd.Dispose();
        conn.Close();

        return OrderID;
    } 


    /// <summary>
    /// 获得某会员（编号）订购的商品总金额
    /// </summary>
    /// <param name="MemberID">会员编号</param>
    /// <returns></returns>
    public static float GetTotalMoney(int MemberID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        //int MemberID = Convert.ToInt32(Session ["MemberID"].ToString ());
        string sql = string.Format("select sum(SumPrice) as sp from tb_BuyInfo where MemberID={0} ", MemberID);
        //string sql = "select * from tb_BuyInfo";
        SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        float totalmoney = float.Parse(ds.Tables[0].Rows[0][0].ToString());
        sda.Fill(ds);
        conn.Close();
        return totalmoney;
    } 


    /// <summary>
    /// 得到当前会员购买的商品信息记录，包括商品编号、数量、价格总额,以便写入订单明细表tb_OrderDetail
    /// </summary>
    /// <param name="MemberID">当前登陆会员账号</param>
    /// <returns>返回记录集变量</returns>
    public static DataSet GetGoodsByMemberID(int MemberID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql1 = string.Format("select GoodsID,Number,SumPrice from tb_BuyInfo where MemberID={0} ", MemberID);
        SqlDataAdapter sda1 = new SqlDataAdapter(sql1, conn);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        conn.Close();
        return ds1;
    } 

    /// <summary>
    /// 将当前的购物信息写入到订单明细表tb_OrderDetail
    /// </summary>
    /// <param name="ds">购物信息记录</param>
    /// <param name="OrderID">订单编号</param>
    public static void Write_tb_OrderDetail(DataSet ds, int OrderID)
    {
        //有购物记录
        if (ds.Tables[0].Rows.Count >= 1)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string sql = string.Format("insert into tb_OrderDetail values({0} ,{1} ,{2} ,{3} )", OrderID, Int32.Parse(ds.Tables[0].Rows[i][0].ToString()), Int32.Parse(ds.Tables[0].Rows[i][1].ToString()), float.Parse(ds.Tables[0].Rows[i][2].ToString()));
                sql = sql + "; update tb_Goods set sales=sales+" + ds.Tables[0].Rows[i][1].ToString() + " where GoodsID='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                conn.Close();
            } 
        } 
    } 


    /// <summary>
    /// 删除指定会员编号的购物车中的临时购物信息记录——从tb_BuyInfo表中删除
    /// </summary>
    /// <param name="MemberID">会员编号</param>
    public static void DeleteShopCarByMemberID(int MemberID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open(); ;
        string sql1 = string.Format("delete from tb_BuyInfo  where  MemberID={0}  ", MemberID);
        SqlCommand cmd = new SqlCommand(sql1, conn);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        conn.Close();
    } 

    #endregion


    #region///////////////////后台管理中订单维护时候使用的方法///////////////////////////////

    ///////////////////通过订单编号得到该订单的所有信息（订单信息，订单明细信息，下单人信息，收单人信息
    /// </summary>
    /// <param name="orderid"></param>
    /// <returns></returns>
    public static DataSet GetOrderInfoByOrderID(int orderid)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql0 = @"SELECT     dbo.tb_Member.MemberID, dbo.tb_Member.MemberName, dbo.tb_Member.Sex, dbo.tb_Member.RealName, dbo.tb_Member.MobileTel, 
                      dbo.tb_Member.Email, dbo.tb_Member.Code, dbo.tb_Member.RegisterDate, dbo.tb_Member.Address, dbo.tb_Order.OrderID, dbo.tb_Order.TotalMoney, 
                      dbo.tb_Order.OrderDate, dbo.tb_Order.OrderState, dbo.tb_Order.PayType, dbo.tb_Order.IsPayed, dbo.tb_Order.ReceiverName, 
                      dbo.tb_Order.ReceiverTel, dbo.tb_Order.Address AS Expr1, dbo.tb_Order.Code AS Expr2, dbo.tb_Order.Email AS Expr3, dbo.tb_OrderDetail.SumPrice, 
                      dbo.tb_OrderDetail.Num, dbo.tb_OrderDetail.GoodsID, dbo.tb_OrderDetail.OrderID AS Expr4
FROM         dbo.tb_Member INNER JOIN
                      dbo.tb_Order ON dbo.tb_Member.MemberID = dbo.tb_Order.MemberID LEFT OUTER JOIN
                      dbo.tb_OrderDetail ON dbo.tb_Order.OrderID = dbo.tb_OrderDetail.OrderID";  //长字符串可以换行写，前面加上@即可
        string sql1 = sql0 + " where dbo.tb_Order.OrderID =" + orderid;
        SqlDataAdapter sda = new SqlDataAdapter(sql1, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        return ds;
    } 

    /// <summary>
    /// 通过订单编号得到订单明细中的信息：商品编号，商品名称，数量，单价，金额
    /// </summary>
    /// <param name="orderid"></param>
    /// <returns></returns>
    public static DataSet GetOrderInfoByOrderID1(int orderid)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        conn.Open();
        string sql0 = @"SELECT     dbo.tb_OrderDetail.GoodsID, dbo.tb_Goods.GoodsName, dbo.tb_OrderDetail.Num, dbo.tb_Goods.Price,dbo.tb_OrderDetail.SumPrice
                        FROM       dbo.tb_Order INNER JOIN
                      dbo.tb_OrderDetail ON dbo.tb_Order.OrderID = dbo.tb_OrderDetail.OrderID INNER JOIN
                      dbo.tb_Goods ON dbo.tb_OrderDetail.GoodsID = dbo.tb_Goods.GoodsID";  //长字符串可以换行写，前面加上@即可
        string sql1 = sql0 + " where dbo.tb_Order.OrderID =" + orderid;
        SqlDataAdapter sda = new SqlDataAdapter(sql1, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        return ds;
    } 


    /// <summary>
    /// 通过订单编号和订单状态位信息修改订单状态（是否付款，是否发货——是否处理）
    /// </summary>
    /// <param name="orderid"></param>
    /// <param name="ispayed"></param>
    /// <param name="ischecked"></param>
    public static void UptOrderStatebyOrderID(int orderid, string WuLiu, string ischecked,string DanHao)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstr"]);
        string sql0 = "update dbo.tb_Order set OrderState='{0} ',WuLiuName='{1} ',DanHao='{3} ' where OrderID={2} ";  //长字符串可以换行写，前面加上@即可
        string sql1 = string.Format(sql0, ischecked, WuLiu, orderid, DanHao);
        SqlCommand cmd = new SqlCommand(sql1, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    } 

    #endregion

} 
