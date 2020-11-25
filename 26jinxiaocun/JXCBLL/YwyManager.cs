using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class YwyManager
    {
        public static IList<Ywy> getAllYwy()
        {
            IList<Ywy> ywys = new List<Ywy>();
            try
            {
                ywys = YwyService.getAllYwy();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return ywys;
        }
        public static void deleteYwyByYwybh(int ywybh)
        {
            try
            {
                YwyService.deleteYwyByYwybh(ywybh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static Ywy getYwyByYwybh(int ywybh) {
            Ywy ywy = new Ywy();
            try
            {
                ywy = YwyService.getYwyByYwybh(ywybh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return ywy;
        }
        public static Ywy getYwyByCoditions(string condition1, string condition2, int condition3) {
            Ywy ywy = new Ywy();
            try
            {
                ywy = YwyService.getYwyByCoditions(condition1,condition2,condition3);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return ywy;
        }
        public static string getYwymcByYwybh(string ywybh) {
            return YwyService.getYwymcByYwybh(ywybh);
        }
        public static string modifyYwy(Ywy ywy) {
            return YwyService.modifyYwy(ywy);
        }
        public static string addYwy(Ywy ywy) {
            return YwyService.addYwy(ywy);
        }
    }
}
