using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class enrollincourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void backtocourses_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("courses.aspx");
            conn.Close();
        }

        protected void backtostudent_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("student.aspx");
            conn.Close();
        }

        protected void enroll_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int cid = Int16.Parse(cidenroll.Text);
            int sid = Int16.Parse(sidenroll.Text);
            int instr = Int16.Parse(instrid.Text);

            SqlCommand enrollproc = new SqlCommand("enrollInCourse", conn);
            enrollproc.Parameters.Add(new SqlParameter("@cid", cid));
            enrollproc.Parameters.Add(new SqlParameter("@sid", sid));
            enrollproc.Parameters.Add(new SqlParameter("@instr", instr));

            // how can i show that the enrollemet succeeded or failed?
            conn.Open();
            enrollproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}