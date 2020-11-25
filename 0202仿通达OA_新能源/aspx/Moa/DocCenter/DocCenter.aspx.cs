using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Collections.Generic;

namespace OA.aspx.Moa.DocCenter{ 
 public partial class DocCenter: System.Web.UI.Page
{
    public List<ERPFileList> EmailList = new List<ERPFileList>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        FTD.BLL.ERPFileList MyLanEmail = new FTD.BLL.ERPFileList();
        string DirID = "0";
        try
        {
            DirID = Request.QueryString["DirID"].ToString();
        }
        catch { }

        FTD.BLL.ERPFileList MyModel = new FTD.BLL.ERPFileList();
        if (Request.QueryString["Type"].ToString().Trim() == "个人文件")
        {

            var T = context.ERPFileList.Where(p => p.UserName == FTD.Unit.PublicMethod.GetSessionValue("UserName") && p.IFDel == "否" && p.TypeName==Request.QueryString["Type"].ToString().Trim() && p.FileType!="dir").OrderByDescending(p => p.ID);
            EmailList = T.ToList();
        }        
        else if (Request.QueryString["Type"].ToString().Trim() == "单位文件")
        {
            var T = context.ERPFileList.Where(p => (p.UserName == FTD.Unit.PublicMethod.GetSessionValue("UserName") || p.CanView.Contains(FTD.Unit.PublicMethod.GetSessionValue("UserName"))) && p.IFDel == "否" && p.TypeName == Request.QueryString["Type"].ToString().Trim() && p.FileType != "dir").OrderByDescending(p => p.ID);
            EmailList = T.ToList();
           
        }
        else if (Request.QueryString["Type"].ToString().Trim() == "知识库")
        {
            var T = context.ERPFileList.Where(p => (p.UserName == FTD.Unit.PublicMethod.GetSessionValue("UserName") || p.CanView.Contains(FTD.Unit.PublicMethod.GetSessionValue("UserName"))) && p.IFDel == "否" && p.TypeName == Request.QueryString["Type"].ToString().Trim()  && p.FileType != "dir").OrderByDescending(p => p.ID);
            EmailList = T.ToList();
          
        }
        else if (Request.QueryString["Type"].ToString().Trim() == "共享文件")
        {
            var T = context.ERPFileList.Where(p => p.IFDel == "否" && p.IfShare=="是").OrderByDescending(p => p.ID);
            var TT = context.ERPFileList.Where(p=>p.FileType!="dir" && T.Where(c=>c.DirID==p.DirID).Count()>0);
            EmailList = TT.ToList();
            
           
        }        


        
    }
}}