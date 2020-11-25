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

public partial class Admin_ChangProduct : System.Web.UI.Page
{
    CtlProduct cp = new CtlProduct();
    EntProduct ep = new EntProduct();
    THClaass th = new THClaass();
    DataBase db = new DataBase();
    public static string pid;
    public static string gphoto;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pid = Request["productId"];
            relist();
            CompanyNameBingding();
            dispaly(pid);
            this.ibtnOk.Attributes.Add("onclick", "return confirm('确定要修改吗？');");
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
        System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
        Random ro = new Random();
        ArrayList al = new ArrayList();//定义存贮图片路经
        //判断上传图片的有效性   
        //ep.sTime = System.DateTime.Now.ToString();
        ep.PdtypeId = ddlproducttype.SelectedValue;
        ep.Desc = th.HtmlEncode(txtintroduct.Text);
        ep.Price = System.Convert.ToInt32(txtprice.Text);
        ep.ProductName = txtProductName.Text;
        ep.CompanyId = ddlcompanyname.SelectedValue;
        ep.ProductId = pid;
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
                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('对不起，请上传有效的图片！');</script>");
                //return;
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
                    string s = gphoto.Substring(gphoto.Length - 6, 6);
                    string sp = Server.MapPath(gphoto);
                    if (s == "wu.jpg")
                    {
                        //如果是默认图片则不删除

                    }
                    else
                    {
                        File.Delete(sp.Trim());
                    }

                }
                catch
                {
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
        string sql = "select picture from g_ProductPicture where productId='" + pid + "'";
        ArrayList alist = new ArrayList();
        DataTable dt = new DataTable();
        dt = db.RunDataSet(sql).Tables[0];
        if (dt.Rows.Count > 0)
        {
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                alist.Add(Server.MapPath(System.Convert.ToString(dt.Rows[j][0]).Trim()));
            }
        }
        if (cp.UpdateProduct(ep, alist, al))
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('修改成功！');window.returnValue=true;window.close();</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('修改失败！');window.returnValue=false;window.close();</script>");
        }
    }
    protected void btnAddType_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./add_Type.aspx','','dialogHeight:350px;dialogWidth :480px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
    }
    protected void btnbrowse_Click(object sender, EventArgs e)//选择一个公司
    {
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./ChooseCompany.aspx','','dialogHeight:350px;dialogWidth :480px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
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
    private void CompanyNameBingding()
    {
        DataTable dt = new DataTable();
        dt = cp.selectCompanyName();
        this.ddlcompanyname.DataSource = dt;
        this.ddlcompanyname.DataTextField = "companyName";
        this.ddlcompanyname.DataValueField = "companyId";
        this.ddlcompanyname.DataBind();
    }
    private void dispaly(string pid)//显示产品信息
    {
        DataTable dt = new DataTable();
        dt = cp.dispalyproduct(pid);
        this.txtProductName.Text = System.Convert.ToString(dt.Rows[0][1]);
        this.txtprice.Text = System.Convert.ToString(dt.Rows[0][4]);
        this.txtintroduct.Text = th.HtmlToStringEncode(System.Convert.ToString(dt.Rows[0][6]));
        gphoto = System.Convert.ToString(dt.Rows[0][5]).Trim();
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
    protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        this.Page.RegisterClientScriptBlock("关闭窗口", "<script>window.close()</script>");
    }
}
