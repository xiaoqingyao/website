using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace COMM
{
    public class DataViewAdapter
    {
        private DataView _view;
        public DataViewAdapter(DataView view)
        {
            _view = view;
        }
        public int TotalCount
        {
            get { return (_view == null) ? 0 : _view.Table.Rows.Count; }
        }
        public object GetPagedData(int start, int end)
        {
            DataTable table = _view.Table.Clone();

            for (int i = start; i <= end && i <= TotalCount; i++)
            {
                table.ImportRow(_view[i - 1].Row);
            }
            return table;
        }
    }
}
