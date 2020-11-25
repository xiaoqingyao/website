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
/// EntQuestion 的摘要说明
/// </summary>
public class EntQuestion
{    
    private string strquestionId;
    private string strquestion;
	public EntQuestion()
	{
	}
    public string questionId
    {
        get
        {
            return strquestionId;
        }
        set
        {
            strquestionId = value;
        }
    }
    public string question
    {
        get
        {
            return strquestion;
        }
        set
        {
            strquestion=value;
        }
    }
}
