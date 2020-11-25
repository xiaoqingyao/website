
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
using System.Collections.Generic;

public partial class DocFile_TiKuKaoShi : System.Web.UI.Page
{
    public List<ERPTiKuKaoShi> EmailList = new List<ERPTiKuKaoShi>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

        }
    }
   
	public void DataBindToGridview(string IDList)
	{
        DataEntityDataContext context = new DataEntityDataContext();
        ZWL.BLL.ERPTiKuKaoShi MyLanEmail = new ZWL.BLL.ERPTiKuKaoShi();
        var T = context.ERPTiKuKaoShi.Where(p => p.ID>0).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
	}

    public string getZF(string id)
    {
return ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select sum(DeFen)  from ERPTiKuKaoShiJieGuo where DeFen is not null and KaoShiID=" + id);
    }

    public string getDN(string id)
    {
        return ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select sum(DeFen)  from ERPTiKuKaoShiJieGuo where TiMuID not in (select ID from ERPTiKu where FenLeiStr='¼ò´ðÌâ') and  DeFen is not null and KaoShiID=" + id);
    }

    public string getRG(string id)
    {
        return ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select sum(DeFen)  from ERPTiKuKaoShiJieGuo where TiMuID in (select ID from ERPTiKu where FenLeiStr='¼ò´ðÌâ') and  DeFen is not null and KaoShiID=" + id);
    }
	
}
