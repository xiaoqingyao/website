using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class HylbManager
    {
        public static string getHylbmcByHylbbh(string hylbbh)
        {
            return HylbService.getHylbmcByHylbbh(hylbbh);
        }
        public static IList<Hylb> getAllHylb()
        {
            IList<Hylb> hylbs = new List<Hylb>();
            try
            {
                hylbs = HylbService.getAllHylb();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return hylbs;
        }
        public static Hylb getHylbByHylbbh(string hylbbh)
        {
            Hylb hylb = new Hylb();
            try
            {
                hylb = HylbService.getHylbByHylbbh(hylbbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return hylb;
        }

        public static void deleteHylbByHylbbh(string hylbbh)
        {
            try
            {
                HylbService.deleteHylbByHylbbh(hylbbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyHylb(Hylb hylb)
        {
            return HylbService.modifyHylb(hylb);
        }
        public static string addHylb(Hylb hylb)
        {
            return HylbService.addHylb(hylb);
        }
        public static int existsHylbByHylbmc(string hylbmc)
        {
            return HylbService.existsHylbByHylbmc(hylbmc);
        }
    }
}
