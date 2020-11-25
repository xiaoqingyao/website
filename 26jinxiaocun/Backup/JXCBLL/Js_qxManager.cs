using System;
using System.Collections.Generic;
using System.Text;
using JXCDAL;
using JXCMODEL;

namespace JXCBLL
{
    public class Js_qxManager
    {
        public static IList<Js_qx> getJs_qxsByJsbh(int jsbh)
        {
            IList<Js_qx> js_qxs = new List<Js_qx>();
            try
            {
                js_qxs = Js_qxService.getJs_qxsByJsbh(jsbh);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return js_qxs;
        }
    }
}
