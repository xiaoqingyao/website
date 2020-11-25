using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// CommonProperty 类，是一个复杂的类，用来存储订单信息，下单人信息，收货人信息——用于后台管理中订单维护页面 
/// </summary>
public class CommonProperty
{
    public CommonProperty()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    } 
    public int OrderID;  //订单编号   
    public float TotalMoney;//订单总金额
    public DateTime OrderDate;//下单时间
    public string OrderState;//订单状态
    public string PayType;//支付类型
    public string IsPayed;//是否支付过  


    public string ReceiverName;//收货人姓名
    public string ReceiverTel;//联系人电话

    public string ReceiverAddress;//购货人地址   Address
    public string ReceiverCode;//邮政编码    Code
    public string ReceiverEmail;//Email地址   Email

    public int MemberID;//订购人ID（会员ID）
    public string MemberName;//购货人姓名
    public string Sex;//购物人性别
    public string MobileTel;//联系人电话
    public string Email;//Email地址
    public string Address;//购货人地址
    public string Code;//邮政编码
} 
