using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    string _emailid = null;
    string _password = null;
    string _dbpassword = null;
    string _firstname = null;
    string _lastname = null;
    string _today = null;
    string _time = null;
    string _id = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            _emailid = TBemail.Text;
            _password = TBpassword.Text;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Bsaspecconnstr"].ConnectionString);
            conn.Open();
            string strQuery = "select password,Fname,Lname,emailid,id from Tblregistrations where emailid='" + _emailid + "'";
            SqlCommand com = new SqlCommand(strQuery, conn);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    _dbpassword = reader.GetString(0).Replace(" ", "");
                    _firstname = reader.GetString(1).Replace(" ", "");
                    _lastname = reader.GetString(2).Replace(" ", "");
                    _id = reader.GetString(4).Replace(" ", "");
                    _today = GenericFunctions.Getdate();
                    _time = GenericFunctions.GetTime();
                    AssignSessions();
                }
            }
            else
            {
                Response.Redirect("users.aspx");
                Response.Write("userid is wrong");

            }
            reader.Close();
            if (_dbpassword == _password)
            {
                Response.Redirect("Welcomepage.aspx");
            }
            else
            {
                Response.Redirect("users.aspx");
                Response.Write("Password is wrong");
            }
        }
    }
    private void AssignSessions()
    {
        Session["_emailid"] = _emailid;
        Session["_password"] = _password;
        Session["_firstname"] = _firstname;
        Session["_lastname"] = _lastname;
        Session["_today"] = _today;
        Session["_time"] = _time;
        Session["_id"] = _id;
    }

}