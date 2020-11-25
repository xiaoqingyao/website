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
public class stuadmin : System.Web.UI.Page
   {
   protected System.Web.UI.WebControls.DataGrid dg1;
   public void Page_Load(object sender, System.EventArgs E)
   {
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
  
  this.Load += new System.EventHandler(this.Page_Load);
   
}

public void BindData()
  {
   //string SqlConn="Data Source=(local);Database=lwtjdb;User Id=sa;pwd=sa";
  
   SqlConnection Conn=new SqlConnection(data.strconn);
   Conn.Open();
   string SqlStr="select stuNo,stuName,stuZy,lwTitle from lwtj";
   SqlDataAdapter da=new SqlDataAdapter(SqlStr,Conn);
   DataSet ds=new DataSet();
   da.Fill(ds,"lwtj");
   dg1.DataSource=ds.Tables["lwtj"].DefaultView;
   dg1.DataBind();
 }
public void Sort_Grid(object sender, DataGridSortCommandEventArgs E) //≈≈–Ú
	{
        
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="select * from lwtj  order by stuNo";
                        SqlDataAdapter da=new SqlDataAdapter(SqlStr,Conn);
			DataSet ds=new DataSet();
			da.Fill(ds,"lwtj");
			dg1.DataSource=ds.Tables["lwtj"].DefaultView;
			dg1.DataBind();
	}

public void ChangePage(object sender,DataGridPageChangedEventArgs E)
       {
          dg1.CurrentPageIndex=E.NewPageIndex;
          BindData();
        }	
		  
public void Click_Grid(object sender, DataGridCommandEventArgs E) 
		{  
                        if (E.CommandName=="daochu")
			   { Session["stuno"]=dg1.DataKeys[(int)E.Item.ItemIndex];
                             Response.Redirect("lwdc.aspx");}  
			else if(E.CommandName=="delete")
			   {

			     SqlConnection Conn=new SqlConnection(data.strconn);
			     Conn.Open();
			     string Sqldel="delete from lwtj where stuNo="+dg1.DataKeys[(int)E.Item.ItemIndex];
                             SqlCommand Comm=new SqlCommand(Sqldel,Conn);
			     Comm.ExecuteNonQuery();
			     string SqlStr="select stuNo,stuName,stuZy,lwTitle from lwtj";
                             SqlDataAdapter da=new SqlDataAdapter(SqlStr,Conn);
			     DataSet ds=new DataSet();
			     da.Fill(ds,"lwtj");
			     dg1.DataSource=ds.Tables["lwtj"].DefaultView;
			     dg1.DataBind();				            
                           }    
        }      
			
		
		
	}
}
