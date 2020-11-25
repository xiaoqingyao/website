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
public partial class StoreManger_ChkRuRu : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    public string DownPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = data.GetDataReader("select * from  Store  ");
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            GetInfo();
        }
    }
    private void GetInfo()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        SqlDataReader dr;
        dr = data.GetDataReader("select * from  JinHuo where id=" + id);
        dr.Read();
        txtname.Text = dr["name"].ToString();
        txtds.Text = dr["ds"].ToString();
        txtType.Text = dr["TypeName"].ToString();
        txtdanjia.Text = dr["danjia"].ToString();
        txtguige.Text = dr["guige"].ToString();
        TextBox1.Text = dr["Code"].ToString();
        txtriqi.Text = Convert.ToDateTime(dr["AddTime"].ToString()).ToShortDateString();
        txtPerson.Text = dr["CManger"].ToString();
        txtSL.Text = dr["shuliang"].ToString();
        Hidden1.Value = dr["GoodsId"].ToString();
        Hidden2.Value = dr["TypeId"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {   int id = int.Parse(Request.QueryString["id"].ToString());
        data.RunSql("update JinHuo set istRuKu='是' where id="+id);
        SqlDataReader dr;
        dr = data.GetDataReader("select   *  from kucun where chanpinId='" + Hidden1.Value + "' ");
        if (dr.Read())
        {
            data.RunSql("update kucun set shuliang=shuliang+" + float.Parse(txtSL.Text) + " where chanpinId='" + Hidden1.Value + "'");
        }
        else
        {
            data.RunSql("insert into kucun(chanpinId,name,ds,danjia,TypeName,TypeId,guige,shuliang,Code,GoodsId,StoreName,StoreId)values(" + Hidden1.Value + ",'" + txtname.Text + "','" + txtds.Text + "','" + txtdanjia.Text + "','" + txtType.Text + "'," + Hidden2.Value + ",'" + txtguige.Text + "'," + txtSL.Text.Trim() + ",'" + TextBox1.Text + "','" + Hidden1.Value + "','"+DropDownList1.SelectedItem.Text+"','"+DropDownList1.SelectedValue+"')");
        }
        Alert.AlertAndRedirect("入库成功！", "AddStore.aspx");
    }
}
