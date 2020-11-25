﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

namespace OA.aspx.DocCenter{ 
 public partial class DocHuiShou: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();

            //设定按钮权限            
            iButton3.Visible = FTD.Unit.PublicMethod.StrIFIn("|038D|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|038M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton2.Visible = FTD.Unit.PublicMethod.StrIFIn("|038E|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }
    }    
    public void DataBindToGridview()
    {
        FTD.BLL.ERPFileList MyModel = new FTD.BLL.ERPFileList();        
        GVData.DataSource = MyModel.GetList("IFDel='是' and FileName Like '%" + this.TextBox1.Text + "%' order by DirOrFile desc,ID desc");        
        GVData.DataBind();
        LabPageSum.Text = Convert.ToString(GVData.PageCount);
        LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
        this.GoPage.Text = LabCurrentPage.Text.ToString();
    }
    #region  分页方法
    protected void ButtonGo_Click(object sender, EventArgs e)
    {
        try
        {
            if (GoPage.Text.Trim().ToString() == "")
            {
                Response.Write("<script language='javascript'>alert('页码不可以为空!');</script>");
            }
            else if (GoPage.Text.Trim().ToString() == "0" || Convert.ToInt32(GoPage.Text.Trim().ToString()) > GVData.PageCount)
            {
                Response.Write("<script language='javascript'>alert('页码不是一个有效值!');</script>");
            }
            else if (GoPage.Text.Trim() != "")
            {
                int PageI = Int32.Parse(GoPage.Text.Trim()) - 1;
                if (PageI >= 0 && PageI < (GVData.PageCount))
                {
                    GVData.PageIndex = PageI;
                }
            }

            if (TxtPageSize.Text.Trim().ToString() == "")
            {
                Response.Write("<script language='javascript'>alert('每页显示行数不可以为空!');</script>");
            }
            else if (TxtPageSize.Text.Trim().ToString() == "0")
            {
                Response.Write("<script language='javascript'>alert('每页显示行数不是一个有效值!');</script>");
            }
            else if (TxtPageSize.Text.Trim() != "")
            {
                try
                {
                    int MyPageSize = int.Parse(TxtPageSize.Text.ToString().Trim());
                    this.GVData.PageSize = MyPageSize;
                }
                catch
                {
                    Response.Write("<script language='javascript'>alert('每页显示行数不是一个有效值!');</script>");
                }
            }

            DataBindToGridview();
        }
        catch
        {
            DataBindToGridview();
            Response.Write("<script language='javascript'>alert('请输入有效数字！');</script>");
        }
    }
    protected void PagerButtonClick(object sender, EventArgs e)
    {
        //获得Button的参数值
        string arg = ((ImageButton)sender).CommandName.ToString();
        switch (arg)
        {
            case ("Next"):
                if (this.GVData.PageIndex < (GVData.PageCount - 1))
                    GVData.PageIndex++;
                break;
            case ("Pre"):
                if (GVData.PageIndex > 0)
                    GVData.PageIndex--;
                break;
            case ("Last"):
                try
                {
                    GVData.PageIndex = (GVData.PageCount - 1);
                }
                catch
                {
                    GVData.PageIndex = 0;
                }

                break;
            default:
                //本页值
                GVData.PageIndex = 0;
                break;
        }
        DataBindToGridview();
    }
    #endregion
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        FTD.Unit.PublicMethod.GridViewRowDataBound(e);
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label MyLab = (Label)e.Row.FindControl("LabVisible");
            HyperLink MyHyp = (HyperLink)e.Row.FindControl("HyperLink1");
            Image MyImage = (Image)e.Row.FindControl("Image1");
            string ImagePath = "../../images/filetype/" + FTD.DBUnit.DbHelperSQL.GetSHSL("select FileType from ERPFileList where ID=" + MyLab.Text.Trim()) + ".gif";
            if (File.Exists(Server.MapPath(ImagePath)) == true)
            {
                MyImage.ImageUrl = ImagePath;
                //共享文件夹
                if (FTD.DBUnit.DbHelperSQL.GetSHSL("select FileType from ERPFileList where ID=" + MyLab.Text.Trim()) == "dir")
                {
                    //设置点击后进入相应文件夹
                    MyHyp.NavigateUrl = "#";
                    MyHyp.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select FileName from ERPFileList where ID=" + MyLab.Text.Trim());
                    if (FTD.DBUnit.DbHelperSQL.GetSHSL("select IfShare from ERPFileList where ID=" + MyLab.Text.Trim()) == "是")
                    {
                        MyImage.ImageUrl = "../../images/filetype/sharedir.gif";
                    }
                }
            }
            else
            {
                MyImage.ImageUrl = "../../images/filetype/unknown.gif";
            }
        }
    }
    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete ERPFileList where ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户彻底删除文档信息";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
    protected void iButton2_Click(object sender, EventArgs e)
    {
        string IDList = "0";
        for (int i = 0; i < GVData.Rows.Count; i++)
        {
            Label LabVis = (Label)GVData.Rows[i].FindControl("LabVisible");
            IDList = IDList + "," + LabVis.Text.ToString();
        }
        Hashtable MyTable = new Hashtable();
        MyTable.Add("FileName", "文件名");
        MyTable.Add("BianHao", "文档编号");
        MyTable.Add("DaXiao", "大小(KB)");
        MyTable.Add("ShangChuanTime", "上传时间");
        MyTable.Add("UserName", "上传人");
        MyTable.Add("IfShare", "是否共享");

        FTD.Unit.DataToExcel.GridViewToExcel(FTD.DBUnit.DbHelperSQL.GetDataSet("select FileName,BianHao,DaXiao,ShangChuanTime,UserName,IfShare from ERPFileList where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPFileList set IFDel='否'  where ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('恢复选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户恢复已删除的文档信息";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
}}