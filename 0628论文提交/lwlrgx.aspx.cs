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
	public class lwlrgx : System.Web.UI.Page
	{		
                protected System.Web.UI.WebControls.TextBox lwText;
                protected System.Web.UI.WebControls.Button update;
		protected System.Web.UI.WebControls.Label message;
               	protected System.Web.UI.WebControls.RequiredFieldValidator rvf1;
		private void Page_Load(object sender, System.EventArgs e)
		{
                 if(IsPostBack==false)
		 lwText.Text=Session["lwtext"].ToString();
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
			string SqlStr="Update lwtj set lwText='"+lwText.Text.Replace("\r\n" , "<br>").Replace(" ","&nbsp;")+"' where stuNo="+Session["theno"];
		        SqlCommand Comm=new SqlCommand(SqlStr,Conn);
                        Comm.ExecuteNonQuery();
                        Conn.Close();
			message.Text="恭喜你!更新成功!";
                        }
			else
			{message.Text="发生错误,请按照文本框后的提示信息重新输入正确信息!";}
		}
	}
}
