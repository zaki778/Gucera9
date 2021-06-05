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
    public partial class addFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            string Comment = comment.Text;
            int courseID = Int16.Parse(cid.Text);

            SqlCommand addFeedbackProc = new SqlCommand("addFeedback", conn);
            addFeedbackProc.CommandType = CommandType.StoredProcedure;

            addFeedbackProc.Parameters.Add(new SqlParameter("@comment", Comment));
            addFeedbackProc.Parameters.Add(new SqlParameter("@cid", courseID));
            addFeedbackProc.Parameters.Add(new SqlParameter("@sid", Session["user"]));



            conn.Open();
           int a= addFeedbackProc.ExecuteNonQuery();
            conn.Close();
            if (a > 0)
            {
                Response.Write("Feedback added");
            }
            else
            {
                Response.Write("Not enrolled in this course, enter a valid course");
            }

        }
    }
}