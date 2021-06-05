using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace GuceraTeam9
{
    public partial class reqCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void onAccept(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int adminID = Int16.Parse(adID.Text);
            int courseID = Int16.Parse(cID.Text);

            SqlCommand accProc = new SqlCommand("AdminAcceptRejectCourse", conn);
            accProc.CommandType = CommandType.StoredProcedure;

            accProc.Parameters.Add(new SqlParameter("@adminID", adminID));
            accProc.Parameters.Add(new SqlParameter("@courseID", courseID));

            conn.Open();
            accProc.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Course Accepted");
        }
    }
}