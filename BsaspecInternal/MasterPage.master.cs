using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.DataBind();
    }
    public string FirstName
    {
        get
        {
            if(Session["_firstname"]!= null)
            {
                return GenericFunctions.Converttotilecase(Session["_firstname"].ToString());
            }
            else
            {
                return null;
            }
            
        }
    }
    public string LastName
    {
        get
        {
            if (Session["_lastname"] != null)
            {
                return GenericFunctions.Converttotilecase(Session["_lastname"].ToString());
            }
            else
            {
                return null;
            }
        }
    }
}
