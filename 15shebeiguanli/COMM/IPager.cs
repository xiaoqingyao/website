using System;

namespace COMM
{
    public interface IPager
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="rPageIndex"></param>
        /// <param name="ID"></param>
        void DoPageIndexChange(int rPageIndex, string ID);
    }
}
