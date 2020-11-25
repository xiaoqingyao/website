using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace OA.aspx.Main{ 
 public partial class MyDesk: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            //读取个人设置
            FTD.BLL.ERPUserDesk MyModel = new FTD.BLL.ERPUserDesk();
            DataSet MyDataSet = MyModel.GetList("UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' order by ID asc");

            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    string StartStr = "<table width=\"100%\"><tr><td valign=\"top\" width=\"50%\">";
                    string EndStr = "</td></tr></table>";
                    string MidStr = "";
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        //对当前次数求余，为1时为一行结束，否则0代表还有一个td
                        int TdInt = i % 2;
                        //按照设置显示桌面
                        string TTStr = "<div class=\"bigtype\"><table  width=\"98%\"  cellpadding=\"0\" cellspacing=\"0\" ><tr ><td height=\"30px\" background=\"../../images/list_hd_bg.png\"><img src=\"../../images/collapse_arrow.png\" width=\"16\" height=\"16\" align=\"absmiddle\"><a class=\"heiBold\" href=\"javascript:void(0);\" onclick=\"SwitchMenu('Model" + i.ToString() + "')\">" + MyDataSet.Tables[0].Rows[i]["ModelName"].ToString() + "</a></td><td background=\"../../images/list_hd_bg2.png\"><div align=\"right\"><a href=\"MyDeskModify.aspx?ModelName=" + MyDataSet.Tables[0].Rows[i]["ModelName"].ToString() + "\"><img src=\"../../images/pencil.png\" width=\"10\" height=\"10\" border=\"0\" align=\"absmiddle\"></a>&nbsp; <img onclick=\"_delmodel('" + MyDataSet.Tables[0].Rows[i]["ModelName"].ToString() + "')\" class=\"HerCss\" src=\"../../images/close_x.png\" width=\"10\" height=\"10\" border=\"0\" align=\"absmiddle\">&nbsp; </div></td></tr></table></div><div class=\"Model" + i.ToString() + "\">" + GetDeskLink(MyDataSet.Tables[0].Rows[i]["ModelName"].ToString(), int.Parse(MyDataSet.Tables[0].Rows[i]["LookNum"].ToString())) + "</div>";
                        if (i != 0)
                        {
                            if (TdInt != 0)
                            {
                                MidStr = MidStr + TTStr + "</td></tr><tr><td valign=\"top\" width=\"50%\">";
                            }
                            else
                            {
                                MidStr = MidStr + TTStr + "</td><td valign=\"top\" width=\"50%\">";
                            }
                        }
                        else
                        {
                            MidStr = MidStr + TTStr + "</td><td valign=\"top\" width=\"50%\">";
                        }

                    }
                    this.Label1.Text = StartStr + MidStr + EndStr;
                }
            }

            //绑定单位门户

            BindDW();

        }
    }

    private string GetDeskLink(string ModelName, int ModelNum)
    {
        string StartStr = "<table width=\"98%\">";
        string EndStr = "</table>";
        string MidStr = "";
        string OKStr = "";

        if (ModelName == "我的工作")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPNWorkToDO where   UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "'  order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../NWorkFlow/NWorkToDOView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["WorkName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["StateNow"].ToString() + "</td></tr>";
                    }
                }
            }
        }
        else if (ModelName == "内部邮件")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPLanEmail where ToUser='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' and (EmailState='未读' or EmailState='已读')  order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../LanEmail/EmailView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["EmailTitle"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                    }
                }
            }
        }
        else if (ModelName == "单位公告通知")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPGongGao where TypeStr='单位' and (UserBuMen='所有部门' or UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' or ','+UserBuMen+',' like '%," + FTD.Unit.PublicMethod.GetSessionValue("Department") + ",%') order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../GongGao/GongGaoView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td><td>发布人：" + MyDataSet.Tables[0].Rows[i]["UserName"].ToString() + "</td></tr>";
                    }
                }
            }
        }
        else if (ModelName == "投票")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPVote order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../GongGao/VoteView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td><td>发布人：" + MyDataSet.Tables[0].Rows[i]["UserName"].ToString() + "</td></tr>";
                    }
                }
            }
        }
        else if (ModelName == "日程安排")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPAnPai where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../Work/RiChengView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeTiXing"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["GongXiangWho"].ToString() + "</td></tr>";
                    }
                }
            }
        }
        else if (ModelName == "工作日志")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPWorkRiZhi where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../Work/WorkRiZhiView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TypeStr"].ToString() + "</td></tr>";
                    }
                }
            }
        }

        else if (ModelName == "公共通讯簿")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPTongXunLu where TypeStr='公共通讯簿' order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../Work/TongXunLuView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["NameStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWeiMingCheng"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShouJi"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWieDianHua"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["FenZu"].ToString() + "</td></tr>";
                    }
                }
            }
        }

        else if (ModelName == "个人通讯簿")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPTongXunLu where TypeStr='个人通讯簿' and UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../Work/TongXunLuView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["NameStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWeiMingCheng"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShouJi"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWieDianHua"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["FenZu"].ToString() + "</td></tr>";
                    }
                }
            }
        }

        else if (ModelName == "共享通讯簿")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPTongXunLu where IfShare='是' order by ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><a href=\"../Work/TongXunLuView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["NameStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWeiMingCheng"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShouJi"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWieDianHua"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["FenZu"].ToString() + "</td></tr>";
                    }
                }
            }
        }

        else if (ModelName == "个人文件")
        {
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPFileList where  DirID=0 and FileType!='dir' and TypeName='" + ModelName + "' and IFDel='否' and UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' order by DirOrFile desc,ID desc");
            //记录集行数>0
            if (MyDataSet != null)
            {
                if (MyDataSet.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                    {
                        MidStr = MidStr + "<tr style=\"background-color: #f9f9f7;\"><td><img src=\"../../images/JianTou.gif\"><img style=\"vertical-align:bottom;\" src=\"../../images/filetype/" + MyDataSet.Tables[0].Rows[i]["FileType"].ToString() + ".gif\">&nbsp;<a href=\"../DocCenter/DocView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["FileName"].ToString() + "</td><td>编号：" + MyDataSet.Tables[0].Rows[i]["BianHao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DaXiao"].ToString() + "KB</td><td>" + MyDataSet.Tables[0].Rows[i]["ShangChuanTime"].ToString() + "</td></tr>";
                    }
                }
            }
        }


        OKStr = StartStr + MidStr + EndStr;
        return OKStr;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "单位门户")
        {
            this.Panel2.Visible = true;
            this.Panel1.Visible = false;
        }
        else
        {
            this.Panel1.Visible = true;
            this.Panel2.Visible = false;
        }
    }

    public void BindDW()
    {
        string[] ListItem = new string[8] { "单位公告通知", "投票", "公共通讯簿", "共享通讯簿", "单位文件", "项目文件", "电子刊物", "重要文件" };
        //记录集行数>0
        if (ListItem.Length > 0)
        {
            string StartStr = "<table width=\"100%\"><tr><td valign=\"top\" width=\"50%\">";
            string EndStr = "</td></tr></table>";
            string MidStr = "";
            for (int i = 0; i < ListItem.Length; i++)
            {
                //对当前次数求余，为1时为一行结束，否则0代表还有一个td
                int TdInt = i % 2;
                //按照设置显示桌面
                string TTStr = "<div class=\"bigtype\"><table width=\"98%\"  cellpadding=\"0\" cellspacing=\"0\" ><tr ><td height=\"30px\" background=\"../../images/list_hd_bg.png\"><img src=\"../../images/collapse_arrow.png\" width=\"16\" height=\"16\" align=\"absmiddle\"><a class=\"heiBold\" href=\"javascript:void(0);\" onclick=\"SwitchMenu('Model" + i.ToString() + "')\">" + ListItem[i].ToString() + "</a></td><td background=\"../../images/list_hd_bg.png\"><div align=\"right\">&nbsp; &nbsp; </div></td></tr></table></div><div class=\"Model" + i.ToString() + "\">" + GetDeskLink(ListItem[i].ToString(), 5) + "</div>";
                if (i != 0)
                {
                    if (TdInt != 0)
                    {
                        MidStr = MidStr + TTStr + "</td></tr><tr><td valign=\"top\" width=\"50%\">";
                    }
                    else
                    {
                        MidStr = MidStr + TTStr + "</td><td valign=\"top\" width=\"50%\">";
                    }
                }
                else
                {
                    MidStr = MidStr + TTStr + "</td><td valign=\"top\" width=\"50%\">";
                }

            }
            this.Label2.Text = StartStr + MidStr + EndStr;
        }
    }
}
}