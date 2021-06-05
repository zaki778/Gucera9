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
    public partial class viewCertificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int courseID;
            courseID = Int16.Parse(Request.QueryString["cid"]);


            string connectionString = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand viewCertificateProc = new SqlCommand("viewCertificate", conn);
            viewCertificateProc.CommandType = CommandType.StoredProcedure;

            viewCertificateProc.Parameters.Add(new SqlParameter("@cid", courseID));
            viewCertificateProc.Parameters.Add(new SqlParameter("@Sid", Session["user"]));



            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(viewCertificateProc);
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

            // Panel1.Controls.Add(new Label { Text = sb.ToString() });
           // Response.Write(sb.Length);

            if (sb.Length != 92)
            {
                Panel1.Controls.Add(new Label { Text = sb.ToString() });

            }

            else
            {
                Response.Write("No Assignments defined for this course, try another course");
            }


            viewCertificateProc.ExecuteNonQuery();
            conn.Close();

        }
    }
}