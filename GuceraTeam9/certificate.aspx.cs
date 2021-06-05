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
    public partial class certificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["user"]);
        }

        protected void submitCertificate_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(@connStr);

            int cid = Int16.Parse(CourseID.Text);
            int sid = Int16.Parse(StudentID.Text);
            int insId = Int16.Parse(InstructorID.Text);
            string issuedate = (IssueDate.Text).ToString();

            SqlCommand issueCer = new SqlCommand("InstructorIssueCertificateToStudent", conn);
            issueCer.CommandType = CommandType.StoredProcedure;

            issueCer.Parameters.Add(new SqlParameter("@cid", cid));
            issueCer.Parameters.Add(new SqlParameter("@sid", sid));
            issueCer.Parameters.Add(new SqlParameter("@insId", insId));
            issueCer.Parameters.Add(new SqlParameter("@issueDate", issuedate));

            conn.Open();
            int num = issueCer.ExecuteNonQuery();
            conn.Close();
            if (num > 0)
            {
                Response.Write("certificate has been issued successfully");
            }
            else
            {
                Response.Write("NO certificate has been issued, please check your entries ");
            }

        }
    }
}