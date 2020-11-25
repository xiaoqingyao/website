using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class BaseDAO
    {
        public SqlConnection oleConn = null;
        public SqlTransaction tx = null;


        public void NewConn()
        {
            string str = ConfigurationSettings.AppSettings["ConStr"];
            if (str != null)
                oleConn = new SqlConnection(str);
            else
                oleConn = new SqlConnection("Data Source=PC-20121203IMUC\\SQL2005;Database=shebei;Uid=sa;Pwd=sa");
        }
        public void BeginTransaction()
        {
            if (oleConn.State != ConnectionState.Open)
                oleConn.Open();
            tx = oleConn.BeginTransaction();
        }

        public void Commit()
        {
            tx.Commit();
        }

        public void Rollback()
        {
            tx.Rollback();
        }

        public void Open()
        {
            if (oleConn.State != ConnectionState.Open)
                oleConn.Open();
        }

        public void Close()
        {
            if (oleConn.State == ConnectionState.Open)
                oleConn.Close();
            oleConn.Dispose();
        }

    }
}
