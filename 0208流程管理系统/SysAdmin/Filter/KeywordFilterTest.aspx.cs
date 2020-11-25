using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;
using System.Text.RegularExpressions;

using System.Runtime.InteropServices; 
using System.ComponentModel; 
using System.Threading;
 


#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月24日
    功能描述： 关键字替换测试页
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class KeywordFilterTest : AdminPage
    {
        BLL.Filter.KeywordFilter bllKeyFilter = new AllPower.BLL.Filter.KeywordFilter();
        HiPerfTimer timer;
        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void btnReplace_Click(object sender, EventArgs e)
        {
            string content = txtOldStr.Text.Trim();
            //DataTable dtKeyword = bllKeyFilter.GetList("KEYWORD", Utils.getOneParams(SiteID.ToString()));

            timer = new HiPerfTimer();            
            timer.Start();
            content = bllKeyFilter.ReplaceKeyword(content, SiteID);
            //if (!string.IsNullOrEmpty(content))
            //{   
            //    foreach (DataRow drKeyword in dtKeyword.Rows)
            //    {
            //        content = content.Replace(drKeyword[0].ToString(), drKeyword[1].ToString());                  
            //    }
            //}
            timer.Stop();
            
            lblMillisecond.Text = (timer.Duration*1000).ToString();

            txtNewStr.Text = content;
        }


        internal class HiPerfTimer
        {
            [DllImport("Kernel32.dll")]
            private static extern bool QueryPerformanceCounter(
                out long lpPerformanceCount);
            [DllImport("Kernel32.dll")]
            private static extern bool QueryPerformanceFrequency(
                out long lpFrequency);
            private long startTime, stopTime;
            private long freq;
            // 构造函数 
            public HiPerfTimer()
            {
                startTime = 0;
                stopTime = 0;
                if (QueryPerformanceFrequency(out freq) == false)
                {
                    // 不支持高性能计数器 
                    throw new Win32Exception();
                }
            }
            // 开始计时器 
            public void Start()
            {
                // 来让等待线程工作 
                Thread.Sleep(0);
                QueryPerformanceCounter(out startTime);
            }
            // 停止计时器 
            public void Stop()
            {
                QueryPerformanceCounter(out stopTime);
            }
            // 返回计时器经过时间(单位：秒) 
            public double Duration
            {
                get
                {
                    return (double)(stopTime - startTime) / (double)freq;
                }
            }
        } 

    }
}
