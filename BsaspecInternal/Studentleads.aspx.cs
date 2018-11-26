using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Studentleads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (IsPostBack)
        {
            try
            {
                Guid guidstr = Guid.NewGuid();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Bsaspecconnstr"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into TblStudentLeads (StudentID,StudentFirstname,StudentLastname,StudentPhone,StudentEmailid,StudentUniversityname,Studentvisastatus,Studentvisastartdate,Studentmmajors,Studentmgpa,Studentbuniversityname,Studentbmajors,Studentbgpa,Studentclocation,Studentnative,studentcommunication,Studenttrainingp,Studentprogrammingl,Studentstemextension,Studentstemextnsd,Studentexperience,Studentcomments,LoginID,LoginDate,LoginTime) values (@StudentID,@StudentFirstname,@StudentLastname,@StudentPhone,@StudentEmailid,@StudentUniversityname,@Studentvisastatus,@Studentvisastartdate,@Studentmmajors,@Studentmgpa,@Studentbuniversityname,@Studentbmajors,@Studentbgpa,@Studentclocation,@Studentnative,@studentcommunication,@Studenttrainingp,@Studentprogrammingl,@Studentstemextension,@Studentstemextnsd,@Studentexperience,@Studentcomments,@LoginID,@LoginDate,@LoginTime)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@StudentID", guidstr.ToString());
                com.Parameters.AddWithValue("@StudentFirstname", TBfirstname.Text);
                com.Parameters.AddWithValue("@StudentLastname", TBlastname.Text);
                com.Parameters.AddWithValue("@StudentPhone", TBPhone.Text);
                com.Parameters.AddWithValue("@StudentEmailid", TBemail.Text);
                com.Parameters.AddWithValue("@StudentUniversityname", TBmuniversity.Text);
                com.Parameters.AddWithValue("@Studentvisastatus", DDvisastatus.SelectedValue.ToString());
                com.Parameters.AddWithValue("@Studentvisastartdate", TBvisastartdate.Text);
                com.Parameters.AddWithValue("@Studentmmajors", TBmmajors.Text);
                com.Parameters.AddWithValue("@Studentmgpa", TBmgpa.Text);
                com.Parameters.AddWithValue("@Studentbuniversityname", TBbuniversity.Text);
                com.Parameters.AddWithValue("@Studentbmajors", TBbmajors.Text);
                com.Parameters.AddWithValue("@Studentbgpa", TBbgpa.Text);
                com.Parameters.AddWithValue("@Studentclocation", TBclocation.Text);
                com.Parameters.AddWithValue("@Studentnative", TBnative.Text);
                com.Parameters.AddWithValue("@studentcommunication", TBcommunication.Text);
                com.Parameters.AddWithValue("@Studenttrainingp", TBtrainingp.Text);
                com.Parameters.AddWithValue("@Studentprogrammingl", TBprogrammingl.Text);
                com.Parameters.AddWithValue("@Studentstemextension", DDstemextension.SelectedValue.ToString());
                com.Parameters.AddWithValue("@Studentstemextnsd", TBstemextnsd.Text);
                com.Parameters.AddWithValue("@Studentexperience", TBexperience.Text);
                com.Parameters.AddWithValue("@Studentcomments", TBcomments.Text);
                com.Parameters.AddWithValue("@LoginID", Session["_id"].ToString());
                com.Parameters.AddWithValue("@LoginDate", Session["_today"].ToString());
                com.Parameters.AddWithValue("@LoginTime", GenericFunctions.GetTime());
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