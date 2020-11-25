using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月28日
    功能描述： 广告js模板编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class AdvertisementJsEdit : AdminPage
    {
        #region  初始的参数
        FileReadOrWrite file = new FileReadOrWrite();
        private string _src = null;

        /// <summary>
        /// 路径
        /// </summary>
        public string Src
        {
            get
            {
                if (this._src == null)
                {
                    this._src = Utils.ReqUrlParameter("src");
                }

                return this._src;
            }
        }
        #endregion

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        void PageInit()
        {
            if (Src != "")
            {
                string strFile = "Advertisement/js/" + Src;
                if (System.IO.File.Exists(Utils.GetPath(strFile)))  //如果文件存在才更新文件,防止别人乱操作
                {
                    txtCode.Value = file.FileRead(strFile);//文件读取      ;
                }
                else
                {
                    txtCode.Value = "文件不存在";
                }
            }
            else
            {
                txtCode.Value = "文件不存在";
            }
        }
        #endregion

        #region 操作
         /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strFile = "Advertisement/js/" + Src;
            if (System.IO.File.Exists(Utils.GetPath(strFile)))  //如果文件存在才更新文件,防止别人乱操作
            {
                if (file.FileWrite(txtCode.Value, strFile))//文件保存
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddSucess") + "',title:'提示信息'})");
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddError") + "',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddError") + "',title:'提示信息'})");
            }
        }
        #endregion
    }
}
