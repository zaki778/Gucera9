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
    public partial class submitAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();

            SqlConnection conn = new SqlConnection(connectionString);

            string assignmentType = assignType.Text;
            int assignmentNumber = Int16.Parse(assignNumber.Text);
            int courseId = Int16.Parse(cid.Text);

            SqlCommand submitAssignProc = new SqlCommand("submitAssign", conn);
            submitAssignProc.CommandType = CommandType.StoredProcedure;

            submitAssignProc.Parameters.Add(new SqlParameter("@assignType", assignmentType));
            submitAssignProc.Parameters.Add(new SqlParameter("@assignnumber", assignmentNumber));
            submitAssignProc.Parameters.Add(new SqlParameter("@sid", Session["user"]));
            submitAssignProc.Parameters.Add(new SqlParameter("@cid", courseId));

            conn.Open();
          int a=  submitAssignProc.ExecuteNonQuery();
            conn.Close();
            if (a>0)
            {
                Response.Write("Assignment submitted");
            }
            else
            {
                Response.Write("Not enrolled in this course, enter a valid course");
            }

        }
    }
}