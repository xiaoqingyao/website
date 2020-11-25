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
	public class lwtj : System.Web.UI.Page
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
                protected System.Web.UI.WebControls.TextBox lwtm;                
		protected System.Web.UI.WebControls.TextBox lwTitle;
                protected System.Web.UI.WebControls.TextBox lwgjz;
                protected System.Web.UI.WebControls.TextBox keyWord;
                protected System.Web.UI.WebControls.TextBox lwzy;
		protected System.Web.UI.WebControls.TextBox lwBody;
                protected System.Web.UI.WebControls.DropDownList xwlb;
                protected System.Web.UI.WebControls.TextBox flh;
                protected System.Web.UI.WebControls.DropDownList bmjb;
		protected System.Web.UI.WebControls.Button submit;
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
                protected System.Web.UI.WebControls.RequiredFieldValidator rvf10;
		protected System.Web.UI.WebControls.RegularExpressionValidator rev;
		protected System.Web.UI.WebControls.CompareValidator cv;
			
		private void Page_Load(object sender, System.EventArgs e)
		{
		 
		 SqlConnection Conn=new SqlConnection(data.strconn);
		 Conn.Open();
		 string SqlStr="select * from lwtj where stuNo='"+stuNo.Text+"'";
                 SqlCommand Comm=new SqlCommand(SqlStr,Conn);
		 SqlDataReader dr=Comm.ExecuteReader();
		 if(dr.Read())
                   {Response.Redirect("yjtj.aspx");}
			
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
                //,isPass      
		           SqlConnection Conn=new SqlConnection(data.strconn);
		           Conn.Open();
                   string SqlStr = "insert into lwtj(stuName,stuNo,password,stuZy,stuTel,email,teacherName,teacherNo,lwTitle,keyWord,lwzy,xwlb,flh,bmjb,isPass,lwText) values('" + this.stuName.Text + "','" + this.stuNo.Text + "','" + this.password1.Text + "','" + this.stuZy.Text + "','" + this.stuTel.Text + "','" + this.email.Text + "','" + this.teacherName.Text + "','" + this.teacherNo.Text + "','" + this.lwTitle.Text + "','" + this.keyWord.Text + "','" + this.lwzy.Text.Replace("\r\n", "<br>").Replace(" ", "&nbsp;") + "','" + this.xwlb.SelectedItem.Value + "','" + this.flh.Text + "','" + this.bmjb.SelectedItem.Value + "','未审核','')";
			   SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			   Comm.ExecuteNonQuery();
			   Conn.Close();			   
                           Session["stuno"]=stuNo.Text;
                           Response.Redirect("lwlrtj.aspx");
			  }                       
                      else
			{message.Text="发生错误,请按照文本框后的提示信息重新输入正确信息!";}
		}
	}
}
