using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class XsddManager
    {
        public static string modifyXsdd(Xsdd xsdd)
        {
            return XsddService.modifyXsdd(xsdd);
        }
        public static IList<Xsdd> getAllXsdd(string zt,string tj)
        {
            IList<Xsdd> xsdds = new List<Xsdd>();
            try
            {
                xsdds = XsddService.getAllXsdd(zt,tj);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return xsdds;
        }
        public static void deleteXsddByXsddbh(string xsddbh)
        {
            try
            {
                XsddService.deleteXsddByXsddbh(xsddbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string addXsdd(Xsdd xsdd)
        {
            return XsddService.addXsdd(xsdd);
        }
        public static Xsdd getXsddByXsddbh(string xsddbh)
        {
            return XsddService.getXsddByXsddbh(xsddbh);
        }
        public static int getZtByXsddbh(string xsddbh)
        {
            return XsddService.getZtByXsddbh(xsddbh);
        }
        public static void modifyZtByDdbh(string zt, string ddbh)
        {
            try
            {
                XsddService.modifyZtByDdbh(zt,ddbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
    }
}
