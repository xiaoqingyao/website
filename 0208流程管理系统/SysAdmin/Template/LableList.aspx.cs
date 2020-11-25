using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AllPower.Common;
using System.Text;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:     胡志瑶
    创建时间： 2010年9月07日
    功能描述： 标签管理/标签列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class LableList : AllPower.Web.Admin.AdminPage
    {
        private AllPower.BLL.Template.Lable lable = new AllPower.BLL.Template.Lable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InitControlData();
                int pageIndex = Request["page"] != null ? int.Parse(Request["page"]) : 1;
                PageInit(pageIndex);
                this.SetRight(null, rptListInfo);
            }
        }

        private void InitControlData()
        {
            //绑定分类
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = 1;
            prams.I2 = 50;
            prams.I3 = -1;
            prams.S1 = SiteID.ToString();

            DataTable dt = lable.GetLable("LableClass", prams).Tables[1];
            reptClass.DataSource = dt;
            reptClass.DataBind();
          
        }

        private void PageInit(int pageIndex)
        { 
            
            
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = pageIndex;
            prams.I2 = Split.PageSize;
            prams.I3 = int.Parse(dropIsSystem.SelectedValue);
            prams.S1 = txtLableName.Text.Trim();
            prams.S2 = Request["classID"];
            prams.S3 = SiteID.ToString();

            DataSet ds = lable.GetLable("LableList", prams);
            if (ds != null)
            {
                rptListInfo.DataSource = ds.Tables[1];
                rptListInfo.DataBind();

                Split.CurrentPageIndex = pageIndex;
                Split.RecordCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                Split.PageSize = Split.PageSize;
            }
            txtLableName.Attributes.Add("onkeydown", "if(event.keyCode==13)" + this.Page.ClientScript.GetPostBackEventReference(this.btnQuery, null)); //回车事件
          
        }
        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete();           
        }

        private void Delete()
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                StringBuilder ids = new StringBuilder();      //选中的标签
                StringBuilder freeIds = new StringBuilder();  //选中的自由标签
                StringBuilder names = new StringBuilder();
                foreach (RepeaterItem item in rptListInfo.Items)
                {
                    CheckBox check = item.FindControl("check") as CheckBox;
                    if (check.Checked)
                    {
                        LinkButton lbtnDelete = item.FindControl("lbtnDelete") as LinkButton;
                        if (int.Parse(lbtnDelete.CommandName) == 10)
                        {
                            freeIds.Append(lbtnDelete.CommandArgument + ",");
                        }
                        else
                        {
                            ids.Append(lbtnDelete.CommandArgument + ",");
                        }
                        Label lblName = item.FindControl("lblName") as Label;
                        names.Append(lblName.Text + ",");
                    }
                }
                hidLogTitle.Value = names.ToString().TrimEnd(',');
                try
                {
                    if (!string.IsNullOrEmpty(ids.ToString()))
                    {
                        //删除Lable表中的数据
                        AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
                        prams.I1 = -1;
                        prams.S1 = ids.ToString().TrimEnd(',');
                        lable.DeleteLable("ONELABLE", prams);                       
                    }
                    if (!string.IsNullOrEmpty(freeIds.ToString()))
                    {
                        //删除Lable_Free表中的数据
                        lable.DeleteLableFree(freeIds.ToString().TrimEnd(','));
                    }
                   
                    PageInit(Split.CurrentPageIndex);
                    WriteLog(GetLogValue(hidLogTitle.Value, "Del", "Lable", true), "", 2);
                }
                catch (Exception exp)
                {
                    WriteLog(GetLogValue(hidLogTitle.Value, "Del", "Lable", false), "", 3); //写日志                      
                    Utils.AlertMessage(this, exp.Message);
                    return;
                }
             
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限！");
            }
        }

        //禁用,启用
        public void LableList_State(object sender, CommandEventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("State"))
            {
                string returnMsg;
                string[] strMessage = AllPower.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态

                #region 是否启用状态标识更改
                int iEnable = AllPower.Common.Utils.BoolToInt(strMessage[1]);
                if (iEnable == 1)
                {
                    iEnable = 0;
                }
                else
                {
                    iEnable = 1;
                }
                #endregion
                //tranType = STATE，调用存储过程名[proc_K_SysModuleSet]
                returnMsg = lable.LableEnable(iEnable,Utils.ParseInt(strMessage[0],0),Utils.ParseInt (strMessage[2],1));
                PageInit(Split.CurrentPageIndex);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'更新操作失败，没有权限！',title:'提示信息'})");
            }
        }

        protected void rptListInfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lbtnDelete = (LinkButton)e.Item.FindControl("lbtnDelete");

                HyperLink hypEdit = (HyperLink)e.Item.FindControl("hypEdit");
                HyperLink hypCopy = (HyperLink)e.Item.FindControl("hypCopy");              
                string lableId = lbtnDelete.CommandArgument;
                int isSystem = int.Parse(lbtnDelete.CommandName);

                string url = "", title = "";
                switch (isSystem)
                {
                    case 1:
                        url = "LableSystemEdit.aspx";
                        title = "系统标签";                        
                        break;
                    case 2:
                        url = "LablePageEdit.aspx";
                        title = "分页标签";
                        break;
                    case 10:
                        url = "LableFreeFirstEdit.aspx";
                        title = "自由标签";
                        break;
                    default:
                        url = "LableStaticEdit.aspx";
                        title = "静态标签";;
                        break;
                }
                url += "?NodeCode=" + NodeCode + "&IsSystem=" + isSystem + "&id=" + lableId;
                (e.Item.FindControl("lblIsSystem") as Label).Text = title;
                hypEdit.NavigateUrl = url + " &action=edit";
                hypCopy.NavigateUrl =  url+" &action=copy";
            }
        }
        #region 新建标签
        //10:自由标签 0:静态标签 1：系统标签 2：分页标签
        protected void AddLable(int type)
        {
            string url = "";
            switch (type)
            {
                case 1:
                    url = "LableSystemEdit.aspx?NodeCode=" + NodeCode + "&IsSystem=" + type;                   
                    break;
                case 2:
                    url = "LablePageEdit.aspx?NodeCode=" + NodeCode + "&IsSystem=" + type;       
                    
                    break;
                case 10:
                    url = "LableFreeFirstEdit.aspx?NodeCode=" + NodeCode + "";                  
                    break;
                default:
                    url = "LableStaticEdit.aspx?NodeCode=" + NodeCode + "&IsSystem=" + type;                         
                    break;
            }
            Response.Redirect(url);
        }

        protected void btnStaticNew_Click(object sender, EventArgs e)
        {
            AddLable(0);
        }

        protected void btnSystemNew_Click(object sender, EventArgs e)
        {
            AddLable(1);
        }

        protected void btnPageNew_Click(object sender, EventArgs e)
        {
            AddLable(2);
        }

        protected void btnFreeNew_Click(object sender, EventArgs e)
        {
            AddLable(10);
        }
        #endregion

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            PageInit(1);
        }

        //生成Dreamweaver插件
        protected void btnDW_Click(object sender, EventArgs e)
        {           
            string userPath = lable.CreateDwPlugins(SiteID);
            dlZipDir(userPath, "hqblable");
           
        }
        ZipOutputStream zos = null;
        string strBaseDir = "";

        private void addZipEntry(string PathStr)
        {
            DirectoryInfo di = new DirectoryInfo(PathStr);
            foreach (DirectoryInfo item in di.GetDirectories())
            {
                addZipEntry(item.FullName);
            }
            foreach (FileInfo item in di.GetFiles())
            {
                FileStream fs = File.OpenRead(item.FullName);
                byte[] buffer = new byte[fs.Length];
                fs.Read(buffer, 0, buffer.Length);
                string strEntryName = item.FullName.Replace(strBaseDir, "");
                ZipEntry entry = new ZipEntry(strEntryName);
                zos.PutNextEntry(entry);
                zos.Write(buffer, 0, buffer.Length);
                fs.Close();
            }
        }
        //zip压缩
        private void dlZipDir(string strPath, string strFileName)
        {
            MemoryStream ms = null;
            Response.ContentType = "application/octet-stream";
            strFileName = HttpUtility.UrlEncode(strFileName).Replace('+', ' ');
            Response.AddHeader("Content-Disposition", "attachment;   filename=" + strFileName + ".zip");
            ms = new MemoryStream();
            zos = new ZipOutputStream(ms);
            strBaseDir = strPath + "\\";
            addZipEntry(strBaseDir);
            zos.Finish();

            //删除打包之前的文件  
            DeleteFolder(strPath);

            zos.Close();
            Response.Clear();
            Response.BinaryWrite(ms.ToArray());
            Response.End();
        }

        //删除目录
        public void DeleteFolder(string path)
        {
            if (Directory.Exists(path)) //如果存在这个文件夹删除之   
            {
                foreach (string d in Directory.GetFileSystemEntries(path))
                {
                    if (File.Exists(d))
                    {
                        FileInfo file = new FileInfo(d);
                        if (file.Attributes.ToString().IndexOf("ReadOnly") != -1)
                        {
                            file.Attributes = FileAttributes.Normal;
                        }


                        File.Delete(d); //直接删除其中的文件  
                    }
                    else
                    {
                        DeleteFolder(d); //递归删除子文件夹   
                    }
                }
                Directory.Delete(path, true); //删除已空文件夹   

            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
          

        }

    }
}
