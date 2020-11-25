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
/// CtlGather 的摘要说明
/// </summary>
public class CtlGather
{
    DataBase db = new DataBase();
	public CtlGather()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string CreateGatherId()//生成团购ID
    {
        String id = "";
        DataRow dr;
        int lent, ctr;
        String t;
        DataSet ds = new DataSet();
        String sql = "select gatherId from g_gather";
        ds = db.RunDataSet(sql);
        lent = ds.Tables[0].Rows.Count - 1;
        if (lent < 0)
        {
            id = "G00001";
        }
        else
        {
            dr = ds.Tables[0].Rows[lent];
            t = dr["gatherId"].ToString().Substring(1, 5);
            ctr = System.Convert.ToInt16(t);
            if (ctr > 0 && ctr < 9)
            {
                ctr = ctr + 1;
                id = "G0000" + ctr;
            }
            if (ctr >= 9 && ctr < 99)
            {
                ctr = ctr + 1;
                id = "G000" + ctr;
            }
            if (ctr >= 99 && ctr < 999)
            {
                ctr = ctr + 1;
                id = "G00" + ctr;
            }
            if (ctr >= 999 && ctr < 9999)
            {
                ctr = ctr + 1;
                id = "G0" + ctr;
            }
            if (ctr >= 9999)
            {
                ctr = ctr + 1;
                id = "G" + ctr;
            }
        }
        return id;
    }
    public Boolean InsertGather(EntGather eg)
    {
        string sql = "insert into g_gather values('"+eg.GatherId+"','"+eg.ProductId+"','"+eg.Titel+"','"+eg.Contant+"','"+eg.TypeId+"',"+eg.Price+","+eg.GatherNum+","+eg.Number+","+eg.Heat+",'"+eg.Time+"')";
        try
        {
            int i = db.ExecuteNonQuery(sql);
            if (i == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    public DataTable SelectGatherType()
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_type";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public Boolean CheckTypeName(string typename)//检测类别名是否存在
    {
        DataSet ds = new DataSet();
        String sql = "select * from g_type where gTypeName='" + typename + "' ";
        try
        {
            ds = db.RunDataSet(sql);
            if (ds.Tables[0].Rows.Count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    public Boolean InsertType(string typename)
    {
        try
        {
            string gid = CreateGatherTypeID();
            String isql = "insert g_type values('" + gid + "','" + typename + "')";
            int i = db.ExecuteNonQuery(isql);
            if (i == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    public String CreateGatherTypeID()
    {
        String id = "";
        DataRow dr;
        int lent, ctr;
        String t;
        DataSet ds = new DataSet();
        String sql = "select * from g_type";
        ds = db.RunDataSet(sql);
        lent = ds.Tables[0].Rows.Count - 1;
        if (lent < 0)
        {
            id = "GT00001";
        }
        else
        {
            dr = ds.Tables[0].Rows[lent];
            t = dr["gTypeId"].ToString().Substring(2, 5);
            ctr = System.Convert.ToInt16(t);
            if (ctr > 0 && ctr < 9)
            {
                ctr = ctr + 1;
                id = "GT0000" + ctr;
            }
            if (ctr >= 9 && ctr < 99)
            {
                ctr = ctr + 1;
                id = "GT000" + ctr;
            }
            if (ctr >= 99 && ctr < 999)
            {
                ctr = ctr + 1;
                id = "GT00" + ctr;
            }
            if (ctr >= 999 && ctr < 9999)
            {
                ctr = ctr + 1;
                id = "GT0" + ctr;
            }
            if (ctr >= 9999)
            {
                ctr = ctr + 1;
                id = "GT" + ctr;
            }
        }
        return id;
    }
    public DataTable SelectProduct(string sql)
    {
        DataTable dt = new DataTable();
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public Boolean DeleteGather(string gid)//删除团购
    {
        string sql = "delete g_gather where gatherId='" + gid + "'";
        try
        {
            int i = db.ExecuteNonQuery(sql);
            if (i == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    public DataTable sProduct()
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_product";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public Boolean Updategather(EntGather eg)//更新团购信息
    {
        string sql = "update g_gather set productId='"+eg.ProductId+"',gatherTitle='"+eg.Titel+"',gContant='"+eg.Contant+"',gTypeId='"+eg.TypeId+"',gatherNum='"+eg.GatherNum+"',gPrice="+eg.Price+" where gatherId='"+eg.GatherId+"'";
        try
        {
            int i = db.ExecuteNonQuery(sql);
            if (i == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    public DataTable dispalygather(string gid)//显示团购资料
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_gather where gatherId='" +gid + "'";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public DataTable hotgather()//查找点击高的团购
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_gather";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {
 
        }
        return dt;
    }
    public SqlDataAdapter selectgather(string gTypeId)//查看团购
    {
        SqlDataAdapter sqlda = new SqlDataAdapter();
        string sql = "select * from vwGatherProduct where gTypeId='" + gTypeId + "'";
        try
        {
            sqlda = db.RunDataAter(sql);
        }
        catch
        {

        }
        return sqlda;
    }
    public DataTable selectProductPritrue(string productId)//查找到产品的图片
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_ProductPicture where productId='" + productId + "' order by ";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public DataTable GatherDetail(string gid)
    {
        DataTable dt = new DataTable();
        string sql = "select * from vwGatherProduct where gatherId='"+gid+"' order by productID desc";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public DataTable NewGather()//最新加入的团购
    {
        DataTable dt = new DataTable();
        string sql = "select top 20 * from vwGatherProduct Order by heat Desc";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public DataTable selectSameCompanyProduct(string cid)//查找同一公司的产品
    {
        DataTable dt = new DataTable();
        string sql = "select * from vwGatherProduct where companyId='"+cid+"'";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public DataTable selectPer(string pername)//取用户信息
    {
        DataTable dt = new DataTable();
        string sql = "select * from personalInfo where perName='" + pername + "'";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
//    public Boolean insertOrder(string persql,string ordersql)//生成定单
//    {
//        if (persql == "")//不需要更新用户信息
//        {
//            try
//            {
//                int i = db.ExecuteNonQuery(ordersql);
//                if (i == 1)
//                {
//                    return true;
//                }
//                else
//                {
//                    return false;
//                }
//            }
//            catch
//            {
//                return false;
//            }
//        }
//        else//需要更新用户信息
//        {
 
//        }
//    }
}

