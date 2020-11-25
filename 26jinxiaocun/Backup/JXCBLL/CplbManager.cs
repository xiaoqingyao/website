using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class CplbManager
    {
        public static IList<Cplb> getAllCplb()
        {
            IList<Cplb> cplbs = new List<Cplb>();
            try
            {
                cplbs = CplbService.getAllCplb();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return cplbs;
        }
        public static Cplb getCplbByCplbbh(int cplbbh)
        {
            Cplb cplb = new Cplb();
            try
            {
                cplb = CplbService.getCplbByCplbbh(cplbbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return cplb;
        }

        public static void deleteCplbByCplbbh(int cplbbh)
        {
            try
            {
                CplbService.deleteCplbByCplbbh(cplbbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyCplb(Cplb cplb)
        {
            return CplbService.modifyCplb(cplb);
        }
        public static string addCplb(Cplb cplb)
        {
            return CplbService.addCplb(cplb);
        }
        public static int existsCplbByCplbmc(string cplbmc)
        {
            return CplbService.existsCplbByCplbmc(cplbmc);
        }
    }
}