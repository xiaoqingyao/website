using System;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


/// <summary>
/// 页面数据校验类
/// </summary>
public class PageValidate
{
    private static Regex RegPhone = new Regex("^[0-9]+[-]?[0-9]+[-]?[0-9]$");
    private static Regex RegNumber = new Regex("^[0-9]+$");
    private static Regex RegNumberSign = new Regex("^[+-]?[0-9]+$");
    private static Regex RegDecimal = new Regex("^[0-9]+[.]?[0-9]+$");
    private static Regex RegDecimalSign = new Regex("^[+-]?[0-9]+[.]?[0-9]+$"); //等价于^[+-]?\d+[.]?\d+$
    private static Regex RegEmail = new Regex("^[\\w-]+@[\\w-]+\\.(com|net|org|edu|mil|tv|biz|info)$");//w 英文字母或数字的字符串，和 [a-zA-Z0-9] 语法一样 
    private static Regex RegCHZN = new Regex("[\u4e00-\u9fa5]");

    public PageValidate()
    {
    }


    #region 数字字符串检查
    public static bool IsPhone(string inputData)
    {
        Match m = RegPhone.Match(inputData);
        return m.Success;
    }
   
    /// <summary>
    /// 是否数字字符串
    /// </summary>
    /// <param name="inputData">输入字符串</param>
    /// <returns></returns>
    public static bool IsNumber(string inputData)
    {
        Match m = RegNumber.Match(inputData);
        return m.Success;
    }

    /// <summary>
    /// 是否数字字符串 可带正负号
    /// </summary>
    /// <param name="inputData">输入字符串</param>
    /// <returns></returns>
    public static bool IsNumberSign(string inputData)
    {
        Match m = RegNumberSign.Match(inputData);
        return m.Success;
    }
    /// <summary>
    /// 是否是浮点数
    /// </summary>
    /// <param name="inputData">输入字符串</param>
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
    /// 是否是浮点数 可带正负号
    /// </summary>
    /// <param name="inputData">输入字符串</param>
    /// <returns></returns>
    public static bool IsDecimalSign(string inputData)
    {
        Match m = RegDecimalSign.Match(inputData);
        return m.Success;
    }

    #endregion

    #region 中文检测

    /// <summary>
    /// 检测是否有中文字符
    /// </summary>
    /// <param name="inputData"></param>
    /// <returns></returns>
    public static bool IsHasCHZN(string inputData)
    {
        Match m = RegCHZN.Match(inputData);
        return m.Success;
    }

    #endregion

    #region 邮件地址
    /// <summary>
    /// 是否是浮点数 可带正负号
    /// </summary>
    /// <param name="inputData">输入字符串</param>
    /// <returns></returns>
    public static bool IsEmail(string inputData)
    {
        Match m = RegEmail.Match(inputData);
        return m.Success;
    }

    #endregion

    #region 日期格式判断
    /// <summary>
    /// 日期格式字符串判断
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
