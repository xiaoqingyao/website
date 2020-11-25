using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class GoodsManager : System.Web.UI.Page
{
    public static string fname;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = DBHelper.GetDataSet("select * from tb_GoodsType");
            this.DropDownList1.DataTextField = "TypeName";
            this.DropDownList1.DataValueField = "TypeID";
            this.DropDownList1.DataSource = ds.Tables[0];
            this.DropDownList1.DataBind();
            if (Request["ID"] != null)
            {
                InitData();
            } 
        } 

    } 
    protected void InitData()
    {
        string id = Request["ID"].ToString();
        try
        {
            string sql = "select * from View_1 where GoodsID=" + id;
            DataTable dt = DBHelper.GetDataSet(sql).Tables[0];
            if (dt.Rows.Count > 0)
            {
                this.TextBox1.Text = dt.Rows[0]["GoodsName"].ToString();
                this.TextBox2.Text = dt.Rows[0]["Price"].ToString();
                this.TextBox3.Text = dt.Rows[0]["Introduce"].ToString();
                this.TextBox4.Text = dt.Rows[0]["business"].ToString();
                this.TextBox5.Text = dt.Rows[0]["Stock"].ToString();

                this.DropDownList1.SelectedItem.Value = dt.Rows[0]["TypeID"].ToString();
                fname = dt.Rows[0]["GoodsPicture"].ToString();
                this.Image1.ImageUrl = "../" + fname;
            } 
        } 
        catch
        {
        } 
    } 
    private void FileUpLoad()
    {
        if (UploadFile.Value != null)
        {
            string nam = UploadFile.PostedFile.FileName;
            //取得文件名(抱括路径)里最后一个"."的索引
            int i = nam.LastIndexOf(".");
            //取得文件扩展名
            string newext = nam.Substring(i);
            //这里我自动根据日期和文件大小不同为文件命名,确保文件名不重复
            DateTime now = DateTime.Now;
            string newname = now.ToFileTimeUtc() + UploadFile.PostedFile.ContentLength.ToString();
            //保存文件到你所要的目录,这里是IIS根目录下的uploadfiles目录
            //注意: 我这里用Server.MapPath()取当前文件的绝对目录.在asp.net里"\"必须用"\\"代替
            UploadFile.PostedFile.SaveAs(Server.MapPath("../UpLoad/" + newname + newext));
            //得到这个文件的相关属性:文件名,文件类型,文件大小
            fname = "UpLoad/" + newname + newext;
             
        } 
    } 
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;

        if (UploadFile.Value != null && UploadFile.Value != "")
        {
            FileUpLoad();
        } 
        if (Request["ID"] != null)
        {
            string id =Request["ID"].ToString();
            sql = "update tb_Goods set GoodsName='" + TextBox1.Text + "',TypeID='" + this.DropDownList1.SelectedItem.Value + "',Price='" + this.TextBox2.Text + "',Introduce='" + this.TextBox3.Text + "',GoodsPicture='" + fname + "',business='" + this.TextBox4.Text + "',Stock='" + this.TextBox5.Text + "' where GoodsID=" + id;
            bool b = DBHelper.ExecSql(sql);
            if (b)
            {
                Response.Write("<script>javascript:alert('操作成功');</script>");
            } 
            else
            {
                Response.Write("<script>javascript:alert('系统错误，您没有设置好数据库的连接！或您输入了一些非法字符！');</script>");
            } 
        } 
        else
        {
            sql = "insert into tb_Goods(GoodsName,TypeID,Price,Introduce,GoodsPicture,business,Stock) values('" + this.TextBox1.Text.Trim() + "','" + this.DropDownList1.SelectedItem.Value + "','" + this.TextBox2.Text + "','" + this.TextBox3.Text + "','" + fname  + "','" + this.TextBox4.Text + "','" + this.TextBox5.Text + "')";
            bool b = DBHelper.ExecSql(sql);
            if (b)
            {
                Response.Write("<script>javascript:alert('操作成功');</script>");
            } 
            else
            {
                Response.Write("<script>javascript:alert('系统错误，您没有设置好数据库的连接！');</script>");
            } 
        } 
    } 
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
        this.TextBox2.Text = "";
        this.TextBox3.Text = "";

       

    } 
} 