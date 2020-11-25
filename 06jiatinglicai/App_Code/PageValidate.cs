using System;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


/// <summary>
/// ҳ������У����
/// </summary>
public class PageValidate
{
    private static Regex RegPhone = new Regex("^[0-9]+[-]?[0-9]+[-]?[0-9]$");
    private static Regex RegNumber = new Regex("^[0-9]+$");
    private static Regex RegNumberSign = new Regex("^[+-]?[0-9]+$");
    private static Regex RegDecimal = new Regex("^[0-9]+[.]?[0-9]+$");
    private static Regex RegDecimalSign = new Regex("^[+-]?[0-9]+[.]?[0-9]+$"); //�ȼ���^[+-]?\d+[.]?\d+$
    private static Regex RegEmail = new Regex("^[\\w-]+@[\\w-]+\\.(com|net|org|edu|mil|tv|biz|info)$");//w Ӣ����ĸ�����ֵ��ַ������� [a-zA-Z0-9] �﷨һ�� 
    private static Regex RegCHZN = new Regex("[\u4e00-\u9fa5]");

    public PageValidate()
    {
    }


    #region �����ַ������
    public static bool IsPhone(string inputData)
    {
        Match m = RegPhone.Match(inputData);
        return m.Success;
    }
   
    /// <summary>
    /// �Ƿ������ַ���
    /// </summary>
    /// <param name="inputData">�����ַ���</param>
    /// <returns></returns>
    public static bool IsNumber(string inputData)
    {
        Match m = RegNumber.Match(inputData);
        return m.Success;
    }

    /// <summary>
    /// �Ƿ������ַ��� �ɴ�������
    /// </summary>
    /// <param name="inputData">�����ַ���</param>
    /// <returns></returns>
    public static bool IsNumberSign(string inputData)
    {
        Match m = RegNumberSign.Match(inputData);
        return m.Success;
    }
    /// <summary>
    /// �Ƿ��Ǹ�����
    /// </summary>
    /// <param name="inputData">�����ַ���</param>
    /// <returns></returns>
    public static bool IsDecimal(string inputData)
    {
        Match m = RegDecimal.Match(inputData);

        if (!m.Success)
        {
            m = RegNumber.Match(inputData);
        }
        return m.Success;
    }
    /// <summary>
    /// �Ƿ��Ǹ����� �ɴ�������
    /// </summary>
    /// <param name="inputData">�����ַ���</param>
    /// <returns></returns>
    public static bool IsDecimalSign(string inputData)
    {
        Match m = RegDecimalSign.Match(inputData);
        return m.Success;
    }

    #endregion

    #region ���ļ��

    /// <summary>
    /// ����Ƿ��������ַ�
    /// </summary>
    /// <param name="inputData"></param>
    /// <returns></returns>
    public static bool IsHasCHZN(string inputData)
    {
        Match m = RegCHZN.Match(inputData);
        return m.Success;
    }

    #endregion

    #region �ʼ���ַ
    /// <summary>
    /// �Ƿ��Ǹ����� �ɴ�������
    /// </summary>
    /// <param name="inputData">�����ַ���</param>
    /// <returns></returns>
    public static bool IsEmail(string inputData)
    {
        Match m = RegEmail.Match(inputData);
        return m.Success;
    }

    #endregion

    #region ���ڸ�ʽ�ж�
    /// <summary>
    /// ���ڸ�ʽ�ַ����ж�
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static bool IsDateTime(string str)
    {
        try
        {
            if (!string.IsNullOrEmpty(str))
            {
                DateTime.Parse(str);
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    #endregion


}
