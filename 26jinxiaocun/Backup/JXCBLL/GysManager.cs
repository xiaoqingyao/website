using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class GysManager
    {
        public static IList<Gys> getAllGys() {
            IList<Gys> gyss = new List<Gys>();
            try {
                gyss = GysService.getAllGys();
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return gyss;
        }
        public static Gys getGysByGysbh(int gysbh)
        {
            Gys gys = new Gys();
            try
            {
                gys = GysService.getGysByGysbh(gysbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return gys;
        }
        public static void deleteGysByGysbh(int gysbh)
        {
            try
            {
                GysService.deleteGysByGysbh(gysbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyGys(Gys gys) {
            return GysService.modifyGys(gys);
        }
        public static string addGys(Gys gys)
        {
            return GysService.addGys(gys);
        }
        public static int existsGysByGysmc(string gysmc) {
            return GysService.existsGysByGysmc(gysmc);
        }
    }
}
