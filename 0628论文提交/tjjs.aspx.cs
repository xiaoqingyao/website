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
	public class tjjs : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox teacherName;
		protected System.Web.UI.WebControls.TextBox teacherNo;
		protected System.Web.UI.WebControls.TextBox password1;
                protected System.Web.UI.WebControls.TextBox password2;
                protected System.Web.UI.WebControls.TextBox teacherZc;
                protected System.Web.UI.WebControls.TextBox teacherTel;
                protected System.Web.UI.WebControls.TextBox email;                 
		protected System.Web.UI.WebControls.Button submit;
		protected System.Web.UI.WebControls.Label message;
               	protected System.Web.UI.WebControls.RequiredFieldValidator rvf1;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvf2;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvf3;
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf4;
                
		protected System.Web.UI.WebControls.RegularExpressionValidator rev;
		protected System.Web.UI.WebControls.CompareValidator cv;
			
		private void Page_Load(object sender, System.EventArgs e)
		{
		 			
		}

		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		
		private void InitializeComponent()
		{    
			this.submit.Click += new System.EventHandler(this.submit_Click);
                        this.Load += new System.EventHandler(this.Page_Load);

		}
		
		private void submit_Click(object sender, System.EventArgs e)
		{
			if(IsValid==true)
			{
			
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="insert into teacher(teacherNo,teacherName,teacherPassword,teacherZc,teacherTel,teacherEmail) values('"+this.teacherNo.Text+"','"+this.teacherName.Text+"','"+this.password1.Text+"','"+this.teacherZc.Text+"','"+this.teacherTel.Text+"','"+this.email.Text+"')";
			SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			Comm.ExecuteNonQuery();
			Conn.Close();
			message.Text="恭喜你!添加成功!若不再继续添加,请单击<返回上页>返回!";
			}
			else
			{message.Text="发生错误,请重新输入正确信息!";}
		}
		
	}
}
