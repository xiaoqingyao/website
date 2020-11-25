using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;
using System.Data;

namespace AllPower.WEB.main.Plus.API
{
    /// <summary>
    /// Model 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://www.360hqb.com/model/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    // [System.Web.Script.Services.ScriptService]
    public class Model : System.Web.Services.WebService
    {

        [WebMethod]
        public XmlDocument List(string nodeCode)
        {
            XmlDocument xmlDoc;
             AllPower.BLL.Content.API api;

             api = new AllPower.BLL.Content.API();
             xmlDoc = api.List(nodeCode);

             return xmlDoc;
        }

        [WebMethod]
        public XmlDocument List_Search(string nodeCode, string searchContent)
        {
            XmlDocument xmlDoc;
            AllPower.BLL.Content.API api;

             api = new AllPower.BLL.Content.API();
             xmlDoc = api.List(nodeCode,searchContent);

             return xmlDoc;
        }

        [WebMethod]
        public XmlDocument List_Split(string nodeCode, int pageSize, int currentPage)
        {
            XmlDocument xmlDoc;
            AllPower.BLL.Content.API api;

             api = new AllPower.BLL.Content.API();
             xmlDoc = api.List(nodeCode,pageSize,currentPage);

             return xmlDoc;
        }

        [WebMethod]
        public XmlDocument List_SearchAndSplit(string nodeCode, int pageSize, int currentPage, string searchContent)
        {
            XmlDocument xmlDoc;
            AllPower.BLL.Content.API api;

             api = new AllPower.BLL.Content.API();
             xmlDoc = api.List(nodeCode,pageSize,currentPage,searchContent);

             return xmlDoc;
        }

        [WebMethod]
        public XmlDocument Content(string nodeCode,string id)
        {
            XmlDocument xmlDoc;
            AllPower.BLL.Content.API api;

             api = new AllPower.BLL.Content.API();
             xmlDoc = api.ListContent(nodeCode, id);
             return xmlDoc;
        }
    }
}
