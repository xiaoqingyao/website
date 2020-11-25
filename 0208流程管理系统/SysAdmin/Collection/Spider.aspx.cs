using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class Spider : AllPower.Web.Admin.AdminPage
    {
        private string _taskID;

        public string TaskID
        {
            get 
            {
                if (string.IsNullOrEmpty(this._taskID))
                {
                    this._taskID = Request.QueryString["TaskID"];
                }

                return this._taskID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TaskID))
            {
                BLL.Collection.Spider spider = new AllPower.BLL.Collection.Spider(TaskID);
                spider.Execute();
            }
        }
    }
}
