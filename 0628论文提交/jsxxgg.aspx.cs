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
	public class jsxxgg : System.Web.UI.Page
	{       
		protected System.Web.UI.WebControls.TextBox teacherName;
                protected System.Web.UI.WebControls.TextBox teacherNo;
		protected System.Web.UI.WebControls.TextBox password1;
                protected System.Web.UI.WebControls.TextBox password2;
                protected System.Web.UI.WebControls.TextBox teacherZc;
                protected System.Web.UI.WebControls.TextBox teacherTel;
                protected System.Web.UI.WebControls.TextBox email;                 
		protected System.Web.UI.WebControls.Button update;
		protected System.Web.UI.WebControls.Label message;
               	protected System.Web.UI.WebControls.RequiredFieldValidator rvf1;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf2;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvf3;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf4;
                protected System.Web.UI.WebControls.CompareValidator cv;
			
		private void Page_Load(object sender, System.EventArgs e)
		{       
                   if(IsPostBack==false)
                       {
                      
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="select * from teacher where teacherNo="+Session["teano"];
                        SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			SqlDataReader dr=Comm.ExecuteReader();
			if (dr.Read())
                           {                                                                                                                              teacherName.Text=dr["teacherName"].ToString();
                            teacherNo.Text=dr["teacherNo"].ToString();
                            password1.Text=dr["teacherPassword"].ToString();
                            password2.Text=dr["teacherPassword"].ToString();
                            teacherZc.Text=dr["teacherZc"].ToString();
                            teacherTel.Text=dr["teacherTel"].ToString();
                            email.Text=dr["teacherEmail"].ToString();
                            dr.Close();
                            Conn.Close();
                           }
                      }
			
		}

		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		
		private void InitializeComponent()
		{    
			this.update.Click += new System.EventHandler(this.update_Click);
                        this.Load += new System.EventHandler(this.Page_Load);

		}
		
		private void update_Click(object sender, System.EventArgs e)
		{
			if(IsValid==true)
			{
	
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="UpDate teacher Set teacherName='"+this.teacherName.Text+"',teacherNo='"+this.teacherNo.Text+"',teacherPassword='"+this.password1.Text+"',teacherZc='"+this.teacherZc.Text+"',teacherTel='"+this.teacherTel.Text+"',teacherEmail='"+this.email.Text+"' where teacherNo="+Session["teano"];
			SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			Comm.ExecuteNonQuery();
			Conn.Close();
			message.Text="恭喜你!修改成功!请单击<返回上页>返回!";
			}
			else
			{message.Text="发生错误,请按照文本框后的提示信息重新输入正确信息!";}
		}
		
	}
}
