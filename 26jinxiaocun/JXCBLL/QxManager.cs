using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class QxManager
    {
        public static IList<Qx> getAllQx(){
            IList<Qx> qxs = new List<Qx>();
            try {
                qxs = QxService.getAllQx();
            }
            catch(Exception ex){
                throw new Exception(ex.ToString());
            }
            return qxs;
        }
        
        public static Qx getQxByQxbh(int qxbh) {
            Qx qx = new Qx();
            try
            {
                qx = QxService.getQxByQxbh(qxbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return qx;
        }
        public static void deleteQxByQxbh(int qxbh)
        {
            try
            {
                QxService.deleteQxByQxbh(qxbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static String modifyQx(Qx qx) {
            return QxService.modifyQx(qx);
        }
        public static String addQx(Qx qx)
        {
            return QxService.addQx(qx);
        }
    }
}
