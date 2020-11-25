using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class 后台_管理员工作界面 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int n = this.GridView1.SelectedIndex;
       // this.movieid_txt.TabIndex== this.GridView1.Rows[n].Cells[1].Text.ToString();
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // if (this.movieName_txt.Text == "" || this.dirctor_txt.Text == "" || this.leadingActor_txt.Text == "" || this.prices_txt.Text == "" || this.desciption_txt.Text == "")
        {

        }
       // else
        {

            if (FileUpload1.HasFile)
                SaveFile(FileUpload1.PostedFile);
            else
            {
                this.UploadStatusLabel.Visible = true;
                UploadStatusLabel.Text = "You did not specify a file to upload.";
            }

            string strurl = "image/";
            strurl += FileUpload1.FileName;

            string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sql = new SqlConnection();
            sql.ConnectionString = strCon;
            SqlCommand cmd = sql.CreateCommand();

            string strSQL = "insert into Film (FilmName,Dircetor,Protagonist,PictureURL,BriefIntro,Price) values ";
            strSQL += "('" + this.movieName_txt.Text + "','" + this.dirctor_txt.Text + "','" + this.leadingActor_txt.Text + "',";
            strSQL += "'" + strurl + "','" + this.desciption_txt.Text + "','" + this.prices_txt.Text + "')";
            cmd.CommandText = strSQL;
            int b = 0;
            sql.Open();
            b = (int)cmd.ExecuteNonQuery();
            if (b != 0)
            {
                this.UploadStatusLabel.Visible = true;
                this.UploadStatusLabel.Text = "添加成功";
            }
            sql.Close();

            Response.AddHeader("refresh", "0");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.UploadStatusLabel.Visible = false;
        this.movieName_txt.Text = "";
        this.dirctor_txt.Text = "";
        this.leadingActor_txt.Text = "";
        this.prices_txt.Text = "";
        this.desciption_txt.Text = "";
    }
    void SaveFile(HttpPostedFile file)
    {
        // Specify the path to save the uploaded file to.
        string savePath = @"F:\ASP.net\Rainbow\前台\image\";

        // Get the name of the file to upload.
        string fileName = FileUpload1.FileName;

        // Create the path and file name to check for duplicates.
        string pathToCheck = savePath + fileName;

        // Create a temporary file name to use for checking duplicates.
        string tempfileName = "";

        // Check to see if a file already exists with the
        // same name as the file to upload.        
        if (System.IO.File.Exists(pathToCheck))
        {
            int counter = 2;
            while (System.IO.File.Exists(pathToCheck))
            {
                // if a file with this name already exists,
                // prefix the filename with a number.
                tempfileName = counter.ToString() + fileName;
                pathToCheck = savePath + tempfileName;
                counter++;
            }

            fileName = tempfileName;

            // Notify the user that the file name was changed.
            UploadStatusLabel.Text = "A file with the same name already exists." +
                "<br />Your file was saved as " + fileName;
        }
        else
        {
            // Notify the user that the file was saved successfully.
            UploadStatusLabel.Text = "Your file was uploaded successfully.";
        }

        // Append the name of the file to upload to the path.
        savePath += fileName;

        // Call the SaveAs method to save the uploaded
        // file to the specified directory.
        FileUpload1.SaveAs(savePath);

    }
    protected void Button_Update_Click(object sender, EventArgs e)
    {
        string Filmid=" ", Pictureurl=" ", price=" ";
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        string strSQL = @"select FilmID,Price,PictureURL from Film where FilmName = '"+this.DropDownList_moive.SelectedValue.ToString()+"'";
        cmd.CommandText = strSQL;
        sql.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Filmid = dr["FilmID"].ToString();
            Pictureurl = dr["PictureURL"].ToString();
            price = dr["Price"].ToString();
        }
        dr.Close();
        strSQL = @"insert into FilmArrange (FilmID,FilmName,Class,theaterID,SRoomName,PlayTime,Price,PictureURL) values('" + Filmid + "','" + this.DropDownList_moive.SelectedValue.ToString() + "','" + this.DropDownList2.SelectedValue.ToString() + "','" + this.DropDownList_cinema.SelectedValue.ToString() + "','"+this.DropDownList1.SelectedValue.ToString()+"','" + this.TextBox1.Text + "--" + this.TextBox2.Text + "','" + price + "','" + Pictureurl + "')";
        cmd.CommandText = strSQL;
        int b = 0;
        b = (int)cmd.ExecuteNonQuery();
        if (b != 0)
        {
           // Response.Write("alert(&quot;更新成功！&quot;)");
        }
        else
        {
            //Response.Write("alert(&quot;更新失败！&quot;)");
        }
        sql.Close();
    
    }
    protected void DropDownList_cinema_SelectedIndexChanged(object sender, EventArgs e)
    {
        string name = this.DropDownList_cinema.SelectedValue;
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        string strSQL = @"select SRoomName from ScreenRoom where theaterID = '"+name+"'";
        cmd.CommandText = strSQL;
        sql.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            this.DropDownList1.Items.Add(dr["SRoomName"].ToString());
        }
        sql.Close();
    }
}
