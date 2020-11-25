<%@ Import Namespace="AllPower.FrontPublic" %>
<%@ Import Namespace="System.Data" %>

    <div>
    <script runat="server" language="c#">
        protected void LeftInit()
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = null;
                Common commObj = new Common();
                dt = commObj.GetMenu();
                string nodeCode = commObj.SqlCheck(Request.QueryString["c"]);
                string parentNode=string.Empty ;
                if (string.IsNullOrEmpty(nodeCode))
                {
                    nodeCode = "105001001";
                }
                if(nodeCode.Length >6)
                {
                    parentNode=nodeCode.Substring (0,6);
                }
                else
                {
                    parentNode=nodeCode;
                }
                GetLeftMenu(parentNode,commObj,dt);
                dt.Dispose();
            }
        }
        private void GetLeftMenu(string parentNode,Common commObj,DataTable dt)
        {
            if (dt != null)
            {
                DataRow[] dr1=dt.Select ("NodeCode='"+parentNode +"'");
                if (dr1.Length > 0 && parentNode.Length ==6)
                {
                    commObj.FirstMenuDir = dr1[0]["NodeDir"].ToString();
                }
                
                DataRow[] dr = dt.Select("ParentNode='" + parentNode + "'", " NodelOrder");
                for (int i = 0; i < dr.Length; i++)
                {
                    string target="_self";
                    if(dr[i]["OpenType"].ToString ()=="2")
                        target="_blank";

                    Response.Write("<div><a href=" + commObj.GetMenuUrl(dr[i]["NodeCode"].ToString(), dt) + " target=" + target + ">" + dr[i]["NodeName"].ToString() + "</a></div>");
                    if (dr[i]["NodeType"].ToString() == "1")
                        GetLeftMenu(dr[i]["NodeCode"].ToString(),commObj,dt);
                }
            } 
        }

        </script>
        <%LeftInit(); %>
    </div>
