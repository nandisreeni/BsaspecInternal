using System;
using System.Data.SqlClient;
using System.Configuration;


public partial class Comments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime clientDateTime = DateTime.Now;
        //DateTime estDateTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(clientDateTime, "Eastern Time EST (USA & Canada)");

        if (Session["_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        string _user = Session["_id"].ToString();
        string _today = DateTime.Now.ToString("MM-dd-yyyy");
        PanelCal.Attributes["style"] = "display: none";
        if (IsPostBack)
        {
            PANphone.Visible = false;
            PANdetails.Visible = true;

            if (TBcomments.Text.Trim() != "")
            {
                string _phone = HIDEcomments.Value;
                PANphone.Visible = true;
                PANdetails.Visible = false;

                TBphone.Text = "";
                try
                {
                    Guid guidstr = Guid.NewGuid();
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Bsaspecconnstr"].ConnectionString);
                    conn.Open();
                    string insertQuery = "insert into TblComments (id,Comments_Phone,Comments_Comments) values (@id,@Comments_Phone,@Comments_Comments)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("@id", guidstr.ToString());
                    com.Parameters.AddWithValue("@Comments_Phone", _phone);
                    com.Parameters.AddWithValue("@Comments_Comments", TBcomments.Text);
                    com.ExecuteNonQuery();
                    Response.Redirect("Comments.aspx");
                    Response.Write(" successful");
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error:" + ex.ToString());
                }

            }
        }
        else
        {
            PANdetails.Visible = false;
        }
    }





    protected void TBsubmit_Click(object sender, EventArgs e)
    {
        HIDEcomments.Value = TBphone.Text;

        string body = GenericFunctions.PopulateBody("John",
            "Fetch multiple values as Key Value pair in ASP.Net AJAX AutoCompleteExtender",
            "//www.aspsnippets.com/Articles/Fetch-multiple-values-as-Key-Value-pair-" +
            "in-ASP.Net-AJAX-AutoCompleteExtender.aspx",
            "Here Mudassar Ahmed Khan has explained how to fetch multiple column values i.e." +
            " ID and Text values in the ASP.Net AJAX Control Toolkit AutocompleteExtender"
            + "and also how to fetch the select text and value server side on postback");
        GenericFunctions.SendHtmlFormattedEmail("mahesh.vante@gmail.com", "New article published!", body);

    }
}
