  using   System;     
  using   System.Collections;     
  using   System.ComponentModel;     
  using   System.Data;     
  using   System.Drawing;     
  using   System.Web;     
  using   System.Web.SessionState;     
  using   System.Web.UI;     
  using   System.Web.UI.WebControls;     
  using   System.Web.UI.HtmlControls;     
  using   System.IO;     
  using   System.Data.SqlClient   ;     
  using   System.Text;     
  using   System.Configuration; 
    
  namespace   class_lwtjxt     
  {     
    
  public   class   lwdc:System.Web.UI.Page     
  { 
  protected   System.Web.UI.WebControls.Label   flh;     
  protected   System.Web.UI.WebControls.Label   bmjb; 
  protected   System.Web.UI.WebControls.Label   stuno;   
  protected   System.Web.UI.WebControls.Label   stuname;
  protected   System.Web.UI.WebControls.Label   stuzy;
  protected   System.Web.UI.WebControls.Label   teaname;
  protected   System.Web.UI.WebControls.Label   xwlb;
  protected   System.Web.UI.WebControls.Label   lwtitle; 
  protected   System.Web.UI.WebControls.Label   lwtitle2;  
  protected   System.Web.UI.WebControls.Label   lwzy;
  protected   System.Web.UI.WebControls.Label   keyword;
  protected   System.Web.UI.WebControls.Label   lwtext; 
 
    
  private   void   Page_Load(object sender,System.EventArgs   e)     
  {
   BindData();
   Response.Charset="GB2312";     
   Response.ContentEncoding=System.Text.Encoding.GetEncoding("GB2312");     
   Response.ContentType="application/ms-word  ";  
   Response.AddHeader(  "Content-Disposition","inline;filename="+Session["stuno"]+".doc");  
    
  }     
  
  override   protected   void   OnInit(EventArgs   e)     
  {     
  InitializeComponent();     
  base.OnInit(e);     
  }     
    
  private   void   InitializeComponent()     
  {     
   
  this.Load+=new   System.EventHandler(this.Page_Load);     
  } 
     
  private   void   BindData()     
      {     
        
      
			SqlConnection Conn=new SqlConnection(data.strconn);
			Conn.Open();
			string SqlStr="select * from lwtj where stuNo="+Session["stuno"];
                        SqlCommand Comm=new SqlCommand(SqlStr,Conn);
			SqlDataReader dr=Comm.ExecuteReader();
			if (dr.Read())
                           { 
                             flh.Text=dr["flh"].ToString();
                             bmjb.Text=dr["bmjb"].ToString();
                             stuno.Text=dr["stuNo"].ToString();
                             stuname.Text=dr["stuName"].ToString();
                             stuzy.Text=dr["stuZy"].ToString();
                             teaname.Text=dr["teacherName"].ToString();
                             lwtitle.Text=dr["lwTitle"].ToString();
                             xwlb.Text=dr["xwlb"].ToString();
                             lwtitle2.Text=dr["lwTitle"].ToString();  
                             lwzy.Text=dr["lwzy"].ToString();
                             keyword.Text=dr["keyWord"].ToString();
                             lwtext.Text=dr["lwText"].ToString();
                           }
                              
      }    
     
  }     
  }