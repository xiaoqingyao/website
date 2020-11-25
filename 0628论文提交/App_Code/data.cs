using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
///data 的摘要说明
/// </summary>
/// 下载于51aspx.com
public class data
{
    public static readonly string strconn = ConfigurationManager.AppSettings["strsql"].ToString();
	public data()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
}