using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class XsdManager
    {
        public static IList<Xsd> getAllXsd()
        {
            IList<Xsd> xsds = new List<Xsd>();
            try
            {
                xsds = XsdService.getAllXsd();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsds;
        }
        public static Xsd getXsdByXsdbh(string xsdbh)
        {
            Xsd xsd = new Xsd();
            try
            {
                xsd = XsdService.getXsdByXsdbh(xsdbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsd;
        }
        public static void deleteXsdByXsdbh(string xsdbh)
        {
            try
            {
                XsdService.deleteXsdByXsdbh(xsdbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyXsd(Xsd xsd)
        {
            return XsdService.modifyXsd(xsd);
        }
        public static string addXsd(Xsd xsd)
        {
            return XsdService.addXsd(xsd);
        }
        //public static int existsXsdByXsdmc(string xsdmc) {
        //    return XsdService.existsXsdByXsdmc(xsdmc);
        //}
        public static IList<Xsd> getXsdsOrderByCondition(string condition)
        {
            IList<Xsd> xsds = new List<Xsd>();
            try
            {
                xsds = XsdService.getXsdsOrderByCondition(condition);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsds;
        }
        public static IList<Xsd> getXsdsByCondition(string condition1, string condition2)
        {
            IList<Xsd> xsds = new List<Xsd>();
            try
            {
                xsds = XsdService.getXsdsByCondition(condition1, condition2);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsds;
        }
    }
}
