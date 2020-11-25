using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class SpManager
    {
        public static IList<Sp> getAllSp()
        {
            IList<Sp> sps = new List<Sp>();
            try
            {
                sps = SpService.getAllSp();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return sps;
        }
        public static string getSplbmcBySplbbh(string splbbh)
        {
            string str = "";
            try
            {
                str = SpService.getSplbmcBySplbbh(splbbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return str;
        }
        public static Sp getSpBySpbh(int spbh)
        {
            Sp sp = new Sp();
            try
            {
                sp = SpService.getSpBySpbh(spbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return sp;
        }
       
        public static void deleteSpBySpbh(int spbh)
        {
            try
            {
                SpService.deleteSpBySpbh(spbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static String modifySp(Sp sp)
        {
            return SpService.modifySp(sp);
        }
        public static int existsSpBySpmc(string spmc)
        {
            return SpService.existsSpBySpmc(spmc);
        }
        public static String addSp(Sp sp)
        {
            return SpService.addSp(sp);
        }
    }
}
