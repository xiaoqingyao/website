using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.BLL.SysManage;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.Controls
{
    public partial class PublicOper : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                DataTable dt=new DataTable();
                AllPower.BLL.SysManage.PublicOper bllPublicOper = new AllPower.BLL.SysManage.PublicOper();
                dt = bllPublicOper.GetList("ALL", Utils.getOneParams(""));
                if (dt.Rows.Count > 0)
                {
                    for(int i=0;i<dt.Rows.Count;i++)
                    {
                        DataRow dr = dt.Rows[i];
                        CheckBox chkbox = new CheckBox();
                        chkbox.ID = "chk" + dr["OperName"].ToString();
                        chkbox.Text = dr["Title"].ToString();
                        //chkbox.CheckedChanged += new System.EventHandler(this.chkbox_CheckedChanged);
                        this.Controls.Add(chkbox); 
                    }
                }
            }
        }

        public string GetCheckResout()
        {
            string strRrsout = string.Empty;
            foreach (System.Web.UI.Control findc in this.Controls)
            {
                if (findc is CheckBox)
                {
                    CheckBox tmpcb = (CheckBox)findc;
                    if (tmpcb.Checked)
                    {
                        strRrsout = strRrsout + tmpcb.ID;
                    }
                }
            }
            return strRrsout;
        }
    }
}