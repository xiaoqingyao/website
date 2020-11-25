using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Web;


    public class DataPage
    {
        #region 通用分页pagelist
        /// <summary>
        /// 通用分页
        /// </summary>
        /// <param name="pageszie">每页显示数量</param>
        /// <param name="pageindex">当前第几页</param>
        /// <param name="tablename">表名</param>
        /// <param name="field">查询字段名</param>
        ///  <param name="keyfield">主键</param>
        ///  <param name="strwhere">查询条件</param>
        /// <param name="sort">排序字段</param>
        /// <param name="recordcount">返回记录总数</param>
        public DataSet pagelist(int pageszie, int pageindex, string tablename, string field, string keyfiled, string strwhere, string sort, out int recordcount)
        {
            if (field == "")
            {
                field = " * ";
            }
            if (strwhere == "")
            {
                strwhere = " 1=1 ";
            }
            
            string strSql1 = "select count(*) from " + tablename + " where " + strwhere;
            Object obj = SqlHelper.ExecuteScalar(strSql1.ToString());
            recordcount = obj == null ? 0 : Convert.ToInt32(obj.ToString());
            if (pageindex > 1)
            {
                strwhere += " and " + keyfiled + " not in (select top " + pageszie * (pageindex - 1) + " " + keyfiled + " from " + tablename + " where " + strwhere + " order by " + sort + ")";
            }
            string strSql = "select top " + pageszie + " " + field + " from " + tablename + " where " + strwhere + " order by " + sort;

            return SqlHelper.ExecuteforDataSet(strSql.ToString());

        }
        #endregion

    

     
        public string fl_up(System.Web.UI.WebControls.FileUpload f1, string lj)
        {
            string str = "";
            if (f1.HasFile)
            {

                 string tp = f1.PostedFile.FileName.Substring(f1.PostedFile.FileName.LastIndexOf("."));
                 string fileContentType = tp.ToLower();
                if (fileContentType == ".jpg" || fileContentType == ".gif" || fileContentType == ".png")
                {
                    
                    string fileName = DateTime.Now.ToString("yyyyMMddhhmmssfff") + "B" + tp; // 文件名称 
                    string webFilePath = lj + fileName;
                    string fpts = lj;
                    if (!System.IO.Directory.Exists(fpts)) //如果目录不存在，创建
                    {
                        System.IO.Directory.CreateDirectory(fpts);
                    }
                    while (System.IO.File.Exists(webFilePath))
                    {
                        Int64 llj = Convert.ToInt64(DateTime.Now.ToString("yyyyMMddhhmmssfff")) + 1;
                        fileName = llj.ToString() + "B" + tp;
                        webFilePath = fpts + fileName;
                    }
                    try
                    {
                        f1.SaveAs(webFilePath); // 使用 SaveAs 方法保存文件 
                        str = fileName;
                    }
                    catch (Exception ex)
                    {
                        str = "0";
                    }
                }
                else
                {
                    str = "1";
                }
            }
            return str;
        }


    


    }

