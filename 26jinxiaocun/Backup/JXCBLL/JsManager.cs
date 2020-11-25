using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class JsManager
    {
        public static IList<Js> getAllJs()
        {
            IList<Js> jss = new List<Js>();
            try
            {
                jss = JsService.getAllJs();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return jss;
        }
        public static Js getJsByJsbh(string jsbh)
        {
            Js js = new Js();
            try
            {
                js = JsService.getJsByJsbh(jsbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return js;
        }

        public static void deleteJsByJsbh(string jsbh)
        {
            try
            {
                JsService.deleteJsByJsbh(jsbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        public static string modifyJs(Js js)
        {
            return JsService.modifyJs(js);
        }
        public static string addJs(Js js)
        {
            return JsService.addJs(js);
        }
    }
}
