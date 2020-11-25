using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DAO;

namespace BLL
{
    public class MethodInvoker
    {
        public object MInvoke(BaseDAO dal, string methodname, object[] obj, object source)
        {
            try
            {
                dal.NewConn();
                dal.Open();
                dal.BeginTransaction();
                Type type = source.GetType();
                System.Reflection.MethodInfo method = type.GetMethod(methodname);
                object[] objects = new object[obj.Length + 1];
                objects[0] = dal;
                for (int i = 1; i < objects.Length; i++)
                {
                    objects[i] = obj[i - 1];
                }
                object result = method.Invoke(source, objects);
                dal.Commit();
                dal.Close();
                return result;
            }
            catch (Exception ex)
            {
                try
                {
                    dal.Rollback();
                    dal.Close();
                    return null;
                }
                catch (Exception exc)
                {
                    dal.Close();
                    return null;
                }
            }

        }
    }
}
