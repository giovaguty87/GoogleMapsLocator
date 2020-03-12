using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        var Id1 = HttpContext.Current.Request.QueryString["IdW1"];
        var Id2 = HttpContext.Current.Request.QueryString["IdW2"];

        if (!string.IsNullOrEmpty(Id1)) 
        {
            Comment.Text = HttpContext.Current.Request.QueryString["IdW1"];
        }

        if (!string.IsNullOrEmpty(Id2))
        {
            Comment.Text = HttpContext.Current.Request.QueryString["IdW2"];
        }       
    }

    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
}