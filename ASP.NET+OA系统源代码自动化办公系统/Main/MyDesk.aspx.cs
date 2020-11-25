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

public partial class MyDesk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            //读取个人设置
            SDLX.BLL.ERPUserDesk MyModel = new SDLX.BLL.ERPUserDesk();
            DataSet MyDataSet = MyModel.GetList("UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID asc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                string StartStr = "<table width=\"100%\"><tr><td valign=\"top\" width=\"50%\">";                    
                string EndStr = "</td></tr></table>";
                string MidStr ="";
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    //对当前次数求余，为1时为一行结束，否则0代表还有一个td
                    int TdInt = i % 2;                    
                    //按照设置显示桌面
                    string TTStr = "<div class=\"bigtype\"><table width=\"98%\"  cellpadding=\"0\" cellspacing=\"0\" ><tr ><td height=\"30px\" background=\"../images/list_hd_bg.png\"><img src=\"../images/collapse_arrow.png\" width=\"16\" height=\"16\" align=\"absmiddle\"><a class=\"heiBold\" href=\"javascript:void(0);\" onclick=\"SwitchMenu('Model" + i.ToString() + "')\">" + MyDataSet.Tables[0].Rows[i]["ModelName"].ToString() + "</a></td><td background=\"../images/list_hd_bg.png\"><div align=\"right\"><a href=\"MyDeskModify.aspx?ModelName=" + MyDataSet.Tables[0].Rows[i]["ModelName"].ToString() + "\"><img src=\"../images/pencil.png\" width=\"10\" height=\"10\" border=\"0\" align=\"absmiddle\"></a>&nbsp; <img onclick=\"_delmodel('" + MyDataSet.Tables[0].Rows[i]["ModelName"].ToString() + "')\" class=\"HerCss\" src=\"../images/close_x.png\" width=\"10\" height=\"10\" border=\"0\" align=\"absmiddle\">&nbsp; </div></td></tr></table></div><div class=\"Model" + i.ToString() + "\">" + GetDeskLink(MyDataSet.Tables[0].Rows[i]["ModelName"].ToString(), int.Parse(MyDataSet.Tables[0].Rows[i]["LookNum"].ToString())) + "</div>";
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
    }

    private string GetDeskLink(string ModelName, int ModelNum)
    {
        string StartStr = "<table width=\"98%\">";
        string EndStr = "</table>";
        string MidStr = "";
        string OKStr = "";

        if (ModelName == "待办工作")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPWorkToDo where  StateNow='正在办理' and ','+ShenPiRenList+',' like '%," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + ",%' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../WorkFlow/WorkView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["WorkName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td><td><a href=\"../WorkFlow/WorkToDo.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\" >[进入办理]</a></td></tr>";
                }
            }
        }

        else if (ModelName == "我的工作")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPWorkToDo where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../WorkFlow/WorkView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["WorkName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "内部邮件")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString()+ " * from ERPLanEmail where ToUser='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and (EmailState='未读' or EmailState='已读')  order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {                
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../LanEmail/EmailView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["EmailTitle"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "Internet邮件")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPNetEmail where ToUser='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and (EmailState='未读' or EmailState='已读')  order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../NetMail/NetEmailView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["EmailTitle"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "手机短信")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPMobile where FaSongUser='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\">" + MyDataSet.Tables[0].Rows[i]["ContentStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "单位公告通知")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPGongGao where TypeStr='单位' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../GongGao/GongGaoView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "部门公告通知")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPGongGao where TypeStr='部门' and UserBuMen='" + SDLX.Common.PublicMethod.GetSessionValue("Department") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../GongGao/GongGaoView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "投票")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPVote order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../GongGao/VoteView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "日程安排")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPAnPai where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../Work/RiChengView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeTiXing"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "工作日志")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPWorkRiZhi where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../Work/WorkRiZhiView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "公共通讯簿")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPTongXunLu where TypeStr='公共通讯簿' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../Work/TongXunLuView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["NameStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWeiMingCheng"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShouJi"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "个人通讯簿")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPTongXunLu where TypeStr='个人通讯簿' and UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../Work/TongXunLuView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["NameStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWeiMingCheng"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShouJi"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "共享通讯簿")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPTongXunLu where IfShare='是' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../Work/TongXunLuView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["NameStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DanWeiMingCheng"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShouJi"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "我的会议")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPMeeting where ','+ChuXiRen+',' like '%," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + ",%' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../Meeting/MeetingView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["MeetingTitle"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["KaiShiTime"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["JieShuTime"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "我的计划")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPWorkPlan where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../WorkPlan/WorkPlanView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "个人文件")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPFileList where  DirID=0 and FileType!='dir' and TypeName='个人文件' and IFDel='否' and UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by DirOrFile desc,ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../DocCenter/DocView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["FileName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["BianHao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DaXiao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShangChuanTime"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "共享文件")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPFileList where  DirID=0 and TypeName='个人文件' and IFDel='否' and IfShare='是' order by DirOrFile desc,ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../DocCenter/DocCenter.aspx?DirID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "&Type=共享文件" + "\">" + MyDataSet.Tables[0].Rows[i]["FileName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["BianHao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DaXiao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShangChuanTime"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "我的硬盘")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPFileList where  DirID=0 and FileType!='dir' and TypeName='我的硬盘' and IFDel='否' and UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by DirOrFile desc,ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../DocCenter/DocView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["FileName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["BianHao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DaXiao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShangChuanTime"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "共享硬盘")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPFileList where DirID=0 and TypeName='我的硬盘' and IFDel='否' and IfShare='是' order by DirOrFile desc,ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../DocCenter/DocCenter.aspx?DirID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "&Type=共享硬盘" + "\">" + MyDataSet.Tables[0].Rows[i]["FileName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["BianHao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["DaXiao"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["ShangChuanTime"].ToString() + "</td></tr>";
                }
            }
        }

        else if (ModelName == "接收文件")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPTelFile where ','+ToUser+',' like '%," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + ",%' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../TelFile/FileView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["TitleStr"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }
        else if (ModelName == "我的客户")
        {
            DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select top " + ModelNum.ToString() + " * from ERPCustomInfo where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' order by ID desc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    MidStr = MidStr + "<tr><td><img src=\"../images/JianTou.gif\"><a href=\"../Crm/CustomView.aspx?ID=" + MyDataSet.Tables[0].Rows[i]["ID"].ToString() + "\">" + MyDataSet.Tables[0].Rows[i]["CustomName"].ToString() + "</td><td>" + MyDataSet.Tables[0].Rows[i]["TimeStr"].ToString() + "</td></tr>";
                }
            }
        }

        OKStr = StartStr + MidStr + EndStr;
        return OKStr;
    }
}
