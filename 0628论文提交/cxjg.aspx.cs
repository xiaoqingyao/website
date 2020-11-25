using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace class_lwtjxt
{
	public class cxjg : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox stuName;
		protected System.Web.UI.WebControls.TextBox stuNo;
		protected System.Web.UI.WebControls.TextBox password1;
                protected System.Web.UI.WebControls.TextBox password2;
                protected System.Web.UI.WebControls.TextBox stuZy;
                protected System.Web.UI.WebControls.TextBox stuTel;
                protected System.Web.UI.WebControls.TextBox email;
                protected System.Web.UI.WebControls.TextBox teacherName;
                protected System.Web.UI.WebControls.TextBox teacherNo;                
		protected System.Web.UI.WebControls.TextBox lwTitle;               
                protected System.Web.UI.WebControls.TextBox keyWord;
                protected System.Web.UI.WebControls.TextBox lwzy;		
                protected System.Web.UI.WebControls.TextBox flh;
                protected System.Web.UI.WebControls.DropDownList xwlb;
                protected System.Web.UI.WebControls.DropDownList bmjb;
		protected System.Web.UI.WebControls.Button update;
          	protected System.Web.UI.WebControls.Label message;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf1;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvf2;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvf3;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf4;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf5;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf6;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf7;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf8;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf9;               
		protected System.Web.UI.WebControls.CompareValidator cv;
                          		
private void Page_Load(object sender, System.EventArgs e)
                { 
                 if(IsPostBack==false)
                 {
                 
		 SqlConnection Conn=new SqlConnection(data.strconn);
		 Conn.Open();
		 string SqlStr="select * from lwtj where isPass='未审核' and stuNo="+Session["theno"];
                 SqlCommand Comm=new SqlCommand(SqlStr,Conn);
		 SqlDataReader dr=Comm.ExecuteReader();
		 if(dr.Read())
                  {
                  stuNo.Text=Session["theno"].ToString();                  
                  stuName.Text=dr["stuName"].ToString();
                  password1.Text=dr["password"].ToString();
                  password2.Text=dr["password"].ToString();
                  stuZy.Text=dr["stuZy"].ToString();
                  stuTel.Text=dr["stuTel"].ToString();
                  email.Text=dr["email"].ToString();
                  teacherName.Text=dr["teacherName"].ToString();
                  teacherNo.Text=dr["teacherNo"].ToString();
                  lwTitle.Text=dr["lwTitle"].ToString();
                  keyWord.Text=dr["keyWord"].ToString();
                  lwzy.Text=dr["lwzy"].ToString().Replace("<br>","\r\n").Replace("&nbsp;"," "); 
                  xwlb.SelectedItem.Value=dr["xwlb"].ToString();
                  flh.Text=dr["flh"].ToString();
                  bmjb.SelectedItem.Value=dr["bmjb"].ToString();
                  Session["lwtext"]=dr["lwText"].ToString().Replace("<br>","\r\n").Replace("&nbsp;"," ");                  
                   }
                 
                 else
                  Response.Redirect("isPass.aspx");
                 }
                }
		override protected void OnInit(EventArgs e)
		{
		 InitializeComponent();
		 base.OnInit(e);
		}
		
		
		private void InitializeComponent()
		{    
		 this.update.Click+=new System.EventHandler(this.update_Click);
                 this.Load+=new System.EventHandler(this.Page_Load);
		}
                		
		private void update_Click(object sender, System.EventArgs e)
		{
			if(IsValid==true)
			{
			
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="Update lwtj set stuNo='"+stuNo.Text+"',stuName='"+stuName.Text+"',password='"+password1.Text+"',stuZy='"+stuZy.Text+"',stuTel='"+stuTel.Text+"',email='"+email.Text+"',teacherName='"+teacherName.Text+"',teacherNo='"+teacherNo.Text+"',lwTitle='"+lwTitle.Text+"',keyWord='"+keyWord.Text+"',lwzy='"+lwzy.Text.Replace("\r\n" , "<br>").Replace(" ","&nbsp;")+"' where stuNo="+Session["theno"];
		        SqlCommand Comm=new SqlCommand(SqlStr,Conn);
                        Comm.ExecuteNonQuery();
                        Conn.Close();			
                        Response.Redirect("lwlrgx.aspx");
                        }
			else
			{message.Text="发生错误,请按照文本框后的提示信息重新输入正确信息!";}
		}
	}
}
