using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack)
        {
            try
            {
                Guid guidstr = Guid.NewGuid();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Bsaspecconnstr"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into Tblregistrations (id,Fname,Lname, emailid, Phone, Password) values  (@id,@Fname,@Lname,@emailid,@Phone,@Password)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@id", guidstr.ToString());
                com.Parameters.AddWithValue("@Fname", TBfname.Text);
                com.Parameters.AddWithValue("@Lname", TBlname.Text);
                com.Parameters.AddWithValue("@emailid", TBemailid.Text);
                com.Parameters.AddWithValue("@Phone", TBphone.Text);
                com.Parameters.AddWithValue("@Password", TBpassword.Text);
                com.ExecuteNonQuery();
                Response.Redirect("users.aspx");
                Response.Write("Registration successful");
                conn.Close();
                
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }

        }
        
        
    }
}