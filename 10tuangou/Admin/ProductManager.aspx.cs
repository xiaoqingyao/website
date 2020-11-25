using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class Admin_ProductManager : System.Web.UI.Page
{
    CtlProduct cp = new CtlProduct();
    EntProduct ep = new EntProduct();
    THClaass th = new THClaass();
    DataBase db = new DataBase();
    public static string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            relist();
            if (Session["companname"] != null)
            {
                txtcompanyname.Text = System.Convert.ToString(Session["companname"]);
            }
            sql = "select productId,c.companyId,productName,pdTypeId,pdPrice,pdPhoto,time,companyName from g_company c join g_product p on c.companyId=p.companyId ";
            gvBinding(sql);
        }
    }
    protected void ibtnOk_Click(object sender, ImageClickEventArgs e)
    {
        if (validate(this.txtprice.Text) == false)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('产品价格不是数字！');</script>");
            this.txtprice.Text = "";
            this.txtprice.Focus();
            return;
        }
        if (Session["companId"] == null)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('请选择一个公司！');</script>");
            this.txtcompanyname.Text = "";
            return;
        }
        else
        {
            ep.CompanyId = System.Convert.ToString(Session["companId"]);
        }
        System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
        Random ro = new Random();
        ArrayList al = new ArrayList();//定义存贮图片路经
        //判断上传图片的有效性   
        ep.sTime = System.DateTime.Now.ToString();
        ep.PdtypeId = ddlproducttype.SelectedValue;
        ep.Desc = th.HtmlEncode(txtintroduct.Text);
        ep.Price = System.Convert.ToInt32(txtprice.Text);
        ep.ProductName = txtProductName.Text;
        for (int ifile = 1; ifile < files.Count; ifile++)
        {
            if (files[ifile].FileName.Length > 0)
            {
                System.Web.HttpPostedFile postedfile = files[ifile];
                string fex = Path.GetExtension(postedfile.FileName);
                if (fex != ".jpg" && fex != ".JPG" && fex != ".gif" && fex != ".GIF")
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('请确认您上传图片的格式，只能是jpg或gif格式的！');</script>");
                    return;
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('对不起，请上传有效的图片！');</script>");
                return;
            }
        }
        //判断图标文件是否有效
        if (files[0].FileName.Length > 0)
        {

            System.Web.HttpPostedFile myFile = files[0];
            string fex = Path.GetExtension(myFile.FileName);
            if (fex != ".jpg" && fex != ".JPG" && fex != ".gif" && fex != ".GIF")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('请确认您上传图片的格式，只能是jpg或gif格式的！');</script>");
                return;
            }
            else
            {
                string FileName;
                FileName = System.IO.Path.GetFileName(myFile.FileName);
                int lent = FileName.Length;
                string NewName = cp.CreateICOName(FileName.Substring(lent - 4, 4));//对上传的图片进行重命名

                String path = Server.MapPath("~/Image/ProductIco/" + NewName);
                try
                {
                    myFile.SaveAs(path);
                }
                catch(Exception ex)
                {
                    throw new Exception(ex.Message);
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('图片上传失败,服务器忙请稍后在试！');</script>");
                    return;
                }
                ep.Photo = "~/Image/ProductIco/" + NewName;
            }
        }
        else
        {
            ep.Photo = "~/Image/ProductIco/" + "wu.jpg";
        }
        //利用循还上传多图片
        for (int i = 1; i < files.Count; i++)
        {
            System.Web.HttpPostedFile myFile = files[i];
            string pathname;
            string FileName = "";
            FileName = System.IO.Path.GetFileName(myFile.FileName);

            int lent = FileName.Length;
            string stro = ro.Next(10, 100).ToString();
            string NewName = stro + cp.CreateICOName(FileName.Substring(lent - 4, 4));//对上传的图片进行重命名
            String path = Server.MapPath("~/Image/Product/" + NewName);
            try
            {
                myFile.SaveAs(path);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('图片上传失败,服务器忙请稍后在试！');</script>");
                return;
            }
            pathname = "~/Image/Product/" + NewName;
            al.Add(pathname);
        }
        if (cp.InsertProduct(ep, al))//调用插产品的信息的方法
        {
            //Session.Remove("companId");
            //Session.Remove("companname");
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('产品添加成功！');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('产品添加失败！');</script>");
        }
    }
    private void relist()
    {
        DataTable dt = new DataTable();
        dt = cp.RunTypeTable();
        this.ddlproducttype.DataSource = dt;
        this.ddlproducttype.DataTextField = "pdTypeName";
        this.ddlproducttype.DataValueField = "pdTypeId";
        this.ddlproducttype.DataBind();
    }
    protected void btnAddType_Click(object sender, EventArgs e)//添加产品类别
    {
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./add_Type.aspx','','dialogHeight:350px;dialogWidth :480px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");

    }
    private Boolean validate(String id)//验证字符是否为数字
    {
        try
        {
            System.Convert.ToInt32(id.Trim());
            return true;
        }
        catch
        {
            return false;
        }
    }
    protected void btnbrowse_Click(object sender, EventArgs e)//选取公司名
    {
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./ChooseCompany.aspx','','dialogHeight:350px;dialogWidth :480px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
    }
    

    private void gvBinding(string sql)//对GridView1 进行数据绑定
    {
        DataTable dt = new DataTable();
        dt = db.RunDataSet(sql).Tables[0];
        this.GridView1.DataSource = dt;
        this.GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex < 0) return;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标放上去的时候 先保存当前行的背景颜色 并给附一颜色 
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='yellow',this.style.fontWeight='';");
            //当鼠标离开的时候 将背景颜色还原的以前的颜色 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");
            //单击样式
            e.Row.Attributes.Add("onclick", "if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText='';}this.runtimeStyle.cssText='background-color:#99cc00';window.oldtr=this;");
            ImageButton ib = (ImageButton)e.Row.FindControl("ibtnDelete");
            ib.Attributes.Add("onclick", "return confirm('此操作不可逆，您确定要删除所选的数据吗？');");
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)//删除数据
    {
        int i = e.RowIndex;
        string productid = this.GridView1.Rows[i].Cells[0].Text.ToString();
        string photo = Server.MapPath(this.GridView1.Rows[i].Cells[5].Text.ToString().Trim());
        string sql = "select picture from g_ProductPicture where productId='" + productid + "'";
        ArrayList al = new ArrayList();
        DataTable dt = new DataTable();
        dt = db.RunDataSet(sql).Tables[0];
        if (dt.Rows.Count > 0)
        {
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                al.Add(Server.MapPath(System.Convert.ToString(dt.Rows[j][0]).Trim()));
            }
        }
        ep.ProductId = productid;
        ep.Photo = photo;
        if (cp.DeleteProduct(ep, al))
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('产品删除成功！');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('产品删除失败！');</script>");
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int i = e.NewEditIndex;
        string pid = this.GridView1.Rows[i].Cells[0].Text.ToString();
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('ChangProduct.aspx?productId=" + pid + "','','dialogHeight:500px;dialogWidth :600px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
    }
    protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        if (this.pnlAddMark.Visible == true)
        {
            this.pnlAddMark.Visible = false;
        }
    }
    protected void ibtnSreach_Click(object sender, ImageClickEventArgs e)//查找
    {
        if (this.txtSechCompanyName.Text == "")
        {
            sql = "select productId,c.companyId,productName,pdTypeId,pdPrice,pdPhoto,time,companyName from g_company c join g_product p on c.companyId=p.companyId ";
        }
        else
        {
            sql = "select productId,c.companyId,productName,pdTypeId,pdPrice,pdPhoto,time,companyName from g_company c join g_product p on c.companyId=p.companyId where productName like '%" + this.txtSechCompanyName.Text + "%'";
        }
        gvBinding(sql);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        gvBinding(sql);
    }
}
