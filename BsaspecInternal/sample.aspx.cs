﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (TimeZoneInfo z in TimeZoneInfo.GetSystemTimeZones())
        {
            Response.Write(z.Id);
            Response.Write("<br />");
        }
            
    }
}