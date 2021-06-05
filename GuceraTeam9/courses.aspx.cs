using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand courses = new SqlCommand("availableCourses", conn);
            courses.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = courses.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String courseName = rdr.GetString(rdr.GetOrdinal("name"));
                Label name = new Label();
                name.Text = courseName + "<br>";
                form1.Controls.Add(name);
            }
            conn.Close();

            /*
             *  // courseInformation
            

            // output the info as a table wala redirect 3ala page tanya?

            conn.Open();
            viewcoursesbutt.ExecuteNonQuery();
            conn.Close(); */
        }


        protected void viewCourseInfo_Click(object sender, EventArgs e)
        {
            //courseInformation
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int cid = Int16.Parse(cidview.Text);

            SqlCommand viewCourseInfo = new SqlCommand("courseInformation", conn);
            viewCourseInfo.Parameters.Add(new SqlParameter("@id", cid));
            conn.Open();
            viewCourseInfo.ExecuteNonQuery();
            conn.Close();

        }
        internal static SqlDataReader ExecuteReader(CommandBehavior closeConnection)
        {
            throw new NotImplementedException();
        }

        protected void enroll_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("enrollincourse.aspx");
            conn.Close();
            
        }

        protected void backToStudent_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("student.aspx");
            
        }
    }
}