using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class ly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Load += new System.EventHandler(Page_Load);
        if (!Page.IsPostBack)
        {
            BindData();
        }
        Radio1.Enabled = true ;
        Radio2.Enabled = true;
        span1.InnerHtml = "";
    }
    public void BindData()
    {
        //连接数据库
        string connString = "Data Source=bobo-pc;Initial Catalog=XQWY;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connString);
        string sql = "select ID,Name,PicAddr,TType from Face order by ID";
        connection.Open();
        SqlCommand command = new SqlCommand(sql, connection);
        SqlDataReader dataReader = command.ExecuteReader();
        if (drop.Items.Count > 0)
        {

            for (int i = 0; i< drop.Items.Count - 1; i++)
            {
                drop.Items.RemoveAt(i);
            }

        }
        while (dataReader.Read())//'数据库中存在头像信息，循环添加下拉选项
        {
          
            drop.Items.Add(new ListItem(dataReader.GetString(1), dataReader.GetString(2) + dataReader.GetString(3) +dataReader.GetInt32(0).ToString ("000")));
            int j = 0;
            if (j == 0)
            {//初始化头像的显示
                dispimg.ImageUrl = drop.Items[0].Value.Substring(0,drop.Items[0].Value.Length -5);
                j = 1;
            }
        }
        dataReader.Close();
        connection.Close();

    }

    public  void Index_Changed(object sender, EventArgs e)
    {
        drop.SelectedIndexChanged += new System.EventHandler(Index_Changed);
        string theStr;
       
        theStr = drop.SelectedItem.Value;//获取当前头像下拉列表框选项中的返回值
        dispimg.ImageUrl = theStr.Trim().Substring(0, theStr.Trim().Length - 5);//从返回值中获取头像图片的地址
        if (theStr.Substring(theStr.Trim().Length-5, 2) == "帅哥")
        {
            Radio1.Checked = true;
            Radio2.Checked = false;
        }
        else
        {
            Radio1.Checked = false;
            Radio2.Checked = true;
        }

    }
    protected void sure_click(object sender, EventArgs e)
    {
        sure.Click += new System.EventHandler(sure_click);
        //int i, j;
        int theFace;
        string theDDate,theTrueName;
        string theName, theType, theQQ, theEmail, theHome, theTit, theContent;
        theName = name.Text;//获取昵称信息
        theQQ = qq.Text;//获取QQ号码
        theEmail = email.Text;//获取E-mail信息
        theHome = homepage.Text;//获取个人主页信息
        theTit = theTitle.Text;//获取留言主题
        theContent = Content.Text;//获取留言内容
        theFace = Convert.ToInt32(drop.SelectedItem.Value.Substring(drop.SelectedItem.Value.Length - 3, 3));//获取头像ID
        theDDate = System.DateTime.Now.ToString();
        //theReplyDate = System.DateTime.Now.ToString();
        theTrueName = textbox1.Text;
        /*if (checkbox1.Checked)
        { StrQQH = "1"; }
        else
        { StrQQH = "0"; }*/

        if (Radio1.Checked)
        { theType = "帅哥"; }
        else
        { theType = "美女"; }
        if (theName == "" || theTit == "" || theContent == "")
        { span1.InnerHtml = "<font color=red><small>昵称、主题、内容均不可为空！</small></font>"; }
        else
        {
            string connString = "Data Source=bobo-pc;Initial Catalog=XQWY;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connString);
            string sql = String.Format("insert LYSheet(NiCheng,Sex,QQ,Email,Homepage,Title,Content,FaceID,DDate,户主)" +
            "VALUES('{0}','{1}', '{2}','{3}','{4}','{5}','{6}',{7},'{8}','{9}')",
            theName, theType, theQQ, theEmail, theHome, theTit, theContent, theFace, theDDate,  theTrueName);
            connection.Open();
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader dataReader = command.ExecuteReader();
            connection.Close();
            Response.Redirect("main1.aspx");//跳转至留言浏览页面

        }
    }
    protected void Clear_click(object sender, EventArgs e)
    {
        clear.Click += new System.EventHandler(Clear_click);
        name.Text = "";
        email.Text = "";
        qq.Text = "";
        homepage.Text = "";
        theTitle.Text = "";
        Content.Text = "";
        span1.InnerHtml = "";
    }

}