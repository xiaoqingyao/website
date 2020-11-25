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
public class teacheradmin : System.Web.UI.Page
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

public void Sort_Grid(object sender, DataGridSortCommandEventArgs E)
	{
		      
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="select * from teacher  order by teacherNo";
                        SqlDataAdapter da=new SqlDataAdapter(SqlStr,Conn);
			DataSet ds=new DataSet();
			da.Fill(ds,"teacher");
			dg1.DataSource=ds.Tables["teacher"].DefaultView;
			dg1.DataBind();
	}
public void DataGrid_Edit(object sender, DataGridCommandEventArgs E)
                 {
                        BindData();
                        dg1.EditItemIndex=E.Item.ItemIndex;
                        BindData();
                 }
public void DataGrid_Cancel(object sender, DataGridCommandEventArgs E)	
                 {BindData();
                  dg1.EditItemIndex=-1;
                  BindData();
                 }

public void DataGrid_Delete(object sender, DataGridCommandEventArgs E)
		{                  	   
		      
		       SqlConnection Conn=new SqlConnection(data.strconn);
		       Conn.Open();
		       string Sqldel="delete from teacher where teacherNo="+dg1.DataKeys[(int)E.Item.ItemIndex];
                       SqlCommand Comm=new SqlCommand(Sqldel,Conn);
		       Comm.ExecuteNonQuery();
		       BindData();		            
                 }
public void BindData()
              {
              
	       SqlConnection Conn=new SqlConnection(data.strconn);
	       Conn.Open();               
               string SqlStr="select * from teacher";
               SqlDataAdapter da=new SqlDataAdapter(SqlStr,Conn);
	       DataSet ds=new DataSet();
	       da.Fill(ds,"teacher");
	       dg1.DataSource=ds.Tables["teacher"].DefaultView;
	       dg1.DataBind();
               Conn.Close();
              }
public void ChangePage(object sender,DataGridPageChangedEventArgs E)
       {
          dg1.CurrentPageIndex=E.NewPageIndex;
          BindData();
        }
		
		
	}
}
