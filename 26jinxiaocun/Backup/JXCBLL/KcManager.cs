using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;


namespace JXCBLL
{
    public class KcManager
    {
        public static IList<Kc> getAllKc(string qhjg)
        {
            IList<Kc> kcs = new List<Kc>();
            try
            {
                kcs = KcService.getAllKc(qhjg);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kcs;
        }
        public static IList<Kc> getKcsOrderByCondition(string condition) {
            IList<Kc> kcs = new List<Kc>();
            try
            {
                kcs = KcService.getKcsOrderByCondition(condition);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kcs;
        }
        public static IList<Kc> getKcsByCondition(string condition1, string condition2)
        {
            IList<Kc> kcs = new List<Kc>();
            try
            {
                kcs = KcService.getKcsByCondition(condition1,condition2);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kcs;
        }
        public static Kc getKcByKcbh(string kcbh)
        {
            Kc kc = new Kc();
            try
            {
                kc = KcService.getKcByKcbh(kcbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return kc;
        }
        public static void deleteKcByKcbh(string kcbh)
        {
            try
            {
                KcService.deleteKcByKcbh(kcbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyKc(Kc kc)
        {
            return KcService.modifyKc(kc);
        }
        public static string addKc(Kc kc)
        {
            return KcService.addKc(kc);
        }
        public static Kc existsKcBySpbh(int spbh)
        {
            return KcService.existsKcBySpbh(spbh);
        }
        public static string getSlBySpbh(string spbh) {
            return KcService.getSlBySpbh(spbh);
        }
    }
}
