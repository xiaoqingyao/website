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
using System.Data.OleDb;

public partial class Main_MenuTemp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Md5.Md5 MYJiaMi = new Md5.Md5();

        //OleDbConnection Conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("User.mdb"));
        //Conn.Open();

        //OleDbCommand MyCommand = new OleDbCommand("select * from tempuser", Conn);
        //OleDbDataReader MyReader = MyCommand.ExecuteReader();
        //while (MyReader.Read())
        //{
        //    string SqlSTr = "insert into ERPUser(xpwd,JiaoSe,Serils,TrueName,UserPwd,ZhiWei,BeiZhuStr,JiaTingDianHua,EmailStr,UserName,IfLogin,TiXingTime,IfTiXing) values('" + MYJiaMi.MD5(MyReader["UserPwd"].ToString(),32) + "','一般员工','" + MyReader["Serils"].ToString() + "','" + MyReader["TrueName"].ToString() + "','" + ZWL.Common.DEncrypt.DESEncrypt.Encrypt(MyReader["UserPwd"].ToString()) + "','" + MyReader["ZhiWei"].ToString() + "','" + MyReader["BeiZhuStr"].ToString() + "','" + MyReader["JiaTingDianHua"].ToString() + "','" + MyReader["EmailStr"].ToString() + "','" + MyReader["TrueName"].ToString() + "','是','600','是')";
        //    ZWL.DBUtility.DbHelperSQL.ExecuteSQL(SqlSTr);
        //}
        //MyReader.Close();

        //Conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet MYDTDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select UserName from ERPUser");
        for (int i = 0; i < MYDTDT.Tables[0].Rows.Count; i++)
        {
            string filePath = Server.MapPath("../UpLoadFile/" + MYDTDT.Tables[0].Rows[i]["UserName"].ToString() + "") + ".jpg"; //文件路径
            if (System.IO.File.Exists(filePath))//判断文件是否存在
            {
                ZWL.BLL.ERPYinZhang MyModel = new ZWL.BLL.ERPYinZhang();
                MyModel.ImgPath = MYDTDT.Tables[0].Rows[i]["UserName"].ToString()+".jpg";
                MyModel.TimeStr = DateTime.Now;
                MyModel.UserName = MYDTDT.Tables[0].Rows[i]["UserName"].ToString();
                MyModel.YinZhangLeiBie = "私人印章";
                MyModel.YinZhangMiMa = "123456";
                MyModel.YinZhangName = MYDTDT.Tables[0].Rows[i]["UserName"].ToString()+"个人签名";
                MyModel.Add();
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //for (int i = 0; i < this.ListTreeView.Nodes.Count; i++)
        //{
        //    //写入根菜单
        //    ZWL.BLL.ERPTreeList Model0 = new ZWL.BLL.ERPTreeList();
        //    Model0.TextStr = this.ListTreeView.Nodes[i].Text;
        //    Model0.ImageUrlStr = this.ListTreeView.Nodes[i].ImageUrl;
        //    Model0.ValueStr = this.ListTreeView.Nodes[i].Value;
        //    Model0.NavigateUrlStr = this.ListTreeView.Nodes[i].NavigateUrl;
        //    Model0.Target = "rform";
        //    Model0.ParentID = 0;
        //    Model0.QuanXianList = "A_添加|M_修改|D_删除|E_导出";
        //    Model0.PaiXuStr = 59;
        //    int PID0=Model0.Add();

        //    for (int j = 0; j < this.ListTreeView.Nodes[i].ChildNodes.Count; j++)
        //    {
        //        //写入根菜单
        //        ZWL.BLL.ERPTreeList Model1 = new ZWL.BLL.ERPTreeList();
        //        Model1.TextStr = this.ListTreeView.Nodes[i].ChildNodes[j].Text;
        //        Model1.ImageUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].ImageUrl;
        //        Model1.ValueStr = this.ListTreeView.Nodes[i].ChildNodes[j].Value;
        //        Model1.NavigateUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].NavigateUrl;
        //        Model1.Target = "rform";
        //        Model1.ParentID = PID0;
        //        Model1.QuanXianList = "A_添加|M_修改|D_删除|E_导出";
        //        Model1.PaiXuStr = 59;
        //        int PID1 = Model1.Add();

        //        //删除子菜单中的不在权限中的项
        //        for (int k = 0; k < this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes.Count; k++)
        //        {
        //            //写入根菜单
        //            ZWL.BLL.ERPTreeList Model2 = new ZWL.BLL.ERPTreeList();
        //            Model2.TextStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Text;
        //            Model2.ImageUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].ImageUrl;
        //            Model2.ValueStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Value;
        //            Model2.NavigateUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].NavigateUrl;
        //            Model2.Target = "rform";
        //            Model2.ParentID = PID1;
        //            Model2.QuanXianList = "A_添加|M_修改|D_删除|E_导出";
        //            Model2.PaiXuStr = 59;
        //            int PID2 = Model2.Add();
        //        }
        //    }
        //}
    }
}
