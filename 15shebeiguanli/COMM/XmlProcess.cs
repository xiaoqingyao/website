using System;
using System.Collections.Generic;
using System.Data;
using System.Xml;

namespace COMM
{
    public class XmlProcess
    {
        public DataTable ReadXml(string filePath, string id, string name)
        {
            //string a = "222443<BR>er";
            //a = a.Replace(Char(13)+Char(10),"<BR>");
            DataTable dt = new DataTable();
            dt.Columns.Add(id, typeof(int));
            dt.Columns.Add(name, typeof(string));
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(filePath);
            foreach (XmlNode node in xdoc.DocumentElement.ChildNodes)
            {
                if (node.NodeType == XmlNodeType.Element)
                {
                    //dt[0] = node.Attributes[0].Value;
                    //dt[1] = node.Attributes[1].Value;
                }
            }
            return dt;
        }

        public DataSet ReadXml_DS(string filePath)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(filePath);
            return ds;
            //if (lanDS.Tables.Count > 0)
            //{

            //    foreach (DataRow copyRow in lanDS.Tables[0].Rows)
            //    {

            //        dt.ImportRow(copyRow);

            //    }

            //}
        }
    }
}
