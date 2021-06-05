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
    public partial class GradeStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["user"]);
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand gradeAss = new SqlCommand("InstructorgradeAssignmentOfAStudent", conn);
            gradeAss.CommandType = CommandType.StoredProcedure;

            int insId = Int16.Parse(instructorId.Text);
            int sid = Int16.Parse(studentId.Text);
            int cid = Int16.Parse(courseId.Text);
            int assNumber = Int16.Parse(assignmentNumber.Text);
            string type0 = type.Text;
            string grade0 = grade.Text;

            gradeAss.Parameters.Add(new SqlParameter("@instrId", insId));
            gradeAss.Parameters.Add(new SqlParameter("@sid", sid));
            gradeAss.Parameters.Add(new SqlParameter("@cid", cid));
            gradeAss.Parameters.Add(new SqlParameter("@assignmentNumber", assNumber));
            gradeAss.Parameters.Add(new SqlParameter("@type", type0));
            gradeAss.Parameters.Add(new SqlParameter("@grade", grade0));

            conn.Open();
            int num = gradeAss.ExecuteNonQuery();
            conn.Close();
            if (num > 0)
            {
                Response.Write("Assignment Graded Successfully");
            }
            else
            {
                Response.Write("NO Grade submitted , please check your entries ");

            }
        }
    }
}