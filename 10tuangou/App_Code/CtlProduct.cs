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
using System.IO;
/// <summary>
/// CtlProduct 的摘要说明
/// </summary>
public class CtlProduct
{
    DataBase db = new DataBase();
	public CtlProduct()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public DataTable RunTypeTable()
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_pdType";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {
 
        }
        return dt;
    }
    public DataTable selectCompanyName()//查找公司
    {
        DataTable dt = new DataTable();
        string sql = "select companyId,companyName from g_company";
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    }
    public DataTable dispalyproduct(string pid)//显示产品资料
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_product where productId='"+pid+"'";
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
        String sql = "select * from g_pdType where pdTypeName='" + typename + "' ";
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
            string gid = CreateProductTypeID();
            String isql = "insert g_pdType values('" + gid + "','" + typename + "')";
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
    public String CreateProductTypeID()
    {
        String id = "";
        DataRow dr;
        int lent, ctr;
        String t;
        DataSet ds = new DataSet();
        String sql = "select * from g_pdType";
        ds = db.RunDataSet(sql);
        lent = ds.Tables[0].Rows.Count - 1;
        if (lent < 0)
        {
            id = "PT00001";
        }
        else
        {
            dr = ds.Tables[0].Rows[lent];
            t = dr["pdTypeId"].ToString().Substring(2, 5);
            ctr = System.Convert.ToInt16(t);
            if (ctr > 0 && ctr < 9)
            {
                ctr = ctr + 1;
                id = "PT0000" + ctr;
            }
            if (ctr >= 9 && ctr < 99)
            {
                ctr = ctr + 1;
                id = "PT000" + ctr;
            }
            if (ctr >= 99 && ctr < 999)
            {
                ctr = ctr + 1;
                id = "PT00" + ctr;
            }
            if (ctr >= 999 && ctr < 9999)
            {
                ctr = ctr + 1;
                id = "PT0" + ctr;
            }
            if (ctr >= 9999)
            {
                ctr = ctr + 1;
                id = "PT" + ctr;
            }
        }
        return id;
    }
    public string CreateICOName(String icosuffix)//生成图片名字
    {
        string iconame = "";
        iconame = System.DateTime.Now.ToString("yyyy-MM-dd HH-mm-ss").Replace("-", "").Replace(" ", "").Replace(":", "") + icosuffix;
        return iconame;
    }
    public Boolean InsertProduct(EntProduct ep, System.Collections.ArrayList ay)//加一个产品信息
    {
        DataSet ds = new DataSet();
        SqlConnection con = db.ReturnConn();
        SqlTransaction sqltran = con.BeginTransaction();
        SqlCommand insertcom = new SqlCommand();
        insertcom.Connection = con;
        insertcom.Transaction = sqltran;
        insertcom.CommandText = "insert into g_product values('"+ep.CompanyId+"','"+ep.ProductName+"','"+ep.PdtypeId+"',"+ep.Price+",'"+ep.Photo+"','"+ep.Desc+"','"+ep.sTime+"');select @@IDENTITY";
        SqlDataAdapter sqldapter=new SqlDataAdapter();
        try
        {
            sqldapter.SelectCommand = insertcom;
            sqldapter.Fill(ds);
        }
        catch
        {
            sqltran.Rollback();
            con.Close();
            return false;
        }
        if (ds.Tables[0].Rows.Count < 0)
        {
            sqltran.Rollback();
            con.Close();
            return false;
        }
        else
        {
            SqlCommand comd = new SqlCommand();
            comd.Connection = con;
            comd.Transaction = sqltran;
            string pid = System.Convert.ToString(ds.Tables[0].Rows[0][0]);
            try
            {
                foreach (string photo in ay)
                {
                    comd.CommandText = "insert into g_ProductPicture values('" + pid + "','" + photo + "')";
                    comd.ExecuteNonQuery();
                }
                sqltran.Commit();
                con.Close();
                return true;
            }
            catch
            {
                sqltran.Rollback();
                con.Close();
                return false;
            }
        }
    }
    public Boolean DeleteProduct(EntProduct ep,System.Collections.ArrayList al)//删除产品
    {
        string productid = ep.ProductId;
        string photo = ep.Photo;
        int i;
        SqlConnection con = new SqlConnection();
        con = db.ReturnConn();
        SqlTransaction sqltran = con.BeginTransaction();
        SqlCommand delcom = new SqlCommand();
        delcom.Connection = con;
        delcom.Transaction = sqltran;
        delcom.CommandText = "delete g_product where productId='" + productid + "'";
        try
        {
             i=delcom.ExecuteNonQuery();
        }
        catch
        {
            sqltran.Rollback();
            con.Close();
            return false;
        }
        if(i==1)
        {
            SqlCommand delete = new SqlCommand();
            delete.Connection = con;
            delete.CommandText = "delete g_ProductPicture where productId='" + productid + "'";
            delete.Transaction = sqltran;
            try
            {
                delete.ExecuteNonQuery();
            }
            catch
            {
                sqltran.Rollback();
                con.Close();
                return false;
            }
        }
        else
        {
            sqltran.Rollback();
            con.Close();
            return false;
        }
        try
        {
            //删除图片
            string s = photo.Substring(photo.Length-6,6);
            if (s=="wu.jpg")
            {
                //如果是默认图片则不删除

            }
            else
            {
                File.Delete(photo.Trim());            
            }
            if (al.Count > 0)
            {
                foreach (string prictrue in al)
                {
                    File.Delete(prictrue);
                }
            }
            sqltran.Commit();
            con.Close();
            return true;
        }
        catch
        {
            sqltran.Rollback();
            con.Close();
            return false;
        }
    }
    public Boolean UpdateProduct(EntProduct ep,System.Collections.ArrayList al,System.Collections.ArrayList arlist)//更新产品信息
    {
        //更新产品信息
        int i;
        string pid = ep.ProductId;
        SqlConnection con = db.ReturnConn();
        SqlTransaction sqltran = con.BeginTransaction();
        SqlCommand updatecom = new SqlCommand();
        updatecom.Connection = con;
        updatecom.CommandText = "update g_product set companyId='"+ep.CompanyId +"', productName='"+ep.ProductName+"',pdTypeId='"+ep.PdtypeId+"' ,pdPrice="+ep.Price+",pdphoto='"+ep.Photo+"',productDesc='"+ep.Desc+"' where productId='"+ep.ProductId+"' ";
        updatecom.Transaction = sqltran;
        try
        {
            //
            i = updatecom.ExecuteNonQuery();
        }
        catch
        {
            sqltran.Rollback();
            con.Close();
            return false;
        }
        if (al.Count >0)//判断是否新加了图片
        {
            if (i == 1)
            {
                try
                {
                    //删除原有图片信息,并删除图片
                    foreach (string prictrue in al)
                    {
                        File.Delete(prictrue);
                    }
                    SqlCommand delcom = new SqlCommand();
                    delcom.Connection = con;
                    delcom.CommandText = "delete g_ProductPicture where productId='"+pid+"'";
                    delcom.Transaction = sqltran;
                    try
                    {
                        delcom.ExecuteNonQuery();
                    }
                    catch
                    {
                        sqltran.Rollback();
                        con.Close();
                        return false;
                    }
                    SqlCommand insertcom = new SqlCommand();
                    insertcom.Connection = con;
                    insertcom.Transaction = sqltran;
                    try
                    {
                        foreach (string photo in arlist)
                        {
                            insertcom.CommandText = "insert into g_ProductPicture values('" + pid + "','" + photo + "')";
                            insertcom.ExecuteNonQuery();
                        }
                    }
                    catch
                    {
                        sqltran.Rollback();
                        con.Close();
                        return false;
                    }
                }
                catch
                {
                    sqltran.Rollback();
                    con.Close();
                    return false;
                }
            }
            else
            {
                sqltran.Rollback();
                con.Close();
                return false;
            }
        }
        sqltran.Commit();
        con.Close();
        return true;
    }
}
