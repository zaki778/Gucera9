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
    public partial class defAss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


            Response.Write(Session["user"]);


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(@connStr);

            int instId = Int16.Parse(Instructor_Id.Text);
            int cid = Int16.Parse(Course_Id.Text);
            int number0 = Int16.Parse(Number.Text);
            String type0 = type.Text;
            int fullgrade0 = Int16.Parse(fullgrade.Text);
            String weight0 = weight.Text;
            String deadline0 = deadline.Text;
            String content0 = content.Text;

            SqlCommand defAss = new SqlCommand("DefineAssignmentOfCourseOfCertianType", conn);
            defAss.CommandType = CommandType.StoredProcedure;

            defAss.Parameters.Add(new SqlParameter("@instId", instId));
            defAss.Parameters.Add(new SqlParameter("@cid", cid));
            defAss.Parameters.Add(new SqlParameter("@number", number0));
            defAss.Parameters.Add(new SqlParameter("@type", type0));
            defAss.Parameters.Add(new SqlParameter("@fullGrade", fullgrade0));
            defAss.Parameters.Add(new SqlParameter("@weight", weight0));
            defAss.Parameters.Add(new SqlParameter("@deadline", deadline0));
            defAss.Parameters.Add(new SqlParameter("@content", content0));

            conn.Open();
            int num= defAss.ExecuteNonQuery();
            conn.Close();

            if (num > 0)
            {
                Response.Write("Assignment Defined Successfully");
            }
            else
            {
                Response.Write("this course is not assigned to this instructor");

            }

        }
    }
}