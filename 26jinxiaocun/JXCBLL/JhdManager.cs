using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class JhdManager
    {
        public static IList<Jhd> getAllJhd() {
            IList<Jhd> jhds = new List<Jhd>();
            try {
                jhds = JhdService.getAllJhd();
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return jhds;
        }
        public static Jhd getJhdByJhdbh(string jhdbh)
        {
            Jhd jhd = new Jhd();
            try
            {
                jhd = JhdService.getJhdByJhdbh(jhdbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhd;
        }
        public static void deleteJhdByJhdbh(string jhdbh)
        {
            try
            {
                JhdService.deleteJhdByJhdbh(jhdbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyJhd(Jhd jhd) {
            return JhdService.modifyJhd(jhd);
        }
        public static string addJhd(Jhd jhd)
        {
            return JhdService.addJhd(jhd);
        }
        //public static int existsJhdByJhdmc(string jhdmc) {
        //    return JhdService.existsJhdByJhdmc(jhdmc);
        //}
        public static IList<Jhd> getJhdsOrderByCondition(string condition)
        {
            IList<Jhd> jhds = new List<Jhd>();
            try
            {
                jhds = JhdService.getJhdsOrderByCondition(condition);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhds;
        }
        public static IList<Jhd> getJhdsByCondition(string condition1, string condition2)
        {
            IList<Jhd> jhds = new List<Jhd>();
            try
            {
                jhds = JhdService.getJhdsByCondition(condition1, condition2);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jhds;
        }
    }
}
