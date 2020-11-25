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

public partial class DocCenter_DocCenter : System.Web.UI.Page
{
    public List<ERPFileList> EmailList = new List<ERPFileList>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        ZWL.BLL.ERPFileList MyLanEmail = new ZWL.BLL.ERPFileList();
        string DirID = "0";
        try
        {
            DirID = Request.QueryString["DirID"].ToString();
        }
        catch { }

        ZWL.BLL.ERPFileList MyModel = new ZWL.BLL.ERPFileList();
        if (Request.QueryString["Type"].ToString().Trim() == "个人文件")
        {

            var T = context.ERPFileList.Where(p => p.UserName == ZWL.Common.PublicMethod.GetSessionValue("UserName") && p.IFDel == "否" && p.TypeName==Request.QueryString["Type"].ToString().Trim() && p.FileType!="dir").OrderByDescending(p => p.ID);
            EmailList = T.ToList();
        }        
        else if (Request.QueryString["Type"].ToString().Trim() == "单位文件")
        {
            var T = context.ERPFileList.Where(p => (p.UserName == ZWL.Common.PublicMethod.GetSessionValue("UserName") || p.CanView.Contains(ZWL.Common.PublicMethod.GetSessionValue("UserName"))) && p.IFDel == "否" && p.TypeName == Request.QueryString["Type"].ToString().Trim() && p.FileType != "dir").OrderByDescending(p => p.ID);
            EmailList = T.ToList();
           
        }
        else if (Request.QueryString["Type"].ToString().Trim() == "知识库")
        {
            var T = context.ERPFileList.Where(p => (p.UserName == ZWL.Common.PublicMethod.GetSessionValue("UserName") || p.CanView.Contains(ZWL.Common.PublicMethod.GetSessionValue("UserName"))) && p.IFDel == "否" && p.TypeName == Request.QueryString["Type"].ToString().Trim()  && p.FileType != "dir").OrderByDescending(p => p.ID);
            EmailList = T.ToList();
          
        }
        else if (Request.QueryString["Type"].ToString().Trim() == "共享文件")
        {
            var T = context.ERPFileList.Where(p => p.IFDel == "否" && p.IfShare=="是").OrderByDescending(p => p.ID);
            var TT = context.ERPFileList.Where(p=>p.FileType!="dir" && T.Where(c=>c.DirID==p.DirID).Count()>0);
            EmailList = TT.ToList();
            
           
        }        


        
    }
}