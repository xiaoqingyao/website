using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class CkManager
    {
        public static IList<Ck> getAllCk()
        {
            IList<Ck> cks = new List<Ck>();
            try
            {
                cks = CkService.getAllCk();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return cks;
        }
        public static Ck getCkByCkbh(string ckbh)
        {
            Ck ck = new Ck();
            try
            {
                ck = CkService.getCkByCkbh(ckbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return ck;
        }

        public static void deleteCkByCkbh(string ckbh)
        {
            try
            {
                CkService.deleteCkByCkbh(ckbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyCk(Ck ck)
        {
            return CkService.modifyCk(ck);
        }
        public static string addCk(Ck ck)
        {
            return CkService.addCk(ck);
        }
        public static int existsCkByCkBh(string ckbh) {
            return CkService.existsCkByCkBh(ckbh);
        }
    }
}
