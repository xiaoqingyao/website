using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class Expertedit : System.Web.UI.Page
    {
        string nodecode = string.Empty;
        string Id = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            nodecode = Tools.CheckSql(Request.QueryString["NodeCode"]);
            Id =Tools.CheckSql(Request.QueryString["ID"]);
            if (!IsPostBack)
            {              
                if (string.IsNullOrEmpty(Id))
                {
                    BindDepartMent();
                    BindMenZhenDate();
                    btn.Text = "添加";
                }
                else
                {
                    btn.Text = "修改";
                    BindDetail();
                }
            }

            if (nodecode == "105005005")
            {
                //div_menzhentype.Visible = true;
                div_rctype.Visible = false;
            }
            else if (nodecode == "105005007" || nodecode == "105005008")
            {
                //div_menzhentype.Visible = true;
                div_rctype.Visible = false;
            }
            else
            {
                div_menzhentype.Visible = false;
                div_zjinfo.Visible = false;
                div_myinfo.Visible = false;
            }

            if (cbMenZhenZJ.Checked)
            {
                div_zjinfo.Visible = true;
            }
            else
            {
                div_zjinfo.Visible = false;
            }
            if (cbMenZhenMY.Checked)
            {
                div_myinfo.Visible = true;
            }
            else
            {
                div_myinfo.Visible = false;
            }

        }

        #region 初始化详细信息
        private void BindDetail()
        {
            BindDepartMent();
            BindMenZhenDate();

            DataTable dt = Tools.GetDataSet("select * from K_U_Expert where ID='"+Id+"'");
            if (dt.Rows.Count > 0)
            {
                txtName.Value=dt.Rows[0]["Title"].ToString();
                ddlDepartMent.SelectedValue=dt.Rows[0]["DepartMent"].ToString();
                if (dt.Rows[0]["shuxing"] != null && !string.IsNullOrEmpty(dt.Rows[0]["shuxing"].ToString()) && dt.Rows[0]["shuxing"].ToString().Contains("1"))
                {
                    cbshuxing.Checked = true;
                }
                txtXueLi.Value = dt.Rows[0]["XueLi"].ToString();
                txtZhiChen.Value = dt.Rows[0]["ZhiChen"].ToString();
                if (dt.Rows[0]["Gender"].ToString() == "男")
                {
                    rbMan.Checked = true;
                }
                else
                {
                    rbFeMan.Checked = true;
                }
                if (dt.Rows[0]["MenZhenType"].ToString().Contains("1"))
                {
                    cbMenZhenZJ.Checked = true;
                }
                if (dt.Rows[0]["MenZhenType"].ToString().Contains("2"))
                {
                    cbMenZhenMY.Checked = true;                    
                }
                //专家信息
                if(dt.Rows[0]["MenZhenDate"]!=null && !string.IsNullOrEmpty(dt.Rows[0]["MenZhenDate"].ToString()))
                {
                    for(int i=0;i<cbMenZhenDateZJList.Items.Count;i++)
                    {
                        string a = dt.Rows[0]["MenZhenDate"].ToString();
                        string b = cbMenZhenDateZJList.Items[i].Value;
                        if(dt.Rows[0]["MenZhenDate"].ToString().IndexOf(cbMenZhenDateZJList.Items[i].Value+",")>=0)
                        {
                            cbMenZhenDateZJList.Items[i].Selected=true;
                        }
                    }
                }
                txtAddress.Value=dt.Rows[0]["Address"].ToString();
                txtGuaiHaoFei.Value = dt.Rows[0]["GuaiHaoFei"].ToString();
                txtXianHao.Value = dt.Rows[0]["XianHao"].ToString();
                if (dt.Rows[0]["State"].ToString() == "在诊")
                {
                    rbYes.Checked = true;
                }
                if (dt.Rows[0]["State"].ToString() == "暂停")
                {
                    rbNo.Checked = true;
                }
                txtOnlineGuaiHao.Value = dt.Rows[0]["OnlineGuaiHao"].ToString();

                //名医信息
                if (dt.Rows[0]["MYMenZhenDate"] != null && !string.IsNullOrEmpty(dt.Rows[0]["MYMenZhenDate"].ToString()))
                {
                    for (int i = 0; i < cbMenZhenDateMYList.Items.Count; i++)
                    {
                        if (dt.Rows[0]["MYMenZhenDate"].ToString().IndexOf(cbMenZhenDateMYList.Items[i].Value + ",") >= 0)
                        {
                            cbMenZhenDateMYList.Items[i].Selected = true;
                        }
                    }
                }
                txtMYAddress.Value = dt.Rows[0]["MYAddress"].ToString();
                txtMYGuaHaoFei.Value = dt.Rows[0]["MYGuaHaoFei"].ToString();
                txtMYXianHao.Value = dt.Rows[0]["MYXianHao"].ToString();
                if (dt.Rows[0]["MYState"].ToString() == "在诊")
                {
                    rdmystateYes.Checked = true;
                }
                if (dt.Rows[0]["MYState"].ToString() == "暂停")
                {
                    rdmystateNo.Checked = true;
                }
                txtMYOnlieGuaiHao.Value = dt.Rows[0]["MYOnlieGuaiHao"].ToString();
                if (dt.Rows[0]["Image"] == null || dt.Rows[0]["Image"].ToString().Equals("暂无"))
                {
                    venueimg.Visible = false;
                }
                else
                {
                    venueimg.ImageUrl = "/UploadFiles/main/Images/" + dt.Rows[0]["Image"].ToString();
                    venueimg.Visible = true;
                    ViewState["imagePath"] = dt.Rows[0]["Image"].ToString();
                    FileImage.Visible = false;
                    btnsubmit.Text = "删除";
                }
                if (dt.Rows[0]["RCType"] != null && !string.IsNullOrEmpty(dt.Rows[0]["RCType"].ToString()))
                {
                    if (dt.Rows[0]["RCType"].ToString().Contains("1"))
                    {
                        cbRCType1.Checked = true;
                    }
                    if (dt.Rows[0]["RCType"].ToString().Contains("2"))
                    {
                        cbRCType2.Checked = true;
                    }
                    if (dt.Rows[0]["RCType"].ToString().Contains("3"))
                    {
                        cbRCType3.Checked = true;
                    }
                    if (dt.Rows[0]["RCType"].ToString().Contains("4"))
                    {
                        cbRCType4.Checked = true;
                    }
                    if (dt.Rows[0]["RCType"].ToString().Contains("5"))
                    {
                        cbRCType5.Checked = true;
                    }
                    if (dt.Rows[0]["RCType"].ToString().Contains("6"))
                    {
                        cbRCType6.Checked = true;
                    }
                    if (dt.Rows[0]["RCType"].ToString().Contains("7"))
                    {
                        cbRCType7.Checked = true;
                    }
                    if (dt.Rows[0]["RCType"].ToString().Contains("8"))
                    {
                        cbRCType8.Checked = true;
                    }
                }
                txtResume.Value = dt.Rows[0]["Resume"].ToString().Replace("&nbsp;"," ");
                txtMainStudy.Value = dt.Rows[0]["MainStudy"].ToString().Replace("&nbsp;", " ");
                txtResearch.Value = dt.Rows[0]["Research"].ToString().Replace("&nbsp;", " ");
                txtYLResult.Value = dt.Rows[0]["YLResult"].ToString().Replace("&nbsp;", " ");
            }
        }
        #endregion

        #region 初始化绑定下拉列表信息
        private void BindDepartMent()
        {
            DataTable dt = Tools.GetDataSet("select Title from K_U_DepartMent where NodeCode='105004007' and Islckj like '%1%' or Isyjks like '%1%' and SiteID=1 and IsDel=0 Order by Title asc");
            if (dt.Rows.Count > 0)
            {
                ddlDepartMent.DataSource = dt;
                ddlDepartMent.DataTextField = "Title";
                ddlDepartMent.DataValueField = "Title";
                ddlDepartMent.DataBind();
            }
        }

        private void BindMenZhenDate()
        {
            DataTable dt = Tools.GetDataSet("select Title from K_U_MenZhenDate where NodeCode='105005006' and SiteID=1 and IsDel=0 order by Orders asc");
            if (dt.Rows.Count > 0)
            {
                cbMenZhenDateZJList.DataSource = dt;
                cbMenZhenDateZJList.DataTextField = "Title";
                cbMenZhenDateZJList.DataValueField = "Title";
                cbMenZhenDateZJList.DataBind();

                cbMenZhenDateMYList.DataSource = dt;
                cbMenZhenDateMYList.DataTextField = "Title";
                cbMenZhenDateMYList.DataValueField = "Title";
                cbMenZhenDateMYList.DataBind();
            }
        }
        #endregion

        public void cbMenZhenZJ_CheckedChanged(object sender, EventArgs e)
        {

            if (cbMenZhenZJ.Checked)
            {
                div_zjinfo.Visible = true;
            }
            else
            {
                div_zjinfo.Visible = false;
            }
        }
        public void cbMenZhenMY_CheckedChanged(object sender, EventArgs e)
        {
            if (cbMenZhenMY.Checked)
            {
                div_myinfo.Visible = true;
            }
            else
            {
                div_myinfo.Visible = false;
            }
        }

        /// <summary>
        /// 上传缩略图
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int width = int.Parse(imgwidth.Value);
            int height = int.Parse(imgheight.Value);
            if (btnsubmit.Text.Equals("提交"))
            {
                ViewState["imagePath"] = UpImages.MakeThumbnail(FileImage, width, height);
                if (ViewState["imagePath"] == null)
                {
                    Page.RegisterStartupScript("ok", "<script>alert('请选择上传的图片')</script>");
                }
                else
                {
                    if (UpImages.MakeThumbnail(FileImage, width, height).Equals("error"))
                    {
                        Page.RegisterStartupScript("ok", "<script>alert('上传图片的格式错误，支持jpg、gif、bmp、jpeg格式图片！')</script>");
                        return;
                    }

                    venueimg.ImageUrl = "/UploadFiles/main/Images/" + ViewState["imagePath"].ToString();
                    venueimg.Visible = true;
                    FileImage.Visible = false;
                    btnsubmit.Text = "删除";
                }
                return;
            }
            if (btnsubmit.Text.Equals("删除"))
            {
                venueimg.Visible = false;
                FileImage.Visible = true;
                btnsubmit.Text = "提交";
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string name = txtName.Value.Trim();
            string department = ddlDepartMent.SelectedValue;
            string shuxing = string.Empty;
            if (cbshuxing.Checked)
            {
                shuxing = "1";
            }
            string xueli = txtXueLi.Value.Trim();
            string zhichen = txtZhiChen.Value.Trim();
            string gender = "男";
            if (rbFeMan.Checked)
            {
                gender = "女";
            }
            string menzhentype = string.Empty;
            if (cbMenZhenZJ.Checked)
            {
                menzhentype += "1,";
            }
            if (cbMenZhenMY.Checked)
            {
                menzhentype += "2";
            }            

            //专家信息
            string zjmenzhendate = string.Empty;
            for(int i=0;i<cbMenZhenDateZJList.Items.Count;i++)
            {
                if (cbMenZhenDateZJList.Items[i].Selected == true)
                {
                    zjmenzhendate += cbMenZhenDateZJList.Items[i].Value+",";
                }
            }
            string zjaddress = txtAddress.Value.Trim();
            string zjguaihaofei = txtGuaiHaoFei.Value.Trim();
            string zjxianhao = txtXianHao.Value.Trim();
            string zjstate = string.Empty;
            if (rdmystateYes.Checked)
            {
                zjstate = "在诊";
            }
            if (rbNo.Checked)
            {
                zjstate = "暂停";
            }
            string zjonlineguaihao = txtOnlineGuaiHao.Value.Trim();
                        

            //名医信息
            string mymenzhendate = string.Empty;
            for (int i = 0; i < cbMenZhenDateMYList.Items.Count; i++)
            {
                if (cbMenZhenDateMYList.Items[i].Selected == true)
                {
                    mymenzhendate += cbMenZhenDateMYList.Items[i].Value + ",";
                }
            }
            string myaddress = txtMYAddress.Value.Trim();
            string myguahaofei = txtMYGuaHaoFei.Value.Trim();
            string myxianhao = txtMYXianHao.Value.Trim();
            string mystate = string.Empty;
            if (rdmystateYes.Checked)
            {
                mystate = "在诊";
            }
            if (rdmystateNo.Checked)
            {
                mystate = "暂停";
            }
            string myonlineguaihao = txtMYOnlieGuaiHao.Value.Trim();

            string image = "";
            if (btnsubmit.Text.Equals("删除"))
            {
                image = ViewState["imagePath"].ToString();
            }
            if (btnsubmit.Text.Equals("提交"))
            {
                image = "暂无";
            }            
            
            //人才类型
            string rctype = string.Empty;
            if (cbRCType1.Checked)
            {
                rctype += "1,";
            }
            if (cbRCType2.Checked)
            {
                rctype += "2,";
            }
            if (cbRCType3.Checked)
            {
                rctype += "3,";
            }
            if (cbRCType4.Checked)
            {
                rctype += "4,";
            }
            if (cbRCType5.Checked)
            {
                rctype += "5,";
            }
            if (cbRCType6.Checked)
            {
                rctype += "6,";
            }
            if (cbRCType7.Checked)
            {
                rctype += "7,";
            }
            if (cbRCType8.Checked)
            {
                rctype += "8";
            }

            string resume = txtResume.Value.Trim().Replace(" ","&nbsp;");
            string mainstudy = txtMainStudy.Value.Trim();
            string research = txtResearch.Value.Trim();
            string ylresult = txtYLResult.Value.Trim();

            string sql=string.Empty;
            //添加
            if (string.IsNullOrEmpty(Id))
            {
                string id = DateTime.Now.ToString("yyyyMMddHHMMssf");
                int isdel = 0;
                int isenable = 1;
                int isarchiving = 0;
                int orders = 1;
                DataTable dt = Tools.GetDataSet("select max(Orders) as Orders from K_U_Expert where NodeCode='105005005' and SiteID=1 and IsDel=0");
                if (dt.Rows.Count > 0 && !string.IsNullOrEmpty(dt.Rows[0]["Orders"].ToString()))
                {
                    orders = int.Parse(dt.Rows[0]["Orders"].ToString()) + 1;
                }
                string addtime = DateTime.Now.ToString();
                int siteid = 1;
                string nodecodeid = "105005005";
                int flowstate = 99;//审核

                sql = "insert into K_U_Expert(ID,IsDel,IsEnable,IsArchiving,Orders,AddDate,DelTime,SiteID,NodeCode,FlowState,ReferenceID,AddMan,Title,XueLi,ZhiChen,Gender,MenZhenType,Address,GuaiHaoFei,XianHao,State,OnlineGuaiHao,Resume,MainStudy,Research,YLResult,RCType,DepartMent,Image,shuxing,MenZhenDate,MYMenZhenDate,MYAddress,MYGuaHaoFei,MYXianHao,MYState,MYOnlieGuaiHao) values('" + id + "'," + isdel + "," + isenable + "," + isarchiving + "," + orders + ",'" + addtime + "','" + addtime + "'," + siteid + ",'" + nodecodeid + "'," + flowstate + ",'" + id + "','','" + name + "','" + xueli + "','" + zhichen + "','" + gender + "','" + menzhentype + "','" + zjaddress + "','" + zjguaihaofei + "','" + zjxianhao + "','" + zjstate + "','" + zjonlineguaihao + "','" + resume + "','" + mainstudy + "','" + research + "','" + ylresult + "','" + rctype + "','" + department + "','" + image + "','" + shuxing + "','" + zjmenzhendate + "','" + mymenzhendate + "','" + myaddress + "','" + myguahaofei + "','" + myxianhao + "','" + mystate + "','" + myonlineguaihao + "')";
            }
            else
            {
                sql = "update K_U_Expert set Title='" + name + "',XueLi='" + xueli + "',ZhiChen='" + zhichen + "',Gender='" + gender + "',MenZhenType='"+menzhentype+"',Address='"+zjaddress+"',GuaiHaoFei='"+zjguaihaofei+"',XianHao='"+zjxianhao+"',State='"+zjstate+"',OnlineGuaiHao='"+zjonlineguaihao+"',Resume='"+resume+"',MainStudy='"+mainstudy+"',Research='"+research+"',YLResult='"+ylresult+"',RCType='"+rctype+"',DepartMent='"+department+"',Image='"+image+"',shuxing='"+shuxing+"',MenZhenDate='"+zjmenzhendate+"',MYMenZhenDate='"+mymenzhendate+"',MYAddress='"+myaddress+"',MYGuaHaoFei='"+myguahaofei+"',MYXianHao='"+myxianhao+"',MYState='"+mystate+"',MYOnlieGuaiHao='"+myonlineguaihao+"' where ID='"+Id+"'";
            }
            if (SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null) > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='Expertlist.aspx?NodeCode="+nodecode+"';</script>");
                Response.End();
            }
            else
            {
                Response.Write("<script>alert('操作失败！');location.href='Expertlist.aspx?NodeCode="+nodecode+"';</script>");
                Response.End();
            }
        }
    }
}
