﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class BasicInfo_StartStore : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    public string DownPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList3.DataSource = data.GetDataReader("select * from  Store  ");
            DropDownList3.DataTextField = "Name";
            DropDownList3.DataValueField = "id";
            DropDownList3.DataBind();
          
            Type();
            GetChanp();
        }
    }
    /// <summary>
    /// 绑定类别
    /// </summary>
    private void Type()
    {
        DropDownList1.DataSource = data.GetDataReader("select * from  Class  ");
        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        DropDownList1.Items.Add(new ListItem("选择商品类别", "0")); //动态添加新项
    }
    private void GetChanp()
    {
        DropDownList2.DataSource = data.GetDataReader("select * from  ChanPin where TypeName='" + DropDownList1.SelectedItem.Text + "'   ");
        DropDownList2.DataTextField = "Name";
        DropDownList2.DataValueField = "id";
        DropDownList2.DataBind();
        this.DropDownList2.Items.Insert(0, new ListItem("请选择进货商品", "0"));
    }
    private void BinderChanpin()
    {

        SqlDataReader dr;
        dr = data.GetDataReader("select * from  ChanPin where id='" + DropDownList2.SelectedValue + "'");
        if (dr.Read())
        {

            txtds.Text = dr["ds"].ToString();


            txtdanjia.Text = dr["danjia"].ToString();
            txtguige.Text = dr["guige"].ToString();
            txtCode.Text = dr["Code"].ToString();
            txtriqi.Text = dr["shengchanriqi"].ToString();
        }
        else
        {
            alert.Alertjs("没有商品！");
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetChanp();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        BinderChanpin();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataReader dr;
        dr = data.GetDataReader("select   *  from kucun where GoodsId='" + DropDownList2.SelectedValue + "' ");
        if (dr.Read())
        {
            Alert.AlertAndRedirect("仓库中存在该商品不能建立初期库存", "StartStore.aspx");
        }
        else
        {
            data.RunSql("insert into kucun(chanpinId,name,ds,danjia,TypeName,TypeId,guige,shuliang,Code,GoodsId,StoreName,StoreId)values(" + DropDownList2.SelectedValue + ",'" + DropDownList2.SelectedItem.Text + "','" + txtds.Text + "','" + txtdanjia.Text + "','" + DropDownList1.SelectedItem.Text + "'," + DropDownList1.SelectedValue + ",'" + txtguige.Text + "'," + TextBox1.Text.Trim() + ",'" + txtCode.Text + "','" + DropDownList2.SelectedValue + "','" + DropDownList3.SelectedItem.Text + "','" + DropDownList3.SelectedValue + "')");
        }
        Alert.AlertAndRedirect("建立初期库存成功！", "StartStore.aspx");
    }
}
