using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class StudentSubmissions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
        }

        protected void viewSubs_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(@connStr);

            int insid = Int16.Parse(instructorID.Text);
            int cid = Int16.Parse(courseID.Text);

            SqlCommand StudentSubmissions = new SqlCommand("InstructorViewAssignmentsStudents", conn);
            StudentSubmissions.CommandType = CommandType.StoredProcedure;

            StudentSubmissions.Parameters.Add(new SqlParameter("instrId", insid));
            StudentSubmissions.Parameters.Add(new SqlParameter("cid", cid));

            conn.Open();
            StudentSubmissions.ExecuteNonQuery();


            // SqlDataReader rdr = StudentSubmissions.ExecuteReader(CommandBehavior.CloseConnection);
            //while (rdr.Read())
            //{
            //  Int32 studentId = rdr.GetInt32(rdr.GetOrdinal("sid"));
            //  Label sid = new Label();
            //sid.Text = studentId.ToString();
            //form1.Controls.Add(sid);

            //Int32 courseId = rdr.GetInt32(rdr.GetOrdinal("STA.cid"));
            //Label cid0 = new Label();
            //cid0.Text = courseId.ToString();
            //form1.Controls.Add(cid0);

            //Int32 assNumber = rdr.GetInt32(rdr.GetOrdinal("assignmentNumber"));
            //Label assignmentNumber = new Label();
            //assignmentNumber.Text = assNumber.ToString();
            //form1.Controls.Add(assignmentNumber);

            //String assType = rdr.GetString(rdr.GetOrdinal("assignmentType"));
            //Label assignmentType = new Label();
            //assignmentType.Text = assType;
            //form1.Controls.Add(assignmentType);
            SqlDataAdapter sda = new SqlDataAdapter(StudentSubmissions);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            StringBuilder sb = new StringBuilder();
            sb.Append("<center>");
            sb.Append("<table border=1>");
            sb.Append("<tr>");
            foreach (DataColumn dc in dt.Columns)
            {
                sb.Append("<th>");
                sb.Append(dc.ColumnName.ToUpper());
                sb.Append("</th>");
            }
            sb.Append("</tr>");

            foreach (DataRow dr in dt.Rows)
            {
                sb.Append("<tr>");
                foreach (DataColumn dc in dt.Columns)
                {
                    sb.Append("<th>");
                    sb.Append(dr[dc.ColumnName].ToString());
                    sb.Append("</th>");
                }
                sb.Append("</tr>");


            }
            sb.Append("</table>");
            sb.Append("</center>");


            if (sb.Length != 136)
            {
                Panel1.Controls.Add(new Label { Text = sb.ToString() });

            }

            else
            {
                Response.Write("no sumbissions");
            }
            


            conn.Close();
        }
    }

}
