using System;
using System.Collections.Generic;
using System.Text;

namespace JXCBLL
{
    public class PublicManager
    {
        public static string getDateTimeAsId() {
            DateTime mydt = DateTime.Now;
            return mydt.ToString("yyyyMMddHHmmss");
        }
        public static string getDateTime()
        {
            DateTime mydt = DateTime.Now;
            return mydt.ToString("yyyy-MM-dd");
        }
    }
}
