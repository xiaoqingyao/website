using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// EntPersonal 的摘要说明
/// </summary>
public class EntPersonal
{
    public EntPersonal()
    {
    }
    private string strPerName;
    private string strPassword;
    private string strEmail;
    private string strPhone;
    private string strAddress;
    private string strMSN;
    private string strQQ;
    private string strFunctionId;
    private string strPhoto;
    private string strGender;
    private string strScore;
    private string strRegDate;
    private string strLastLoginDate;
    private string strPwQuestion;
    private string strPwAnswer;

    public string perName
    {
        get
        {
            return strPerName;
        }
        set
        {
            strPerName = value;
        }
    }
    public string password
    {
        get
        {
            return strPassword;
        }
        set
        {
            strPassword = value;
        }
    }
    public string email
    {
        get
        {
            return strEmail;
        }
        set
        {
            strEmail = value;
        }
    }
    public string phone
    {
        get
        {
            return strPhone;
        }
        set
        {
            strPhone = value;
        }
    }
    public string gender
    {
        get
        {
            return strGender;
        }
        set
        {
            strGender = value;
        }
    }
    public string address
    {
        get
        {
            return strAddress;
        }
        set
        {
            strAddress = value;
        }
    }
    public string msn
    {
        get
        {
            return strMSN;
        }
        set
        {
            strMSN = value;
        }
    }
    public string qq
    {
        get
        {
            return strQQ;
    }
        set
        {
            strQQ = value;
        }
    }
    public string functionId
    {
        get
        {
            return strFunctionId;
        }
        set
        {
            strFunctionId = value;
        }
    }
    public string photo
    {
        get
        {
            return strPhoto;
        }
        set
        {
            strPhoto = value;
        }
    }
    public string score
    {
        get
        {
            return strScore;
        }
        set
        {
            strScore = value;
        }
    }
    public string regDate
    {
        get
        {
            return strRegDate;
        }
        set
        {
            strRegDate = value;
        }
    }
    public string lastLoginDate
    {
        get
        {
            return strLastLoginDate;
        }
        set
        {
            strLastLoginDate = value;
        }
    }
    public string pwQuestion
    {
        get
        {
            return strPwQuestion;
        }
        set
        {
            strPwQuestion = value;
        }
    }
    public string pwAnswer
    {
        get
        {
            return strPwAnswer;
        }
        set
        {
            strPwAnswer = value;
        }
    }

}
