<%@ WebHandler Language="C#" Class="downloadImg" %>

using System;
using System.Web;

public class downloadImg : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        context.Response.ContentType = "image/jpeg";
        context.Response.AppendHeader("content-disposition", "attachment;filename=file.jpg");
        context.Response.WriteFile(context.Request["url"].ToString());

        //context.Response.WriteFile("Hello World");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}