using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;
//51aspx.com
namespace JXCBLL
{
    public class JhddManager
    {
        public static string modifyJhdd(Jhdd jhdd)
        {
            return JhddService.modifyJhdd(jhdd);
        }
        public static IList<Jhdd> getAllJhdd(string zt,string tj)
        {
            IList<Jhdd> jhdds = new List<Jhdd>();
            try
            {
                jhdds = JhddService.getAllJhdd(zt, tj);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhdds;
        }
        public static void deleteJhddByJhddbh(string jhddbh)
        {
            try
            {
                JhddService.deleteJhddByJhddbh(jhddbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        public static string addJhdd(Jhdd jhdd)
        {
            return JhddService.addJhdd(jhdd);
        }
        public static Jhdd getJhddByJhddbh(string jhddbh)
        {
            return JhddService.getJhddByJhddbh(jhddbh);
        }
        public static int getZtByJhddbh(string jhddbh) {
            return JhddService.getZtByJhddbh(jhddbh);
        }
        public static void modifyZtByDdbh(string zt, string ddbh)
        {
            try
            {
                JhddService.modifyZtByDdbh(zt, ddbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
    }
}
