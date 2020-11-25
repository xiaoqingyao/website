using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;
using System.IO;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月24日
    功能描述： 关键字文件导入
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class KeywordFileImport : AdminPage
    {
        BLL.Filter.KeywordFilter bllKeywordFilter = new AllPower.BLL.Filter.KeywordFilter();
        
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }
       

        #region 修改数据
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                FileImport();
            }
            else
            {
                Utils.AlertMessage(this, "你没有添加权限！");
            }
        }

        #region 文件导入
        private void FileImport()
        {
            string filePath =  Server.MapPath(keywordTxt.Value.Trim());
            string strLine = string.Empty;
            int txtCount = 0;     //文本文件行数
            int importCount = 0;   //成功导入行数
            char split = char.Parse(txtSplit.Text.Trim());
            string[] strArray;
            string strMessage = null;

            Model.Filter.KeywordFilter modelKeywordFilter = new AllPower.Model.Filter.KeywordFilter();
            modelKeywordFilter.AddMan = AddMan;
            modelKeywordFilter.SiteID = SiteID;
            modelKeywordFilter.IsDisable = 0;
            Encoding gb2312 = Encoding.GetEncoding("gb2312");

            using (StreamReader srFile = new StreamReader(filePath, gb2312))
            {
                while (srFile.Peek() > -1)
                {
                    strLine = srFile.ReadLine();
                    strArray = strLine.Split(split);
                    txtCount++;
                    if (strArray.Length == 2)
                    {
                        modelKeywordFilter.ID = Guid.NewGuid().ToString();
                        modelKeywordFilter.Keyword = strArray[0];
                        modelKeywordFilter.ReplaceStr = strArray[1];


                        strMessage = bllKeywordFilter.Save("new", modelKeywordFilter);

                        if (Utils.ParseInt(strMessage, 0) == 1)
                        {
                            importCount++;
                        }
                    }
                }

                srFile.Close();
            }

            //记录导入至数据库后，文件删除
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }

            string alertTitle = Utils.GetResourcesValue("Common", "TipMessage");
            WriteLog(GetLogValue(LogTitle, Action, "关键字文件导入", true), "", 2);
            strMessage = "共有" + txtCount.ToString() + " 行，成功导入 " + importCount.ToString() + " 条记录";
            Utils.RunJavaScript(this, "alert({msg:'" + strMessage + "',title:'" + alertTitle + "'})");

        }
        #endregion

        #endregion

    }
}
