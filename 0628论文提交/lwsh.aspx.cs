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
public class lwsh : System.Web.UI.Page
   {
   protected System.Web.UI.WebControls.DataGrid dg1;
   protected System.Web.UI.WebControls.Label Label1;
public void Page_Load(object sender, System.EventArgs E)
    {   string thename;
        thename=Session["teaname"].ToString();
        Label1.Text=thename;
        if(IsPostBack==false)
         {        
          BindData();
	 }
    }

override protected void OnInit(EventArgs e)
   {
    InitializeComponent();
    base.OnInit(e);
   }
		
		
private void InitializeComponent()
{    
  
  this.Load+=new System.EventHandler(this.Page_Load);

}

public void ChangePage(object sender,DataGridPageChangedEventArgs E)
       {
          dg1.CurrentPageIndex=E.NewPageIndex;
          BindData();
        }	
			
public void Click_Grid(object sender,  DataGridCommandEventArgs E)
        { 
          if(E.CommandName=="view")
         { 
          Session["stuno"]=dg1.DataKeys[(int)E.Item.ItemIndex];
          Response.Redirect("view.aspx");
         }
          else
          {
           
	   SqlConnection Conn=new SqlConnection(data.strconn);
	   Conn.Open();
           string SqlUpDate="Update lwtj Set isPass='“—…Û∫À' where stuNo="+dg1.DataKeys[(int)E.Item.ItemIndex];
           SqlCommand Comm=new SqlCommand(SqlUpDate,Conn);
	   Comm.ExecuteNonQuery();
           BindData();
          } 
        }

public void BindData()
       {
	
	SqlConnection Conn=new SqlConnection(data.strconn);
	Conn.Open();
	string SqlStr="select * from lwtj where teacherNo="+Session["teano"];
        SqlDataAdapter da=new SqlDataAdapter(SqlStr,Conn);
	DataSet ds=new DataSet();
	da.Fill(ds,"lwtj");
	dg1.DataSource=ds.Tables["lwtj"].DefaultView;
	dg1.DataBind();
	 }

	}
}
