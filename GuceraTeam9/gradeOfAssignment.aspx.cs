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
    public partial class gradeOfAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewGrades_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            int assignmentNumber = Int16.Parse(assignNumber.Text);
            string assignmentType = assignType.Text;
            int courseId = Int16.Parse(courseID.Text);

            SqlCommand viewAssignGradesProc = new SqlCommand("viewAssignGrades", conn);
            viewAssignGradesProc.CommandType = CommandType.StoredProcedure;

            viewAssignGradesProc.Parameters.Add(new SqlParameter("@assignnumber", assignmentNumber));
            viewAssignGradesProc.Parameters.Add(new SqlParameter("@assignType", assignmentType));
            viewAssignGradesProc.Parameters.Add(new SqlParameter("@cid", courseId));
            viewAssignGradesProc.Parameters.Add(new SqlParameter("@sid", Session["user"]));

            SqlParameter grade = viewAssignGradesProc.Parameters.Add("@assignGrade", SqlDbType.Int);

            grade.Direction = ParameterDirection.Output;

            






            conn.Open();
            viewAssignGradesProc.ExecuteNonQuery();

            conn.Close();


             string giveTheMessage(SqlParameter g)
            {
                if (g.Value.ToString() == "0")
                    return "Not yet graded!";
                if (grade.Value.ToString() == "-1")
                    return "User does not take this course";

                return g.Value.ToString(); ;
            }
            Response.Write(giveTheMessage(grade));
          //  if (grade.Value.ToString()!="-1")
            //{
              //  Response.Write(grade.Value.ToString());
                
            //}
            //else
           // {
             //   if (grade.Value.ToString() == "-1")
               // {
                 //   Response.Write("User does not take this course");
                //}
                //else
                //{
                  //  Response.Write("Not yet graded!");
//                }


  //          }




        }
    }
}
