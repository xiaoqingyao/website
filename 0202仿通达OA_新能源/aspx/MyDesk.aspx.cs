using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OA.aspx{ 
 public partial class MyDesk: System.Web.UI.Page
{
    public string DeskTopObjJson = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        List<DesktopObject> dList = new List<DesktopObject>();
        dList.Add(new DesktopObject() { DtNum = 0, Index = "256", Title = "项目管理", DataUrl = "Project/ProjectManage.aspx?ProjectName=", MsgNum = 0, Img = "../../images/desktop/project.png", MenuValue = "X001" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "3", Title = "收件箱", DataUrl = "LanEmail/LanEmailShou.aspx", MsgNum = 0, Img = "../../images/desktop/email.png", MenuValue = "001" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "16", Title = "修改密码", DataUrl = "Personal/ChangPwd.aspx", MsgNum = 0, Img = "../../images/desktop/info.png", MenuValue = "012" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "161", Title = "手机短信", DataUrl = "Mobile/MobileSms.aspx", MsgNum = 0, Img = "../../images/desktop/sms.png", MenuValue = "097" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "6", Title = "单位公告通知", DataUrl = "GongGao/GongGao.aspx?Type=单位", MsgNum = 0, Img = "../../images/desktop/notify.png", MenuValue = "004" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "128", Title = "车辆使用记录", DataUrl = "Car/CarShiYong.aspx", MsgNum = 0, Img = "../../images/desktop/vehicle.png", MenuValue = "068" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "9", Title = "工作日志", DataUrl = "Work/WorkRiZhi.aspx", MsgNum = 0, Img = "../../images/desktop/diary.png", MenuValue = "007" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "8", Title = "日程安排", DataUrl = "Work/RiCheng.aspx", MsgNum = 0, Img = "../../images/desktop/calendar.png", MenuValue = "006" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "20", Title = "我的工作", DataUrl = "NWorkFlow/NWorkToDo.aspx", MsgNum = 0, Img = "../../images/desktop/default.png", MenuValue = "015" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "76", Title = "会议查询", DataUrl = "Meeting/MeetingSerch.aspx", MsgNum = 0, Img = "../../images/desktop/meeting.png", MenuValue = "065" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "190", Title = "图书管理", DataUrl = "Office/Book.aspx", MsgNum = 0, Img = "../../images/desktop/book.png", MenuValue = "120" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "47", Title = "资产管理", DataUrl = "Office/GuDing.aspx", MsgNum = 0, Img = "../../images/desktop/asset.png", MenuValue = "039" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "185", Title = "论坛BBS", DataUrl = "BBS/BanKuaiList.aspx", MsgNum = 0, Img = "../../images/desktop/bbs.png", MenuValue = "116" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "26", Title = "工作委托", DataUrl = "NWorkFlow/WorkWT.aspx", MsgNum = 0, Img = "../../images/desktop/workflow.png", MenuValue = "021" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "53", Title = "题库管理", DataUrl = "DocFile/TiKuFrame.aspx", MsgNum = 0, Img = "../../images/desktop/exam_manage.png", MenuValue = "044" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "55", Title = "在线考试", DataUrl = "DocFile/TiKuKaoShi.aspx", MsgNum = 0, Img = "../../images/desktop/score.png", MenuValue = "046" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "36", Title = "个人文件柜", DataUrl = "DocCenter/DocCenter.aspx?Type=个人文件&DirID=0", MsgNum = 0, Img = "../../images/desktop/file_folder.png", MenuValue = "029" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "205", Title = "报表管理", DataUrl = "ReportCenter/ReportFrame.aspx", MsgNum = 0, Img = "../../images/desktop/reportshop.png", MenuValue = "131" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "61", Title = "人事档案", DataUrl = "SystemManage/RenShiInfo.aspx", MsgNum = 0, Img = "../../images/desktop/hr.png", MenuValue = "051" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "13", Title = "个人通讯薄", DataUrl = "Work/TongXunLu.aspx?TypeStr=个人通讯簿", MsgNum = 0, Img = "../../images/desktop/address.png", MenuValue = "010" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "172", Title = "考勤明细", DataUrl = "HR/KaoQinMingXi.aspx", MsgNum = 0, Img = "../../images/desktop/attendance.png", MenuValue = "107" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "165", Title = "收文阅读", DataUrl = "TelFile/GetFile.aspx", MsgNum = 0, Img = "../../images/desktop/document.png", MenuValue = "101" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "191", Title = "借阅管理", DataUrl = "Office/BookJieHuan.aspx", MsgNum = 0, Img = "../../images/desktop/roll_manage.png", MenuValue = "121" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "7", Title = "投票", DataUrl = "GongGao/Vote.aspx", MsgNum = 0, Img = "../../images/desktop/vote.png", MenuValue = "005" });
        dList.Add(new DesktopObject() { DtNum = 0, Index = "176", Title = "工作计划", DataUrl = "WorkPlan/MyWorkPlan.aspx", MsgNum = 0, Img = "../../images/desktop/work_plan.png", MenuValue = "109" });


        foreach (DesktopObject o in dList)
        {
            if (FTD.Unit.PublicMethod.StrIFIn("|" + o.MenuValue + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == true)
            { 
                if (string.IsNullOrEmpty(DeskTopObjJson) == true)
                {
                    DeskTopObjJson = o.GetJsonStr();
                }
                else
                {
                    DeskTopObjJson = DeskTopObjJson + "," + o.GetJsonStr();
                }            
            }
        }

        DeskTopObjJson = "[" + DeskTopObjJson + "]";
    }


    public class DesktopObject 
    {
        public int DtNum = 0;
        public string Index = string.Empty;
        public string Title = string.Empty;
        public string DataUrl = string.Empty;
        public int MsgNum = 0;
        public string Img = string.Empty;
        public string MenuValue = string.Empty;


        public string GetJsonStr()
        {
             string json = string.Format( "dtNum : {0},index : \"f{1}\",title : \"{2}\",dataUrl : \"{3}\",msgNum : {4},img : \"{5}\"",this.DtNum,this.Index,this.Title,this.DataUrl,this.MsgNum,this.Img);

             return "{"+json+"}";
        }
    }
 
}}