using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class KhManager
    {
        public static IList<Kh> getAllKh()
        {
            IList<Kh> khs = new List<Kh>();
            try
            {
                khs = KhService.getAllKh();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return khs;
        }
        
        public static void deleteKhByKhbh(int khbh)
        {
            KhService.deleteKhByKhbh(khbh);
        }
        public static Kh getKhByKhbh(int khbh) 
        {
            return KhService.getKhByKhbh(khbh);
        }
        public static string modifyKh(Kh kh) {
            return KhService.modifyKh(kh);
        }
        public static string addKh(Kh kh) {
            return KhService.addKh(kh);
        }
        public static int existsKhByKhmc(string khmc) {
            return KhService.existsKhByKhmc(khmc);
        }
    }
}
